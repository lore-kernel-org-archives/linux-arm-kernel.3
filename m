Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188D2EFCE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TufLQkkJicSIiMXLOmdkprNfKKLjXmStM1jfSJ1WAM0=; b=aiBnVaV0LUL3F+Ri+Rnbu8dJ4B
	EWoYlRALZhW7GqqUT1as2zBFsu3/TO++1rd1ndisvIdk9FbwcZl94ZIqzvF9bUVhPz1z5mvMbE9kL
	aUB/9SeRL3TCeX28LQ8nLxTMo3f1G0NbPLtDNO6lafVXmAQcl3Iesf1hHI6Tl5A7iTY6ZYRSmgjRa
	MAXsMQIKdjoyWo5fOGF0heKv4p1kv9LyEf3SLnGgLNsqlxP0AERYz1pbm5WTm+xwzqC9cnHdCLPl6
	9IU57xo9l30OaiDn35ma3i2ISaxqTBZ/tLYr7cKHxtn/j+O7bOWyaDm4LtoZB2oflyy1a8jm0Sn5U
	8iA6pLvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqXr-00000000Gc3-1sR1;
	Wed, 04 Mar 2026 18:02:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWq-00000000F2U-1KMI;
	Wed, 04 Mar 2026 18:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TufLQkkJicSIiMXLOmdkprNfKKLjXmStM1jfSJ1WAM0=; b=Cc9b5WijK3T5r2v6Ct488OQmhs
	1nyZaNPkO1AYmfE6dSKMX2D9a/QqHsZJySxZ9cS/vWS1K8kJuTDD8PVLPrVu4C7QlydZmPlHDuAWU
	lYAYnukIXrySWW3WYm9b9qg3UM8ASutlNx2Hr2nP2Uk3Eh/YaQroVbfw03zkeqwxBAQ7FU11tF7WJ
	fbLoC4RJV3x2T4dVQjg1hpjYhGAQz+2JY0B0B8mpyfAOuXO2MFJG/G7tY+oq6Qu6fyzg9U4quCnyN
	iin5ATsWT9z/TMRSS0IttMNtRUsklojsDpQW7MFdyNwWKIzUakshFxuy89sPZm+ql+Mx5KJeEjZzu
	0TDzZ4Dw==;
Received: from mail-northeuropeazon11011005.outbound.protection.outlook.com ([52.101.65.5] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqWm-00000005H8M-1PFY;
	Wed, 04 Mar 2026 18:00:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5/dhSvknCenkz90bG0cOm+9smJ1VDY2fFWJG7Bn5KVaF7qsBkgU8tI2q1bZVis6YY1CqJqauek8Jxz2O7RuEEo6yBpR4s/ewfqJ4urFsNVyxLWeId/LYNYrQv0TyTwqVbup8qIkG+kJq+HZS2gaUYbvcTDl4BLEUQpaH4VO5FZka+SI+TbmS8KBemwgvbwcXyjFKgx0gRiu1eeBPzbmowU//9KdRXCA/sEslaou2bwaN+UzGujdadOEUbEUexx/gF0gAeVD/OLzJ7R6JU2DPXmPL6rpMQObmm/2kHyxGMbK3l2sX6i9ZMXcUBDQY0PSPJzaELZlKkiIC57FNpoteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TufLQkkJicSIiMXLOmdkprNfKKLjXmStM1jfSJ1WAM0=;
 b=yu6jblo7mFHqkWZxInMxT7+ajMp5zENa3HE/GYTR8q5JH8OWpbyj5bZfybmXOj7w1pirHu1laP0TefCWuFMRxXpo1FACMY06JVLlRYDoVj3FFMhIoCv/Fu8l9lA6COeDW7geXMwAIHx9ybNwjanPKhoJBQjiwHDVKNFnX4VjGGsWtVKCSKsQFE/HB86xmr6ImRmRls4ko1tiecdyH8ZhTmcc6DVytg3TA84U432SSqTjmatYrzU+AfZtSzkA7meYjwPgtXM8B/1j6WBqORAoOrskIkOLQhwRHcpiMeS1EcyuAQp+oLiUC8p+TuvvDbcPkpz077vh/zzYmXdaF0rI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TufLQkkJicSIiMXLOmdkprNfKKLjXmStM1jfSJ1WAM0=;
 b=NdYtsoKFgnqXldFvG5DuuY6rDsC5DgjnJlvokwFUqsHgpbOut+rMhmH18VMo6uII/R5n1p+CztkIKxgZTVJ/xluDw7xcMM7Oh6QbW0uFYUWNLC5nq8O7LgZGLn2cZd9WXPkAk05G5XMt8QjdJ1PKj14EG7bR2QswIHjRaFbVUZJSZ1IRoP2ssw7kyISW9+7BpMMlPuXNVXRhcDXkP7izDGOJfDEDYS2/iMTr+HQZhDWs0VjZZRsZ6TzQalMfdgOP4ecNIk7UgBdHg5H1MIuPTll2sPi+Dnyaoy3tKeKOaQMUt9Aw/eQRsKmOtFs6kY6AjL/6vILuaKBlv3VXIi5dgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 18:00:41 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:00:41 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Date: Wed,  4 Mar 2026 19:57:35 +0200
Message-ID: <20260304175735.2660419-23-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::19) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: ec05bbf8-40d3-489b-029b-08de7a17f30b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|10070799003|19092799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: +SBK3VHa1vZFfOpMFSaJye05PDV6Gz1zMpqvynvth4ses8x/WIzrCmh4zxPy5wxjNoZXoBpyHm2rceZR/q4aI99iJdE/M1dwD2yY3AnPjalydxlT/EuT7JSS/p9NxuwNMxZv9mFi59EuROhJW4dx/LFoZEocxkNLVN2OgfMcHNZ0a9E3cTP/fN9H7vese7UB2Qjb/NSxFXGisNjlzhFpFXd6+mUfXrO7MaI/g/+mhFXbjGv8QKHbIMKN020ho8NlRMMPpoUwC1Pqm9k83FzW4f4BH+h6U4G/oaiVKesY3bWxVO+VGYDzne6vYKl3WSZM7sfFGk/FK587q3o78VOZvOV43pEah5zITbjXXQ7AkUdiya2Pttt53Njhtc6YQvoipSpddUmblmiYlNXSFU4+lizLX06P28StyC2C4wN9t9hoQp4zQE6NxNcDxPbUV4gzbzXRVLyTPMDc3A55pi9/vNdmKBsHBAAtoygwfZrDHzwE+PJ9dyTG44YgsrXkjg7TSdEB8J60hrZ/r5QPFO4c+SvCTK+GHv1A1UbwpIrzYo9THe6t/zAbYx2L2T8H+u1g0AfeZ3Vileez7U1CI72fJyOpslUZpMVXPkSbK2aUsYqOI92YSjGR8G8GFHrWiKP17lbjtVCPnKgAjlgEG+Iwex/U/eluXPNUxdobjgwJ/MpkSBgU3Gib7bfV3HMs6m1k9ILf9GF/BtRiNqnWaMk51J0aJZ+o54/AyvHM4onjsfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(10070799003)(19092799006)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mKopRMUnQUHc8NUFY7AZAI3xNfDDSroafoZQmWRdbb8wYktTtr7hgApmWe22?=
 =?us-ascii?Q?Ad3x27ywMBCkjQartSDWvCtsBQ3VAWJmWR1y+ABAYoZMlF6nvffRhnZl2ZlR?=
 =?us-ascii?Q?Q8Gf80Ok+6geFdl6Dk6yj0KOzefJJ/nqxfVJZIU6QbdS/d7QdysnqNjNhh1Y?=
 =?us-ascii?Q?tFtCzvLcfidLSIUtNqmB0JpPIZCyQtQ2fhBBQt9DRTRa4sOwGx9s47uYC0Cx?=
 =?us-ascii?Q?+8YIupQohvjKyaQTxzEGr7wkM2WJDa1ZzXNxzpgmEbn/ZNYqTfGxzB64+FMV?=
 =?us-ascii?Q?Nk8O4ayLngu+8aDBHbGdvBgbGq7FKRRMwwuxbw/k/4OL9Q0zDovT6YcZhvvX?=
 =?us-ascii?Q?oGMZG+7opNfxETuRKogyZJPy0KNnlykHDK9L1WRzKXGX6hkUG1a2bdoPLyr2?=
 =?us-ascii?Q?p7D6VvCxaVp+yitAa1179m1+j9UYFM7yutkDS219v+mHm98+vu7D21uus9/j?=
 =?us-ascii?Q?pD+RhHdK9EU34SozEV8E4W7xpzaihCDsnWByq1G/CzjCp+VnWfNj55gNFGQw?=
 =?us-ascii?Q?yzOfqsyFPGKJkxxfmJobSLAFQrosDW/q0zSSKAyc94HmXzJh+9RA8KSduwRv?=
 =?us-ascii?Q?QUbUO4PzVLmzxl1TBpCBvOUx2/b73hup5kJTlBq59iVP5JHhIYLL4FKx0jpM?=
 =?us-ascii?Q?ad1tL95Oapy7KdWmJFp9QsBEznLfGBTaKYY+AB0xM4VUNDFrxNA9HjuJJ8za?=
 =?us-ascii?Q?TxxH+tGgwu0BXiPC++o6/ZQuY065pk1wD4BS9XKTRIjb2u5pnuzWKVdCqGBe?=
 =?us-ascii?Q?peHJFxd10yAkGJP/JO9bEi/nOeqlGVt6Ni1cVCc2JXKPxh2kARi5jS2eLrau?=
 =?us-ascii?Q?mznkwKXbUHorUTVT6/iUG2TZAN3dWeW9zjKxqaBJUqNMXXnQJ0Jy42OfmHXz?=
 =?us-ascii?Q?MjdPi/MsRx5RYKWWiJ2f4XgApnLfcBQoHsMsQP9JCbTCNNPS4ATuqKgNnZRy?=
 =?us-ascii?Q?jUfoY6BicjMHo/7NosFdCwybSqeE/efPR7hGool8olNkC3chSYOAqn7q7/L9?=
 =?us-ascii?Q?ntxiYsMtPbwceZ9kDaNFurHvzs7MT8sZyWDmkTLwfb0Ak+51sRnM15UuAEcY?=
 =?us-ascii?Q?mKamWPzvdahQGGnz4itl+NE4ei4Jr9LVwv9iVuMvGyMfGiHG0w4zuQCgaFtc?=
 =?us-ascii?Q?Vb1MTyW9NiTqDmWULK2eXY2zVcnWgzJMMXBXrAwbV8MMj9xri/X/o6JFtjzr?=
 =?us-ascii?Q?sXr2lR3XBPp8nhte0F9w4Q360pCfwpNMrECMesgpQj/AekSTZAXo4JcHQbW5?=
 =?us-ascii?Q?dGrzs/elcGX3lY6yNzQlH79z0Kj37unESNZmU9RUlkOZfhlAY5wwMLnqtUSk?=
 =?us-ascii?Q?9Ammz77cUiJ5PbyIVDApwMwAr0uS0iOGwpC9O4ZYFVjLXSrdybPAuBy8/dYw?=
 =?us-ascii?Q?AcZk24sCznKc9kuHUg4xpg8OdVwhR6fmV+ct4YheQIeIjWxn+kdcnmx8x511?=
 =?us-ascii?Q?+rN1paEGBiKoYDbFbynzyA8TjhkSUpb6szUwZr7yrYmeyLjKla6N/1XzydtW?=
 =?us-ascii?Q?19jH46UblRopzT4VJ7dAg/7N++EfpApIm7OxQrS+2ubI4ll4+Y71lBbCETlM?=
 =?us-ascii?Q?UnMb91oHWoE67W4ihxSitNORSCZHXK4MGfRsE90NgPBT6O+3hcFVnh7reCgi?=
 =?us-ascii?Q?KxQay0bmnoVdA9tzJi/ivmXqrIY6NsR9w8tV3ytE2XEUM1oolrt9lH+a3I4V?=
 =?us-ascii?Q?ElvvFa7SmI1EV3805tvCSwfvy3vB+FcI+Ne7noSPRAVjU2qcKyc9CCur6tI6?=
 =?us-ascii?Q?iudTL11fQyiVwswGQYuN0UI0CGjhLxGYtPrZapwzO6YPnkRUUVGbwesv25Cz?=
X-MS-Exchange-AntiSpam-MessageData-1: a/e0Snxr9Mr7YKO8XJVVsH1AY+hWKDiZvIQ=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec05bbf8-40d3-489b-029b-08de7a17f30b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:00:41.6640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hav+faJSFtcsdnxGhRK0OVzAN+CtIQjA+X/PCA/OoH6DY10G0RTe43uOcrp+Fhq8+OIOU4cF439iPwzJYUWruA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_180056_441444_329B6C43 
X-CRM114-Status: GOOD (  11.41  )
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

Some pragmatic shortcuts are being taken by PHY consumer driver authors,
which put a burden on the framework. A lot of these can be caught during
review.

Make sure the linux-phy list is copied on as many keywords that a regex
can reasonably catch.

For simplicity sake this is not perfect (devm_ and of_ are not valid
prefixes for all function names), but I tried to pay attention on
avoiding false matches on things like:
- drivers/net/vendor/device/phy.h
- include/linux/phy.h - network PHY, not generic PHY

So I used \b to try to match on actual word boundaries and be explicit
about what is matched on.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..bdfa47d9c774 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10713,6 +10713,7 @@ F:	Documentation/devicetree/bindings/phy/
 F:	drivers/phy/
 F:	include/dt-bindings/phy/
 F:	include/linux/phy/
+K:	\b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h
 
 GENERIC PINCTRL I2C DEMULTIPLEXER DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
-- 
2.43.0


