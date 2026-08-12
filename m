Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54B7C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gD8gRtBVV4qyrCQ1eYC3k/BmpnFB6HlklndGudb5MDI=; b=AY+UKUg3i77CVd0jN5brih9UtX
	CGGHKUTrzHj/xD+MkaCBcM6j38xydiPWJafIRI/H5Vxtet2ShaAc3xrFRVxh5zDNI/qCXn9/Lhu7Q
	e6zg+79efVHeasZYPM83U7APf19L21LMIjIgVg60PTvbg5/1xS8IcJKIVuIfZ/wiK4AHVpcAwR3CF
	51VGCxe9D1MkUNTLW7jJATICGGQJIhzMFNFkx9GBoBV3uqAgxPvewisqTtqsbUZm3kPd0me2B0p4X
	psBe4bg1yfjEqbJegrkT53qdbKtZBrftxY4ABkxz25LaRR6cZwLn99/JSeyjHWIeJGrwjP3Ym1nnQ
	leFjUp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB8b-0000000GWqA-2aoC;
	Wed, 12 Aug 2026 15:45:05 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB8Z-0000000GWpW-0BTZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:45:04 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67CDZJdh321877;
	Wed, 12 Aug 2026 10:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gD8gRtBVV4qyrCQ1eYC3k/BmpnFB6HlklndGudb5M
	DI=; b=NGb41KRDR3DLPQ+jGgH5SuxjGT7z8MzBlh3HhcmYunAFNgb5IZVdAIgu5
	nvmtUEtyRZ/G+RZ9frrtWC8MPd1YqKU958ZQL0cg4TWaX1yxW0SHL7lmJG9Fi2xK
	Bg8QTsmZaU5k4FIQT1k/uAtRI+R/nJPLjEMPpZ6P7XMxXEYPloLJqFowSCL/PLvJ
	vBNCLYdxa6TjIcV9IQeUbMDZPWBO2HASuNmWXVuf9dFNEdYMVp98FkYyyjEKoKRl
	tJ+6WFrRLqWC9SJZ+jP069OhJvWJ0E5g29I9Di32hLcshYLb6+/AnonauuH3fzrs
	YIwHkPJEBRERS6+0k6XO4k3lDoSTA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011049.outbound.protection.outlook.com [52.101.57.49])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g0d0cn0hq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 10:45:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZMUOO3rm2CeEX39fhC4Mw1ao/SUgeAbsuJ9CI5w0yEykJDP9j251hM61Ys9yK9zzTaUnvzyxc0RgHBT+vY7Z6ej3PbnzpXMArPs3dFFdAGHPmGEo7zzb8GLFf8jYjOJIH0ut/duuhBs4LoiV9TJx+m9cY3WWz8XFjfbbbPoO/mbxYsAuz9pB/yrOK6uf3XjCgGElMcGf++eRta0VP1UHvcwqLHMdbU1A8UBctshp+qpF6VExVBRPst3Tb57quRH3gIiPUrezr5dGRiSBaVLGpgA6zqnDgHni3o/8iZS/ldqyJAfmpKyAk6VXHJx+u2nkstjlkceydx02OnroPSfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gD8gRtBVV4qyrCQ1eYC3k/BmpnFB6HlklndGudb5MDI=;
 b=w0P2TfK7jLEJPwJQuZKjLmyNXOoKjIxpNcCinHO31sr5PMOeBYKcP1mgBXd/VSp3qWtHsORKuEs6ZRaVtAjIsh9579qazMNU03Bta6vO1n0REPEnlNlGxRBnJZDq90gX9CHDdGaB6VQPj3Zq+DrLN6PLArkZj7ukCMU+K4AhcHx362rALiptpRC52kw1w9D9akAMv1vfzRKl5Hm9tYOK4QUkQTf5HSyhfZMLYvBBPhEarv0BdSyKhdzLTT2WfRZ0LNCVDsptLyrSqxmvAy2agprComXRKMufNNi+QJpIO9qocBjuwjb6lCFw6ikEcXTu7OXnXR54E8e3iec2ZPM6cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gD8gRtBVV4qyrCQ1eYC3k/BmpnFB6HlklndGudb5MDI=;
 b=DpM86hyUus4Fyb59u4beHADUJ/eauwi0j7e2EdZv62YMfSKfQGY7ekOOJV+KlnpMj/vFXuA9D5PmsgJmnLk4L2PYPfwMrhFZucDFMYL/+SF7EdS4MXjXwQoNHTVZJTreDJ0ypUKQUmP3LUWHOdJzptvpHYX6shIcPaAeP7H0G2s=
Received: from BN9P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::29)
 by PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:44:51 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:10a:cafe::6) by BN9P221CA0030.outlook.office365.com
 (2603:10b6:408:10a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Wed,
 12 Aug 2026 15:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 12 Aug 2026 15:44:50 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 10:44:43 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 10:44:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 12 Aug 2026 10:44:43 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67CFighH2343963;
	Wed, 12 Aug 2026 10:44:43 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 2/3] nvmem: uniphier-efuse: Enable for K3 SoCs
Date: Wed, 12 Aug 2026 10:44:41 -0500
Message-ID: <20260812154442.3379851-3-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260812154442.3379851-1-jm@ti.com>
References: <20260812154442.3379851-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|PH8PR10MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 630dc847-4c35-4235-7a51-08def888a55b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|18002099003|22082099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 0J06F5RdZR6u4bTZMPoA2MyISe4upAR8OzgYV08x2Jyi6cL8ePEdZ/5zODXrXx15x/phGLYxfD9pMKWFBdRbprqzQjVgi5jIKvyDLSpMavZKQYDOErTg/B+62J3UqrysU2u3NGCKq7FMEpDoZJ/fPfneiVPGSG7GcotrMyp92dptQGXDn36z2xPeAf+/5Az2Exv3tX9a7id/N2ynuywKSGU77UvY7ekbcPt01WiFNTXBcx1SXBiaAofssAJzohEJ61vZX5QxHqbXyefO4NSoNfoiIsJoe+b/MD6cyHHRswV5eQ+LNTWpKNOT6204qYLrmA3qb3+CfyC+wzPO5yfhTlMd1jZVw50weFUZa4ROGpuzLr4AeHRIknMhP1dJJNL1XWZsxB6ewiGwfwlrMI+WigfKvLAKU7LtnYSNwTkUz1iCXT8eWU7BYZ/fzARC1uq6/5zukayJ23vvtZzft2djK26yncQKBbuVenUCRvXn0B6nxopfXBgzADWzVCKw+MPoxrgrQ2NVsxygtx0qoC6XAhi8a6OumeB94JYzwTHfohc/YtcJ9Wz8L5ekv1mMBmKFika2oLYN6wBLryCgt8UzSrOpoSMTIkOcL6HRiLh8o12fqtzXq76ZruDsFMp+NePl7eDfeQOWgnWRNysJFWEszRW6XIShxB+SquOh9LWZ5E4xVaFv1yQG7pKzOKVT1b+497mVbBbvvx6HDaVyYA8dAA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AQnxwug5j3DjflyNk+FdUAWWcbKRw19dw2B2ba6w6mZSAQUMAXMxBEb2PKXDz2S6YM/h0ZRJbUVpPq+Lz/SSLnZAqPV3TMvrlEVYsWQaoIqpwgcImcKIbPLx/Jn9muPC/TQxt1bwqObiOPxq8Z3tcbuSAmRZE8q9lKSfDNEY0v57GaG5uJPrFnTvYwN6YM2spN32Stn2ybfxKEOBNOs7KQTVysBMwPQ9QvoZz3YYJqwXnowCNecnVI2eqoBveRT+6XDCVzN5H2cA91aXDMw6VJyMeXUfUPYYd2G9N8m0AAs5N38s9TZBypt2lN02ynStSQSej+VE0UhctnPxvnjFrBAuaUcMbrvHPIsxSu6NHMXAJD27q/slDjp7D7VkPDohgdfY6cfWww3CDZClorJOI37QwZmrytL5deSeOE97VJk3Eh3UtB9sQ4FeAFw7Mskp
X-Exchange-RoutingPolicyChecked: TkFlGPc0bBUmC9BtxpMrKThBj9fh/nmzva/OqPmHbZnU1/NPe2w7HSzpxv+i/W+ERMsuo8jnR+TwcDJxX62KsdFnltPQfR8PLpcjsvh9rRagJJLhA4mWLlhcqKCyRnku+9onjl3FBm1RfDMV5WeuAhJWNdNY84kj+ity+Og79DD7MYvV/FTpvueFBYl6G9PMJhm6Jyv8HTxi7T3cPQhTVbQzSqz3e+Mt1ci59xVREa/Fm4AruWXMZpNel/mlW1n70Rr2E4NwqXwXWs5Ne19Xwi4derGO8p6H53XlSf7B9ayX9t8I9lh1CKkRonmi9W+qMR2vWd9EFyDqDnnXhh86qg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:44:50.5558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 630dc847-4c35-4235-7a51-08def888a55b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6290
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfX5oTBY3DfAvaB
 tzdezRRshV64vl7qNb63NZdlv68nD/kDW4wF9EWNMmJCv+H9BoOBfXLFa5sTOZnIoS+QIwt/tcV
 NR1kmWahhqZqAhBwogS4oPKkpg9Jnwk=
X-Proofpoint-ORIG-GUID: ibU54WYDJPJ840ogeP2-kvPKP5MM18xp
X-Proofpoint-GUID: ibU54WYDJPJ840ogeP2-kvPKP5MM18xp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfX3Vjp1jkkhH3c
 ctQ311Dc1U8OOsSZKv0wFNbVpocVCXWUzbDynUxLNU39i5s4Sd3KIjpGBSkmnNqeKsKYwSGf12T
 SCjdUHAixF0oncHma3/jaVM0BVMobumLDO9czgJhwAOnE48IEh3oVXtbyVHrLINgypZ2duWwE1J
 GA4Rl4Z9lbFF80vloVxb3RRJIZ+KJ3NFHZsdt31zevTnb+bJpUMTg/CtiKVlLERSS1Ov7Yq7TIX
 vbtmhgRP4Ke+ys1C8Yuh0VEsDL5Kkz8JPiRbnQsOE46s2zPCQ9vIP53nyocvmRSps9jFyTiEB0Y
 aHMhrch3MwoIClV8M1mo8BjlT96AsGy7OoIyxJ7NobQyf4MU4IaJ75DXzvTjhEzHOTJP1S97qvc
 XA51dkuPdhlEC0c3C2AzA8qjg+KXu32oHK3tsXDrb38AvCkTmsm4xBoAo8eo6DiZ6Gbq/JQD0Xb
 h/0D35VSI9qW/Aypa7g==
X-Authority-Analysis: v=2.4 cv=Y+DIdBeN c=1 sm=1 tr=0 ts=6a7c94fd cx=c_pps
 a=DQgCSL4B2z8Pp8IQPtpfIw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=RKf-SnHdLUv6J_xuJ0MA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_084503_092045_4A5599AD 
X-CRM114-Status: GOOD (  14.19  )
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

Add ARCH_K3 dependency and set to always build for K3 architecture.
The uniphier-efuse driver must be builtin to support early probe of
k3-socinfo during boot. The k3-socinfo driver requires the efuse
provider for reading silicon revision information on AM62p device.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/nvmem/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index c36c2a4c2a0b7..df65e7ecfa212 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -541,8 +541,9 @@ config NVMEM_U_BOOT_ENV
 
 config NVMEM_UNIPHIER_EFUSE
 	tristate "UniPhier SoCs eFuse support"
-	depends on ARCH_UNIPHIER || COMPILE_TEST
+	depends on ARCH_UNIPHIER || ARCH_K3 || COMPILE_TEST
 	depends on HAS_IOMEM
+	default y if ARCH_K3
 	help
 	  This is a simple driver to dump specified values of UniPhier SoC
 	  from eFuse.
-- 
2.54.0


