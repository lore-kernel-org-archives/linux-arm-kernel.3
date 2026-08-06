Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D287C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 19:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Clglk2WgiIpN7lTV47L/OyyUW7IvT8KSp0Pkjdtfneg=; b=kRvl6LnLiHJWgvd73h4X7Zulof
	3bqa8jaBdducf5lzVqgTwQyevo+75qldfM5jpQXsb3BwH/hR9vGeNBeshwBwAYFINXitQSBiPgRsP
	b+OzSGN7bIo6lqx/VUQpY9lMFRXMAISery4ku78O9TSHw+s4R7HJiSqMQCZ4QhZPTiLsjlbctn2ZU
	acC3BAuc0XtBOluwpzhn5xm2iqOUFXAqe2hay3XAHcnKv9Ip0+MasyRInV5rkG+Xm2ULNW24QxD82
	vDgsfcWxYNiVrc0MF2awRSB3ZE6o+QZVuSkAE1KUSHnu/hkZn0HMtwrfQ5R2ywV6yVX3XJ+SWBiXI
	tD4o0x4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws49C-00000006ak3-06ro;
	Thu, 06 Aug 2026 19:52:58 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws497-00000006aii-2O0v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 19:52:54 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676ICfc0594769;
	Thu, 6 Aug 2026 14:52:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Clglk2WgiIpN7lTV47L/OyyUW7IvT8KSp0Pkjdtfn
	eg=; b=UobSs/805Uy9jEIuO3xN81X7Zsvxc7qpDFwWXX5wW1yPoegH2jVi0WK0D
	ScEsHOjOmzsC8NkvflhONvpwDeQi/JOCHreTKtsQ8qYeqqeG+rw/ezY0qBdgscRs
	KYw+ZT20frQ8RAzSjdem5H3B6rapIapU+g7A7M6NJmvz67/om0CXaaGra+zhYfqv
	HgNq33x/MGKdFWzUObj68uGWpsCw1g6DhK7q9Sv2HXpGiPf66r5RkocFzwHf6MqB
	qWyqX6a4p+ItBw4Z3iNcD8m3be/99KzofB1bBgfVRXlYw6CQ4zipzoruVlyyYURt
	T0DHwoFUKNv/FRH5JQzWryB7FkbsA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010026.outbound.protection.outlook.com [52.101.46.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvs73c36n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 14:52:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acFQqyCv2pktNH2IjdS4GmGh3hdcv0tddTG9K8/1HO1gBXz92sJ8ZhOv5rbq3afTLP1H8oHbARSC4Wg3qjXKZyvo1JQkvn1/QFFklJlf6dPwasnZ9goEEHBOkA7Zo8834wNlGKglUR8AqJOxoXuQR1xkMR89Necix55H2emZcULroiMJ+BOvYIWR64HPgThrK+tV0kszvMCI7o1G5RBKub4rzVhM3gYM+ovLHE80DRMjPblcu1m1E43+YsUf6XswPX1mjnDTppAqjnyoqorfSJ6epjWXApuXBAjtYL+zsN1bIQbshr+0+THrUoLQCZyZtKxyIac4vzEIotizLb606g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Clglk2WgiIpN7lTV47L/OyyUW7IvT8KSp0Pkjdtfneg=;
 b=pNi8LLCek1M/IfKs2Lt0qtOIaEKPZdwi2rHrA1ycm7hNIpIu6St4DWsmYJWSmirHGlyjiV+RAr9lpAZwWF4d1lZQ4t4g2egtLMd7aQBKEK81gN1xFvYvSetCjfmT4+Dw90QMXb2xpnfYvDpRY0YE24N/VVhuAYJzMSOp0MEezuSmcoA/XQHF8Vs6oUaJks8owwh/XZO87Tn6DHlbsSlC8Q2eqHSWqU048sa2DQRevVOx3CIX1u9lsh+Qt0O+3A7i3u4TpppXDWPGr8FIDvuRhwaHrlO/eK58AnhrkvKPWfH7IimRe5AVmMgmax63J/CjLlwOBcEp1XRfq/5B/ZhavQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Clglk2WgiIpN7lTV47L/OyyUW7IvT8KSp0Pkjdtfneg=;
 b=wArMTHCxN0xORr5X+B+rVwq5eOn4623l8EhBrhfggqGXLXzbNLBBjwoYha258eZM/OtzWmkiV51Xggvvt86rMnk2rLq9rkMYVHY+7+1aq2yBRO7QhrN16b5NV9BLO0faX7eDTf3gZxWVrlNcXVyPU9H4+FCTX/fVKSDFwM7e20Y=
Received: from MW4PR04CA0137.namprd04.prod.outlook.com (2603:10b6:303:84::22)
 by PH3PPFEE76E158B.namprd10.prod.outlook.com (2603:10b6:518:1::7d7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Thu, 6 Aug
 2026 19:52:46 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:303:84:cafe::67) by MW4PR04CA0137.outlook.office365.com
 (2603:10b6:303:84::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Thu, 6
 Aug 2026 19:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 19:52:45 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 14:52:43 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 14:52:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 14:52:43 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 676JqgLP3900552;
	Thu, 6 Aug 2026 14:52:43 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62p-j722s-mcu: Fix watchdog comment
Date: Thu, 6 Aug 2026 14:52:42 -0500
Message-ID: <20260806195242.669491-3-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260806195242.669491-1-jm@ti.com>
References: <20260806195242.669491-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|PH3PPFEE76E158B:EE_
X-MS-Office365-Filtering-Correlation-Id: 46108d7c-8222-45bc-04d2-08def3f44955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|22082099003|56012099006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: YfT02BZc4qvURtzrEfp6x0HXTklEiPuMsUbMPSFGijX+XfTSI+8SsBU1fNEK8xTTWV0+NCdtEeChs+0V/NPFfHMh2YYdgiuWQMR7Qoyw0BnvCOEs1nUIlxpG51JzIxV6tJFXh/77avA3Rm1tuPFAicZkMi7pr+YVa/Jtgxfga9G+iZpf/DI6ncQHBDdVGwl0zVzD92gsuagrIpaTn71slkT544hY5cjy7MhFFjyMpp6LM1LDwM4I7x6IweWW13OwzxdwttX/NXg590O9wZojT6S25M/u7LUDjzzpoBRRLye8b14vzoK6LPEm9zKjfWZWMzsWNgRnSZQpv+D2I59MZ41Gci3Nsp/3lqctD/cB+HusiqBKLG3yMSaDL6KsSOcSyPKT2W/MwB+8gqXbA80CZLmUQgJw3fJfTM0K3e49QcwHEDLa9+JKgXNRQ0CXdJgjE5b7Qr5A8QKeVfmMmxaWyFwmPgPSOqqjdob22P6NP/gaY5cnBDOCzfnLEZinociCmyWWY2o9ziTP7PhGDs3LIDWRZpEzS1AIKKwGWFzLWfsSHTOWA1QwXUJLQDTnfH3u27TRlYQAc9adR8h1fDTlQbzEzKgKsDbIKSooaQl2kwyWhCgE6niym46xy6RF/9Gk4kg2Z0lK+8GqGGF4J0zJPqupFG3eMXqgty8WcwdJ/cBneR8Xa1FuAkz0YeFauDvHPTavJHuecthZWLNXhjZcJg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(22082099003)(56012099006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A13b/hlqtioXRP1KXGTtZJ5iAbKD6wdSFb3HsZ88HBThkI/piAER1ZowjXD1FIBi83BChMAL2X3+e9O+Ei/M3hhEZCAC7A4ud2/K4hTY7SxH7ysc0Xi9nfwnpg/vVal4d+IlK+69bQdfCVixD3vCB2MuLu741skVSX+JENj0B4VSYfUQhQoR9GupekR7GBG6dq5vLh5cPh0APuXTPiyIGwYACgE3k0/cEJmTPg2TT3Xu0HWkQCyXD6OU2QJhsCIFKnorPMtpxBsQ5oFodfnTJN6umPeJMioMvcaUXwVzAkYZitbkP+cb5HZul+aQjCWyyY+Ond1ehf1w/+/m0Hn3yJ/U5cJN1qqsxB9jnAKH09z6dXtsET2pATdoTUV5S240CGqNBuaoQfBH5cSiMh0dr0pCHSMnJrxrqp/AH58wdTASD7SCLHH0SX4MDrqfnm5E
X-Exchange-RoutingPolicyChecked: m2XRZNTMYQy4p7az7q/fayDQ4HHaJ/jcQy/p3fM+bfs4TDJj6phmLJcIMLtMwTD50dz1C7BmBAeUX7/CkbOU7XRnBUmBXnf2dJ1HNYdcFoYyy0NK6JGoYSp9NtSQLvfGtpMm8iPPc9nXmeD5Q+wJBwByV97hnZdQ5kEWziQH3a0h3JLKeVRqhklT7Hx8sG++tWmIZYzChb7eiGzrLbZRzrP0NGT1/OKWdZ0qit8JkC2ox79t1t3dhP3W3fHUigSbGhhE23ZUNUr1rPW0LuRwG93LQw3syHRBvFOoGHaUl3eDwx68k4E+OX8y0xoPOcPl1Etv4ADeV5yGXWLaHms3yw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:52:45.9790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46108d7c-8222-45bc-04d2-08def3f44955
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFEE76E158B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE1NSBTYWx0ZWRfX4/JcKTSUHI64
 tIA30uTb4vZ2BYiyNDS1lz9WvTs7AXZOAInm4l068b1GFBR9U5b15OcjrcOt66KFzy4nZBNFb3u
 48sG9IPzBiVytNatZfHgT4+H+GwsQX7PZ+vlVHLBYX5qgOkS2JHJWO0wk0JZZFRba8gXboO8BXd
 EvWrYHzXgEJPUBnXZtJNgExXe2PLtzcsWryv5EqoTqcN20uSPcu3MSVgT0d2rnvKVdeR7CSpIfa
 3V4RH/mQh2d6p3PoTI8xzkoD/byiNIJee5zkXIBqNmRBz13qXEN7fwhkIz1L+DBhqq55NJi6HEi
 yrFq/rfOg0AAS2gYq6QF6qLqRuY1+KBBo93z/uHd5Vf45vJAk183O6R45TMXo8erAkBPpIk4S0e
 YZsjtLeMmrOk/ZAxp/aQl9478BWo3AKVCrX9blcWWGJszZvP81QDLU6YzEqrTh2pLfJstBzOYi5
 ZuQRgC7rRVi/VGokXNw==
X-Proofpoint-ORIG-GUID: eSbyHPthQYbuym9keHe0I7rTKJSQb0G3
X-Proofpoint-GUID: eSbyHPthQYbuym9keHe0I7rTKJSQb0G3
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a74e613 cx=c_pps
 a=oJ9tI0XfeScUaspqi3eqJg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=J8TWVcMo2mSef7RibcsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE1NSBTYWx0ZWRfX76nlYKuAAQIg
 w5T+gC9GnyNaJq3071Irs1ysfUe0SEbbD+yr+yCA/lS0ZN1jl50WzYJr9MiHWtZII364mfg0V7S
 GhcR5cglF9zQbf5Ggj0oTJl6jVAV5YY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_125253_721111_9A8C5CD2 
X-CRM114-Status: GOOD (  12.20  )
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

There are no M4 cores in MCU domain for AM62PX/J722S and watchdog nodes
are tighly coupled to R5 core, fix the comment accordingly.

Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more IPs")
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
index 5288c959f3c1a..2394a4fb5a94c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
@@ -149,7 +149,7 @@ mcu_rti0: watchdog@4880000 {
 		power-domains = <&k3_pds 131 TI_SCI_PD_EXCLUSIVE>;
 		assigned-clocks = <&k3_clks 131 0>;
 		assigned-clock-parents = <&k3_clks 131 2>;
-		/* Tightly coupled to M4F */
+		/* Tightly coupled to R5F */
 		status = "reserved";
 	};
 
-- 
2.54.0


