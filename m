Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18545C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhYsPvpNS1Lga2EJS7BVoXruOEDLk70zbqb99PZIht4=; b=3cgzatglSl2O9B+FUB9unAy6H0
	5UOuSpUtyqeZDrCI7LBQIrtEGtmkXd6OZxlDtJjwa1xd+wtkebsQjINZe2po+9C8xtSjRsYmaMJxS
	414SWciRvDBheCGQKJk55vxP4Q0jPfDR5g++G+6y6/5I8wKe3viDi79Mmbxnht7TyfkNe1jxN7bE0
	UlrJRaYqy40oFWarx2kH6QcmQruzV4uvl5iAnfnuqzMiawZBfUvHZ7xOiCKqn+H39fiz3qbrX+hae
	jWKsXyn4Y/RsQhP9Z1aC1cjFOlKDiKe3On4xhxAqsWHzZjaj18JFO2jJnT5cCubzro98uvA1u2nSc
	ksa081nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpASB-00000008v9W-2tup;
	Wed, 29 Jul 2026 20:00:35 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAS3-00000008v5R-1QvR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:00:29 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TJ66Cf3536895;
	Wed, 29 Jul 2026 15:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=mhYsPvpNS1Lga2EJS7BVoXruOEDLk70zbqb99PZIh
	t4=; b=qt0ccMHo/X8RH/a7TK+Ei65MU0bxFZP1ipukw7QUMFXs6288FqyIDLtW3
	eKm4zWOwqubTEeVu7ATu5qkLWxLXyjzxFGLvMaI97rrjoMtFYZKz9AeNkE0vOUt5
	PXI5PSVyKMAPCaW/+DvwXagrgXM6hPLn6HRHMHLXmMDDMcWOlYcBfD/Z5PQDqpXN
	dLryG8E7/lBF1RzOewSBREyuQ4TntlvMIelE2GC9vnCplQbyYimuXHsSt8kar4c8
	H+oS6ciFPipCcEhGiJA7K8YnyCSH6w/t0e6h8RxbbiU0SVSUNo75ks2GeHkHyuWf
	CuWgJS+jtA2HCcwGsjR4G7wn99peg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqqcmraqy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 15:00:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7w09H0OX1KahXpGu9rXw/UTGZXEJA4M6woqLftfxJdYsiGEL6HeWCpSrR0I1JlIq0llq4oq1VqTnmk1cGHhxNUQIGp6TD8s3QjxVrD6L8lZ6pTQEOHaNIst/L1GXudtnEoTzhexJ6QHnGeZuZxoekodTOzRg3nyEQOGOdO99ORUESN9ElD+txfy1tnVYRukPnNcdmL5ORbmuPKkRpl67Isry8oJXnvwBy5XWRWbAdqxOy2iTqF1mawUANUb9hKQ1QXG534xnkPVCFXLR6VAJE150fYnLDrw4mHEHnr6KGz9Du1ICjDmNTqom1IJAGuHaOpry5bxPxz7OxINZLEXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhYsPvpNS1Lga2EJS7BVoXruOEDLk70zbqb99PZIht4=;
 b=D2kAnsRYOb+SclgkKz3lCfj0QX8FaQJEGLyansS/FEgO70NHRUHnrS9Ihgavze+ELJKUSlRs2L1DmKEei+pPv4OuDkUBAAX97EU822hfaEI9Eyvv8kk76uzC4eVHow3mMauhMVlTF7fawhgA+5JlWvTlxCKk5fseMR343I/yr6g7cWHSFidF2u7CoSKDy973k2KL8DGY2pI3fL83+rqNQpr9CdXe7vSbLayyu7SUBSQ2dFXZMe7+hSmOaD0bCNdJJkNiBbwxkAD3bKyRYx2fNRDA1bvwHlGMFZOPIAQRowKbNkdI4thO7SKZ0HVkaBtEW4728xt2YEYAkKCAzAUyyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhYsPvpNS1Lga2EJS7BVoXruOEDLk70zbqb99PZIht4=;
 b=o0+7ORUTqFc/7FxvnPuyZNeUZLwsr52BtjLKi08a9kM72ghNW5rdY3N7hi8j9RXLK20dRiOwldOI7l96XHFYPTAtz7oJtsvVe8XdxFiAT2flrz1mdWbZFgoJM5On2AKq1q0rBvEM2mTL1j3sGdOkvoS/9p49m0BInJnuuqAbXoE=
Received: from BLAPR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:36e::9)
 by CO1PR10MB4417.namprd10.prod.outlook.com (2603:10b6:303:93::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 20:00:19 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:36e:cafe::7) by BLAPR05CA0006.outlook.office365.com
 (2603:10b6:208:36e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via Frontend Transport; Wed, 29
 Jul 2026 20:00:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 29 Jul 2026 20:00:18 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:59 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 14:59:58 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TJxwfw1923570;
	Wed, 29 Jul 2026 14:59:59 -0500
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
Subject: [PATCH 5/8] arm64: dts: ti: k3-am64: Enable IO expander interrupt
Date: Wed, 29 Jul 2026 14:59:55 -0500
Message-ID: <20260729195958.671147-6-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729195958.671147-1-jm@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|CO1PR10MB4417:EE_
X-MS-Office365-Filtering-Correlation-Id: ddab66ac-9863-4879-5ddc-08deedac0374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: yIij6LjUbneb6JBEcqeIzz9fErB5S4SCguS2SGJnqi57+5x7/0JU3rZl9MjWAYlCOyGLjWrisNMJa3V3y6fPiPeADoPUIW6/sedqBq+jkF+z6RBER6My50/Losz1+UKFKlXe83BR3wDYcCpF5dHpYnfh+vj4xK1sIYg30qH1OBZ/1lzUs27LXw92W1h9iakZk6vgfFoeG3E0Typ3LOVrDG0WAcQWy1bW3bfnC68dNxVd5A9XzbZGC9hmKq/k4PglH4Rh67A0VEc1Qax2ZcATePeYPAJkjPMkgxjChMy4GoFOA8V/1N9lpihoDta+6tzwX9z/0skgzRaoIwoB1r3J/wmmstHDLvdvQpZAXA3iHx5ENSXuqEtMod3U5+96rV9tqf4DqWWxx0OjAj5XmKBMTvuzeez0a0JswGSnt9jGOV4lj22Q0A0blCjz8mDqeKXtRaJi1cru8TMGRJnbIyvSobx5HN5mXZaS2hCETBQddVyWN6pMdY4QVamVTRg7F9BFILLoui4souilYLpkNeeSwGHe/peMjlmC1hbq6yioIR7T+S+XvboDDhH673wfx8GKGE5Ga+jzn4LuOIRLzumMzkFRkhyr3okhS7SCAg+OjpNTEG2Jj1QCd+yfyJxTDogpw3q+hYRQxeI6heZR/Q83bzSxS8CIM+uNo5KE8N3WTyrDCPHPXxaZOQ8BvL3+xlvgA3VC0oC412NO+j1Be/gK8w==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kjjXH3XeB0H2R3iyik2rSe8IkR4uNQBaH8IG3hB2pz5jSjhhRJDOMbd09yXIfR+tfDJl9E++g/+n7ejp4GG0m0ohBAh/n0IdU+P0KG9kq16r32Ka/gI2V6MeRqAhrCiRu6cZzw5nQ14ZR9DSq91swRqWqbUwSxiKD07kPCfF256kZTCXJZppoQiY71X5JOT6X5cDYHEH/eZGBvVuZxcvelaXk3BcV2G+7g7B20w16vHAWwKgMZ2c4+oh4Jpufx/ErwhWAizCeT3PLIt/4wXA8OGdsEOnW2eS+xMsMGs2IRzVrFkIRHXjw3SRK1PjGae113oFq6Yq2gRHtHQHYG9O+WKSLwMKBGj93eiGugRV+ajUae9MCfPcyWA3se6/s99N2oxJbjO3f6HkvkdVpjPDMp0U4/KIO0qpUzfn/FI7rscsMcqxV8KSFNagoH2Wg9u4
X-Exchange-RoutingPolicyChecked: e3b0kTg+LBSbnu0yPgxrO0+g2X6lKKyVfowBVWTtB1plDedyDMchB2RrTkp0xo13dAOExAn9lplMvf10KPwPOecVWnqhe7NjS0dpVbgabY1pzJqM5WLushPG1S6sRMUjS3nr5UfHb8SjgkstCJP0L07ZYkiaCO1pzpTdOfM8bXGBSQWDqmku7qCrCbK8rnQX4P9h3xoC+zWGYUWSCPu9PePye4HIBP+/dHg4ZSBD27f8WE20SUaTsoJNuOr8zWFgIglyb2SmBIJGRQaqjyDxqxD1ez97rlpIO5uJKLfr9HFwDPx5iW0nWVkkEEaf5bPq6QzNUZ+ZJSIDZVztV/S0vw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 20:00:18.0145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddab66ac-9863-4879-5ddc-08deedac0374
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4417
X-Proofpoint-ORIG-GUID: BTCRzejCDZlS-u38LXBtkolnrESQhl3S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX0IQtKZEWCdHI
 Qr1IHpIt07YYtsUFLT0IZUedD1BybWKQ6/RRDsmvvxgX37gMizWoeQiAD/B8kOB3pgz/VWFWm16
 wLPuRco5wNfRBbxZbSu8bh3yvQdZIRs=
X-Authority-Analysis: v=2.4 cv=UtZT8ewB c=1 sm=1 tr=0 ts=6a6a5bd8 cx=c_pps
 a=WaebrhBVOVZn7IYqRlctMQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=69n5StGKHvAR_yp2vncA:9
X-Proofpoint-GUID: BTCRzejCDZlS-u38LXBtkolnrESQhl3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX1QNMjSntgsEJ
 olsASfBa2Y4tn7b1IMq4rlRpRMKw0rLalC1JXbxtBZvYXhtS7sVKReVpkIROakEI1McxujWi+MK
 vZLRqAqbzIGugbIGgbjNfBn2pQFFNigh9dWYIaGyNcdVHLQ5CE1uxX8/oD/sELj8slarU5rVxlw
 wAWze63uS3fOQ9TlqtF3pEmi4U7uxhcfmdcl2162eXSHuvF0m7bT8IB2an7Ag0hDgYnuw5Q1W6T
 ub80DXBEjngjOTCnfhPAiCtDSQpo4NuEExvDVixSIS/OvxvtO6H77TBoak+2QZtu6gUBCzAHelH
 dvOHt77FmehJcMhluOZ9z1Go7roEzu2KPwS/DWFMnpVXwpzSJDj3wkf27T8Xupq0UrDJ4lXdmE8
 Vb3IHD6pYJ571m07zFkGCVfxpi8TMP2pVyS7U4HjnuItXYEvaoms4C0RHh56RTaSURR7VScTu3U
 ddbILTeNWrhcg8RBqeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_130027_499542_88C01C8D 
X-CRM114-Status: GOOD (  12.82  )
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

On AM64 EVM and SK boards, MMC1_SDWP is used for IO expander interrupt,
remove from MMC1 pinmux node and setup as exp1 IO expander interrupt.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 14 +++++++++++++-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 14 +++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index bc4347cf71140..bb756c922252a 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -259,11 +259,17 @@ AM64X_IOPAD(0x0284, PIN_INPUT_PULLUP, 0) /* (L21) MMC1_DAT1 */
 			AM64X_IOPAD(0x0280, PIN_INPUT_PULLUP, 0) /* (K19) MMC1_DAT2 */
 			AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MMC1_DAT3 */
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
-			AM64X_IOPAD(0x029c, PIN_INPUT, 0) /* (C20) MMC1_SDWP */
 			AM64X_IOPAD(0x0290, PIN_INPUT, 0) /* MMC1_CLKLB */
 		>;
 	};
 
+	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x029c, PIN_INPUT, 7) /* (C20) MMC1_SDWP.GPIO1_78 */
+		>;
+		bootph-all;
+	};
+
 	main_uart1_pins_default: main-uart1-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0248, PIN_INPUT, 0)		/* (D16) UART1_CTSn */
@@ -481,6 +487,12 @@ exp1: gpio@22 {
 		bootph-all;
 		compatible = "ti,tca6424";
 		reg = <0x22>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-line-names = "GPIO_eMMC_RSTn", "CAN_MUX_SEL",
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index d28a38c87f32a..3d7160400cef5 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -198,7 +198,6 @@ &main_pmx0 {
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
-			AM64X_IOPAD(0x029c, PIN_INPUT_PULLUP, 0) /* (C20) MMC1_SDWP */
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
 			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
 			AM64X_IOPAD(0x0290, PIN_INPUT, 0) /* (#N/A) MMC1_CLKLB */
@@ -210,6 +209,13 @@ AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MMC1_DAT3 */
 		>;
 	};
 
+	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x029c, PIN_INPUT, 7) /* (C20) MMC1_SDWP.GPIO1_78 */
+		>;
+		bootph-all;
+	};
+
 	main_uart0_pins_default: main-uart0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
@@ -383,6 +389,12 @@ exp1: gpio@70 {
 		bootph-all;
 		compatible = "nxp,pca9538";
 		reg = <0x70>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-line-names = "GPIO_CPSW2_RST", "GPIO_CPSW1_RST",
-- 
2.54.0


