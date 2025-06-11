Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F0FC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6ev1tZ3qCFeKU4gZHDz2j3yhSEU8lrdKhpJBwOtqTU=; b=b+2S92Eb1YOViR/5K/ltDcfi90
	slbc5+WDM2eBTbW6NaU4pdewmctIs4ZY/35vxQgKQ1dZqobb6MM4vHSp5I75IrjZdaPW/rECSjDtK
	isCfsNMx71uzuQvYTBC+fynXqdjnQ0NJXN+rUHgH1Od/IYzD4cd2/FzvA6gr6tH+h/N7+XKfpMAWA
	njEH9jJwwXfQBjZpgYPEP/lZknCQWxr4yGp24bVAXTHqcIDJuY7TjftXt84X1A4+Z9uZyIdXnbcL5
	MS86NO/E8J+COtpzBmIgMpQd9QSkkUYuIeXQAalphxsEo3FlZDSyqnQjcBKt+bgkEAtmak3AW78eE
	CEamvaJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQ4-00000009Bf2-2S76;
	Wed, 11 Jun 2025 08:02:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFzo-000000097YG-0kkl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u6ev1tZ3qCFeKU4gZHDz2j3yhSEU8lrdKhpJBwOtqTU=; b=k6N+hpWl65HCu9Yj1HYjAKJvEr
	M2BdB2GBemJgLWieqQDhV1RejmsjyL+eXZKASFxML0J1WQoDj0+iItKqYkPOdupi0cjo74kvSDbaP
	7wOpw26BYa2k1kZDhJeiaGGUkUVARLvYBk3qm5TH+Ni+Bxf7A5Dqkw96qojfyN+Aq3ANAAgbiDEQF
	hXCZrf+cTeItHc0WkeJobBX4Cb5LUBLNwebnT+JuuFYoiftJgTvaFHQgE0y9sizNVvSmwC1Zl7ZlM
	eoXTMvemY9MuGtO0H4oYTPwNnpGZFSRXiI+aXQORGRjHCVdh8VXgzk4u+qKLCI/Q8j4fpYeBEifpY
	e72gYDcA==;
Received: from mail-mw2nam10on2061f.outbound.protection.outlook.com ([2a01:111:f403:2412::61f] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFzm-00000002A29-1DYe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 07:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NC8WtAxUAZK9AgPWwhdmfX83iLCLJygLhOTpm+999zFLDFNdsGhZd3dQ7SW5eXChnKspkHVi/qUbJT7/JuqFtlBvsqOVpY9FkLJsc17BTB/4fgDL3PE2owB8GlGZ4yM7a9YU+D0MdJ+P7bdN8cn9CNEq9l9vQ6y1j/w19cEpBCYFmUec9UTYDj85G9G1evIiJqSN/j1fzzKNTOvj/PI64UVCEYBvjGWvBBHvT8lSia4f6iSaBF480QpKS1cB2bMTukDa8Z3npHAEb/okTTj4VFJFI1TAs3yD1r08Ywv51A70EDKVGX2iPJhanBdedxH5FEh/h3gK/kdYF3TI7FgitQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6ev1tZ3qCFeKU4gZHDz2j3yhSEU8lrdKhpJBwOtqTU=;
 b=kHErtk4TPw+aUy5FKwl0ebeLTpUBQeMNjVdik1xD38n/U6qNqapbLd5DrvsyUzbAF+dZGbSDbIZI1oXRZTQNYClvukJISmh3NQwmtkcynLib40Ik8TDBZkiQ8i1KDyA6jPfciju5qzj2t87eL7c3UqYhhGH1JqsLzhEsRT68dCotjEs0+w8lnMireBXWWsL3LBeTqW4R2IFftrMdSW7ya0F0JwnCQkctgd+ZEX3jxUKW4mDXSm71/MFi7kc9Wq9MqiTYbMo0fqBs347NnRd8L50WP6j9NXDBphphUyqScc58hrtBpojQirDEnXlnQOr3fuvkNK8bKnBy48aBL9qDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6ev1tZ3qCFeKU4gZHDz2j3yhSEU8lrdKhpJBwOtqTU=;
 b=ga9IUjMEmtnVmbaiXI9zYMMo8BsF00O0yfWs7X14+QHqTgVuTiIReqeMOFS9GcQ/ZoABkYKIxKPu14Cw2VQ1lUqpaChI6wCUVzUf1A+MQDn9lzpiDXPk+RBELRIuU1J84rdHJujKm3d6o1LD/l0v9A165WK19WIjmYC/KgmvrgXssf9H2yLqPcoA6dI3ITPZ1fPh/W5TjUGc6aiWwDoS5lL4Oi/DN83LdjqHlrI2iHpX944OU1qAOUhsReOqc6HgkJD5jxFgE4YyMK0BBP1xUH1HxITWNUfQ5XzWPVGYzjOiVprXB/kY8qaD7cPPtrIlvrwBvb83HTEf6qhmN97G6Q==
Received: from BN6PR17CA0040.namprd17.prod.outlook.com (2603:10b6:405:75::29)
 by DS0PR12MB8562.namprd12.prod.outlook.com (2603:10b6:8:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 07:35:29 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:405:75:cafe::88) by BN6PR17CA0040.outlook.office365.com
 (2603:10b6:405:75::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 07:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 07:35:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 11 Jun
 2025 00:35:09 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 11 Jun
 2025 00:35:08 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 11 Jun 2025 00:35:08 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, <--to=jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v3 6/6] MAINTAINERS: Add NVIDIA VRS PSEQ driver entry
Date: Wed, 11 Jun 2025 07:34:54 +0000
Message-ID: <20250611073454.978859-7-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611073454.978859-1-shgarg@nvidia.com>
References: <20250611073454.978859-1-shgarg@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DS0PR12MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: fa83a62f-6ebc-47f2-f931-08dda8ba8a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uP18kg70jzQ+uzcnvyBQ3i1QTYP22ISeuDMlGRiq+TckJyvh4+LnK2/Ap2nZ?=
 =?us-ascii?Q?c1VQMaZauRcNrHaMqw9v8qrNrKaMdQTkSNuz3j3nlhKlEBJn7wOblYLzizEv?=
 =?us-ascii?Q?4yRdP8mWO0yPFyB33qQXVv3fVJy/AgQrHUF1hyIEY4f2kCADou4KgQMvq0ja?=
 =?us-ascii?Q?JPsqDKXOqwG0LJi5gf0uic1lpR7v5eN6VyCCVbIqI1ysi6lqrNGxciSbiaSF?=
 =?us-ascii?Q?RyMXO74rBIFniJ4FcJgQ+1LCvgEgeJbOijsd0mHrgWyI1XRvoH7IaIk5wHfR?=
 =?us-ascii?Q?91iUfI2KHWmBVPrkfxBxjpklxPW5/L4ICC2lnpVSE0C2q86u9VeFWyA3MaCq?=
 =?us-ascii?Q?CcjBZOiej0s+38Lz5YUdOY/g9Pv4rIPJt1DfpoIY6Xl0fVO+EVmiDFbJxxT0?=
 =?us-ascii?Q?Xx+flIY6ZG289uePl5lUYDsN0r+U607fCPds+AgDInZ5ETAoXfSCbS1lrZuu?=
 =?us-ascii?Q?iHty5GU3K/Udw9EqGxN0S6dqJuW3OtQX+ri9d2BRoQbo2KFM/olZlfTNmHwg?=
 =?us-ascii?Q?BwTCQ/l72TW9W5XfUBz70ks1lMvOk2Lc+RwR8Qi/8w4D+pd8QqeUIESlCgT3?=
 =?us-ascii?Q?x+KAYMYf8NKMKaWqtAaBaWCfZBJ/uNUrPLXK97yX0PziF8KXJj6BqnKNXMDv?=
 =?us-ascii?Q?0v/m9RKoeb7eCb2vBm1wXx1a1SFTzM2sNrlCfFM7OOhaNh0fzhkPV1B0JRf6?=
 =?us-ascii?Q?ugjs+nFkdiPCz3drCPA88+DzzIruPCKmG9yCxCxwtTbDumUMwH1PE1YAr9Zq?=
 =?us-ascii?Q?YkWcZ3C8BSJjLr+XUzWGb7UBEATz6vCCYjL/kl+MGHioq/V09zivyK5JgFFD?=
 =?us-ascii?Q?r+Hc2ODIKr7o4292cK2ZMZIPIEQcKRb8EpNlcpmZdc0a/NNYHj2Qum6cU4NW?=
 =?us-ascii?Q?93xFN/2TN/xX4QRWNtLE9n1tik2gN1SHGuN5yQ2pY5EtgydleQ1/tx0K6AOF?=
 =?us-ascii?Q?LTKMpex+x78Lr+qiYyPvKM7NDcW7OXjPI/QT8i47f+OO1/9JA7X+CmimD3yr?=
 =?us-ascii?Q?EepTuu7IwJvKacehA9Q3oYKrA/ai5itS3N5/70g4iKoiRLI1BwNdOgWoBzoJ?=
 =?us-ascii?Q?2rtXnu5Ie9uCRgsGZRt+pMgUxYQCh6QOFjchEBADwYh5EnsH8d3b8fgM0lGz?=
 =?us-ascii?Q?PAdwgQ/NOpVleIVWrwsscFSw1/MbELMo1h6+mKS4OvQzXySb5KQMLUKBitvE?=
 =?us-ascii?Q?u2XBPx7VWdpSr/aGXm1RZfSaMvN8RNOlkDI29sRGty0LmeJerINibkX/U0NG?=
 =?us-ascii?Q?Coc218iVzy5n2BdkbWTjzfq48RayfOHKMEVrnQshJxPOyJlHB5/21Uc9jv35?=
 =?us-ascii?Q?nHoH7W0Y4y0/LTKuMtgyMSpwwoySLt8VWxMxt5CMFrKeOvQ81kLmRWn4oAZi?=
 =?us-ascii?Q?+i7UYXtyECY7u4fhNd6H6OZquH1uMpcL1F5NDBr4aejDjr/65yXcX4glAdGz?=
 =?us-ascii?Q?7ECkRuUSdZE5ti9Bjwj39gx8KgM2LcicDh5Fe4oRLd5P0Kx+eZCE/RzTOssP?=
 =?us-ascii?Q?Bex3CIoEVDoPNQfMxoZTba/Wz194Wm/zVDTW?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:35:29.2491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa83a62f-6ebc-47f2-f931-08dda8ba8a51
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8562
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083538_414221_0345E059 
X-CRM114-Status: UNSURE (   9.52  )
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

Add NVIDIA VRS (Voltage Regulator Specification) power sequencer driver
entry in MAINTAINERS.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v3:
- fixed indentation

v2:
- this is a new patch in V2

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7a147f31468..7a4f2e4f702b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17789,6 +17789,15 @@ S:	Maintained
 F:	drivers/video/fbdev/nvidia/
 F:	drivers/video/fbdev/riva/
 
+NVIDIA VRS POWER SEQUENCER
+M:	Shubhi Garg <shgarg@nvidia.com>
+L:	linux-tegra@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
+F:	drivers/mfd/nvidia-vrs-pseq.c
+F:	drivers/rtc/rtc-nvidia-vrs-pseq.c
+F:	include/linux/mfd/nvidia-vrs-pseq.h
+
 NVIDIA WMI EC BACKLIGHT DRIVER
 M:	Daniel Dadap <ddadap@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0


