Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BD7C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qs+wWNgWmnm/OWzkjpZ8KcBSC69ItpZm3fjtjYmKyo=; b=zqPDDBMxwrEkE3G6jq+ubGp4Y8
	mQmu2yDe2dJHLAankqZz+dPcD7MhAEQ05RaQ05ScvKDh43R71J8P0F/Mqbnd3oBAN7EKF1vYPz3vK
	v7cPWDtZJvbXWSkBLVnkz1EIyNH0TXfqLCv2kf8XdeirnFgtnEemaJ8EAc5G8yeXJqq60yvAqeXeU
	F6/HaPl9PsM20oScWR3ZYRBRmMCeEzZTh7cjDDiV97yGx94ulkHOte5O/FELX9vz0AquUeJ9KYW7D
	j1/IUHAg8tTYskixnOA43h6gcGCCh1AOs6zvIIkGPjDvTumPPRcVWaP093rPZZBMvm5rcUCr84zr2
	Mk41jojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZIh-00000003mJ5-2Pl3;
	Wed, 05 Aug 2026 10:56:43 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZId-00000003mIg-0XYj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 10:56:41 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6758dbXV1847081;
	Wed, 5 Aug 2026 05:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3qs+wWNgWmnm/OWzkjpZ8KcBSC69ItpZm3fjtjYmK
	yo=; b=j7dKGG48MTWTK76i2ns3esA6ty2B0UrjrrSPodapNcAqPR/spK/0m2Ywx
	FuhMjPK0WqTQicXTU84xtrXi3bof9K/bKI2hpfzNH7w6czfhz6vUEmPSUgqf/LjJ
	uJ6a8tLgeiBEVslE1cd0WuT2mel85MnF+mX8NnmYwEtH6gP+3Iez/OaqpnsBh7tP
	wiPg/3yRsAxnEw/7IYorsl4or03gRPzuV4LFPcRCjNc0vus8LlmJ4tcQRV0Wqdi5
	6CjGhqLouX9U8XxIRn/O65mK2tfTGWo/1S4odb1PNo89nOpseUhlddgtflMTB8uy
	OLPMIutFcYGSe3/1OakFshuxhR7hQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011004.outbound.protection.outlook.com [40.107.208.4])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fuuxtu810-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 05:56:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yN9lijEiUCmcFU+YuNs1tE3wdnJmEa67HYUsQ4nWTluFtYs25hvdeDxvCTccPt783sTzR44Q1dlMjRxv5xbSOEkmudVxN0lzyuDyGSv9ZmVmwIMC5TMM3PuC98eRIeLotiLFh0f2XQzqsqCcPvKZvcPu4+PjycfVe5skjCHZZclPVxFlnKSnKZSz3ovJVxDyHbfo/CIAyC0/kW5iHWWbRHi561+I6eiGNxn0DfkRpFc0wqiN43gkVKqe1xETRiq+Mt2Tb2b/tP8zQLEZBG6x2ENqkm1aSRdgXTVvB/ZZI5mmw1lEjeglVLAl+i8b/aHUbL6jjitWITMm7Ek1EuIh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qs+wWNgWmnm/OWzkjpZ8KcBSC69ItpZm3fjtjYmKyo=;
 b=t60tN0sBVNvxKBiD2ch4ImUcAl5G5pe5uZPBwRg3DEEU81WpSW6xxCrm/++3Kc3wCx6c5XjQMwkFgknt43biLWM630UGzP/cOtBLPfTYfPpiGpZEFNBsEf3AiJdOrd+VfOTBhH5kbngCx5lMAGGT55/1+QG/dmZLxPZzk27/DmvuHZglbHilO5rO+0SeIf7/NnMadVyUSMt1UnfKTpi5sTQgXOTXsJGo80frU9hcrBHLAuzii0LvqYq/lD7yxiSIFgMrZyHFG1K8cH2pTn6UYwjemQJp7/Y52h1otvflCWgsqTaExc3JrXu9AWnX5vC26xZwuxbK3yZzIaot+GSqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qs+wWNgWmnm/OWzkjpZ8KcBSC69ItpZm3fjtjYmKyo=;
 b=lsI5DP7PmVGabkqSwoXLBisKkPvN0SNUg8gsjfniTnKk+ZRTSz92hFYTK3H3BYCR3JHmrspdG6Y7p28JCPiuE9fGLXKuKZICNgqkjnHRvdl0s50gEiHj4UzdOFenfKv1iV4F9miqYzquH9cyZan59wWFlgy3eBl6ahjMcAlW2d4=
Received: from CH0PR03CA0347.namprd03.prod.outlook.com (2603:10b6:610:11a::26)
 by PH0PR10MB997641.namprd10.prod.outlook.com (2603:10b6:510:386::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 10:56:32 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::8f) by CH0PR03CA0347.outlook.office365.com
 (2603:10b6:610:11a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 10:56:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 10:56:32 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 05:56:32 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 05:56:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 5 Aug 2026 05:56:31 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 675AuRZU1276885;
	Wed, 5 Aug 2026 05:56:28 -0500
Message-ID: <995f20c8-77da-4054-8068-dd580507aa6e@ti.com>
Date: Wed, 5 Aug 2026 16:26:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-am62a: Set MMC clock pins as
 OUTPUT
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260805004821.416613-1-jm@ti.com>
 <20260805004821.416613-4-jm@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260805004821.416613-4-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|PH0PR10MB997641:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d3a96e-3926-4c54-9a30-08def2e035eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|4143699003|3023799007|10067099003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: zFTHY7XHmiIBGJTxMamE0qUxOwOQ44DFHfDW7bWodf0fg/f22W75rTgUzeLzObkys76MCudyGdsmtXGpith4LrxZ3tip9FVLxMe24eartnU3UMX02UXNNgyMmSOz1L6e64ptgPdu6BYJ4RG4ai3xe7DtmKiPkKA6hLg91+6gZqDChEoZS2uQlZYVUpUxia79DwHvvjX4+1DcTY646Ogl9YBqUIqYDnFz/J8KM+z1za7GxR+LH4hvX+crSZKN9LO/ZOGwAD4dJLH3MzbNgSFmwOleLURU4zl7yI2sW1HOiZ9ar+p9jpzRDFL8nsoudnXxXACxstAh9UuOwnp5TEoW+9PGH23pceq19dLD4icfhiIHsQ53sdZ+n5qfX49YcF0yhcIxfbnRQTN3Tv9GHjTt/1tb/6jwzSVxMH4G2H+sLQZMJ5/1XMjabteBm9B8KAcwpafBvO9478v/UYHegqQE9G95aPKvtYVj6cFATBwWKNWQHGW5+v8wIRsfFbdsf+454HHHcpFxb8Y8UmRpPCbRVQ6I4jPPNeVO0Z7lbTxx9RLTK0NO6nNDTpYWsWf2ODMi/sHEgRK+/g4TXOTTg8BEeHyXfsW474Qa6HFKf5Pt7ng9BqWQ7yL8a9sFAGYV05ScFAMrDErcJSUgSiBa/h3JwlTPSByNyrkJ7w0oofEQ7HEBR1mF+UtdGoeNU+L8RxZ2Ibrqbyz5vc3lB6gl6cgL3Q==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(4143699003)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ulzL5DcgDmPZlvQzsglU4bMrJtoYAiqiLVcNo6AySHqq+u9E49qlkOYJ3DWcbMi09MWpM0gaV3EGPNNKaCiirIcDh/EDxnhTxgnwY/erZRNl6pPbvgGya96fRjwxZ5bpHd7hCPbFThOkS5A9eaLXWj/tmtjZWzwGpv/B91hc+33y5lze4KYZYMt7cwogdK0mIKo1VGaSgxgZu8y1TJNrROCEZhk29o0NIAsdGluw2xMOqW5U/yL0IjLdydsMv3LtaldXmcubXSGr8iUcyoia0OvihSBLUwU/vjU3/E+1Gvk+q0kjmRSh7/IUWXuoCTdUGOELp1Zx8Z2OG5lX29gQvddj/WsIgkdcRrOC4/kmeVNUFtbB6u6KGTEkh4vLo7Y3A0hC9wdTfQwI7arfX1AjzipW9r3kutpcc/u+lkp/fsJRCREtKKt0mLwFaZx9C3G5
X-Exchange-RoutingPolicyChecked: cgvhGu3JxQsHPd7KLwfPzSyXfGhJ11N/p/TPZBtfr68VbNveseKGegOZ2TjxTaytR2OJ2tv1jIQC3vn2guNXnQMEgOpaRJ81NKusoATPPbYANeOG99okY6TDNatQbeTcyfrwyqDqIKBmnvRto8kWBU0vyX7BbtyLicX74D1fZ8RTDu2LuKZvb8QbQhyHHeG8lCWvzvpxX+8A4I9y/XlmHdzP2euTzuPcrhf1/I7M+F6EQO9JfYQ7B7TnfQv7uAmALX7AfsXceBth80NTRV3rV0WEXcTxwIy04S/0PLpM06NOchB84Tvx69Hx3TiwAYoPmzwombM9qAastbTVguaCAg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 10:56:32.3386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d3a96e-3926-4c54-9a30-08def2e035eb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997641
X-Proofpoint-ORIG-GUID: ZB9S6dkJ2RAEFyiIVc2WL1dbEUnPzb5S
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4NyBTYWx0ZWRfX04hBQrcnECdn
 JiixkeAP6XPET5OOdMM4LhA5LZ2k3VBO1zaWxxUTSZwK2g6GPIweRVNxDzlQpQLvtNm/UsTFbMo
 icWTdMVami9gv+KRIV1Pgw50LMRuUbQ=
X-Proofpoint-GUID: ZB9S6dkJ2RAEFyiIVc2WL1dbEUnPzb5S
X-Authority-Analysis: v=2.4 cv=fZKdDUQF c=1 sm=1 tr=0 ts=6a7316e3 cx=c_pps
 a=4d7Nl6fXTlayLABBLko2Iw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=i2YvWbDG3o7-TbIA7CoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4NyBTYWx0ZWRfXy5apikxu1fNS
 INZ6W44exYh5iHA3YEjtYeAxWE5KJc+IGLYbgqmNPcQ+LJs5mO+KwZULe2gmxOrDhb+k7Moatdi
 DdhJHN0QN2Vro+qH4eyIEW9r2ulrt3SIP+/plbTejpqSZEsyIC8uWWRw6En2KEY2hiFQ/5PU925
 kZQrr+UvIvzcqBlCKaPGTUtfr5qwcSZ/aGfYuG0wZDEIW++hYnp63r2ic4ihE5MKf/QfAgD5cSJ
 PjPGjr4S0oWDDhww2qMi8wbB34PBjKf2WyvYRkyLtrNWoXCHgNX5fVaaGrRBFEgdvv6txTXTu5v
 Trh44Do5pbkgPyKsstk6kAcsclk1BZcxCG+8ouD6gH+txiNNjjDbbnDvnmeEcXP/vOyt0PiDIk+
 ScAP1ZmlxmpiQA4dUc03PstfJW+rXxYzyZfSJZbHsfmBWBjjuLddJNjfWbD2pn2lqiLcz2dzThU
 xZDO8BTi4RdYcWdQQng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_035639_181537_B59583B1 
X-CRM114-Status: GOOD (  14.69  )
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

Hey Judith,

On 05/08/26 06:18, Judith Mendez wrote:
> MMC clock pins must be configured as OUTPUT-only per TRM [0] with
> receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
> PIN_INPUT to PIN_OUTPUT to match documentation.

I think this patch and the next one should carry a fixes tag.

With that for the whole series,
Reviewed-by: Moteen Shah <m-shah@ti.com>

Regards,
Moteen
> [0] https://www.ti.com/lit/pdf/spruj16 Rev. C: Table 12-257. MMCSDi I/O Signals
>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index b04636cab71c7..e63c5200a2370 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -328,7 +328,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
>   	main_mmc0_pins_default: main-mmc0-default-pins {
>   		pinctrl-single,pins = <
>   			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
> -			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
> +			AM62AX_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
>   			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
>   			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
>   			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
> @@ -344,7 +344,7 @@ AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
>   	main_mmc1_pins_default: main-mmc1-default-pins {
>   		pinctrl-single,pins = <
>   			AM62AX_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
> -			AM62AX_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
> +			AM62AX_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */
>   			AM62AX_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
>   			AM62AX_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
>   			AM62AX_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */

