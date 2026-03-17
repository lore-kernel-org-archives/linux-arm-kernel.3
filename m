Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A847F3381F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtDRvroIGM5tXJpwLBGAUUa+V3qm0j4XhEGsyCPQJQg=; b=lJvhxEbk1LqaacoMpEJ19QyNU7
	ycax4REY4LuwP40YY/VTJwzm68guNjM+txx9sptp0xgCjZSwBUG83/miqUZTDlN9KlUDtdLxGnPfF
	P+HmYiwmzQa3Q4742O3+Bu+0cBMkeeAsln5Fnum12z77mRJj6CFzrRYKKWxZnHCER8Lyd1JvOIbcS
	4S4QVWBlOfAnKXeFFmMqS/pJbb44BjetpXsMDAnDdUr9KNQbk0a2shV4BBqS5hfeUe+4s8xU+gd4Q
	K8v093kSGc7gOCBXxo4uJyMCFXZlllJupz157VezLxO6+k6G8opcPB52UJS6J/prsBj4AtQ1FBmZT
	VEsixnWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QPf-00000005nvl-0Cdt;
	Tue, 17 Mar 2026 09:08:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QPT-00000005npD-1wwJ;
	Tue, 17 Mar 2026 09:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XtDRvroIGM5tXJpwLBGAUUa+V3qm0j4XhEGsyCPQJQg=; b=nz1QxYeC2xqzn8R9bAaAbs9cMa
	BxPJbvWDQnQw1QEra+lyghpzh/pgw3LWBuzCC4Wzyd5/g5eyymyRnWTsMK/L7DwoxYC7Qd0wXNWio
	/lO/rymrTnCMvIHKihPa3D/MVuxZEnkjh0o/y/JPNfFsjkwWUqaEx93+X8JZgiYNR983cgc75sY6C
	i0WzCW9rGD0CPOK34duEKqaaK2dusvcBHLhIebcOJIFp79XzLE9SgP95IFwXUL0ahje9s5a1qt8RY
	sNSZcgoxUPbSoJLDFg78pnySPUZT0+i9IsPjyvdRu2dDYE2pdh9JHEc7FIy4dBfJ8eIRRc3/gJpZJ
	bIvbidgA==;
Received: from mail-japanwestazon11022094.outbound.protection.outlook.com ([40.107.75.94] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QPQ-00000008UXh-0L4E;
	Tue, 17 Mar 2026 09:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vyf78FqbHmajU8Wat4XOPH8GbNI9s+TOgWZE1wTiQ8UpgVu5cGKfZvi6v9GsETfSNvLPVMAIYKq0OO8KA01WeNaZx8U+ZCmt1CT9zrDT1CVeIcDl6fsmN2wQIAIGW7Kujb9suL2BRKCffx+0GgBZiTT1unvPx4I3gvDJU0xpgB1ynjJsMdUuWuWrVarCL1vGqPHrs3kGu6iwCTGeUmO9yPkjVOmA/ezjnpu84mDOSIUfLGRUJaxSPpMfkys4yExnUi2oycVDqfBbCl62CTViiYE0J16nS8h5jqwTk6/UezMjdvTGP5265FgzocfPfVzfKuy+5FLam7sdPbduINLEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtDRvroIGM5tXJpwLBGAUUa+V3qm0j4XhEGsyCPQJQg=;
 b=lXLqCh3IoKzdskzLFFzYHwH+iHiw4DvrU9QFHrwygEypYM2jYZh/kLIudVD1D43H1AH17EfCwtUXCUj8uW8Wajxi2QabZd7Z7EobkPXytEbXvWE7aI6FgQAPIBtYf2OcnKjVvbU7MtUIqS72CD0OPljB1B00kAIV9S5/BQOeEHadTHdlFC3uV/4reer5DROylIAFMNNI4WePgZbxobUXABnQiq3EEJ1GuhdxjG1W1+a3ArRAciZh1pdKLHjpykJVxAY7Lem1p/185XFRc7+20XngFnXX7Prbe4JnB/IB3FoYy2H/DOjRmEOsDdx6agAdpsiaNjEidXXubKLJgWjFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SEZPR03MB8663.apcprd03.prod.outlook.com (2603:1096:101:22a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 09:08:03 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 09:08:03 +0000
From: Gray Huang <gray.huang@wesion.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	naoki@radxa.com,
	jonas@kwiboo.se,
	chaoyi.chen@rock-chips.com,
	i@chainsx.cn,
	michael.opdenacker@rootcommit.com,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	andrew@lunn.ch,
	alchark@gmail.com,
	pbrobinson@gmail.com,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add Khadas Edge 2L board
Date: Tue, 17 Mar 2026 17:07:31 +0800
Message-Id: <20260317090731.600787-3-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317090731.600787-1-gray.huang@wesion.com>
References: <20260317090731.600787-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0222.apcprd06.prod.outlook.com
 (2603:1096:4:68::30) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SEZPR03MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc312fc-2197-46a6-e5bc-08de8404b1fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JZeVLMUwJMgdYnCpeDLXWdVKVesxQphlGVlC0+/OlhOeTlrh31qGkchoZ2qgebjn/7qQvNAIwtQTFvPPMxNtJNOHMTAO6rofBlra3gLRZTvcW9wtcqFPFpW1fUS8Su+Y+HMQrmEq+JAGAAlT5mIijc5W5nEy5OGsAt0qXTzb6+DJo/jaAoDsw/F6FWoQ3FM6zdt8zRR5P6tOr9/fbkm+cnWZfXqv2UB+rxZRAJAzZEDJgKz3UxGzBj4iyku+3WOBbFLntiIz5j4T3ilvOLBrXKUVCWBVBZSOavwapv/8mZU7xrdr/1kkDwB4n8XFGhgnEMlWh7srb7Kdswn30uGBWDfAYLxdMHMi+uDKNGSbzfkX4aCr9eRdLpTsx0at2VmmREvkGfmwNpS55/qdsU/VN1QL8UvA/6vzeJAAX2cDDBi402XA78gcYFzQ60+VcrvVeCZelB3pfik6a5TuqlNBYrelTS6y4t9QKHLvKEcr7PiF1tavgUYOxPMlwYp5NniFWym1c+f9Vl0gXgxlWuirZPgLSUro0SLa5jKDc0vW29oI7hVVwr16hgW2mDKGy1Kv14c971ZFqnHtKeSzqt7oUvwd/ElHWTz7SL7UzT5x9m7V82xHeXAIBoigkGEr8+QPwv4mDwFCw+sZ0nXHjQJz2UWMBhC1DtS66SaBNpMN7hnto7oQQXpnFEcH4IZcC6YVJyZ0uKYk1EERBYT0TokL0oPv0OLwFi9mOAnf+LLcw0UchJ+HtNkdXm5SblVjrXs2x7FMFRRsYPTwGXr3q8A7MAzTl438ilFeJiTg7+/hJaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EkXJzQk6qTZiV0b+af70qf1yVIedhw+Ut6fj8kkwWzL45/77Z+U/ycsu1mMb?=
 =?us-ascii?Q?FQnnsvU3TSX8biVV4Qinr0brMwOHLVxvy78GqRObs66So8v0LBZuwsByM1VH?=
 =?us-ascii?Q?KIA7i4ecMwYgboSwKHl/aft84lxa6wKMlm+fq3DvpW4NyGLBZuauDX5c6GUK?=
 =?us-ascii?Q?H8iQ1Tf4X1W7mNHa6zEnxnLl8eJHNGBdh4vAfqAlP4r9fFoHwU+yS/dlJbH9?=
 =?us-ascii?Q?8KqSw22YrXlClwFjSq1YHaykivShvln7f78y6Oqw+CzswcOYL8s8sitbC9dn?=
 =?us-ascii?Q?FDosJvadz6I9fEEz1KJe9rzJEugwxURvoBIxBh7VYxDR3XuMd64LLdlRrLgK?=
 =?us-ascii?Q?UeeqqRsmOdb7EzLfFkZqYkGaggp+QNzb0ST5pdBElvWPtsyB+HRKUjDseGIX?=
 =?us-ascii?Q?Ze6PcwLhVwji72cJLtlc3Q00jYVu66Zm3YfKgd/3uTIQgL358wfgiv2fowsV?=
 =?us-ascii?Q?XA8iBVlrZf9SB+9SfOKpknw9WHNlDrHwuUTVKgf6b40nHHIasAGrsYqh32lC?=
 =?us-ascii?Q?/xKVxn6GxIRJ7tAlbqxVUEl8tfLEk8mGpkFTOYjjvd7MD9W3KwhaCpoExudU?=
 =?us-ascii?Q?7W2GY6OgOfA5peJ7inTgUr06is/Jkyis704vHCl46ukPFo3tymAuLX+cFmOB?=
 =?us-ascii?Q?9Nvhxglua/+46JqP4vF86POSLeDtjgOnPUn/f2WoWYgBGElefEtq1Xh7dqhs?=
 =?us-ascii?Q?EsIr/UjHXyx1Pv5W9Q7FdlbBfBiKvIRFJWKB/5eGY+kJh53r39cyUx9LNzbr?=
 =?us-ascii?Q?RqzkW9L1CSjCZ7ZfzyJfPHAY/JQUSAFrbO7D0VR90+aoVhdhmjHvBvIhP/gK?=
 =?us-ascii?Q?A9JYV/Bo1gjyvGPEwHNBPtRw93I2+rQ8yX5HkHW73wRl8HQbmWlWJXJvmYN5?=
 =?us-ascii?Q?edyhbMaiZ7RqYfdBzu0W9lLJGNf/hMIUdt7jmkNclL/ogqeU809NaXPL8RmZ?=
 =?us-ascii?Q?LtiEyVVOMHhw0ngL1EjyjHwUJNSmkGzNK9DoXqRs0/M/ZdrkdJJb8dPkImfb?=
 =?us-ascii?Q?ylby5DiPVVCLmQASXGI3OGF6LW5pRp4i5ZQzn5yoomHcS0F4yr0zuCYhodLd?=
 =?us-ascii?Q?J0c+3bVjdqOIDnu59vFYA53+SCRq/LNEAzZpn079bgijlZIK3iboC5IqpU+w?=
 =?us-ascii?Q?4qLQgohIEaBim3g6uZEx7R+VFWRdsUvFlpz5rbiV7OzSNzP0cNcm2VeSCLT7?=
 =?us-ascii?Q?MeniN1pVQnMAIu3vMwVnPB/1z+lDj6Bi082NeB7Ps75tPrw4lhf7C6Bp9wZK?=
 =?us-ascii?Q?XQ40vE3Iv3s8vDtJnMd22rSp4EwnpiYb+joxOJv6XqiDz2HJyG8gZbUa+QqC?=
 =?us-ascii?Q?52DFLfLc+3aONJR1zJfq7SHFGWTRSmBOtnvrvJclUPCxRyicvOJ4F6qrlmcv?=
 =?us-ascii?Q?TYn8BHh2IhncT2YbjG2JRCwuujzSr9WBTTVmJWQxtNgfcsxpPzItK1smh+Kk?=
 =?us-ascii?Q?Ua8GMAWptRHP2TKR1+Hzseb2iE+eFznx2skHuPvE7o/4SH9s/TyKPvFlyRQv?=
 =?us-ascii?Q?kDp4feaJOMQIGjYN8W6/HojacwtriQ2tQ06O4mlaO/swi9jCH85My295zwoV?=
 =?us-ascii?Q?BzhqQ5XKqNkdlSAZ+gPWdaeA7VBipVKMWkVS6+AOs/QJ3YM8e5JEEbG3xiqZ?=
 =?us-ascii?Q?FgWo+YUiU2FxeCirp7wESE3ktkZaHwGz1Xo4GM49wsiQ98rGRauYlCk75qQt?=
 =?us-ascii?Q?Gf+xqVWkDezBReskHKUsJEOtLfKb3LAwyVRC6Tt1XKPe+ABiVNMpjpa8MGgC?=
 =?us-ascii?Q?snQX4rXgkQ=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc312fc-2197-46a6-e5bc-08de8404b1fa
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 09:08:03.5867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeLaQ1DdHYgYX2sRu/FosaqBAi4wgI5xs2VS2OOEz5JKrGbSnBdl1GftT0RtSkURrkeVMPFL5lZWVV/Pc2DlJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_090816_274696_FCC7D054 
X-CRM114-Status: GOOD (  12.88  )
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

The Khadas Edge 2L is a single board computer based on the Rockchip
RK3576 SoC.

Add basic device tree support for this board. Currently, only eMMC
and UART are enabled, allowing the board to boot into a basic Linux
system via the serial console.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4d384f153c13..127403666332 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -164,6 +164,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtbo
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-khadas-edge-2l.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-luckfox-omni3576.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-r76s.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
new file mode 100644
index 000000000000..68630379af63
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3576.dtsi"
+
+/ {
+	model = "Khadas Edge-2L";
+	compatible = "khadas,edge-2l", "rockchip,rk3576";
+
+	aliases {
+		mmc0 = &sdhci;
+	};
+
+	chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+};
+
+&sdhci {
+	bus-width = <8>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.34.1


