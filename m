Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B77C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTgSC6lvdQw/EWLWJNWdB2j2rldq1odtMSptEWho5Uo=; b=RqsL8dp/J1TAEp2sMvmXeNWo4k
	z7p/2RLEDMltfS1Gw7Lggr61B4mGABRK8wD3f2fRX2AkuuOISyqPTT4INdkAtykbNzQoRzjWb5NZn
	35zv7CuSkFvVvUHdc7h26QIksFKQP5J17wC1AdDILbyiqGQQ0Yv2nuzjYgJtq+WfqC9m37VDhmC3a
	V7LfDP/EjZ71d2tMo6XmU/lsBY26G/ujEG440AZ/dG0j7KGsMpyQKwYVAxXhHhP52UT72RifDPPnS
	qK0MTvp7rEpBBaFE0qs8PltFxvkyTntvyj3MizkzEOh1IIMfm4hw8vLeWuP/Uag4xiteL8FbbtqfF
	biWML+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyw-0000000CrGm-2BJX;
	Mon, 10 Aug 2026 20:52:26 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyu-0000000CrDi-0syy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:52:25 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AJjEB53700754;
	Mon, 10 Aug 2026 15:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=vTgSC6lvdQw/EWLWJNWdB2j2rldq1odtMSptEWho5
	Uo=; b=HeNajvGc4Multc1ieyFGvi1jery/DPqhIddVaMEWlvKcc4SOThR2OaxBO
	h8fLRtbfd3FbSJYKb2qnoNExFvHTN+RrHjcdLjilXKoT6scaw2yNRMO7UeescXhN
	NBSe5WVgJ7LkLNzDKkQrcDBT8KkCyzKHc8arDLpUQizMlivYLVPFPxIRD/nWPhOD
	LMqDHm87szFvwCzIANwQ9sEDZ2EDlMb2hH+GXOOY7WiA40gKWm+PYZ96lYMi4CTQ
	2wmMwiFooxy/m05dLwDF7WOtpWn+k24IslXWZtbphTtbPijFXMNK4Nb07MWfnaP1
	+ucDrWicyIjLjrxjknk0rrh4mYJwA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fydkwv08y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 15:52:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfJxSsJ0Za7FoFlLqLBOkGq50G6PTFHkvvpbVtEJFwCiuOmsA5F/IoBH3SB2wScPVUfTt3e66b05CtDbRKUklW4yx5MZU3gZqj3fqv8vU+LaPrgDn4ZwfmFfQNyGknNdG4s4UC0IrjyyhBkRoyJEGBwJ5Z5ok2eg84RVgUjhvZJ9TkLxL8paRHtKoS+UHBWrz/AAw1lf+NLvQm32k4kYXnUZ+zRFPmXiM3iYbbGZUt2zUiYjd3/w1qFZ/m1J+7SMn5qS920MQR7lIXgiwZG7tKLTJ7NynjasyIpSWUirNYpAPDo4kLLl2iEfM0P0hInZuXMvXfXpbKymoQ9fn3W2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTgSC6lvdQw/EWLWJNWdB2j2rldq1odtMSptEWho5Uo=;
 b=iNLHJmvU7+h+2cNT2laWFX0rlWkcmYuZc9/O+j8Ombv8ffo6E/khnaLwPvmSaDcs7wQokp0R7r3zPaKtVURfA4eagZ7taVG+pAj7IVUDD367CanH6bpYIn9jEvVxGGQuYGOKfqKLfTfCRwn1j/Onp+3ReWHI7thGKm/ZEEn5taNYldDoox1nHphbRSnBkZPD+1exnPgMfUlSQIFBPQRpaqrjPh665BBSAcvSOQ4bzL8x+gppgNKMgvDtOdKI2oUr3UROe+nm7NGIWcKONBDudRR90V4w5KbCYO6IX3zz6UgcxIf0q04SThNy/Y4bk+0e3zp6qPn+orwChfiBAu1Fdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTgSC6lvdQw/EWLWJNWdB2j2rldq1odtMSptEWho5Uo=;
 b=ws0DhoPIF53Y7gSt9DOgpYd+BtBv7hqXkTkyZfG7lFDM7V7KxBMp2Me8BX4nBTfyJtWq+qwfSLX8VLqtQIGnsR3qeaS2qbhuRq/yScMqtj6mUBde+lLq77/30B8D1FborExYxUcJd6t75ca3s8grtWVJ1wNHDPZUY+AyBZa0qhQ=
Received: from BN0PR02CA0020.namprd02.prod.outlook.com (2603:10b6:408:e4::25)
 by IA4PR10MB8635.namprd10.prod.outlook.com (2603:10b6:208:569::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 20:52:14 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::22) by BN0PR02CA0020.outlook.office365.com
 (2603:10b6:408:e4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 20:52:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 20:52:14 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:11 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 15:52:11 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AKq8Sf3838072;
	Mon, 10 Aug 2026 15:52:11 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v2 2/6] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add mmio-sram node to main_navss
Date: Mon, 10 Aug 2026 15:52:02 -0500
Message-ID: <20260810205206.685971-3-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810205206.685971-1-b-brnich@ti.com>
References: <20260810205206.685971-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|IA4PR10MB8635:EE_
X-MS-Office365-Filtering-Correlation-Id: f48060b4-cb62-4cfb-ead4-08def72141dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 0dc7ZXgbbb48ULZgagnrzWkTpjG9wqDLWppSwdhrG3gKr8JWRGFr07Vyko2GlpuewksdcYiP53Rwi2UidKo2p1A1vafRGeSvVHG5KP7fSkag7Es9ztxB3Sr4/d8SDK5x1LF9fK5lBxtQQtzyou0MbP0LAP4h774qrT3QpFdVFfUQIWHv83OgAOwslZs1s50C4rDgwGseC8JvXNFwbDO5JF+G/i9tfCeQQZ+TRkgtkl5u3Y7lku6BhbRTf73TX4IRsOQLXbr07lui1CTY6fzwy0+1Ps4zJbd14TQChFeKb8ML0uWZ5Vg53liduAimcLcaGHR1ZXw5LX4bhtOF0BFJpZ3X98P0xUvM0L+fsPas/DsavWX96wNY4DGlr7g8t5ntjTZTDA2S63PxmE4qXpWsrYc8p6NcYyJV7fth/CHZCj1yLkY86z93pscR7raeRGGgt7o9GJq76sHo6o+nWBzng1QrCIZAtiQczLMd/5hOgGjkFb1I9WlN2vB8g5dvf8NS74NMIf6nzBWrkAxMT2ZjZBPrmBU0KKBREMtoscdqLtxt5HBx6O0BYSR+xeJTZkM444/p0f1CRzJQxHHQquLtIaQJB3nxE5M8SkdMMN5Zj5C6e3YuzeUd4GuXZXCXfVpJ9L/T60SjHYTTvMHP7KMP1ZrvjJGZfcbwuztH/2AaF2zxZSaTZvCxUIJ9Tr7/SvGU4LSDgT1OtjxX7GKio1+rog==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TrqIEFzriezDeS/4x8pl574tlZTtWYxMBjfaE22NthBAGkZk6O7HZCQ5G+rYkoyW+LEJNlZKRRTDziZFpqnDDP27dY/XQe/Cvyuh514XAjJsk7P1wCsGalID4+O3dCMFTJpL9rH28ZHkCwHFNmyMSXajM0RcapNzX/gFP0Y4zjqM5w8KLoSe/X2IBPWhr/zd1u2swmj6I7fPmPDEKkgWHhddq4FYwb6KWfCAOlWVNaJNX9tk6dxrsMBw7Uj+BV+BSWCRL3FiSD9em5pBMKeKXv5cTS83VLM0g/IkGlsZadY/lu9oennlWYv2w3RIg47XUrXO3kZhPQA7GQO+CNaAiHNwjUC6OMj5Oc09wtsY5tUoTeAsdjI9IW0vDcWD7zyrzmU695mHkjOv07TZkfWaCHnigGt2oiL+CdxeF8XHAv1vcm48JCmdNLvxfMT1+Xt4
X-Exchange-RoutingPolicyChecked: ibORcJHVcOwyu50U79b+m9rBvgd413hTsY0asTV+L0giZCRFQN/RuwQGiRtLJAhwEDVd4HCOmlWTA4kU9KW0bh+CDS6p49r4V9c2wSvorv6XCvl1i1UOXy8FfeSEzUTSbAFeTST7GkwCrw5Sd/kHp1Xl5HMe5lSVQWlj43TxX9E6RIk8vVH7puV0Gcg528k7+WOrr3Jsnt+/F2ulaOo0uVMuRXq6Qw4kpdrwPG2UTUNVshGInnRGSb3zfW/j4CAZJeq0h0qACiko7c8Lz5Eg/v+8X6nOpW8v/LdDOxIMONHUoPbi3VpyNVe+pQSwVuSm6tU1j2kI7czcSmZIJaWwqg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 20:52:14.3024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f48060b4-cb62-4cfb-ead4-08def72141dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8635
X-Proofpoint-GUID: 5MbngUQDGZdXZtThP3tENtB1cIkIgkQf
X-Proofpoint-ORIG-GUID: 5MbngUQDGZdXZtThP3tENtB1cIkIgkQf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfX9llodMt6+58Z
 3lRgLseRUKxpOg+CbcVrtmSicsfBzvCByT8autOJqusinaxIcTarZCAPqDMc4ggOet1TO5oQoRC
 VrMM4kQLfajUYngNsUOAMbsIulgyko668yym+TFZzbXCe2Azfnb/FCeCYwEEOhK+ffebAnKXQu3
 Glr7brTfQLwi8wsRo7mj9ggDtzqznE9Y9HfzVbtDfr/VvaclbGiWduGGxNYRFDaAET8+kZXTiqd
 8+tJd+9x39I3/GCddibTW9Fp3oOZ/vLHqBx2vNCc253MqNzNEeFEiHGrqBikX9gt4CveZwqlDyz
 oJlCAsFOtQCeQkTJlkegsxfu54+Vv8AUlvAp00f8QUjwgOkXz9LY5bB64T/OR1Y95uLkvXi0X2p
 11n7fDHPyULGawTSI293FY4sBjumwp4lmbho1frc56dVzS39+sc9WxZbDYQ8Kpqyj7MdIK1u32C
 0ctwqf3B3GAfRxFAPsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfX61Vdhh1pyhwI
 XMl4G0eYHvMDW+Sn2HylfNGWFqCUBEFBMJSrvFuTEUqE+537hCGP/hejOg3oWi9rE1Ak0O7eHu2
 Xn+vVJc/QLrqI3s6JbUMb0cwL0Fy9XA=
X-Authority-Analysis: v=2.4 cv=F8FnsKhN c=1 sm=1 tr=0 ts=6a7a3a01 cx=c_pps
 a=+TgAdn5i6nn1e/5/V9fTSg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=t2EuUbTCF47BKSFJwqMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_135224_273203_6F58C7E0 
X-CRM114-Status: GOOD (  10.76  )
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

The NavigatorSS (NAVSS) address space contains a 64 KiB on-chip SRAM
region at its base address. Add an mmio-sram node to expose this region
to consumers via the generic SRAM allocator API.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index c2636e624f18b..e836f0f42e30d 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -1254,6 +1254,14 @@ main_navss: bus@30000000 {
 		dma-coherent;
 		dma-ranges;
 
+		main_navss_sram: sram@30000000 {
+			compatible = "mmio-sram";
+			reg = <0x00 0x30000000 0x00 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x00 0x30000000 0x10000>;
+		};
+
 		main_navss_intr: interrupt-controller@310e0000 {
 			compatible = "ti,sci-intr";
 			reg = <0x00 0x310e0000 0x00 0x4000>;
-- 
2.43.0


