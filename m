Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C84C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z2FXOXUKIxoyp7LYjTTd4JWueCap6zrFjeyL1Wc4/i0=; b=i/N+2lZUcgSapLM+DLhdB6KnAN
	1oe345bCeBnM7IX2hljnf7nvC6VsUTx65RVCZazG7xpG6OWAUhuYaba4AlZYzTTNHTH8CspL0PDun
	Z7LYgA2sb3UrmbQhZ0xv/egVs6YRagIlglENVXFmunguPIlir1EqOt7yzSP/o1v7FCIOpNcblNoT/
	jJVAp0VusWO/1cKb8eiZim+1ll3Gs8g26L4q/Ifwo3nLWQEzqNtXhzaVeclMM5a/crHjZtpANPTmW
	dIz1qWooltwVpy7rtlEb8aL6T7EgtrG2lJvsbrRzx9OujqHle/4BXHcesNpVbfQcr3pzzVeTnsUj1
	MxxTN66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpASB-00000008v8c-1b2M;
	Wed, 29 Jul 2026 20:00:35 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpARw-00000008v3y-10Os
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:00:21 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TJ7TSE3195591;
	Wed, 29 Jul 2026 15:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=z2FXOXUKIxoyp
	7LYjTTd4JWueCap6zrFjeyL1Wc4/i0=; b=LDtzgnxXZCnE7mLNqmfAxoSp2agW7
	6UREu5/cq1eWHBzv36WcrLhkV5q/ZcgQmxmIgw9PzOBBGNSgTUTXMH+HStfGzPu7
	i5HsDzuhUrNbf20X1BM0xy3pbM1M+7Rp7bZ9+XbxkpZrrEYZTq+Mu4e1IRJBNRO+
	nDcpzPpzm75613j1JqDpWklbkmB+R1qS0WfEC8wW8KBTCldSqylXkD84HIsYqgju
	iGucbpz+rIKKYn43KntesPkRJCYKcT8MQY5Ejkmh//XNVRFBZTveoSPcRKZUCwbQ
	9FEwTbOr3Z/X+qghxgpIEqwf1QIRi3ApWrio0NwEJzh2ZgGqL1+LZyy2A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqqdagby9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 15:00:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWZUC/w2eJE3hxgH2V7/rKQhYrMdYXGl/5i68sEXyfTzJLC18HZ3BrZWhZDAerFBWjPdl9DbrwtEF2EtSfrjxIVOBAZFMleMWDyklmSOZQb6D6PCpTiUUUQmoe1l8TM/TuoWV3mX4kBa+OSHy3geRDMvF5DF17ClqSQifLv4K1tfycY3uFCqEk2pjxByL2CKSZhyzNVQmKkEG/jhrrkQ/f+iR36YAvelrXFUe2AGSNjt6iWC2w7V51G8vSk+bysgJkAuI9oxRHhINdMO3Eg/B5wYfEpf1kGYpMnKvnVAI2CwIrC1UGwiA4qQwWBh72VGaChavi/UWZ5PweqYOEYw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2FXOXUKIxoyp7LYjTTd4JWueCap6zrFjeyL1Wc4/i0=;
 b=uE0yJDPgV0Pa/fBrS9MOn0865Ve/eT7BjaDZTNnvD4yWDd+HJi2yQkWa2RjourTbi/H7dnmAMZe0kjg4uvgeoTYGVQCEO0prrkLUi2EbmHqU/Wp3y5QiKhdDOeyTe9NkkmcWSeBdPnTL/9/+feTmFyYLTpegglxrMXKlkmsgu0FfE8YJLW1JBsw3gMBhjQymvvhGb7RrCdCff12Leb6BUo81kkI8ZaCaO+5nzPTRdbnxJT3PY7MO/powIYUmH12/YzUhPddxxDL4P4JLY9QUqXRSh6MzLmjqjI6qARd+J2U0XiiGcX2FaIwmkCtHOazuc3+TdldEJnNL40MYIVEEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2FXOXUKIxoyp7LYjTTd4JWueCap6zrFjeyL1Wc4/i0=;
 b=WKWiRPze4aMZEzR1GRNJ6SQl+Mw9Ed0DqlbVKw5YaB7P56nyHKJl33tdAi6Y657KmJ/EXKBDYj4zlLRwuPRmgTZHc1WZN/YAYD7WRIgUwjzS3fkPENB4PMobwkjh4SF65ckQo0g4Hrm9uXUR7NWg9Hi8rkN7vMPpKXjf06vwCCE=
Received: from BLAPR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:36e::21)
 by IA3PR10MB8417.namprd10.prod.outlook.com (2603:10b6:208:573::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 20:00:15 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:36e:cafe::69) by BLAPR05CA0012.outlook.office365.com
 (2603:10b6:208:36e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via Frontend Transport; Wed, 29
 Jul 2026 20:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 29 Jul 2026 20:00:13 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:59 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 14:59:58 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TJxwfr1923570;
	Wed, 29 Jul 2026 14:59:58 -0500
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
Subject: [PATCH 0/8] MMC pinmux configuration fixes
Date: Wed, 29 Jul 2026 14:59:50 -0500
Message-ID: <20260729195958.671147-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|IA3PR10MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: c17cbe0e-5ec7-4cf9-243d-08deedac00c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|18002099003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: +FQYPggYp0mRpWYeBZwUjNOm5JHnTbYShFKoEbVV7+mn/5J1BoWiE1VIVIhqB3U2sQxwQMhaiddH27Fu+nsyiEbzI96UrRkNcaAxZ489ECp3/Of+sN+339q4/bMw4l2Hhe8STHHqUx5qato6EYM4ojqMEV3neb6tUxQXxdxibjhUrx4hfp6RWQ7nsq7U11EiDGxhr4dM8VLvjMjDW1K+/hcNFDH+BLibKMHwmeYGg9UixavpHf6dtO2TUOffXHBXLv0K32XT36xgEWHcsW7mpC7s9PjGY5pdtpyzS0kpVgebKDEPlvQ/u3GbjPAwKmNrPsG+8f0Mvec7kbgL5y/4PKxGTApvLik6dCR3bFO0AShN9QLiHuze3PgrV2mvCFhQVo2EFRQ8BnFp5scGwEHhM/jy3xRIROL2jDiepWCfsOULf3CactxUUBYjJzyb+zx3BEJXSYgaprEmMXVOAFGDngTZAz/Z6jB3RgC6XW+r6sR/2RzYy8fKIwH0TRo7vJW38SzqVwu02WTuL1V1A945HtEC7rgZxD0S6mziZSPhvQUov0zJcksX8K94FubJz4e6ZHisVMTLvbd8LuDazSZNyOhlheaR2gRI/sf+LTegFcBtCMx4gGZ03kGT03tItvlJplcVgW49eTwCbkC4O2zGt5cyFk2PJt+cD5NMNvVRytuLWOY6ccf7o+6033clV7kSVjBUsYsovdlphiPQC4DIkw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(18002099003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uveC75xq5zixH3RpLGJoG5hS0GYM8t9NADKF1gHZ0V1WXWUpyXLbceyE0fWh1fWHlOgLMWC3bAiv+L7NVBcGLWitLbuIO1lu+aXlqNv4d/uZN8nYflh02vDIONATe1CUZbS8Ski6X0D8t6aBBh91sanQPc5V24yqWs2fPT1EsCz+XKCDJrSHNpY8Uzhr9XBO1zW70u2c9vgs2KEJzdJY4CNi07NHNShXS8qiBKvTWphKZyO2kiRZgYvA2maXoXuEfT8O5cdHb9NTi0z16LsdOkYqg+AyAr1qdhgUO4dXZfLovHCO5H+7CIDIHph2CaBzM5BW2ax/zigNTxdCFJRe4kJ5MjFeZVtesdisq+D5Ca9emo0luzi33UXe9Dvcd10BIhUFB5FEUEzELM7U0qqLO10TjADEtoZP+PmysHqfNXA21A1A4olrj5tKV1EoIEsb
X-Exchange-RoutingPolicyChecked: Dz3U8OvrQgyf19EGLD8ZRQKsRlpSpxyT2+Q44ANwXEf+EcJynEhDtSFA3mW2snf5pYoEB0Hz0+bVrSxykKURZu9yQHa29vCQZcxmTvuKkW73HBidMn1F+THBMj4GHeKu0gA2fsSnLHtsbSSLr4+fzKJAZPDNVxUqhbdDrG8Y6zWA858oo1drBzVS4r7zulBAblaoz2jcBkIDr1t4U5d465K/CMBPuoQBHhMiCD0ySu7qC39gMwp9sCI5DJGWqOvw+SQ6f4iYn9k7CosiNtZ0+HldXhRJ0mdSlgoqZTnn1ZhTiVmvqt7V8NMgDc+aUKhoGugpRDWAa0x6rkAWQw4uHw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 20:00:13.5041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c17cbe0e-5ec7-4cf9-243d-08deedac00c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8417
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX/pg6Adsaadd9
 QyMoI7VC5FqbHZZlypW6vRFjxUwABOGfF8+/MSaSOHhNMt0pbqknnychkGlDclINO37aeFAxy2x
 LCEUvi8/piwIKUby8EEZAac3LxDarPkjOlSF5FsUlz6w1XYTBo9349wANmi0lfBGq2YxTduR0MS
 wUmyjggJDnEDCAYJ6Jglz90slyBSxNYgLppfBtiB1Bqdh904R4BKks8iILoywWH6ryihvXST+f5
 11WYUTrA75DsJBl6dBPK17jR9jkfRmeioAUcbwCU0oP1uVfBr9mux508bLFbGMSvJMuY7r6VbMf
 ZfxdI/y5goOf885LzPqcylX8dU2UELD9JxlP1gWtFGmxNBODUoKswL0NbPNkYbjkOi7TQ/fhlWc
 nMaOcOZCgCqF3odUv8snKNGzyrmADjATV30GcHABnITwpy7ApZhZfJDP1U6yPyyXiEOsz25Fl59
 HX/z45ScVVFYzWVHBgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX7031EL+sPRvT
 y7BjX2WFyrgAB7bAMEKEDzcF+3GsEms9cVJVRsyZ3W5v7t5SrNdhCeNjzToB3NGg1ezbmaWHZO7
 4fdLO3Zgr5pNDTlpDqiFSWMhzlXGy1Y=
X-Proofpoint-ORIG-GUID: jaDY_KC0B-UNGBoLqT6taQTiPibiQEzF
X-Proofpoint-GUID: jaDY_KC0B-UNGBoLqT6taQTiPibiQEzF
X-Authority-Analysis: v=2.4 cv=ef0NubEH c=1 sm=1 tr=0 ts=6a6a5bd1 cx=c_pps
 a=hWS9KTtKglmM4LJ/Q12dcg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=y5e1Cd9fArhe7WHNoJ8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1011 phishscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_130020_398534_9191E935 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

This series fixes MMC pin input/output and pullup/pulldown settings
across AM62x, AM62AX, AM62LX and AM64x boards.

All patches have been tested except patch 5/8, so tested-bys
are apreciated.

Judith Mendez (8):
  arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
  arm64: dts: ti: k3-am62a: Set MMC clock pins as OUTPUT
  arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT
  arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups for
    MMC0
  arm64: dts: ti: k3-am64: Enable IO expander interrupt
  arm64: dts: ti: k3-am64: Let MMC1 clock loopback use hardware default
  arm64: dts: ti: k3-am64-sk: Disable MMC1 internal pulls
  arm64: dts: ti: k3-am642-evm: Remove unnecessary internal pullups for
    MMC1

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts      |  2 +-
 .../boot/dts/ti/k3-am62-pocketbeagle2.dts     |  2 +-
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |  6 ++--
 .../arm64/boot/dts/ti/k3-am625-sk-common.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       |  5 ++--
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts      |  4 +--
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts       | 19 +++++++++---
 arch/arm64/boot/dts/ti/k3-am642-sk.dts        | 29 +++++++++++++------
 9 files changed, 46 insertions(+), 25 deletions(-)

-- 
2.54.0


