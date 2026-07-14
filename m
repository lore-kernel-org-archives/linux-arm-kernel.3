Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F677C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 23:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nhvTCzqU1n+XujT72ULfkrEuJRSbJIGrrGogbzzMmlU=; b=xxBuNqOGVhaOg0JSvifTQsPRJX
	dlmFC/t9L3whNrN068Q1pyWe1a+WpQgWerMJAFyFOGVlebKwzjdhhGdBUNVbL3t2R17IfE031KD9A
	NQrqQ76X+BuxxS1eFzot3JlUAjppklObFk068bYj3qXueM4+I9mTNHiRlZbRjUQ19XBfb765uWgF1
	YYdJUk/PbRO8/iA43wlw5JvFFQP0ZOongjQZAzxQ6sJOtnHv87F+0r1CCBqx86UyiaAWnxSJjxeIm
	e9smeBtWAoe1MUoxvIli+vT+4p1bcEV8y+qFZTgbgnExwqXxzmDprK+0aHAwcbb8jaarIDaQp2vLC
	OtMwHyXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjmCb-0000000DRS8-037d;
	Tue, 14 Jul 2026 23:06:13 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjmCX-0000000DRQo-2aFe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 23:06:12 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EIuP3b3002829;
	Tue, 14 Jul 2026 18:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=nhvTCzqU1n+Xu
	jT72ULfkrEuJRSbJIGrrGogbzzMmlU=; b=Q7YpWHCbid1MoiwMWp+euOv/e9W7a
	Gdq1yiuE2iniPUDOlDiaLtCeMAOWTY8j8At/ow5G9aYIdIMfq2ONn8eAZv8ztjQ5
	RvjGkFtcnxxTF850d4X202nSpgnaAmZSJGZmJdIaPQq0B3L8A1Ake3tTsTCQ+ttb
	QsT1BVIFjGYOd4vBnXKsvWn8UVa27UY4xWNeV8MfU7gGfkTnaiHh8f+Eizdb5qmw
	LTSd8Kz8ZzY8hv7WUGvAVmeUvdABIBzEyi4oHGsqX7+vwlEt0LsFypSeY+14vTEP
	fU69Kjkz6/ff+cUdp4sP183MPNtZKWlWKn6+cZkvOB2NvXuytAw96tvJw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011034.outbound.protection.outlook.com [40.107.208.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdm2tkrrj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 18:06:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/+d8F97lRMKHS2VQC3atxAc4XtSiddYLKFLBvc6Ko5Pk6AiC/6WLnmP0roSd2Bh+gxUfFh1O1RIODLh6F3SrKT62+yRq8bIdNkYE0+2ZyF/khzQvWAnfUkdODPE0pJ+iuSmj6MfZPuceeuoql/DgOafyipnQHkdrKTt00ykfM3qSwS7PcOEREPDSp330GirSwVA/LmLU16hDyNMJ7OltCq7FfJdcZaRv9WO9Tvmw/KjHyfvLqLR2NfNmmw/1+/CVElhozkY7H8n4k6hRExpKwtbkEYAZdZQd3VhqMY25S5c/XJ16rKQwGiVLqoMzy3585QcuixE6Flryq1ZMUnCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhvTCzqU1n+XujT72ULfkrEuJRSbJIGrrGogbzzMmlU=;
 b=wYcXzgTG6E2snnz6R8vPv9i5npkWPZadJDmUFsNZBpwkbMSmRji6NxoKoL1U8vnXOKnYWjnjfr6iT8GwDAt0MzCtor6IDtN8ZfCROTkAKotWsz0zl0SgFegAKMqOyFlt9AqTNi596Qzg8BNNUyl2KARow9WM+IRgohg5a+qRJtBNOrB8CCcQxGqjSYfXpH/d49zUZq+YbZFC4y3kc5Vn30dVcIxUyPTEU4og+LZbk6bkkxNl1UYRICx9zvypQViLjkFC+5cg7CspLkp1iV6f0Mv6cHkJEx12Tti1406C3fdC+cY9IiiDeQMMHKWoD11w30tKjp2zEuRJqG9YDmt5SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhvTCzqU1n+XujT72ULfkrEuJRSbJIGrrGogbzzMmlU=;
 b=S87zYxS9Ty90WQ6dD/ox8N5XpY6AabhSY6NsTxfgr/EuQ3uwc3ZZc2Wxeel4mGm6x9VXB5PNqA8boPBkK1uo4qwkUh8AU5ZUjZhvm8k2gxO+ktoSeyRHFDU+8JI2/zo9YBuyk2PwInw0cGMReh+nxUlu3usPiAJKwC71Ahk11Aw=
Received: from CH0PR07CA0017.namprd07.prod.outlook.com (2603:10b6:610:32::22)
 by CYYPR10MB7627.namprd10.prod.outlook.com (2603:10b6:930:be::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 23:05:56 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::9b) by CH0PR07CA0017.outlook.office365.com
 (2603:10b6:610:32::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 23:05:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 23:05:55 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 18:05:51 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 18:05:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 18:05:51 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66EN5peY1043038;
	Tue, 14 Jul 2026 18:05:51 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Tue, 14 Jul 2026 18:05:48 -0500
Subject: [PATCH] arm64: dts: ti: k3-am62l: Add bootph to usb0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260714-am62lx-evm-dfu-v1-1-62b025bea71a@ti.com>
X-B4-Tracking: v=1; b=H4sIAMvAVmoC/yXMTQ5AMBBA4avIrE1SRYWriEUxZcRfWkQi7q5Yf
 ov3LnBkmRwUwQWWDna8zB5RGEDT67kj5NYbpJBKZEKhnpQcT6RjwtbsKI3QRqWUZ3ECPlotGT6
 /YVn9dns9ULO9F7jvB4TorXpyAAAA
X-Change-ID: 20260706-am62lx-evm-dfu-2f0af65e9734
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Anshul Dalal <anshuld@ti.com>,
        Bryan Brattlof
	<bb@ti.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=816; i=bb@ti.com;
 h=from:subject:message-id; bh=ISY/eDIHciSRyfkolt2UQgo8sAmZBbTdLiJFne7KCuc=;
 b=owNCWmg5MUFZJlNZgM45DwAAY/////9/v/d57/7WwpP92nZudrr67N/k/tv5//2P6b1//+2wA
 RsZpD1ADQANMgDQA0yNNNDCA00AAA0MgMgNAA0AAMQBoANA9RoMTTE9Jo/RRAMgB6gAaA0AAAaB
 poZNDQ0A09TRoBoAMmmnqBp6gGYk0AaGnqDTTQ9RoaGgA0O1D1AaaDIaAaAyA000aAGRoGgyNA0
 yAANNGmjIZMg0Bo0ANDQaGjQBoNMmT1NPQEFaJI1vaeeMF2FihhMeCf9+/Ded2AFCEBFTw81evE
 djlq0KTbaD667sfEBb8T6v4nQw6yAnAtxBCe5AyEmZPECpQ6ngr+sBeeP26BasXPWTLHQXkjW2Y
 GfKOW36cRK2AIdgPFhcHCqg3m0P2IFVscIylY9xsRoHyAXRxsSS1n/A2SE0qWTQ9gYgjrAcf2mM
 Y1oupQmkLGGcR+VTwf/RhouD9Rc/SRKWShVLw4q576Vak4EvSCFftp8gFZx8Zx8Wpw/mgHQeK5h
 zQxFjNpdICi3nyIRPDXJy/6zOKe83Qm91iqdxMtxjVYut7erUlaBsv4udwrE7O3CsaiRKbMTZfK
 w1BglANlqqwAmUUwAGATrCU1Ugz+zIcKYCrD4XOAvtpgTEGCCZvdDHT1Fh8pxpNtQslWcD/oZvs
 EDUUTA1wDDSAuQ8jXn+LuSKcKEhAZxyHg==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|CYYPR10MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: c1dee53c-fe15-4cec-a4df-08dee1fc7598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: sHUo1l0ezZQhvomBAaz58eP3xde2d+YNTLhLXvHQjzfNZ6cCTF2TX+Pm8ATQM1J2Leqpndpw96MeWCpRzSnYoLP3eX9IJ3kWNsRoSaTdHsdDQUeq3fbz3altH5J7t7dYCzJjL9AyionzGwe9g9IdMMneji2UN1/Mq/4QaV4c64wBnKuNSoM0bQNImMrlsYpH4enj3bR9xbQIu4xD1AygwTA2DejQFBVV/ySj4N05mUyy+VoSkFsgRS6QpravmYN4/ttClUX8kbsoMXQtlF/uNHM8zydk4D2gK7UqJVNG66h2sFMXCAweK09wlXqXLtmCk4tsCQxHAHlMMaQR7Q7aXatoFiqTYSXW5roW3WIO/uc+o8/SUH3908uK2Gf/ruIf/anPwW21o5X25znzFRU8R4s5O4+IqYpR2weEHTHhM/uReBTMNxFNYdMtaevXj789xKAOBYhS7yoCnQVU7GoFYqzO8yUBuuGBHy2/8ismVsW9Ur5F7CPs/RGkpStTO2orcO8YnKjx/3U6h95tHNYRygUAP4VMMzd70667+akf2CWXV56pybAZlk8SO6fMaV3dmwatLEzmqGAVlMGXmpxwp8zd0pBKklzJH2xnSMktXiW3qX7TBO2Y/lo/ghAwECuwQIUmO39fe2cEFiTjh7G8o5m3fb1fiLMdvbTEkEdXBXlFvAOtvIZluHEo/AUAfr6Ets7zistMBP+hT9qqkPH/HQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yYWxmC6L8XSanQ7ibVFMWxuqP3cazk2vQPS5xiQ9LxD9LxzC5/+k5cnEjEO73Nz6Dfu26N6OQAbrHmj96gKpC2RoFvh5Fibd2cJDURqMuvgOW7op8nW0vfHk5xlwj3UZ7AzgSLboNjWTrDaOzcNPba9piNtJzUK8zbISaBb+zueH1cfpDJ/S1AxrPp36o+RAjeh53DR7peMTMi51NZ/RU2IuBzyTuXcyUHDYOvt1FXesyijCz2xDMPkThmmxhT1vzRh3vUxjC9D8MG4JMBvKL+4Nr3KK8YXrAZh9QcTUtwv+Zc8MWFIi7HOpQxSIcldXSzdA4wMwHATV9paqWdwmsQRECeHpVwDHPSCXCp4R9ADuwCpOjqD+NwU3RQ1obQ8T3n5k3JjluCMv8W/KzFma2+vbl0Y8eXMqkzRUs20uQlbZr3MozGOJfkCS/cds494R
X-Exchange-RoutingPolicyChecked: EPHiFPYo3qSQyK2WEqoKdQOC6q+QBBKYvnNPjsGHTBr2GKu3QLC7uT2ve5Z+vl9eP8TrXOwSKOo29ZmPgC5XSxxDI4RsG2kEOlmudRWixyc8eY8ZmNWoKXrQwIIFg/Srs/m4/dKfspZwkgtEb57iHMsssf51JJnMjwEmwNRwrw23k/newuk1ZDDQKeaeO4D9GZgNU85Jp2RlUk++d6iaHs3tiepDXN3XoQX0ineGn4RfkIjJw0m14qSZCxXH6OLo5BOXvX13wrPonkZScjHaEB5lUthk6vzDuJrX0aYQhzMMGhXU/0oS/POfIM5Tt2oYWlxLn2OtCFg8HYzYUmU/1w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 23:05:55.3220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1dee53c-fe15-4cec-a4df-08dee1fc7598
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7627
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDIzOSBTYWx0ZWRfX6+4VcPY18Esl
 2g+z8vLPtzFj7edn/K5OwHLzxdRh/LuDgLQTodZjQ9fisjGbWrqMENkq9nEuVCuuAo4cMHIlcm2
 lK0RGXDbhFYadYJrQZg5fkfKoGxu2i4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDIzOSBTYWx0ZWRfX53dNo05+geY0
 M3gppZY75/6WWeMQgsuGIWqoy8c2LKpAfWZ/54FhoxoYVHBuW/c4DU49ENaxmaKLdl8UHAhAsfG
 nQlBq/p5ZaNmZwoKv3F0cSmTH1Cld4B57rLOqluLULRVMWs/3s73j0ztNbsgU8Ujtgs0WAzbsop
 Cb+j2TBAc48apfhh5uCUNzoSDPRIsUxyah5TQP2KSGFCwieUiK6CUHKDBxFRpMH3+BCaCp84fb1
 dW1mClOExzYwVCS673NIHwMjlecPYJiKnuWCZrUrdM+jX8cqey+KxLToSu2W/IojJ4v0YXSxvCT
 uXJ9NC7qiDCBjmU1nBBm9aZgDFdXenR0NpPPAZctuDrXwhrlBM3YODoZx6OntkloaPQn0pUiU/j
 FwAL8CKTAQgMLaG8x/WKilKYFooeFfUYIVYE93qMqa7XQ7Dl2eL3fquTku0RnLfal0dlF6DhcRX
 kBls5kOBNgexgZMs/ZQ==
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a56c0d8 cx=c_pps
 a=zZIwMYV7Wou7+0JapvgM9A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=oEzHEs0w8VfrOXkm9DcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: XaBFzdRy7U0G1_aIMRP9wicLuGawRpyQ
X-Proofpoint-GUID: XaBFzdRy7U0G1_aIMRP9wicLuGawRpyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_05,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_160610_668807_1ABE34A7 
X-CRM114-Status: GOOD (  10.06  )
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

From: Anshul Dalal <anshuld@ti.com>

The AM62L-EVM has the ability to boot via DFU. Add the boot phase
property to the usb0 node to enable this boot mode.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index a1af4571a815..84a0cfaaf196 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -356,6 +356,7 @@ &usbss0 {
 
 &usb0 {
 	usb-role-switch;
+	bootph-all;
 
 	port {
 		usb0_hs_ep: endpoint {

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260706-am62lx-evm-dfu-2f0af65e9734

Best regards,
--  
Bryan Brattlof <bb@ti.com>


