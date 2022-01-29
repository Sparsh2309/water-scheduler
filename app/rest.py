import json
from flask_restful import Resource, Api
from flask import request
from app import app
from db import insert_cursor, select_cursor

api = Api(app)


class MotorTabMap(Resource):
    def get(self):
        query_motor = "select id,motor_name,motor_state from motor"
        motor_rows = select_cursor(query=query_motor)
        data = []
        for motor in motor_rows:
            query_tab = f"select tab_id,tab_state from tab where motor_id={motor['id']}"
            tab_rows = select_cursor(query=query_tab)
            data.append(
                {
                    "motor_name": motor["motor_name"],
                    "motor_state": motor["motor_state"],
                    "tabs": tab_rows,
                }
            )
        return data, 200


class State(Resource):
    def get(self):
        query_motor = "select motor_name,motor_state from motor"
        motor_rows = select_cursor(query=query_motor)

        query_tab = "select tab_id,tab_state from tab"
        tab_rows = select_cursor(query=query_tab)

        data = {"motor": motor_rows, "tab": tab_rows}
        return data, 200


class Scheduler(Resource):
    def get(self):
        query_scheduler = """
        select scheduler_id,scheduler_name,motor_id,motor_state,
        scheduled_at,scheduled_to,scheduler_state from scheduler
        """
        scheduler_rows = select_cursor(query=query_scheduler)
        return json.dumps(scheduler_rows, default=str), 200

    def post(self):
        query_scheduler = f"""
            insert into scheduler(
                scheduler_id,scheduler_name,motor_id,motor_state,
                scheduled_at,scheduled_to,scheduler_state
                ) values(
                    '{request.form["scheduler_id"]}',
                    '{request.form["scheduler_name"]}',
                    '{request.form["motor_id"]}',
                    '{request.form["motor_state"]}',
                    curdate(),
                    curdate(),
                    {request.form["scheduler_state"]}
                )
            """
        status = insert_cursor(query=query_scheduler)
        return {"status": "success", "inserted": status}, 201

    def put(self):
        query_scheduler = f"""
        update scheduler set motor_id='{request.form["motor_id"]}',
        scheduled_at=curdate(), scheduled_to=curdate(),
        scheduler_state={request.form["scheduler_state"]},
        motor_state={request.form["motor_state"]}
        where scheduler_id={request.form["scheduler_id"]}
        """
        status = insert_cursor(query=query_scheduler)
        return {"status": "success", "updated": status}, 200

    def delete(self):
        query_scheduler = f"""
        delete from scheduler
        where scheduler_id={request.form["scheduler_id"]}
        """
        status = insert_cursor(query=query_scheduler)
        return {"status": "success", "deleted": status}, 202


api.add_resource(MotorTabMap, "/")
api.add_resource(State, "/state")
api.add_resource(Scheduler, "/scheduler")


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
