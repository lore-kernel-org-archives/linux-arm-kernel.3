Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A105F4643B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/XZWFlsxzM+0lZxykfSK1STJKtwotZ7hmQM6Y2ONMU=; b=JcAv18AR6km0DIjXDN8kanyy/K
	xeTN8NkQKYNHIcxN69brtRyK0e4soBu3NbaqtEEAhyOIASQvOIw3HksLy2CdKsiC0ANAES4i22jBC
	yvDjqSt3Y3xm9PUzm8Crht/yYFXOHIk1JFy38MqbTewJL6FCENXwGKq0/5YMDb/XhJ20TJ7EPp5IZ
	m8BXaVxXCotnkA2JiWL5LJWCS9GrEeZFyRAqArai7af5nmThIe9VReFg+jPYEgnsm+SWmiR+iLiiU
	BIyzF2o4XdJvqwEtx5SnzSSt+KQmoRmoj3r2hZxK5mLk4sNjVRdLpLkVst50BSWlMEyDcpQquTmYm
	kcYphfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24RD-00000003f0o-3InD;
	Mon, 16 Mar 2026 09:40:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24RB-00000003f0N-3o1B
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 09:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=b/XZWFlsxzM+0lZxykfSK1STJKtwotZ7hmQM6Y2ONMU=; b=PBEnEh2Da8XUe3HHQT+uPvYb2Z
	v7Rr8ywApnK3cJqVdAMkKt+x8EHR19e0i33TBiSFKvXOMgshKP5omSnXbRQ2kUYzn5wrbdElOzyoT
	JVPqRLATF3/vRufHT+pEb5F3MJ4c33xeq3zsuEMFPi1S0KlsSoBTrS3IulpEwAriHz7oKcKzbVoGU
	Pine3swnmmbSNPHtWEio0d7qUB1dQljnYoo6ImAGrobdOgYTlILdRmhLv9B8UW89VLgr7Be1yFRQ5
	JhBCAe/KWH4iYUqAv7yWmztPiO1CNhBaG0T5sGyweeI+gAlKltIzqojDurClaKLFkGezrHrxDXYR+
	K3v9pHFg==;
Received: from mail-northeuropeazon11011031.outbound.protection.outlook.com ([52.101.65.31] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24R8-00000006OXu-3w1G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:40:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3XyfcN8ESK3+8ouiUYEgfaoB3EABM6ueSS+ZJIYVypx5N+Ks8IUvk3UPqCYUGhNw//uXcXn8ob3Gxhg6xV6pIfQE0ZZYHmwMQUMohdQvyxjXXlJmNDvyK4iKMjt2C8bY8nxZtU8a6xPD9NTPMvmnZzT56NWp9/cjBtmftDTXO5XeLNnar5wkJUy3pRaNfFWrWf0Si+gh8FJJaBN/desZqCWeb5CML8u/nAdR7FiGZsGaN77LOeScO2aOGj3XepKT12u8Gk4kZ1oggt3byLhbcDHV9ajMUbvWcyZhTUfuvQnN9IC7y5HRbh077bl8WZPTliv8HKiSOiESSsx3VUb7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/XZWFlsxzM+0lZxykfSK1STJKtwotZ7hmQM6Y2ONMU=;
 b=F1C389//NQ6c+0HNR3BUBl8/LjKVh75Q5knmoLBoa9mX4FDZEa6sszjVeA6Za/QBrfiTP15lK8/3J/32f83Eur3a0KGxqW4WZRzzLP4bjRqI2TSZ7o5cnCqstzwJULNLxZvckRD43vOBmBD+zOa4+arhgkYsRtDe85WtRXHw8AxgK4IbL+ariAYc60cwYt6C92YCDF9MdEK8JXFLVmqb2jwLWpifQpsa0xEvoGIwzPnePWal8Gu0YKBNdMTcxLyEluDDPKRqXwJ9blURL7gZ/JrpklkTWjtJj57hYTX1sb8VrmVmpVbnaZzK3VPLSQPtjHcZXod1DaC3gyiShrGriA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/XZWFlsxzM+0lZxykfSK1STJKtwotZ7hmQM6Y2ONMU=;
 b=Dh9atMUGKPjkKZKzL4K+LeUSaXP8dGNHZAL7ThI6mavC7Nj09BNLE4aqPbJjZxiyIk1AoRmVDWYFYs0C+a3gO2KC+zb4F35i7y56+vRMSIW1ytN14JWSEsyVNDg258GEN4Kl0DxGvbff8MrN/gySk7uJEN72jzD5mjqMUvy+Jybe7S3Ic2do966L3NvpwuED4It5KmNfLv4dVJPojFjrIesMNvZJKKtUwRl+wKfhHi7catav8cQfC6/aLfROMscj6C7Lzu5S7+P4YVC4wrzLzTLJey+S5QSTOvHHRj5X2g9+XHOLjMFwo4/7bFKt2v86/IvgCRP9Arpirf5CjQJ2AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by MRWPR04MB12119.eurprd04.prod.outlook.com (2603:10a6:501:97::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 09:40:22 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::b476:c19a:24cd:3694]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::b476:c19a:24cd:3694%3]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:40:32 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	f.fainelli@gmail.com,
	frank.li@nxp.com,
	chleroy@kernel.org,
	horms@kernel.org,
	linux@armlinux.org.uk
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH net-next 01/14] dt-bindings: net: dsa: update the description of 'dsa,member' property
Date: Mon, 16 Mar 2026 17:41:39 +0800
Message-Id: <20260316094152.1558671-2-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316094152.1558671-1-wei.fang@nxp.com>
References: <20260316094152.1558671-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|MRWPR04MB12119:EE_
X-MS-Office365-Filtering-Correlation-Id: 663c7db8-2b24-47a4-c040-08de834010fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|1800799024|366016|38350700014|18002099003|921020|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: qDN0E2uUDHspZI5oGztuX+TO7xYvxazPTaddl1L1oSDXkKNiQ+KAQdbtFPUeYLyJLDA28yoEjRuhvGCu99EeO6nLwRbaW1AE/Mj8pFbsL5/1XAWf61942BXMSIOmvG7EtBvo/R/CIzjcMZRzrz+trUGTSOh5FJu3+LQJH0oKnWfRs0BuY2q+X63T7XhWuu8/4Kzf0Nj8U3KkyPilvksbvbcc7cbYj8FadyLw0r/tuQw43yfQhdEykaxZu0n8h5wlKPI8s8MJFX/GcmfosTKC0PvqJFVjJu32W3hWklGbNy3ReqIpl0GUHz10WnswmDE+/aZJ7xd9zWJBz3NFghhKMLOigOLvAJML/7sndx+tphWpuxDirB6qrYWyuw1ApzJHGdmyVkDeud/oI1wHt3rLsNMxHyHVTY57Jx2wB8KOdwhKzkyG0cI/sQq1f1OOzGDif0dltie4yQFqsHPFscfMnHn4qDT7h5s+AfT8GLOij2nr5CkGmyACocaA1jWm/HLk55NL27MPoLu1upEI5uO52rrjFh6j2BTU8jaCPAPF2LBPKiWIYnm09U4yCp2pl3ycKPfEoCAxUv0FoR0Dz+4ilWNMEyH8h5OiT8PC4vqckltpQPRe1bS5DO65HitxMP5L4fkSXfjeaEYTwwbpcqz+SV2krV+4eNNgUPYlF71Et+O/0QsllXQWjImhRt3aZHT0X9kmvUii4RCAhG37+3nGByonqXDmgoVglGspmBRZoxymVgA1roinsFmbPyL11JJhUA9qasb5mano5+yW7rGSFMpnThMNlJ6oX03+8Ge5vbfrbJ8GJfs72fuBwDaKhh75
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(921020)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6hkeX6H+gUobCTUoAb1Uk3ht3869Zl8n+6hEwujSsDknUbz/ntKxvdenVQzK?=
 =?us-ascii?Q?Kq7IfncUye9lR3jFHGPir5ybDwRqtofQJ4sksC/1KCCzjuCZnidAR+KbL7ur?=
 =?us-ascii?Q?oLNsVtABynWnilmfyz91gNrtkAWeGqRBXlL/Gb2o6aWpur4Mcle/y49HQVus?=
 =?us-ascii?Q?bP29HVJvB+WAb6/Qv2x55VWo8bFLlztH/7xBUSSa8YzgFLCR92Ijo8ignCzO?=
 =?us-ascii?Q?/N/rvCLnw7JKYUDcqC6AY9czpxkX4gZFCxo/6eNsQbordQNxVPP3PSVoCYw8?=
 =?us-ascii?Q?uu7c3CYOBAxyULLHy4q8HcswhD7SgQ+lQniq6l9RV5Q9JOjVDTd7e3yDB+Qs?=
 =?us-ascii?Q?/StAk7ty2WTJ/wflIx3W54NZo03I30+yn7ExKsALOG24aWUCSD/3S+w+wkKN?=
 =?us-ascii?Q?W8xi0z/saoUiKzN8iozbWsYAxILXEqzPMLMbgGJ2enykTXaKEaWBgThp8R7O?=
 =?us-ascii?Q?RBaaB0qfnwSMmT3R7ziNyrOJLvO16lX7+spdh+9uAz2aaq0UUlMof2jW4GtY?=
 =?us-ascii?Q?l0hhtWl+kcOmmWHXedEdaxHWRPuKFyTZ7amPW3q1+6bRl+S3KU+4kr2YBL9+?=
 =?us-ascii?Q?YoI6FD/yt7WIiPx+uYIYUjxiVQ7kDpj0MD7i2gzYF0MjL+aJ0OoepyNt93pD?=
 =?us-ascii?Q?1fWDSt8KbDVRysPfY79GIn5LhpFEhEN3xtTFMOf5shbttW49B2mJOqG1Qc2p?=
 =?us-ascii?Q?FVXdgOcCOmJYZ7+yUvpf+RVCyWHI0RnsCpl2M6TQZx8tcN1rW8bpp/odhpyq?=
 =?us-ascii?Q?WbJ3HPdze4fAq4q0LzCqTkooUcToH8Q3fNBbO6/H4K5EwyohG3otJO0lrCHz?=
 =?us-ascii?Q?mqp3fyXbL2jskkQ0axgSX+WoaCdZkzDxqkfEGWf9DsK7gqwtuJUmq2e4ugf/?=
 =?us-ascii?Q?2Qv2a7h18d6/GLaf49DXJzT5j/19doSADdkLHoIF/mHPbzAt7lL/O4e19sLl?=
 =?us-ascii?Q?FEqBzJbXannhUNN5Ubq6vpQDUDnt86n6vYUQPgM7qhu7T+QlPIe2+LfNglTL?=
 =?us-ascii?Q?eYRn4viKBWc4PCUHYrlx59JOycykSYlOv2sARuM/1LUzKAb4SWUDVp4wngXl?=
 =?us-ascii?Q?4XSnpxrxYdHayIXj7cG9/UUXDkbqnvWyvBp7ZP2ruanWhRlCGQub235rXauS?=
 =?us-ascii?Q?n+5TG1L1UDDPF9CDWt2U81oJuUTnRVVTw555apTVPK3Qxyeo0wv7e24SciAA?=
 =?us-ascii?Q?ETkNYIcKobPlUMyQkS/7WRQNWcWf35P3AeX1cZenamUyJ0q6aPR1EFpD3gxd?=
 =?us-ascii?Q?FTNSLPhQN46/1ChBL014YMD0UgeU7ZdX1zoM//Oe93ZaSr8MHDVa0a22m0wb?=
 =?us-ascii?Q?clcdQjWtLW0yvxxPoDFisPDkI5rggf5QjeRrHRnwkWLHQNltWWIOTdNi2a/w?=
 =?us-ascii?Q?bc01YzxDUYCgOUaErfdLbwOCH5+UeYCTq+xtTSPZKTTo37IpFXJ1L6f4Qo3D?=
 =?us-ascii?Q?bFOZD5Y1m9j+2xk3+mgs+mxYSDxYCVPVAGlmEz7+rY17DX7VN6VQT+4TvA1M?=
 =?us-ascii?Q?LLp/JHZMrygpC2DaLdBAzYYBwDf26O0ps22693j9HspIGLQWrG9/Fh8LA81v?=
 =?us-ascii?Q?F9JNJbC5fY3m5WsfKP/HsjC1SmuGX4CL2Bz++lnoHnV1C9B+1SW/LBS2d3Wn?=
 =?us-ascii?Q?g3I7KV1DyMYIJbpVdeA0tRmvfUxFY3l8AqFDt85c23FEjjBz47Y5gR3LWc0v?=
 =?us-ascii?Q?MkKkI+cZUNtf+ut+tByyMYNj8O9ZPcOd+p3/axgmCBJL+ZxOC8kF0UFtL0Jk?=
 =?us-ascii?Q?oM5uzFhLkQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663c7db8-2b24-47a4-c040-08de834010fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:40:32.5407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hM9y7vufUc/MRAVt04sZ6LTz7iG7Ij79pz8FyoPLNxOtrXyAPoYHncUTk6+zE9uux2Nh0c6+OGNSg0XIVcoXcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_094035_132118_C19BFE98 
X-CRM114-Status: GOOD (  14.05  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The current description indicates that the 'dsa,member' property cannot
be set for a switch that is not part of any cluster. Vladimir thinks
that this is a case where the actual technical limitation was poorly
transposed into words when this restriction was first documented, in
commit 8c5ad1d6179d ("net: dsa: Document new binding").

The true technical limitation is that many DSA tagging protocols are
topology-unaware, and always call dsa_conduit_find_user() with a
switch_id of 0. Specifying a custom "dsa,member" property with a
non-zero switch_id would break them.

Therefore, for topology-aware switches, it is fine to specify this
property for them, even if they are not part of any cluster. Our NETC
switch is a good example which is topology-aware, the switch_id is
carried in the switch tag, but the switch_id 0 is reserved for VEPA
switch and cannot be used, so we need to use this property to assign
a non-zero switch_id for it.

Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 Documentation/devicetree/bindings/net/dsa/dsa.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
index 2abd036578d1..801e1411e5c2 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
@@ -28,7 +28,11 @@ properties:
       A two element list indicates which DSA cluster, and position within the
       cluster a switch takes. <0 0> is cluster 0, switch 0. <0 1> is cluster 0,
       switch 1. <1 0> is cluster 1, switch 0. A switch not part of any cluster
-      (single device hanging off a CPU port) must not specify this property
+      (single device hanging off a CPU port) does not usually need to specify
+      this property, and then it becomes cluster 0, switch 0. For a topology
+      aware switch, its switch index can be specified through this property,
+      even if it is not part of any cluster. Also, topology-unaware switches
+      must always be defined as index 0 of their cluster.
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
 additionalProperties: true
-- 
2.34.1


