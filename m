Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A59C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E/akTU0u9I0bjgBlaCWnT8iQ9Uqr2fyYmwqc7EVjddk=; b=0yYh7zWnW447alq+RNjE8tOKos
	ccIBiKUXQA2iZ6eKrD5uvUoxHMsuDIwf/qejK1dWMkl31qdOSBp+O7abvQwOHJ7wORftnqkVlwRWT
	HrHCS+BLvTkVHMa0GGmdcWw80PAORX76m9qP2RZoWOO+jSsu2awj0/pN3iUWjO5m8vV00YAllW+/w
	Dn4JJ8gzHb//xbj8yAzXWHxng570iSlF2PwNzfCv4s0zi0ru0dwScgjnHSDGYEKlUUeZbsqWonBXg
	0pQ8WChCDQB6A9p14T3hlRNrKAiZGD3SIixFoZ9Eux6SUxWHbX0L50T6GA7oBXbOksszOQQ7fe2Nt
	5niwyY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGDH-000000099rt-0cNO;
	Wed, 11 Jun 2025 07:49:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFzb-000000097WS-2nSM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:35:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=E/akTU0u9I0bjgBlaCWnT8iQ9Uqr2fyYmwqc7EVjddk=; b=Ru9LAr+a5ZjV1LvVGi/uYP46CP
	YLivQnzqY74OS5oaqiIwRDVSBMK1bPZhIHXH6N8y5UMNwNyTgUCRGboNe/hBDLQgGvv5JZ/y2qPde
	RxrJgJoPOt6Yxkn2C/oq4tCFjdTK0fRYfap4vcvl8hqVy+Em4BW2XBeaWAd8owUpStBe2W9sfN7+K
	w7mttX9oeVcaK+cDJ5KwStOoASyfhfdIWFpeHjwqh9cVFR9XdtIV/WqFuzkG6Rit9UXX3yXmHPNLP
	lPaYof40wi6wkmNt2IquJDFYD3+xb658gi5ODuzH4pCp4mO1Ud97dzEox8er2y1Oqcm6hQNHuETPd
	IW/AgFYw==;
Received: from mail-bn8nam04on20610.outbound.protection.outlook.com ([2a01:111:f403:2408::610] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFzZ-000000029zQ-08JA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 07:35:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiRNVbSSYfFeYo6pKaP2orgvEpe58mAbeBALNaZZ88WUBs0Gf403uV/cKCuT6m+R8w7HTdxBu29KJl01+o1lyyLGacD2Y/wnh67YSmClFezzBZ8LTBizBDQPkvb7oAKiAq68LedXv0pDaqRR8m/gyEZkFb2C7CbDAROqkqigW9I6L55YibPdyQGeaKObejeZ17L+BnaqiKnSvQoDw5rBV3gX3VulK5IISm8U6NRZ97C74l0kFDDsrEcMvtWoHdBYdtf+Yex3ocCcvjT9e9PUDFseIr3Eq2AXlcew/tAxISObu5+iR+IVZI9r18WupOvCDs4H5yQ+qso0gfOLM+pohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/akTU0u9I0bjgBlaCWnT8iQ9Uqr2fyYmwqc7EVjddk=;
 b=PG1Yl/T5ntyQvswIsWZxOuxEGxmhmvjS50MdUIXcalIxbNtHBtxdYGSExUyMTf3K7WV+PI6Sxt4ATowmP9ZPszfWPvdRq6jm6iMOXBqOVykhSXh7p+JyAPRFFiBbQka+XT6BLGf2S11MTTYCAxc1IlJlqqj49zlz7hOjDUbtk9M1DK4ixgwMcyjBSpPt/V02Lu/u5gahXYrdvmDmGEl0ll5ZtsNHG+oxw14KsZadFdEziBdxQ6FZqPZdCdprk2nT4L87wILeZhCeJxUd2tAzCldBEmVWN7LMuYnUzeuAiM4paz6M5rNQeRgWXf2M4eigcoQIw3ivQuKBTEHad+wi8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/akTU0u9I0bjgBlaCWnT8iQ9Uqr2fyYmwqc7EVjddk=;
 b=sfdj3dKrdAJF0bu/GI/OpoHqf43wzFUdpSOXK1aeLEy4pJKqsfNFsycu+ygD5l+G0nR0G4mxJWftQJqYDN7fe3wtPw7R50igIWQ2eErXFGBYO/ddhmNGWjjkt0tPmhuD1DBwQ39S1vAW6xktpTocl9ZhVaZlBrx2gStVxvNivbLaq5outc4ek1WQTFt3pCDB7UrSZg+g6D5baVmC2/F1WnfxENSgBbehjYQmkh1u3oTE+dU5DMlj+PTKHs5utzIIQWiwu3UyurTAeR5evtYpqsZZGXO2aKF616FVuFz/Y+EDMUi+/HaoIkkpMGGBFQOPsvgz8tFft0Ez0dn8ZSDiOg==
Received: from BL0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:207:3c::26)
 by IA4PR12MB9786.namprd12.prod.outlook.com (2603:10b6:208:5d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 07:35:13 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::8b) by BL0PR02CA0013.outlook.office365.com
 (2603:10b6:207:3c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 07:35:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 07:35:13 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 11 Jun
 2025 00:34:56 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 11 Jun
 2025 00:34:56 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 11 Jun 2025 00:34:56 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, <--to=jonathanh@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Shubhi Garg
	<shgarg@nvidia.com>
Subject: [PATCH v3 0/6] Add NVIDIA VRS PSEQ support
Date: Wed, 11 Jun 2025 07:34:48 +0000
Message-ID: <20250611073454.978859-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|IA4PR12MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 42567657-2bbb-4641-8e31-08dda8ba80ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5UM6TcTUka2+X/dTFFhz12YfJDqOVJzqtgfQaKJrbUM2EySkX9zJtvP+9xXS?=
 =?us-ascii?Q?duv8GR6Rm8VN288WPSkrXJsLPAq57CAzPUVyhfNqLXxoXGhrd5CDgtAIHWOv?=
 =?us-ascii?Q?+7lPRr8V9nw0CfQekU1zM6UhpI41WRC86FXRLJtKIRkSqHKF6Au9+KwQGg2L?=
 =?us-ascii?Q?0fEvWgPLR1dvafcshkEZTUT2ek9j1G1+f7xIre6S6ZbCEa/IYkBbXpRHjtIe?=
 =?us-ascii?Q?JNDaeffPWCySDSZUejYVKPfaRr35SvlpDHbUph7/MU7qbdDPKz98q3IO+Vak?=
 =?us-ascii?Q?DNEKxf07bPghzNQI0VU8jTDQOgdwjXA6xP4/bFzmSw9o33Wbk2pjwHULapQr?=
 =?us-ascii?Q?2hH5zx3W63qHfof2goNwVh0sIk6Pr/0H9X8yLGpy425vMyx6SUPZS/VviazG?=
 =?us-ascii?Q?KZfVRYBnFqw6ikvk23fYR+2U6vHxTyMBl0drFReQm5le3I6sJ7GR+tmQyhbX?=
 =?us-ascii?Q?27DbD/u9Z94nwTsrdXeBQ+ftVYvTDb4TU573yDLADdFWlmEHG+AqH4gJy9zg?=
 =?us-ascii?Q?ODgLtTiuWGrpUIWJCvm6iPzApevEYSSnrAIILfSkwXqpVRr6EJ4hdOvHo8Ty?=
 =?us-ascii?Q?tDKVxjrMd5CEpEBA/GSe6eFU1/UJLujzqlYA4p80ll8H6n0A/ZAN8OznhLY4?=
 =?us-ascii?Q?/NhYIRatrk7qx+BMdhva08T/vzFZrnsa8jXt6Vbb5oi+674hcLsTxBXj6jgq?=
 =?us-ascii?Q?7EPdZjQGIrFwEuGkyYnIB3Rz5050vtBbPT/us4qzL8G7FIPuWSfj6t3vKZQg?=
 =?us-ascii?Q?1bzsCQd7+pi6HxbCW2hk29gIGDWotkiLpjVGdpFhN0I+Q5XY174R18QD8l4D?=
 =?us-ascii?Q?tgL2h5B67fnzbV9M8jiSR7prbJnDxhBMklCv4EeyyVnDwk8U38VfThNhPULQ?=
 =?us-ascii?Q?R5EEp+c7Py1QDbE/mJQuROWTUK9rvUJoAs6MfmjX8Nfrcsn9IEx3KwEr3ePg?=
 =?us-ascii?Q?MYIiB8E1+adDAUvI+lAxM4ZOTNTWf+pD/B/ICrcH3eZUmDqI9mXbMDwSV1Rt?=
 =?us-ascii?Q?8AUHMI5dpuhF7AVjVoRz0dqPxEvqO0nX+BDB3wJ+Fj/xFVKjmRdd0t8eQCWP?=
 =?us-ascii?Q?doOmKVt2LCJP8wDwEPoQTVxXFS3GA4C9nd6Md0t7b4EuIvezS+FgYZNh2bGl?=
 =?us-ascii?Q?oQ2hs7MXoic2CsA9mpP9nudGnaIxP51OUV6EQewDFtbv8elh88q2VSU0Q15/?=
 =?us-ascii?Q?z9R1GlQZxXNn8gJ7RWpbCGSWnKfW5zpDy9+65AVpjQN7UyyFd2BtFGO9ejvq?=
 =?us-ascii?Q?WeqIU6/YVZx2nOSJEvnzgkQ2WzwaCI0u0pDDjJuYa0kCvK2m/9raNZBsNWKY?=
 =?us-ascii?Q?nSqOmnXNTUv7vfOfYxPx5os1+DVe8mr0RiyBjlu3vG/qcy6Lnen9aSzE4f29?=
 =?us-ascii?Q?vob17l8E6HAln/KuSEjgwDv4LlXPpgy0jKm9vwNhbGUqxzEEXEfBTlS1TPmF?=
 =?us-ascii?Q?YWxG6kzW1LUiF0yjtgLeFQp18iGhtNzTVGS/n42fC+AgSR3Pczv5EmLzjQGw?=
 =?us-ascii?Q?eSd3FGXK+yV3ziZ0eWbogRu1o7uGp1k1yjTq?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:35:13.1535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42567657-2bbb-4641-8e31-08dda8ba80ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9786
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083525_191969_6D1BE25D 
X-CRM114-Status: GOOD (  16.18  )
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

This patch series adds support for NVIDIA's Voltage Regulator Specification
(VRS) Power Sequencer (PSEQ) controller. This controller includes a PSEQ
hardware block, that manages power sequencing and voltage regulation for
various components in the system. This controller also provides 32kHz RTC
support with backup battery for system timing.

The series includes:
- Device tree bindings for the VRS PSEQ controller
- MFD driver to handle the core functionality
- RTC driver for the PSEQ's real-time clock functionality
- Device tree nodes for Tegra234 platforms
- Configuration updates to enable the driver
- driver entry in MAINTAINERS

Changes in v3:
- fixed device tree node name to generic "pmic@3c"
- fixed indentation in dt-bindings
- added rate limiting to interrupt clearing debug logs
- removed unnecessary braces in if blocks
- changed dependency from I2C=y to I2C in mfd Kconfig
- fixed return value in RTC driver function calls
- fixed sizeof(*variable) inside rtc driver devm_kzalloc
- switch to devm_device_init_wakeup() for automatic cleanup

Changes in v2:
- fixed, copyrights, definitions and dtb node in dt-bindings
- removed unnecessary logs from MFD and RTC driver
- fixed RTC allocation and registration APIs
- removed unnecessary functions in RTC driver
- used rtc_lock/unlock in RTC irq handler
- added alias to assign VRS RTC as RTC0
- added driver entry in MAINTAINERS
- few other miinor changes done in driver

Shubhi Garg (6):
  dt-bindings: mfd: add NVIDIA VRS PSEQ
  arm64: tegra: Add device-tree node for NVVRS PSEQ
  mfd: nvvrs: add NVVRS PSEQ MFD driver
  rtc: nvvrs: add NVIDIA VRS PSEQ RTC device driver
  arm64: defconfig: enable NVIDIA VRS PSEQ
  MAINTAINERS: Add NVIDIA VRS PSEQ driver entry

 .../bindings/mfd/nvidia,vrs-pseq.yaml         |  60 +++
 MAINTAINERS                                   |   9 +
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  11 +
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  15 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/nvidia-vrs-pseq.c                 | 267 ++++++++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nvidia-vrs-pseq.c             | 457 ++++++++++++++++++
 include/linux/mfd/nvidia-vrs-pseq.h           | 127 +++++
 12 files changed, 972 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
 create mode 100644 drivers/mfd/nvidia-vrs-pseq.c
 create mode 100644 drivers/rtc/rtc-nvidia-vrs-pseq.c
 create mode 100644 include/linux/mfd/nvidia-vrs-pseq.h

-- 
2.43.0


