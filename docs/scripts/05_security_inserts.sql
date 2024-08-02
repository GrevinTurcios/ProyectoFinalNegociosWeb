
INSERT INTO roles (rolescod, rolesdsc, rolesest) 
VALUES ('ADMIN', 'Administrador', 'ACT');

INSERT INTO roles (rolescod, rolesdsc, rolesest) 
VALUES ('AUDIT', 'Auditor', 'ACT');

INSERT INTO roles (rolescod, rolesdsc, rolesest) 
VALUES ('OPADQ', 'Operador de Adquisiciones', 'ACT');

INSERT INTO roles (rolescod, rolesdsc, rolesest) 
VALUES ('PBL', 'Operador de Adquisiciones', 'ACT');
/*------------------------------------------------------------------*/

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) 
VALUES ('Controllers\\Mantenimiento\\Catalogo\\MantenimientoMenu','Menu de mantenimiento','ACT','CTR');

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) 
VALUES ('Controllers\\Mantenimiento\\Catalogo\\Catalogos','Lista de Catalogo','ACT','CTR');

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) 
VALUES ('Controllers\\Mantenimiento\\Catalogo\\Catalogo','Formulario de Catalogo','ACT','CTR');

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) 
VALUES ('mnt_catalogo_new','boton para un nuevo producto','ACT','FNC');

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) 
VALUES ('mnt_catalogo_upt','boton para editar','ACT','FNC');

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) 
VALUES ('mnt_catalogo_del','boton para eliminar','ACT','FNC');

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) 
VALUES ('Controllers\\Landing\\Carrito','carrito de compras','ACT','CTR');

/*------------------------------------------------------------------*/

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('ADMIN','Controllers\\Mantenimiento\\Catalogo\\MantenimientoMenu','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('AUDIT','Controllers\\Mantenimiento\\Catalogo\\MantenimientoMenu','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('OPADQ','Controllers\\Mantenimiento\\Catalogo\\MantenimientoMenu','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));
------------------------------------------------------------------------------------------------------------
INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) 
VALUES ('ADMIN', 'Controllers\\Mantenimiento\\Catalogo\\Catalogos', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) 
VALUES ('AUDIT', 'Controllers\\Mantenimiento\\Catalogo\\Catalogos', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('OPADQ','Controllers\\Mantenimiento\\Catalogo\\Catalogos','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));
-------------------------------------------------------------------------------------------------------------
INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('ADMIN','Controllers\\Mantenimiento\\Catalogo\\Catalogo','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('AUDIT','Controllers\\Mantenimiento\\Catalogo\\Catalogo','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

--------------------------------------------------------------------------------------------------------------
INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('ADMIN','mnt_catalogo_new','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('ADMIN','mnt_catalogo_upt','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('ADMIN','mnt_catalogo_del','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));
---------------------------------------------------------------------

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('AUDIT','mnt_catalogo_new','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('AUDIT','mnt_catalogo_upt','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

---------------------------------------------------------------------
INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES 
('PBL','Controllers\\Landing\\Carrito','ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));
---------------------------------------------------------------------



/*------------------------------------------------------------------*/

INSERT INTO roles_usuarios (usercod, rolescod, roleuserest, roleuserfch, roleuserexp) 
VALUES (1,'ADMIN','ACT', NOW(),NOW());

INSERT INTO roles_usuarios (usercod, rolescod, roleuserest, roleuserfch, roleuserexp) 
VALUES (2,'ADMIN','ACT', NOW(),NOW());

INSERT INTO roles_usuarios (usercod, rolescod, roleuserest, roleuserfch, roleuserexp) 
VALUES (3,'AUDIT','ACT', NOW(),NOW());

INSERT INTO roles_usuarios (usercod, rolescod, roleuserest, roleuserfch, roleuserexp) 
VALUES (7,'AUDIT','ACT', NOW(),NOW());

INSERT INTO roles_usuarios (usercod, rolescod, roleuserest, roleuserfch, roleuserexp) 
VALUES (8,'OPADQ','ACT', NOW(),NOW());

INSERT INTO roles_usuarios (usercod, rolescod, roleuserest, roleuserfch, roleuserexp) 
VALUES (9,'PBL','ACT', NOW(),NOW());
/*------------------------------------------------------------------*/
DROP TABLE usuario;
/*------------------------------------------------------------------*/
INSERT INTO usuario (
    useremail,
    username,
    userpswd,
    userfching,
    userpswdest,
    userpswdexp,
    userest,
    useractcod,
    userpswdchg,
    usertipo
) VALUES (
    'grevinronelruizturcios@gmail.com',   -- useremail
    'Grevin Turcios',           -- username
    'Artes1234!',          -- userpswd
    NOW(),   -- userfching
    'ACT',                   -- userpswdest
    NOW(),   -- userpswdexp
    'ACT',                   -- userest
    'activationcode',        -- useractcod
    NOW(),   -- userpswdchg
    'ADMIN'                    -- usertipo
);

INSERT INTO usuario (
    useremail,
    username,
    userpswd,
    userfching,
    userpswdest,
    userpswdexp,
    userest,
    useractcod,
    userpswdchg,
    usertipo
) VALUES (
    'admin@example.com',   -- useremail
    'Admin',           -- username
    'Admin123!',          -- userpswd
    NOW(),   -- userfching
    'ACT',                   -- userpswdest
    NOW(),   -- userpswdexp
    'ACT',                   -- userest
    'activationcode',        -- useractcod
    NOW(),   -- userpswdchg
    'ADMIN'                    -- usertipo
);




INSERT INTO usuario (
    useremail,
    username,
    userpswd,
    userfching,
    userpswdest,
    userpswdexp,
    userest,
    useractcod,
    userpswdchg,
    usertipo
) VALUES (
    'Auditor!@example.com',   -- useremail
    'Auditor',               -- username
    'Auditor123!',           -- userpswd
    NOW(),                   -- userfching
    'ACT',                   -- userpswdest
    NOW(),                   -- userpswdexp
    'ACT',                   -- userest
    SHA2(CONCAT(UUID()), 256), -- useractcod 
    NOW(),                   -- userpswdchg
    'AUDIT'                  -- usertipo
);

