Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AF4C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsyRUdlxVi5gkT6E4omdnlFOvaLBq29ki9AE78ax0fw=; b=Dggbi+06TlH4aX6FtyNtT0xKZP
	XAC1MCLy25YgDrNzwTCs7dbNXyADN3qWvRRAHWid4fI2vr6Kf5xYBitE8kWKhf3hWrcoQAFD0+To2
	/Er+bPTIrSQu+yHqo1dXx9eBS5oOGQCbOUwzNSLElk9QVy+v5ECMQPERsvagiRLCR9lX+3Bz08TSc
	dIovKHqMmzfTwNIikBWbp9STJ6Il3EGYViMQjMyqUPl2bfi6AIKlER/D91Ssyyz5+DM87x4Uqajft
	rJwjk428cHR7/ADVfReHubcmaYIVIoh46TDyMb0LSclMPr6jp3uIuVihFHEd1juuygwQ1MgSGvxSh
	+WwSQyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6up-000000007BZ-1WUk;
	Mon, 28 Sep 2026 08:40:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6ud-00000000772-2JuK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 08:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Date:References:In-Reply-To
	:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UsyRUdlxVi5gkT6E4omdnlFOvaLBq29ki9AE78ax0fw=; b=D4S24VodDsz+NgKdp41GZ7xuan
	ytyXazs9YE2zqv10QlX0kgjBKChQy2acP3+sq/tF9+qd81X5DTUeaYaRkh0bHYceFtDMA0GHDDmQ7
	JDybKVVRKK5NjZBfHTD1BBS0UztSx6byl03RcoZjxEDCO5TvouO4xuWa/eaBc229jXy33LdB0exEx
	Ce2kGNw2iRwZpwToODp+PQkdbaYkyvtsLwg9P+/Ra3BrsgLOvCWjueBH2m4W921XAOQQBwl8kS//m
	T8eDXUFfKncR/YA/WT8y//AoLiY+kMmR6Fq6JhOPbmJ2JFlG9UVeeLywECXKXk+uuvM9yeUtCR8Hk
	9CsOvyxQ==;
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xB6uY-00000001F5a-2yzM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:40:37 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S80f7t1469585;
	Mon, 28 Sep 2026 03:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=UsyRUdlxVi5gkT6E4omdnlFOvaLBq29ki9AE78ax0
	fw=; b=eXkn9wBZNUMT1rmuXqhLTX5Znhvb0r8AWW5r/9A42cjioI5aoaPeeauvv
	thY+wnSHoznoJMSszgQd2t2STGJovB/FA/cGrOXc6yw2C+okBExKSwCxT2cUHwqM
	wi8i7L9fsP5BCtWXCfHU5bQrt2CbmuK+q82fNHnPEOLmXTjn1yMa2dqZ/9/Q9/TC
	Nq6630bJ9W4KWjoCv8C7h6mf2zDQjqyDz3lsu9hOFLXg8xCkjaAjhyccjIAHIpn8
	uf0rndPzNgkYBKYMExIalYN/kLl1olPtBlZwkQ0Ivk6l/Vk5DinYrCWZl7dhM619
	eRD5pWlQWpHk93ZFulmCAE1UdH3ng==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013053.outbound.protection.outlook.com [40.93.201.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5mxh0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 03:40:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jhp21S/yWqCu9onz7KNuFflvGhVL49+8iWicTDWTwWiqW2QudTUpU8sK5coY77u+Ms0XidqBG+HPAyxdRSbFXQWFs5BIwOGQ/83GrxB4+VeHqkTiL5MVoR5H54AMYwl8ACI3WoAhO8fBWb0CcEjVjniP5D2bK/l02beo+X1b9qlgtC1mQGauFtuY4EprrVNDOeMas2Qvc0BMHaQnVVSyvo1s237ZE4FiGTbdKOxtxAgdWWBcLtweaN8EYVizSqWy5JUqXygwKbs89Z7fXFkoNLfu/ZUy6yM/oLnZkE0JLbtYw6yu/OaDRW5+vscXYGTH+Tsbm7PoZirjyIF0S6LoQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsyRUdlxVi5gkT6E4omdnlFOvaLBq29ki9AE78ax0fw=;
 b=OAfIZIxSXd6MBpzg+o2CQpEmAG9BYjmF7kD4DOT5STW/ozVBWZROVSNtBaJ17F/xiLvn8BVmq/XpBNaQ0xQWQ7BtEXo+A/qg5cAStfsTakcro+F5+OHsNuhuZTUjpvjv0XXjWp3NbbZWkYt+N5VrGKVoEBC+JLkmZPg7FPk4QEVBreaypR8J82WF5rJjsLRHiRKzFAzEXlOmxSu3nLremO6ntPTWXfjDrTofNY6SWbzVLtDo99PFfDx1UZI/LbGVCYdL+/FhhnxR8rOG8+Z52bVJ2QJqaQJpznVvYzI4c33Ifp65D4mHjozD/wM9B2S+LklZAzxDAb7ojsPzUkQsyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsyRUdlxVi5gkT6E4omdnlFOvaLBq29ki9AE78ax0fw=;
 b=hTX0NRwUnBK5c2wke+TMurzPYWld00Ao8nWLKyXOFm5/2haV87aUiRqM1dy7ZgPT1RecYimhDhfJN53p2NPBTdqT6587diSuELLQIL0Iy9m1h66La+6y5refNx0WQbKy/P//4hDdcFHGD0WxUdTETVfw9jOfkJvLJNK1W27kvRo=
Received: from BN0PR04CA0119.namprd04.prod.outlook.com (2603:10b6:408:ec::34)
 by SA1PR10MB5822.namprd10.prod.outlook.com (2603:10b6:806:231::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 08:40:28 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::11) by BN0PR04CA0119.outlook.office365.com
 (2603:10b6:408:ec::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 08:40:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:40:27 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:18 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 03:40:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 03:40:17 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S8dedk3686893;
	Mon, 28 Sep 2026 03:40:13 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 16/19] dmaengine: ti: k3-udma-v2: New driver for K3
 BCDMA_V2
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260928025749.1055383-17-s-adivi@ti.com>
References: <20260928025749.1055383-1-s-adivi@ti.com>
 <20260928025749.1055383-17-s-adivi@ti.com>
Date: Mon, 28 Sep 2026 14:09:34 +0530
Message-ID: <179058477464.77164.10449748708121740554.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|SA1PR10MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 8364d712-f288-4f57-7e9a-08df1d3c25d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|82310400026|1800799024|4143699003|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: nSPot1ktbUPjNuZzxXQyjN9wT0SVefLizKgaaDRZr9Q+nbK4DGfJemjeuiJh8rRMnXyOpKP7v53OrLimVZWgjdM0gmQn/fbHX7Lv4ihGlKPjalxeIhmLHRpbDsyKq6eSw/W+bdUXiN6Kasz6NzLuE9AmTUlrMjK4/ka76BalDYOpq8Gez8++nfex15nhAODc0EYUqoRaCWnxCqzo7wsXz+XAHa+qkv1rEBHqoRfU7geIuKqKHuvV5Zmj/Rh4kzD6RNGW/dI0DSEe5cf7to+6sRTo/XmYSw19sytiNQr+Mwb52r4h+btM4OJQBeuFYr6UZ5puvYeqDh87ZNaRSNDFugkEclK1tDnvzwk10Uqo6xVV7UUlh9N44aLrA0nA64v+XqwAzZaEaq8E5uLYRzeepnJu5yFeFcgK1UoLRJOeQ2jtt5ox9ms/iGZuFCS6OIZkMomxGZb5tE3uIqbBsmP5D5gjzJ1fnnReSXdXy/bAwKIDTbq7lkqfySCYHdcJRHZKdslcpqrn10FLeh1PjZom+RnUParr2d/RxbGFTfSJ7a47QSYUQqUoviIpw0KLs3TM2NAqiNtz48okOkzIxNoPLV/iSDAlAaHSLODxO3zjZVWglqrLiL+IfCKROCSFxHEfUE+uzJ6s9UYuPcplZCkMsyd6p4RZk5B90lb6dTYnhgJ6vwAiFUKK059DbsUstq0w
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(82310400026)(1800799024)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GntrgG1fuZZOy+Oz7LBJAf+UbyscP/0F7Crt9hUmZeuoZ9h/WN32jOy8OM0NG9VPqg4rr6tlfMJaBlOyZdwhQI5JCMfgkefuhq4soj6ygDPsMFVpexW/dKN4ZqTut0XbiNc3xAXp+tzyH8Qcu0oTJ/SrdeAduDA5UoLrrTdecbn+yU0vJf7rK/uxkT6d4pnz3K4FoGSUE1UPsu6Rh3mfgq3Ekti3spzdKYcr9lXn9EVE9Q2xeKNs8F0NzqNgCi5q44r+DmBTniBrBa1Pst+YEuZx4g+U8ldrgHRG5gmG7ig0BhAj1BU51aLkEk/FPMPz54DwcXIGGpH9axEu80kZVuLsOn9mJyz6dKkeshmVqTSib/lXx+a4AqPqJPF2j1G3E8M9IY6+WbdV9CizwcjSapvx1yw5mxet7xpW2F9fISxNL2xwiFVG4vVi4a7yspqA
X-Exchange-RoutingPolicyChecked: pyCtqbK9FtlFL6v0Kk8Hf+iHdKA2tikWsMWRYVwhJjM3x7MH2qI8Ihegl8gOUxT/AKYlnJscf4hwWdcL9lGXSvXCzj1TBGbPprQuxUL7rDnZ7a3PBTi7Wky/bG++tYK1/rgG5n66L8/RxVpke2JN/pBM1yi9LyHQfeNec9pDTOlKVTWYYWIAqEEJyO9AZVZW8ZdQwdreu1rseWlvy4MFA8VjYiCVk40ZTrmZMv1YADtDnLCq/1c/sHh8UTpZ54cibDv0IPyQdm6MLEkIAAe52B385LUTB33QWmPJw4jMVlqo/XNJF4evY9j9in0pZFLRvvW9Dk0+NlXTc1W1kJ7fFw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:40:27.8743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8364d712-f288-4f57-7e9a-08df1d3c25d5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5822
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6aba27fe cx=c_pps
 a=IxQEmK7OG+ZB3KQxmUR4Jg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=yLREh687bbE4FCYcsc8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfXxy+18yxgz7tY
 z1w0MXgCBrq40qvbxqIwf5uTrk7kmw6S8M7UYV3CWQB/NucMo3QXB1ZF2TptvZVefTcs158XMHt
 q9iNUT4PGz/r5LUw/+XIff/2R6hZLaCkuai567V0TvtGnuQ8oxDtpCWFE84nSeWSUT2LCLUuXmU
 9SMRyZAK++DWf/SyX2JTRs1J8sCfXL9/8dK9I113deYCOjotVPwwv/2ddYfw3o69vbwVdTgFcTZ
 AzRtMtkv55KATpk0EpKj9MIpwYpi3PFunyBmB6n+KVRxeOuDeFcD555HRGsDcEoCOgCKnzlmhoY
 UgZoTsA44ACaMP1L/SQKbNWJpY0Q9gNhqgFgp3iy0Q4mMKZtZ/R6ELMwFSGlPt6QDTvBRbHJjxe
 7cXhWMiGxILKvKoy/fyxOR1R3EiW6sWj5Fh9U+c0v9j+U6sxtbZC9O3bYiMJoYSp0vsiAN4xg8s
 Tra7RBG95LshNDhpvdA==
X-Proofpoint-ORIG-GUID: 51HenKx4KVOr_20gWib7bdcf_Ukv7FhP
X-Proofpoint-GUID: 51HenKx4KVOr_20gWib7bdcf_Ukv7FhP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNCBTYWx0ZWRfX/XB7Q71KmS7u
 2FSeUZVDmx6YFVhFk+zZyzYNa/Nzi9diJuGg5ZNlR9cpIIve5xXXpJmquCtsJp41Ur+DKfmj8EI
 6gwYUJHQVv9gRphUrqkN1T3pqthRRgY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_094035_793233_46B43154 
X-CRM114-Status: GOOD (  14.12  )
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

On Mon, 28 Sep 2026 08:26:22 +0530, Sai Sree Kartheek Adivi <s-adivi@ti.com> wrote:
> Add support for BCDMA_V2.
> 
> The BCDMA_V2 is different than the existing BCDMA supported by the
> k3-udma driver.
> 
> The changes in BCDMA_V2 are:
> - Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
>   needs to set in the RT_CTL register.
> - Static channel mapping: Each channel is mapped to a single peripheral.
> - Direct IRQs: There is no INT-A and interrupt lines from DMA are
>   directly connected to GIC.
> - Remote side configuration handled by DMA. So no need to write to PEER
>   registers to START / STOP / PAUSE / TEARDOWN.
> - Unified Channel Space: Tx and Rx channels share a single register
>   space. Each channel index is specifically fixed in hardware as either
>   Tx or Rx in an interleaved manner.
> 
> [...]

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

-- 
Vignesh


