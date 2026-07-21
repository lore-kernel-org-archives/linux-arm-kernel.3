Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EB0C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 05:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OI1Yfn4jk49xPzEaMwehUp365bZUQXj8W3ga9oleC70=; b=DERTO7bWMxRKaWdRfp8EJHH0F6
	84TtpP8+OGvSR9SEnhIuuJ/NZXNvKf8Nvqe8L4qLmuNw3Vh7zH6DHaWVjxRF5tMBuvT0bl64fxKcx
	0qJmBx294YP251hJakaLVQzyLwdDZFIFdlUlIRmIqGR3evStOSAonkJ24X5D3+Xp7r6EkDEXd4yqJ
	JzrzA51zi3rwDvJP4LfzCySxvs1jZ1DCrjI3UDTH+n0qM75KaWS8DMkycYVvfWYj/lZh+TEpigKZZ
	GkngcFPZ8ctJDm+luoPS621YLHPqsHYSUbh6F9e3wg1eoDlDxhDp7qOnHQv3Y/bymycfJvTXd3GC8
	0FtR5cAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3LE-00000008TZ6-1aeM;
	Tue, 21 Jul 2026 05:48:32 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3LB-00000008TYU-1U7K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 05:48:30 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66L2feWJ3857717;
	Tue, 21 Jul 2026 00:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OI1Yfn4jk49xPzEaMwehUp365bZUQXj8W3ga9oleC
	70=; b=MzdAGc7LigTD8QQxq4g3uSlasFf807qBFRoIzW07zo3aq6O0Txoxqqcy/
	LDI0MeJAatikqnwT4V3QvvysNPYv+BPJ/ffg1kb3pDdpSJYBPHKG1VCp6a37yKr0
	/NCE1PK37HPVCqeXu35jsu+tAUU3ZIu7eXN1VomF2ymF4kiLKl4B9Tlb/RFGlxDj
	zX2TeFgpdm+cfg885isnHmnh3IHlhim1gj6swZGQceBwN6aicaqflja7nez8T2Ra
	pmv0ypZtgkysqYIp/SvrCtqi8k9O8ouiIuv1Cyp17LfAxAfrF0Ps34ClJv43IkGD
	j+nOW6jgsXIHyDauwOzLLwwWQEsnA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fj077gq7x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 00:48:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbYfg5YUupc82L6RCW1PcHn/BJP5TuS1W0JDv+2e3CwNndsq+B9igHMFMUAXIeu55Ry75A40lr4xxWiEh7P00T45W7d6A3W1DTIbfaGc2B+fDW4k+CwKMmccHSxLaJqGQB8KG3J7AprJ34sZPPzH4cAd5cl01dGBA5RmriHp3eJuplUKmgPDl42/LYqxrbL+43ZbKIiijYzbn2GwRsroS7e5w9uT5kOMsLR3/b0DunccsY2cmnqlkPfLa3o6WCn8uouTMtcFPRNGIJrM8v0AlwUcjwqJ/G8U+JCw3RPAvCd13MItZKpcZqcaiWULqLn4cfZDL89yKalHm93zBbSvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI1Yfn4jk49xPzEaMwehUp365bZUQXj8W3ga9oleC70=;
 b=dyXHlmws8fqrJjTjZClFJRrmUDeTUk1pVa3WswJy7R+gWalTPLtEwygZOZnZFJQOTTAYBrQrZacfC9gmLQPHeCW2XVmwq8xEc5f2F2G8tjGVeTFiyFGEFY8fZerA7CFNlc26p5toyKfkIswnpF8Py6tssu7354f1e0Ketuu0SYSOIaJxLINsVRXh7SAWuq935JfdYa9r1uZUTChMgKuEgMnJkN3PSb9VqI90MTiPfiKSNaRv53DPnb7rbNxWulHyFGuw0S9kmGVbkLdELHvDwjr0W7RDL2f+h6cedp14FGEWLQDaHbu+RRCNYlafrnHe/Rz8mhKxDXiruF1LQkvRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI1Yfn4jk49xPzEaMwehUp365bZUQXj8W3ga9oleC70=;
 b=LjfFJSfuUgnqM9Ipa8T1sayjWJKdeEY0IhuqOdMn4XV/51c123jl/8xH/bZZpEthAC9qlDMsjDpLDYFhVjTRt0TKc8tJLpxzRrr1sN8/VQRcNqZU3T5auAcQ3qjIpTrWl38UL5sCwJBss6bRPD4yApPr2nxme/CX7Zdd5A1gTVQ=
Received: from SJ2P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::7)
 by PH0PR10MB7027.namprd10.prod.outlook.com (2603:10b6:510:280::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 05:48:23 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:5da:cafe::93) by SJ2P220CA0010.outlook.office365.com
 (2603:10b6:a03:5da::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 05:48:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 05:48:21 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 00:48:04 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 00:48:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 00:48:04 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66L5m0W8607602;
	Tue, 21 Jul 2026 00:48:01 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Stefano Radaelli
	<stefano.radaelli21@gmail.com>
CC: <pierluigi.p@variscite.com>, <matthias.p@variscite.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <cover.1782680023.git.stefano.r@variscite.com>
References: <cover.1782680023.git.stefano.r@variscite.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: am62p5-var-som-symphony: align DTS
 with hardware revision
Message-ID: <178461287597.873002.14272788577832844412.b4-ty@b4>
Date: Tue, 21 Jul 2026 11:17:55 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|PH0PR10MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: 7810c38b-b2ea-4302-b589-08dee6ebac62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|7416014|376014|22082099003|18002099003|13003099007|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: siAuMNq3Cjsd23QMJZUCbNXuQlAqfsIsvB4S7yWXKe3p4JYxGDE+B/MeWT3zbhkcyqFEnu/5GG0xeDlFHqU/0vL6h1zr7ORoKScz4nuPfLVtdq+nrYKWF3sDLLsxsooBVxkGB3aOI8L1EEqWMovavw+PjjcsIp8VX+9yjLVa1dmffqN9Vx37tnG4BoUW2lIvNsOIP4sSuihsFQRtf+hvafp9lHvnCJ5UaTFHGXbyvoR7S69SZ5T7oAZkACVxxdYOLJo9lS6UVPQdk9ZBeoBZYSSTzPai7fwL59wEVn19iuulo/JRO8unL8Qh5RhwJmxEskmxhYWNj8zlD1C67yQStUE8bJHQnIi+1w6PoalCVlE8NHKIdbnSRbkIbbHdj0M3QbCCQHRA7Ldf3TMRs07fZn9bbW68cpNsW+WpI+AwJ17lSd/j3JkZ7hvBGOEbjv2msLkZtsSsOu06PRAgbm4Cyl9GmDV7PTFMDdDG8UcqxyXtOS4ZD32cM2YDFCEGgcKa55s8uTrtMPi4sEOVXrYefyLKeei4OncEanUa778XMANPGHuvlSBO/Rz1RDeQ5TDVGDe+Kxgin21/Y8sHyptKuu3+oOcMxOXY/23VovCi8FYRSnRSGtOYzjBIlIg6DKbS7PyeiANY227K3S2S+6Oh283fWsIOIuu36U9BQHqpiSZ1N4KDVOAlYJXctQhvWu83e9ib1Sl8Aw3g0HIIfIVAYg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(13003099007)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rTVxvSWzmkeQMK1yjx3eX/e1+k6Wgx6Wg4wABJAfCIicjLRmvSQADbC++AiCl4oOu5I4Zq9/Fi+9JIAZJvN8rTU3lm2DPpk2tduFLRp3Ye9ZcuhdtEPzBauGKCEuzp4/KMd7U85qJMf20FRiI2L4kG/VwcBt88j8gHe0qiT4p28CHFP67rAPgq5rqwpTcgwl9i+Sw5Sq8PA/nLoH1MY1avCEuWEDAei2VUyiEbjz3BVK36ndoKW2mil+LyY0i5tZyRH35Lxq7qBS27lsIrs+zJmDlhJo9AWLYDA2Qb/YX7l/6lDkPa2ugHJe5YRnIBqrRxmFhqWzkA7ze6joSj9bVj5M812zS3/U/VQZuHhm2zHobQ1/V+0lHFZF+24tQczc+mga3MG/AoKsABsV6o48pg5tCCBnj3rZ9M800NhETEr/eAkiR63pXwHHWcoFQkbS
X-Exchange-RoutingPolicyChecked: Lcw01AWgiKGEqmE669kC7Xl1YjBOs3tUDzLtnj4M5lB9HTzV0yf5HZxhND6XWBmjByiFK59qmN0Ldt8Pt1JxWhAi47ZfPr/Ktle/XgKqzhcYbx6/y9kHmdHflgydh9fUsulHd9UW8qa1tmxdKWCafb65tjMSEZDZbBsuUL0qTj34X94AST91tsg7J/SDLhiv7EFcjAuXmV+drADnTp1nmjsyAp49olHU/NIL0D7S0AqTk2eAMSy3Q6vVaSVjGzGxGS1r9il06aXV7jQ8ix6Deh/uQK9FOCfDKriR31DMbFDuamgENw+DiSwHC+TVQeYrQOqUdBicohJGiNo5KrFIuA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 05:48:21.5686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7810c38b-b2ea-4302-b589-08dee6ebac62
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7027
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA1NyBTYWx0ZWRfXxTGQMhOVmPnl
 NIrPK/1P3ad4whrPM+J52MFyONIwWApBnOg/9/BQZlrRf6X/Syullou6+Ly5t1HpTPYWHt0wulR
 5AsLbGrpzNP+4JFbe+nJYuZ5+dP3YEILS+IVVHsJDuEyMV2YScs4WmyRk4KbtfDwaRjO5IP8w1n
 Gr2EajjY59SAHGI4Dt0KQw8ycIS80pjynzEq+7BuanPtkhtxzzUtraGR84m+3RuEf/yEsYWMwHu
 M1hoZmRZxf04aC7pVesfp3XUCmc+Kn+t5248U2PT9Uz8PlUj+NmpjdiSrIPe6LpgVMzc1t7pRYm
 dNiiKOkOImLzY7r/k0Jgsoldh6YS2TNZVZG4/XtmEKjyRY9c/p8R8QgvxBaDA27rDrKy/7t/WmW
 ejxZf7qxkUugB3CsZCzdXBC2jMkGo+7VEZ7GIEzN+D4/Bs4+PFj3cvIQH5HKB/DZ62uErm58wme
 Cguz9wXK3FULoc1WrtA==
X-Proofpoint-ORIG-GUID: Tq3ihlqfOcEHkjI5txE8hNEJSaVx62sk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA1NyBTYWx0ZWRfXzcBjBIHn7Lr/
 tTdR91AhkCXiovgnK0Bqaux31ehb+RkPFipamelgUiv9zOSSeioIvrvs4YM0BhWX8hl8NfxhUIB
 WrOnuJLc5p//WTZrPZUKFgKdKR//KR8=
X-Authority-Analysis: v=2.4 cv=KabidwYD c=1 sm=1 tr=0 ts=6a5f082a cx=c_pps
 a=QW6cWtaKxEx5aDBFEJsq+w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Tq3ihlqfOcEHkjI5txE8hNEJSaVx62sk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_224829_406760_31CD6ADF 
X-CRM114-Status: GOOD (  15.22  )
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

Hi Stefano Radaelli,

On Sun, 28 Jun 2026 22:56:04 +0200, Stefano Radaelli wrote:
> arm64: dts: am62p5-var-som-symphony: align DTS with hardware revision
> 
> This series updates the device tree description for the Variscite
> VAR-SOM-AM62P and Symphony carrier board to better reflect the current
> board configuration.
> 
> It aligns the Ethernet PHY description, updates the audio codec
> configuration, and adds the touchscreen and TPM devices together with
> their required board-level resources.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration
      commit: 1c97b48546ad266090d66528314f7da399ce6ecf
[2/4] arm64: dts: ti: var-som-am62p: update audio codec configuration
      commit: c026c728573b42718759ce425b075b9b25e194bf
[3/4] arm64: dts: am62p5-var-som-symphony: add touchscreen support
      commit: b29d6c7d2030f084e3b4911579bce1fb038b24fb
[4/4] arm64: dts: am62p5-var-som-symphony: add TPM support
      commit: cb364ce1df8902d8f26c05e1091e24f337efade7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh



