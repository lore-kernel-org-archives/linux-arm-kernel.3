Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEA5C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kb8yJKjlhUrWh9jaLuR6PNi6RterEYz2pjx/reSWf8=; b=FblPPKbAUkEZXZbjmjXSljhw3W
	ZlO32d6Cnk0hyeMy6hestPO6ggW5I8ESKN6Eludj2NfqvtwxW4LKuoYX75q+LAYXMaSsboJtAThPW
	SIvPkOBTlOsNH9iFHczCvBpKxYQOkWr7F86FCZ+gu8zLd1XHOmVOHdQQzc2hBTBLPVdtIenjpF6jo
	ZD3iVAXeQ4CTboLYmF0ciFDf4Q3QRz+8G13ppEixjxqQrOJnBp0PTxP6Jo80ZxqdhRepz6IS5guw/
	/as+dCXD+e0Yh3u9tqbQf13nEJQ04RAv47+fc2V0pqhQ86uyIJIgIpW5aK9MigERag54+ZjyZvJDE
	P/iCFymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke04-00000001eXm-1Gbe;
	Fri, 17 Jul 2026 08:32:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke03-00000001eWC-0Jr0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8kb8yJKjlhUrWh9jaLuR6PNi6RterEYz2pjx/reSWf8=; b=QLq469lDGUiX2xHf2rE44yFhHI
	dpEoY3pAA22LMRbH9DfGE/1+JgrjixgRJryAiRkAdSTHdeCOBzXmy4/EiM03ZTMUhaWey4nnW1baE
	unUnwMBuDdrnZQIUSh1hCh2kDzOPDAW+Aaunc1fJGN3m9I9mXbfPLY9ARNc4G3jUAcRYS4tLaryJc
	U5fALW9DViVFHDTQY+plCt7JI9orvPOf/ZuDsX2TRBmJpR+ypWwcYwBXt4Ql74F+As7pPrjvU+8Ml
	7p0M0y/pQaXpoqc5PsCH1ByT9hxuhWwz9blYhHN5R3nj9q83R7yq9kt+Hp5A6/33QDy2moOBwqx0Y
	z6Pq7w2A==;
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdzy-0000000EfpK-1Ovh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:32:49 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66H6aYDh1797892;
	Fri, 17 Jul 2026 03:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8kb8yJKjlhUrWh9jaLuR6PNi6RterEYz2pjx/reSW
	f8=; b=NRQ3IJwNsSZese/ns6jPkE0Tt0Yf3GFUTFn4XrE/5h8bRI59xMNZ0+hjP
	g72RvsG4TZU9L9Sy0WuDgsbwid19j8Yn+aJLuGA9g1NV+Hqk2AnzTOTCo2frQi+X
	gvH4xRuqbRUJUiirgN89YJHtkiexnP/S+0iQNqpugHuh6z7kQV4LZvF5NeB4fDyR
	KECb/n28qkipto3K3cEQXLX2BcIaGyztxS4R31d3YR8Gkg55XchIwfks3iS3EKje
	0GNmZU1+Gamn3Xcarp30pmvA+TR+/pUzvocyYE6+8/MPNgBURn+CYSOrSYzWOo0E
	E6ifub3dBHaC4Eus0CaVMxXCL5K6w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013028.outbound.protection.outlook.com [40.107.201.28])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fex78e296-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 03:32:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAnpwjr4TClH4wvrazpE/I62HIRDFnk0lct3tLp+ng+AMc8XAm7U99x29+9cfBHBWmjcPaQ1HfDtHgH2WbaSuOd5PhxOg+6KG5ihsAXheYbtuHrTsLkOWY/rUhshQHjrvK7H16dS5WQZtF0VN0xERZYZxfosTq7gXew/kC41LuHysOFRdEP0rzCS0WajhKbxUxKe+9I8jYGJnZk2wu1EvlM2tpVAF39fjh51qYDRj6Y3O1VB+K0Pvoa4DjjUBnqimG7LF5VnMGeQCfHXXsqdR00h1569ecu3mmJ80bhoGLxs4+eL4VUeZ0s3D8S/lgMUvQyNqe3hnpXwhCTezra43w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kb8yJKjlhUrWh9jaLuR6PNi6RterEYz2pjx/reSWf8=;
 b=xtdmrEVDTqSHG5manBxSelkr6GpDHWL/rUmEewZKOUGQ375B5RCm6KSfhc0CWAvfEBD7C6Dz0zMXCSRK1xU43ll3bKa0TSOzSI3Mvv8HvXtYQvZ/kc8VPx5ozi/xLho7hadCKlSqZm3eZXTQcpMrbJv5OpHIdbziG9wV/ores7/ypsGf7DdbiHndkdwp1LZ3pX+xp8MGqjAaAr4o4XE2895tFeDuV28g9LSeXnx8yKf/dLsqftKeivacztmNEqkDA4WLU6fX3JHpBjcIpXkUUxrQUs8xey7rxJo+4oGi26h6j6u8Wi0TZllNDlIFHtylboOqDQCSv9khrblf8jhYEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kb8yJKjlhUrWh9jaLuR6PNi6RterEYz2pjx/reSWf8=;
 b=QzwckboxpqP0JUDQblZmM16JTp1UZC2Twrn6LYYr+MjF5Ea0i2nTi7REXpA05axsK/mS7KYX62949nqVCD4knkwFzmkcbZrkY47AKj1UAyRuTtO8X3OeUAohLs1+Uk4fm8+QUF7CXZO3fQCXP+yF7FIZWYMuiTtxeQDRoDWFzoE=
Received: from BY3PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:39a::10)
 by SJ5PPFC41A007A8.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ca) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Fri, 17 Jul
 2026 08:32:37 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::a3) by BY3PR03CA0005.outlook.office365.com
 (2603:10b6:a03:39a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 08:32:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 08:32:36 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:32:17 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:32:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 03:32:16 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66H8W27J3390257;
	Fri, 17 Jul 2026 03:32:12 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>
Subject: [PATCH v7 2/2] arm64: dts: ti: Add audio overlay for k3-j721s2-evm
Date: Fri, 17 Jul 2026 14:02:01 +0530
Message-ID: <20260717083201.1887640-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717083201.1887640-1-m-shah@ti.com>
References: <20260717083201.1887640-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|SJ5PPFC41A007A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5175b8-ac4c-4862-9672-08dee3ddf4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|36860700016|376014|23010399003|82310400026|13003099007|22082099003|18002099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: FH8DoxFg5ZScKXWkPQtSKKl2NCd9RIAMwZChUZV6ybvbMdRzcN1AihXwJbhDpAqOhXA1t7LqRVaL6NVV7KLXKNnMe3aPTe5TYnx8RZK7wozL+pf+xAC9B/ah7tfFh+78ytC4G2oz558TFjGLgOdS7nt8XVRBKHdqqTO2HwS/VSr80wPfVXisBFeHJgwikBErabwJJocjjFu7ttvQPdALHgHiaU2giizsh6PQstFdCVIQqhDvgR3wp655NlH+ZBzn1YPPB8rutJSZH7f02Sy2ACCiBzjM0DZ5s2ESpClD/i5mGky5VehoOgPNs3dX9OxUSF0SVAe8/lK93WMWGhBnqspqARNNC3uRFhN/WBZUfbCIJ2Ukdzi46X0iK9xy5fLJN5hgbrL39DkPpRu2HwsyW/RAJQU6kU4il8HWsc8glSSBG1XTpnM+YTBlKT3hx2fL0rU+RSIhwseqZ223uMmlFrTWyQy5u2mCmfNIHFf4itDg1RAhKfWn8GsCnQrcCUn0KckWycTWf8QyckZ1//TOaT+74Gj66sMDQCEdxkJRBE920r3142ld3sRLHjBv9Sz1Iqb7TiXorW7s/NoOyjsn/h/bOkaXFjLyA6aFz6f6R+8mprI9gLulAF7WffY3uSAaydBdQHdZ0/WP0f2axAlg9Q==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(23010399003)(82310400026)(13003099007)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KfE5IX7I8FIWKTeYoZXgr1SKXVtN+0qKMwul6jGPeGOjnaCsUlm7d3C0AO8cVG7V6spT6Pi1d41uj2k9ZPLnPVv9FM+rz5yQkm0lm0SVBhc3ord/S06S4ncCyeS3PBuUGF2EQPf+k03yeSvN1gmAKlofb6JuZzVP3l+4MVVaMy/WiLonuL0rYzOfJN+5Sy9DBV2Vt27eIIXRgJjb67eR83+6snBevI+sXJffehrdZjCOBuiT6FTX7nWYu3g+MUjqiuMYoOjklPF6ltaSAQvm4nH3Mn5EmpXeHhQBc8V1v4utX0i8smVcYGKNQzQ6G0Nb2PSTz72d15a99wyLNsVoDE1D//woKdeXvgMi0xh6E4Rb9VB7JSuQ/bw4cp84h9a0xmk0yfmZMANpNg2BEV2kw/yHEX01KIRFqrmWIqqggOjqr86+puLxTHrpc5aLTXRc
X-Exchange-RoutingPolicyChecked: iOIPl0jsevwc1hEzNRDAeSM2BjxMnScsIKVmAoJ2JVBG3ToKyxBZt+EdUfCTFjhwhGja5PKsAbPGCB5r0WwaB+8FNjWoRorY72p7sN9OvcUHwM56dLRi7agNkJCvK1qDZnoqvND9oBQtIjz0BeEvAZ+5QTj/snMr0p1Adwi+vTOajQyHd2QTNcn/+JbOiryFst30ue5jmTHuyZawr9T2OToy/l5lQ4RO9xeZ30Av2EzuC4kMwKGIquCxVNlFCVWAf+fJArPsz5iWLLR/11ceYHs/qAITODrBuAMNmIrAch2k8jfxPPPXl1fzs1p95xvnDmF7I3++2ff5Rs72u57NPA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 08:32:36.6744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5175b8-ac4c-4862-9672-08dee3ddf4d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC41A007A8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX1go2mQbuNsWT
 L5DdrNE+rLMJU6qjHrUB1RPmBeXSYvuPzmAhnFFQUKhwfqUVLdHYEYv9+UYMIRrvjEN0YAzCjvR
 gap5O3OnZ15wTYizxbcMNI1It5eDqhLiYuJVwujyjFybn7xIg7wsqH2ry/T6PruM27zR4It/fdE
 x8yPDv7L2ccWYMujqthKn11LJZVD1f/m1fcGk/TUCpum4833I6xePKPVdvU4M1X/sSATJML0plv
 3gRV52KTMsAMH3wThPNEJ9e02srklSrmQTse2VO+UYN7KKrkeALCqzjeZztbmo/nTuC7IJMONbH
 s/Pu8mUkrg8HnF0PkFC+567gzq3+Zs9zhEKjkFTyfDmGnuo2uDf88CZCA2+RPLF80qtZj3kIR3t
 HprD+8LrGITcWvvVWd0I9b9XlL2Y0mBPh1WLyGRSOAWorQKu9f6llTHBemEKJNInAGf60Z3EQZ5
 6B+8k2Jt99ZyZOALeug==
X-Proofpoint-GUID: 0zBCgMJtePWNuWwgEAgUJnNn8-u9JAKQ
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a59e8aa cx=c_pps
 a=bKR93RD0qenpecP8xHJc8w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=oFhqMRED-i6X9MmFsNUA:9
X-Proofpoint-ORIG-GUID: 0zBCgMJtePWNuWwgEAgUJnNn8-u9JAKQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX94stmL+/rLu7
 +E2i2X3HQUW9/R1eYy4eSS1d6KS9a6yjdpJVQWNdcFLeoP0BpxMbcirme6mqJRTwUr/IucvAqQx
 MHTydtvjOFM0C9zzTqdE8zXmNJ2Qw5w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_093247_096070_8B079723 
X-CRM114-Status: GOOD (  16.80  )
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Add device tree overlay to enable analog audio support on J721S2-EVM
using PCM3168A codec connected to McASP4 serializers.

- Add audio_refclk1 clock node to k3-j721s2-main.dtsi
- Add nodes for sound-card, audio codec, I2C3 and McASP4
- Add pinmux for I2C3, McASP4, AUDIO_EXT_REFCLK1 and WKUP_GPIO_0
- Add GPIO expander (TCA6408) for codec control
- Add gpio-mux controller to route I2C3 lines
- Add GPIO hogs to route McASP serializers
- Set idle-state to 0 in mux0 and mux1 for McASP signal routing
- Disable main_mcan3 and main_mcan5 as they conflict with McASP4
  signal routing via mux0 and mux1

Reviewed-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
Reviewed-by: Sen Wang <sen@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Co-developed-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 157 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |   9 +
 3 files changed, 170 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe52..d9824e17085f4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -180,6 +180,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-audio.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
@@ -320,6 +321,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721s2-evm-audio-dtbs := k3-j721s2-common-proc-board.dtb \
+	k3-j721s2-evm-audio.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -396,6 +399,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721s2-evm-audio.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
new file mode 100644
index 0000000000000..ac5a827e1b750
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree Overlay for J721S2 Audio Support
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "k3-pinctrl.h"
+
+&{/} {
+	codec_audio: sound {
+		compatible = "ti,j7200-cpb-audio";
+		model = "j721s2-cpb";
+
+		ti,cpb-mcasp = <&mcasp4>;
+		ti,cpb-codec = <&pcm3168a_1>;
+
+		clocks = <&k3_clks 213 0>, <&k3_clks 213 1>,
+			 <&k3_clks 157 299>, <&k3_clks 157 328>;
+		clock-names = "cpb-mcasp-auxclk", "cpb-mcasp-auxclk-48000",
+			      "cpb-codec-scki", "cpb-codec-scki-48000";
+	};
+
+	i2c_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&wkup_gpio0 54 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_i2c3_mux_pins_default>;
+	};
+};
+
+&main_pmx0 {
+	mcasp4_pins_default: mcasp4-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x0c8, PIN_OUTPUT_PULLDOWN, 1) /* (AD28) MCASP4_ACLKX */
+			J721S2_IOPAD(0x06c, PIN_OUTPUT_PULLDOWN, 1) /* (V26) MCASP4_AFSX */
+			J721S2_IOPAD(0x068, PIN_INPUT_PULLDOWN, 1) /* (U28) MCASP4_AXR1 */
+			J721S2_IOPAD(0x0c4, PIN_OUTPUT_PULLDOWN, 1) /* (AB26) MCASP4_AXR2 */
+			J721S2_IOPAD(0x070, PIN_OUTPUT_PULLDOWN, 1) /* (R27) MCASP4_AXR3 */
+		>;
+	};
+
+	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
+		pinctrl-single,pins = <
+			J721S2_IOPAD(0x078, PIN_OUTPUT, 1) /* (Y25) MCAN2_RX.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+};
+
+&wkup_pmx2 {
+	main_i2c3_mux_pins_default: main-i2c3-mux-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x038, PIN_OUTPUT, 7) /* (B27) WKUP_GPIO0_54 */
+		>;
+	};
+};
+
+&exp2 {
+	p09-hog {
+		/* P09 - MCASP/TRACE_MUX_S0 */
+		gpio-hog;
+		gpios = <9 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "MCASP/TRACE_MUX_S0";
+	};
+
+	p10-hog {
+		/* P10 - MCASP/TRACE_MUX_S1 */
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "MCASP/TRACE_MUX_S1";
+	};
+};
+
+&mux0 {
+	idle-state = <0>;
+};
+
+&mux1 {
+	idle-state = <0>;
+};
+
+&main_mcan3 {
+	/* Conflicts with McASP4 signal routing via mux0 */
+	status = "disabled";
+};
+
+&main_mcan5 {
+	/* Conflicts with McASP4 signal routing via mux1 */
+	status = "disabled";
+};
+
+&k3_clks {
+	/* Configure AUDIO_EXT_REFCLK1 pin as output */
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
+};
+
+&main_i2c3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c3_pins_default>;
+	clock-frequency = <400000>;
+	mux-states = <&i2c_mux 1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	exp3: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "CODEC_RSTZ", "CODEC_SPARE1",
+				  "UB926_RESETN", "UB926_LOCK",
+				  "UB926_PWR_SW_CNTRL", "UB926_TUNER_RESET",
+				  "UB926_GPIO_SPARE";
+	};
+
+	pcm3168a_1: audio-codec@44 {
+		compatible = "ti,pcm3168a";
+		reg = <0x44>;
+		#sound-dai-cells = <1>;
+		reset-gpios = <&exp3 0 GPIO_ACTIVE_LOW>;
+		clocks = <&audio_refclk1>;
+		clock-names = "scki";
+		VDD1-supply = <&vsys_3v3>;
+		VDD2-supply = <&vsys_3v3>;
+		VCCAD1-supply = <&vsys_5v0>;
+		VCCAD2-supply = <&vsys_5v0>;
+		VCCDA1-supply = <&vsys_5v0>;
+		VCCDA2-supply = <&vsys_5v0>;
+	};
+};
+
+&mcasp4 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp4_pins_default>;
+	op-mode = <0>;          /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	auxclk-fs-ratio = <256>;
+	serial-dir = <	/* 0: INACTIVE, 1: TX, 2: RX */
+		0 2 1 1
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 1228ac5711bf0..36a01a06dd254 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -74,6 +74,15 @@ ehrpwm_tbclk: clock-controller@140 {
 			reg = <0x140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		audio_refclk1: clock-controller@42e4 {
+			compatible = "ti,j721s2-audio-refclk", "ti,am62-audio-refclk";
+			reg = <0x42e4 0x4>;
+			clocks = <&k3_clks 157 299>;
+			assigned-clocks = <&k3_clks 157 299>;
+			assigned-clock-parents = <&k3_clks 157 328>;
+			#clock-cells = <0>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
-- 
2.34.1


