<!DOCTYPE html>
<html>
<head>
	<title>Verkefni 6. Sessions</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="normalize.css">
	<link rel="stylesheet" type="text/css" href="/static/main_2.css">
</head>
<body>
    <%
    from bottle import *
    from beaker.middleware import SessionMiddleware
    bs = request.environ.get('beaker.session')
    empty = True
    %>
    <h2>Karfan</h2>

    <% for i in range(6):
         if bs.get(str(i)):
         empty = False
         end
     end
    if empty:
    %>
        <h3>Karfan er <i>tóm</i>, farðu og skoðau um.</h3>

    %else:

        <table>
            <tr>
                <th>Vara</th>
                <th>Verð</th>
                <th>Fjarlægja vöru</th>
            </tr>
            <%
            sum = 0
            for i in range(6):
                if bs.get(str(i)):
                sum = sum + int(val[int(i)]['price'])
            %>
            <tr>
                <td>{{val[int(i)]['name']}}</td>
                <td>{{val[int(i)]['price']}}</td>
                <td><a class="a" href="/del/{{i}}">Eyða</a></td>
            </tr>
            % end
        % end
            <tr>
                <td>Heildarverð:</td>
                <td><b>{{sum}} kr.</b></td>
                <td><a class="a" href="/delall">Tæma</a></td>
            </tr>
        </table>
    % end

    <h4>
        <a class="a" href="/">Aftur á verslunina</a>
    </h4>
</body>
</html>
