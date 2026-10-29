Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A144606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wX9GHOnx;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=QI6dmsyF;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=X092mdVR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uD4NzRCsm92nvRqQMsf2u9hdU6AoeIuuighJm0SER64=; b=wX9GHOnxME00v72h6utiG8AhlK
	cve1V79CzB5qdAhI9HpUHPPogp2QI7Cd7vs4ZQoG8kKWud4nGsglVFCraQI7tDP82zH96ikn7O3p/
	Kwl3RPvHvmsMP8eAJ0qbeSvPqJDGQuRiIYsd5nUTOj3xc1+TGkmdUvikWHC1O5fsDHcH+o8eDQljs
	MT4SPGRLc8crvtT/mgyOfRylH2HQFWO+qfjlXNXjFPOE4Bno6g1ptLB/fWGx0Ir9hYDM20iUJ4FA6
	uIXoyDnv8xNSr1VCz/xbEs85VPDzCHxdxkvTLJGFasMt85cu12xZzLF21Jadbc/2aocUcDqG5yCLV
	QI+oSvMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUdf-0000000A5HH-0Nor;
	Thu, 29 Oct 2026 18:14:11 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUd5-0000000A4mo-1dbb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:13:36 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDkbm2604323;
	Thu, 29 Oct 2026 13:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=uD4NzRCsm92nvRqQMsf2u9hdU6AoeIuuighJm0SER
	64=; b=QI6dmsyFPqPmhHuryaF1Heb0l6wFl/uA46QfgVSkMPZLu5f0dFmwgmV+l
	TTg6HiwYo5kN2hW+8DiTkWLKmyviPs39i9/J4cN5A90LCjQ6Hbu7NFYm8v7fXPjG
	ts/rgAEcddDytJ4X66IIrKVP2BT2Z6hp1zjmJ/YvqgAoZkdG4N0bKZDv5C3g1Rca
	n+RzXFkVfo5IdVLsghgyhLAnqAv8V0gm4+h15/h1dbtfo/RFaKHsjPh9ZcLVokuH
	ZAfPCQ3qx8OqpCTp6pfIVrT0ZcOTfe9Z9WwxWXc+eZHuKTgyc+kc1Gtzddbajqjh
	9d1cvuFpuYDxI2Ps1GbbHAzNY+pHw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm55ak3t3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOOlJ0rtygsWG5/uIapKFnt0wEWphec9Tb/MtwXdnnI7oNiIjcHo+xQlH6b4yQyXXb4c0qUVVq+SIFbiNX9uWWYgXxufiTmQtIyMGZsIGd6pEpwKxQfDz7+p9IX+Uy7PAhy8rZg5BRtUdFQmmmyhrr1/GJ5RaHic5kqNEEAL6KMs7+9mj8pnTLg0nkLdD0bBKs5Uof90ok7xmt202sUcrcA8zv24ozU70V6IolSF7xPlyfcwLWMMVjzh894/ZOQ5qXYXpzIY0LDJSbG2LWCD679JCHO4l4BFMnXztoRpC7i7cUw0CV1nD5S+TMfriOglZo4rsRWWfgNljouvVuBAzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD4NzRCsm92nvRqQMsf2u9hdU6AoeIuuighJm0SER64=;
 b=hMzmnRaDXV5mPVNc/858JDp5XgI/V95u8RK+UgJiRbV4hLu9MBITtSIUQ2XJyEBfswLWqcKpf72qVEuexPMvEi+6qIvnu2AG2Pf50iFKzyCvVq/1SZXc6YCUf/oa3tdaya7rRPHlcYYFc2LcG7354S6QE5UhytU17/r22AsySnO+BphlcILuAKLUYF/vlxGWng7jElwvdc/PCUBZ31ft4DJJttqL1bKQPDyvBs7r0Lrloobmt0tyf/oau9WcUcpdLzBxHueV1TmHqgvmwDfETkxHi+uUPkyLubrWpsP1KFEcyzDcquYgEglzH8/IHP8enONR57/9byDLhzNC8VhCxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD4NzRCsm92nvRqQMsf2u9hdU6AoeIuuighJm0SER64=;
 b=X092mdVRdD6X+vIhfSkCnqRQc7WnuF7lzkQIFgfR7bdNe99YZzoLEoCBJP/OnSRIiHmcujgzQgEr3Z7C5Hy1S09PNFAs1S6phZ6AL+6GScnelGlV3twq6tOEGHFD7xMTirlV0GB6kwGXpuso4JdemczKYDOnNMtt5OuxEiHJP68=
Received: from PH8PR21CA0015.namprd21.prod.outlook.com (2603:10b6:510:2ce::12)
 by DM6PR10MB4188.namprd10.prod.outlook.com (2603:10b6:5:21b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:12:49 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:510:2ce:cafe::64) by PH8PR21CA0015.outlook.office365.com
 (2603:10b6:510:2ce::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.4 via Frontend Transport; Thu, 29
 Oct 2026 18:12:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:12:49 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:25 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:25 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmMB3408718;
	Thu, 29 Oct 2026 13:12:23 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 11/22] firmware: ti_sci: Use rx_message as message receive buffer
Date: Thu, 29 Oct 2026 23:41:36 +0530
Message-ID: <20261029181147.266771-12-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029181147.266771-1-b-padhi@ti.com>
References: <20261029181147.266771-1-b-padhi@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DM6PR10MB4188:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c5cf8d-7658-4d1f-0c25-08df35e83dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|261009223027099003|261026130827099003|261026140227099003|261026121527099003|261026135527099003|261021133027099003|261028144727099003|261022105027099003|261022115727099003|10067099003|261022113327099003|261021130227099003|261021123027099003|261022075727099003|261021135927099003|261021121427099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: OAvFqQAOFsxYG4Q2M9bNy1hvr8IzVSu/Wq1AgMReTjTYQjjn4uUwtqxz/VNiMKey0oklWlj8o6OPUoRePG5SYDnkiXvotVlb1w99PJmGUAQLB10WamlGKr9hiBMK9Vnt3KvbCqNGd6uqvJZfEV3DADEbJMsCULuCOhyxFRALRI4BsfKULSaoFn2zk/zStHxFWnnrtK+yKEY59pKzJVmWIRkFd6GHg5nRwkxHSsuK5ohunASNG9HMU1N4RUOCqVjCOky9oiDG6J0ZwB+MQGVuKMFqSKr67Lfx7vA07WxwotQn+SnsZrxwT1lnaC5nuTqEohrCUwnrbYGd4bKJ4a3dxgs/kwZ0cVACGjNQPlhw805g8Eeyjzj8FdBKZcxJQq5ShVDVN9wJ9zB3HD9utWG9DXNaM6jNKcu4Gd8bnGc5EhNX6wC3+TCy6nmvW5VLjGXlDj0kxgIxywzdXlh6Kd6JxriSzOzuwHRKkXpfvQzbh2n59WLorYe1waFv6+ySgnYDBd1dO6Qjh/UH8nBKZDqTD+CuHXZ+uhkdm8XQRCYn5gaZKYrix/GjQKNLcRnACpy6DrU2YXWJFPrG865Zr1QSCakAoJqKPZPhHndP7hAe8VM43SjYGU0fGxfZtkXGO+BxYUkm/tEkZWoGaUZ6XXen2Q1zv6u3qDoQlF/VTJlFrgk=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(261009223027099003)(261026130827099003)(261026140227099003)(261026121527099003)(261026135527099003)(261021133027099003)(261028144727099003)(261022105027099003)(261022115727099003)(10067099003)(261022113327099003)(261021130227099003)(261021123027099003)(261022075727099003)(261021135927099003)(261021121427099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cFe0SAtkk9CxVKlG/BXhK4vJNtcbxiqXOWcruirG5NPsX8xXm7ImHve5kFIrtPcxCjDZU/dhZDA19mFC6KS4rp/Z0HNrJcDRNiK7JR8RRHLaPKnLDcqMFlwg+6elSivnCZ2mhVKf5C2VWpyCtiCiGBrWVwwI2I68gLlfvC4pM1sm2tJBefoeQYAyQngAzCxcgref/kJ3kaOAvkmYUMlwSEASsRNg07+x3bL89hGagZqNp82+opp8LvMDjbhEajnRcRrD6flJUwRCCpoVzitPDD02ur8jqUgTgyR1JSNujOoOQD3zvcCcr+YzChvLt62mhVQfD3UNvYIiO2VyofXolkylpDW5Q83bB6ouIfnUv8xlmA7I6hp5bpJ7/cbsha17YtZ3Mj2dDmbOO1nVQpFeZt9/r8Mtxu+iCj3kxSx48sZ6nYASjfbnk4jbALnaOlJO
X-Exchange-RoutingPolicyChecked: k+ZpFSSesRKxCVZ44nSHVmUZZWhLkWRmxf6cDXpQD3RHUdXf6FmuCVs6sEX58Z0le3zHhFMVEZfjxrjCYimzH9IN4dBeyn2N9ALUf8frcOnjtaEXtrJWq5UAXIb6n9kjC4BArUdJgVEBAbPf+X4dTshdxIPc3XVtct7hSKA3IXPIqPiHTxzoZQgpFDKAfItUuoD/M+6TTwf+/Iq7UVP6IGHEAMr2O5sobVGkwnyFCK1f4mGXEA1kqapXoO3Fkr9SmPFSTzal1rbfBKwPQeL47OxQtxnnWphzKGfETD/tPkXF2Dh+l7L9636ewG9SEIXJST7jjaFhic1fmw6itZUKKQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:49.2909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c5cf8d-7658-4d1f-0c25-08df35e83dbb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4188
X-Proofpoint-ORIG-GUID: TcmQp6DTJPO5T7fEE894Cm3X259afR2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX9PBclGiH6hH3
 Z1fopuNc2PMfTAbe0Kb8VKBMFM940JoiILQyS6Z+e5d1K29Gbas/qvHX45tXKsp7be+oDBlFA3m
 4G719To/sXCxYUwS+rMhsTxVBVwF4s8lPmJLkWa9ZyyXcarWFcJJIGP9Y9FdHV7vKedebNj7lyE
 Wo0v/JoV7j7pLwXZAaETNomupD6hymR29rmNOoG/wtpc9hw0npkwbIK0pdA3lN3R9pv5iEGU89r
 mxhWzVBvmuITS38LwxXnsfs8YfLB5cY/9zCJt6yIvFEd32giljBHGRdWNWuuvM4kFT6Ra8FSQsB
 +DyKDnMEWbo0sp09rL9rUC4F8pfGjczWeWtPkXXZ8IHb2/sEeYl4XoVv6CzMqRKJUyGKwUzKMgG
 OtD/x2HsdIpN03QEQnPguGgygKZcAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfXxI7fbpklzOra
 QExH32lrWxc1WLE+Td/W4C15rpDKvpYajLA6qWQTrdigb4Ozmz/yqMCjqknVJhFplE+D+zF//O+
 qtS4nw9SDKZVt60/6GweQ/j5srevbDU=
X-Proofpoint-GUID: TcmQp6DTJPO5T7fEE894Cm3X259afR2W
X-Authority-Analysis: v=2.4 cv=eM2GH3p1 c=1 sm=1 tr=0 ts=6ae38cc6 cx=c_pps
 a=jRvQvoFr2LhS1HEjeZSEyQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=6xb-8MLe_s-5M6G4LukA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_111335_564886_9EADE02E 
X-CRM114-Status: GOOD (  19.88  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andrew Davis <afd@ti.com>

Previously we allocated a message buffer big enough for the largest
message we could receive for every message we could have concurrently
in flight. Now have the rx_message buffer during the whole xfer process
we can use that as our message receive buffer. This removes an extra copy
and the amount of memory we need to pre-allocate.

Note: rx_buf now points to the caller's on-stack response buffer. If
the system firmware replies after ti_sci_do_xfer() has timed out, the
rx callback can race with the caller returning and write into a stale
stack frame. A reply that arrives after the timeout means the system
firmware is not responding within its specified bounds, after which the
system cannot be expected to operate correctly anyway, so this is not
handled.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-12-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-12-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 6ed67160c6a7f..fef7028d40e39 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -45,14 +45,12 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
  * @tx_message:	Transmit message
  * @rx_buf:	Pointer to store received message
  * @rx_len:	Receive message length
- * @xfer_buf:	Preallocated buffer to store receive message
  * @done:	completion event
  */
 struct ti_sci_xfer {
 	struct ti_msgmgr_message tx_message;
 	void *rx_buf;
 	u8 rx_len;
-	u8 *xfer_buf;
 	struct completion done;
 };
 
@@ -287,7 +285,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
 
 	ti_sci_dump_header_dbg(dev, hdr);
 	/* Take a copy to the rx buffer.. */
-	memcpy(xfer->xfer_buf, mbox_msg->buf, xfer->rx_len);
+	memcpy(xfer->rx_buf, mbox_msg->buf, xfer->rx_len);
 	complete(&xfer->done);
 }
 
@@ -522,12 +520,10 @@ static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 	 * state, then ensure that the response is an ACK
 	 */
 	if (response_expected && ret == 0) {
-		if (!ti_sci_is_response_ack(xfer->xfer_buf)) {
+		if (!ti_sci_is_response_ack(xfer->rx_buf)) {
 			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
 				 caller);
 			ret = -ENODEV;
-		} else {
-			memcpy(xfer->rx_buf, xfer->xfer_buf, xfer->rx_len);
 		}
 	}
 
@@ -3326,7 +3322,6 @@ static int ti_sci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct ti_sci_desc *desc;
-	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info = NULL;
 	struct ti_sci_xfers_info *minfo;
 	struct mbox_client *cl;
@@ -3380,15 +3375,9 @@ static int ti_sci_probe(struct platform_device *pdev)
 	if (!minfo->xfer_alloc_table)
 		return -ENOMEM;
 
-	/* Pre-initialize the buffer pointer to pre-allocated buffers */
-	for (i = 0, xfer = minfo->xfer_block; i < desc->max_msgs; i++, xfer++) {
-		xfer->xfer_buf = devm_kzalloc(dev, desc->max_msg_size,
-					      GFP_KERNEL);
-		if (!xfer->xfer_buf)
-			return -ENOMEM;
-
-		init_completion(&xfer->done);
-	}
+	/* Initialize the xfer completions */
+	for (i = 0; i < desc->max_msgs; i++)
+		init_completion(&minfo->xfer_block[i].done);
 
 	ret = ti_sci_debugfs_create(pdev, info);
 	if (ret)
-- 
2.34.1


