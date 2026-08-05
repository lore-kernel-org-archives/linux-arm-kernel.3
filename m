Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE681C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 22:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHpjIzaDlYcpm3HUmDtq7ijPle6V0m58AmFlX8ont2w=; b=EHHa8vARO/DS6zU5d86B9LthkN
	wnpOY2Onig/uBKQ9nEuUUL+uPa3+EvKdR62nUb2Kh/drum9sYA5B0CYySPbXJowsFFiaWo4qDYlCd
	vh1WFlrmYLeo4/QFO30YB1t5PWV8EIfYr4204PqMgJ5UqbZABPubQbcLtb/TYSkI9HlN/KduxwA1U
	vPGvBdA69d0dsooyjT+C8x1/dGqanJM2Sj8F3mttZV7q5HGPZu+jNQKTBsxl8vS1PCwOlBvNX1uKt
	F3RN6RCkzZhChaU+Lew+/J9gzZJctz67nFg0NYn7HggM2UTpqLUF0CdxJCjVwpT2SspLPxm/OjniO
	NgoXxpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkVo-00000004ctH-0oxL;
	Wed, 05 Aug 2026 22:55:00 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkVl-00000004crz-23Zm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 22:54:58 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HVQeL1786720;
	Wed, 5 Aug 2026 17:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=pHpjIzaDlYcpm3HUmDtq7ijPle6V0m58AmFlX8ont
	2w=; b=lHT/NHOwRDxoT9UbklTu9tm4NB+zqKJnRwA68UNk6DCk3Bo0+bYJ8ngkT
	ZSWzMqdbfyLR4PPziVZArsr12sHkQ3p0bMrKx1FLrgETN1n75ISLkggXffnci6zu
	S76P0ANPgcqz2eLtOl/bU4cpR1JSlh7U2gbDqgvQmgDBeQU7D+5Rk/ndV6mrDy8y
	VQ7u/vGr4Mo6eCDUMOAik2HOpssgQK7PK/i5JTAEkBK9vYx4qcYmY5i3hPJycUWz
	CabEMCEI65lHbBUdod+WmVwFaUW/KryH7DETLoMzEbdQnZH56HwZIHp1yhfwkAEB
	xpZr0y4cUQpyCLoKdEd6QQxR8mYNw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fuuyqytgn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 17:54:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMPY/WQro5Ix3onHngp3K/nemXENtfNsR2UBZHWMkdxtd95KYE6yaWX2iFaLqvwenwLn/zvockJ2e5O2eQCBlK7+TNLPqfqG3o7D7X+mf3X5hmXWtV9a1+J/D0h4RmJLYeR+GtUPDkRLhwAacLd08oTYyrMNW6+xWhdugfifzHAHj1HGB5V12mk0Jz4KpJClUCcuqeOJEw9gGNutzculPc3QPe9XIjcpX1Oi109wmDJGyNgSt4bbFE12yJJ3RfkYU5E0W+dTQGTADRdF5XeDUpHIEHzurQHp5YdQtOrzBvVQdB9481/KNBFNVQbxw1E8xArcrRdqhjr1sPou6/giUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHpjIzaDlYcpm3HUmDtq7ijPle6V0m58AmFlX8ont2w=;
 b=pSxtu+6TjbioB4n0Dz+7LjUMAfJfclXV56+SlAk6D96TwWgyeK7FG1FJh4zf1F7wi05rUYwK1O2NdFpffI4AzozKof0JdqjVV66dqotK/PNCIFiZYsqPFzqP7ColvaDbmiTdylOxzKmD1zXPCR5I6n5sz6VALrUEHOnuQq3559iooxbA/dkfrC46udSsoM/PpmHOB+j2Ztcs/A0WeUwD1kplQuasGBOq70E0n2auo+1CY2UiWeyv9Ga75YxjrhA70X/8UbLVipc9qmgq3gkq4LIRshYRnreP7jgzTL//+/MnX0vtRzHlrWRCz1T11w8NTgvUfZfTYaGFxQ0SPjsm9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHpjIzaDlYcpm3HUmDtq7ijPle6V0m58AmFlX8ont2w=;
 b=NCdqY2Qg2NkDrofIzE9UuJeKdMI8sGeX99wfHtgw+1Z2wuv+n9N9xaPDYaiEkwBM4DVY+NiWgs+ReM4k99eW/Ak/K7AyS9Qfh8tYcA9H71dVIdneehYB8uJ0VEHLWA8NKiFhzlDI8tyGhVO7BTjf3teT9lPtK+BJlfhLU2ESzYo=
Received: from BY3PR10CA0019.namprd10.prod.outlook.com (2603:10b6:a03:255::24)
 by SAVPR10MB997795.namprd10.prod.outlook.com (2603:10b6:806:4e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 22:54:52 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:255:cafe::34) by BY3PR10CA0019.outlook.office365.com
 (2603:10b6:a03:255::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 22:54:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Wed, 5 Aug 2026 22:54:51 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 17:54:39 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 17:54:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 5 Aug 2026 17:54:38 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 675Mscth2968446;
	Wed, 5 Aug 2026 17:54:38 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v3 2/4] arm64: dts: ti: k3-am62a: Set MMC clock pins as OUTPUT
Date: Wed, 5 Aug 2026 17:54:36 -0500
Message-ID: <20260805225438.464184-3-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260805225438.464184-1-jm@ti.com>
References: <20260805225438.464184-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|SAVPR10MB997795:EE_
X-MS-Office365-Filtering-Correlation-Id: a1206ee1-9578-4d58-c19e-08def3448ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|3023799007|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: pLqmIhCNAGRtEp1ugrL9hsLmFqTnHbVpU0JRrRAa9jFbD2bczb0vL+eJZe+trkKVq1izfYEymlQcbp3YQ0x1MBuKbqq0c+ksw2szzQzCumLoByKgUiKdd5JZJjXoeZuhOjj843Q2Bv8Xr6CL/ORnYNVGRhOqOFjDk4+2X9Hd67wjvkteulNZB0t0RShzzKibE5iwmpB7pMYKF8RaXlh4GFR+zE+cuEUaOB0J6TFtWZ1aheK6RPPt8F+dFQg/jpKp4ranJESEQedfCRJSw3mZD6m9KzqJILdhtI/V9bMVuSelvcA8M0OkDneNU/4JHHAzrd94XEF/V3fHdAY7/KT/F2SxeLMI6K0972wqTjrOSiZmb9IQDWqWpk61N9Wplcq+mlKQo4tfk3r6SXSdhXwoKAfkgr38QbBbIXdyJJwYjP4etwNFfOIE5zCC8qh48BIh+V0ikZ5jb5+fiLh7d+C//tz6+hzqtEmbbobjqaQqq19d4INnoH3rryzOOO/Fsjk2ZMO3xcjmnOyXJqpM2aP8L3DEYpDVf7HQ9UMNRVTVnED1T52mTfjLbHQowEVj6eAWsKOkadBwdei2vCm/RQsorTyAr3qaGmLkeoFvOk7FIJLvErI/9kM5jZE5bPBJ7dq0XNJ4Z2mpsqI6zkul+JY4s/nPLG1VzG6AOAFCScL6olEvijNtbFiX+vXIoIznheOs7zg8V7drhPeHm8pXMqEKdw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(3023799007)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: q6SJ3Ww4VfiLx6oczXoQq9teTRd6Ng+UCckKcHFQREKCHQX8pkcrgnHymqj3B8sEU742l8fvPISy+hKbgMFnY+q2blcEedmSgxb+9HsIRhdxwALduG07c5xKEMQAaJxLN7brbD1waQsx59w/pZV+0aWZwzZsAi2B+a70He8EZdDvbER/8O1KjqjCLYL2S4wpP2txHBDH2mJ6Ei8Sx5ejWulxrMy8ueziROJ5ULNKohxNyUzvXIkC6BXUhxQqAKgc8BEbYXy0LOdr1fjRGJ/ObOLNr2jZy/kOvR8uSCxEZ+wZtSoyC9taDmJXdnZVEc1HeASgBvGzaI8I0aS69hbxJ9Yd8jBMOMazTY0bG4x7YyBwLLO7HufveYzbwtWf0DtIhSHCvloBH7vNHuQ7wLMk9tOOjpUDIR7OGX+wRlLsDKzceoNj0LdqE2VpEpuCMHw2
X-Exchange-RoutingPolicyChecked: CTSJ8ytklmt2RSUgWLN2lLvBGK5Rjo8XJzvbd32mR8qTBlJE7jDYeODfSKGSaSCpFEN2xnOuKQL8A6Q2EYU900C2T/B4zsOhGY8aa6jmat2DF6FI2QweoP6Vu/DBGV/MJ3lmKCR8eB2RhIwUOYM2hEd4LB1ADufn12ySa1PBZWxgV7RKCZj5C5RGnUsrO9yatkRZH8XQmZvaFaWYWpgtWm6F6coP5bK2dEu3+k1alxIh0WWLOA6K8zDkzTmzubfAijaiUERSzOlGV5eGJdwUDaIUEySyEBY8mAajLDU22ESqRD+JRnYqcYx0f+dW/VInMPymLRkJBy7BOnRSteewRA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 22:54:51.0160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1206ee1-9578-4d58-c19e-08def3448ebf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR10MB997795
X-Authority-Analysis: v=2.4 cv=B/yJFutM c=1 sm=1 tr=0 ts=6a73bf3f cx=c_pps
 a=yMiMM/zaslgybVO5xx/4Yg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=py86r-KCYd5x2I3iXOkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE4NyBTYWx0ZWRfX2FnufnP2Xahz
 TJPEVQHNv9Ibj8w7Tfnp6TQQ3ktd8ULYoeIgqqWy9rbBXmKauXIV9lK6tyxM8sWnyOGqYcU++tI
 HgvFvzFK3NqFjL1CimE5Vqy1Jfh9F/s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE4NyBTYWx0ZWRfX6ue9slHk03By
 PmuUvQsgLZEqQCDfwj1UCJiyiqiQ1z7fpyhh/EP+lkB7G5R22wPLy40UmSODrr9msR57QxWxDIy
 nxgYOWVvKtIhcCBVXpKph7aqsoBE9KY/WFD55kXuG5Plkw/WOtliQB44LacZ9FXIJzvFvj1dmdO
 9y2NGXv7w+H8VQj6f5t6HIJ1ztxwFAe+IA264h44LtMifwImiNQaCYOfDtp0wrFwxFMC7UtDyVo
 zC1HP3fHwv16tdmR0blBBzAgXD1GfOlg/vt2Ur8OiVHs/iVur4FpFxJTcww3I1BezOr5wb6McET
 PTajp67uepr6jc60Q3T7GUbE1UfKxwEaPrKj3VCchV5+K2lLjTeQUOnIb5iL09goH758oIU0qwm
 LqZkewlAOhNgX4Fl9JoRdyJwhj+Ls6AxRlJTvQbfg4ZyTSQ6mkFas+gdZP0jCEOGaZlVi7LhyRM
 hcYd4VCw/bZl7Zc3vVw==
X-Proofpoint-GUID: dDPnPrrjqdtAHNvRs_tnXs0HgkC9Y5Cs
X-Proofpoint-ORIG-GUID: dDPnPrrjqdtAHNvRs_tnXs0HgkC9Y5Cs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_155457_641865_2E198F3C 
X-CRM114-Status: GOOD (  12.51  )
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

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruj16 Rev. C: Table 12-257. MMCSDi I/O Signals

Fixes: e041ec6e86e7 ("arm64: dts: ti: k3-am62a7-sk: Enable eMMC support")
Fixes: 38c4a08c820c ("arm64: dts: ti: Add support for AM62A7-SK")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
Changes since v2:
- Add Moteen's review tag
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index b04636cab71c7..e63c5200a2370 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -328,7 +328,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
 	main_mmc0_pins_default: main-mmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62AX_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
@@ -344,7 +344,7 @@ AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
-			AM62AX_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
+			AM62AX_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */
 			AM62AX_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
 			AM62AX_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
 			AM62AX_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
-- 
2.54.0


