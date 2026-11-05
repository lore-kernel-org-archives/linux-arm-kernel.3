Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AC6606D810
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 02:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N42/6NyK;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=NKgsFCog
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=L6jNYr3+I2TRbJ6lO8eF3ELPRVGF41ECwcb9ijXpjdA=; b=N42/6NyKDAz/qcpl+SdScpJwMB
	+NxYDjfUaEymhqg2eFMXH+I7YFfzmOWI7tEqs/rrINuTIp2Ufi31VWk8Fb/rMeGiPNwpOoO3hasRV
	VbQVAJ0e7r/tz64laprTHwmPQjY4k2YZz1hdr+nOPkf+aw/p5qANa71PlKqkNnNIUYDSuhWX3hxoA
	BjSxhztuupjqJqU+DsgGmpQgUQXCZcGA8w31v1RCgkhZL53TQK1sebp/HYawoXMc2PvDWxzGIXpo1
	EY2FkU1GxJlgNdCOcs9EBuM8iwzz0xT26JI+peLNm8puj4ea0tTRP1mXjujrgs+FupJU1Dv3HwQ31
	E7ztlo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnHh-00000007aV3-3CR0;
	Thu, 05 Nov 2026 02:33:01 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnHf-00000007aUg-2I3T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 02:33:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNA7S37PImboqzhqWXvcOEA8owOWS46LyYCZxmkqfi3eEfl+T0oyUlpmGSrJVvejX3yEIwE7jmEeVLFX9JQ+O4yU4h5vo/cTHljYWP/XSaV0w6wCfXycB4nNioHTwiVIrBqjDGpjrzlKsrI3BcDNVQ4mMmLwpzB6UYLboF7vmLGIpcj2PXavkw96Siaf21WcAoKaSdYtxhfaZsHCYZn5ebxnlo6oBXy2mWkMC5Q1xCm0KiN6+lrZXkCPtw73tkqL402yOKv9KzifyhWxJ8LnCVERTQAKGf720piQ86AfLuGhxVSaakritY5YGJe4+MF2YcRfHeaBX9vnUhCiH4oGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6jNYr3+I2TRbJ6lO8eF3ELPRVGF41ECwcb9ijXpjdA=;
 b=K7cZhjk1xwlGeLbmAbJuoQSmTLvWsKvbkvJHUCPrpaokvfuLRkvtSOBxBuPJELbNFJAo7ca1qnrjeocV8ZLUpidJWgXhyToFSiObI4w7lLZbhuCgvrif4BvUxu/YIGlYwLQNGm1Cx461oa3ShkzqllBJM5bnnKrIhYGrEpkudwZkEEA5RsoRZbiV54M3r/d1kuyCZXITQKV3BTz6UpjNIg0vAM/3GJqZfKGSScHS++cxQDC1pOPxuJLuTVPkCMvzxB1zrkkLSGxW9ZCElVQ5iY2alyBg8npVOwO97TyqvMsUECwrmEyIYs8eF/r5TzrOSzxI66uOwefrE8lHFfEd+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6jNYr3+I2TRbJ6lO8eF3ELPRVGF41ECwcb9ijXpjdA=;
 b=NKgsFCogYCLsDKacAIyL4mcqDbk8tjFJwEAEW7ug4V0gj/2HCuLXiKKEDnG1q3JV9W4gg5HI9AX33FQBjUMkq8zyi5B8ei7H4FroF1ps/2mtgki7tVCSawww6YsLXjqNesKAJ0iFwjdnm0LE4lZ/8MEOxTJUKGOBkB85cXbhvQkZ8luo13FjJdZyIXROJeGhXdRrapvxtqGQ9tqimjfaAYLMBIZ8H0RyCeG1Jo6+bPjbqNoE50ApD1BGkBJ1TqgZRRkCyfHyGDX7s4YwF10RoP7FzjZGfG3y5cvz4ET5np9+NQ7QaVD+rqVOHMruHN1myxLMm4jLF5q9NH5PW1Jomg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SN7PR03MB7274.namprd03.prod.outlook.com (2603:10b6:806:2de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 02:32:54 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0569.010; Thu, 5 Nov 2026
 02:32:47 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: stmmac: dwmac-socfpga: Enable multi-IRQ when per-queue IRQs present
Date: Wed,  4 Nov 2026 18:32:45 -0800
Message-ID: <20261105023245.4683-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:a03:333::14) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SN7PR03MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: cc290210-3732-4bd2-43c2-08df3ae5141e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|18002099003|55112099003|261009223027099003|261021121427099003|261022105027099003|261026140227099003|261026121527099003|11063799006|56012099006|10067099003|261028144727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: DjxHl8NuFTl/jKretbUrjFXZZygYn2SX/XQ97fwqD+2RuZtgvcQQTCXfsBAuAIfnV887Vz7HHf1cUY9X410LoCAL9md3+SlGiCIm0IamAs0Yr0KEEM9IYxAq7nZ1UKfZf5h3JjXTFKujj7ph2QfpHnbxPqJB833ageslvwvsKhXKRyuJ29TKl0NymiINcfF6ecx5CzOr1aSLOVOAHzqpGw7fYvJvSo/dhEqSnpdnQj5zFUNOy3LtgpCwWdrDx6A3o5Dg8jdFA1LzRKpC9vuxblRylUDkgtWG6lDjH8x/zikLNE6Wfs6AyVCR29PDF1WfYb10kGmu+b7in53L2STvpIwIx1Y0bWMPvwV8kslLSL0daiRTwzVXj85MdOLh8PuhTYB9/wV5tijA7C0XQHQy+qZdNbBEWaPXbKYqPBdPxmPTKHPkZwX7PzzM0tuPGE9jCAHD0qRBV9d1NH2Yq1oZv0dq6HwcJqHRttTyEqdbJw4uyolI9XbA3uCyGKzuNt1uk8BDh7ttQy/128Ed2JBb1LMulY2ZjP6cWrSYmkSsFp88m1LQu6KmswjNux9dPs/YtPgwrDVicEPjWj1R5Y1gQndBmS6Oe7cDgeX1hmDh6c6KsOPGZETC4Uy0L4mQCtSb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(18002099003)(55112099003)(261009223027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CdAEVzen6R8FIcY1EDcei2WYmonyAHOA1GYRa8ecyrEz3F8tb4pETS7g/e3V?=
 =?us-ascii?Q?Dx5DuHsp9EC51YYqkxKDZ64352VtOSxw44fXh34VqS1aeSYyoMub4qOGL9Wi?=
 =?us-ascii?Q?glhvQv04ja4KVMQ/V80P71Z5sofCrWwYMmm1BMHfRfQqlF5WLNGZOVnh/Dxo?=
 =?us-ascii?Q?ozMedlq+C78y/xax1bgPWS1vIjLaczvB5SMPpkx1i+bPli976wW/W1ehrVOY?=
 =?us-ascii?Q?aSq7mTCjZVA1H0JxfmanAuaXzykXoBYwv8avUelDKZC5D8MmdKl4OfNk8Dp8?=
 =?us-ascii?Q?oer89iJjRhAG9/gpIM1x0FDKbYVz2+1j219cxZrgupAa37nrfkPMGSAH/JUJ?=
 =?us-ascii?Q?1j1QQAEm1gLcvtWf9g1iOP3Lyww/2uRYZn1H28qFFyTSoWk5NB2zghxHR2uG?=
 =?us-ascii?Q?AjE2O8tzSbEuutqaR22yx7F4B3cd/lgDKmj/0V7L1j9qDIWPS3bLa3CNVduf?=
 =?us-ascii?Q?0sUnSLzQ0IDTNx9UqN97KeU5weL2jxYeh1Q/xg8z2dCehXiNaOqvobtXw8VB?=
 =?us-ascii?Q?K2u2Lg/0T8G6PBBtaIV4p21mSiUREpWAO9mKbkhAVOi4s0fdmzP6TW5yBZ+B?=
 =?us-ascii?Q?dsuJMPqgmt3PrHxVtIVwMFOx7MHqfk1tnqgfdsG2UH99sBLsT3dTWZe5/4w8?=
 =?us-ascii?Q?fkOYRa3H9amzkyEAFmHerNSEtuRK993dqrv6qY9Wp6aNrWKbSLZVUdXuVJRs?=
 =?us-ascii?Q?FkkMAHqxUkRnbjd+eBKtCwbiIAVMbwYPWLlKnpGok6atl+mxMqLMXQpkjiBc?=
 =?us-ascii?Q?nk6jDGf3dQe7uCj6JYJI7QiXiBdQGyHUOHUHQgMQyfJGE5WpBpyggNdOKq8o?=
 =?us-ascii?Q?CvXBVs+fD5+wv39yStaKQ9kjOrBpb/vgaMGi9CRX31nQSa6+yWwlRRpXmZfI?=
 =?us-ascii?Q?AMaIclrI7FHwHBIwR6UoJ4xfq6XUnRgNKuj9h+xzp5kBPVDNKE9+m+3G7WBO?=
 =?us-ascii?Q?z2tqM3SPie+B9NUu+JZLXwywyTGQVRWae/OnrmChzgfFFaldsczk3zfIbFP8?=
 =?us-ascii?Q?mypibrpa8YWdsvn8QHeDFCjAqttQFkGwZ8IdLqBWtqE18ByX9pxhsKT3m5YC?=
 =?us-ascii?Q?zcHnOtYpK4PHGZGWzG0t7EtGs+FuKRHbCifsqSZvJeCPGrVq4y+3sEOqsqfD?=
 =?us-ascii?Q?Xkbic9jko4+dd7sEhcvm/HaicpQJzaSu2iJCu1jfBEUwmQ7ljU94yrHUW0vZ?=
 =?us-ascii?Q?lDbeakERZHsESVYOmfrcOMuWlnH8lPrhppjPKlGh8IExaa/5dwl6jRuIX+6L?=
 =?us-ascii?Q?d15TBby3ZuFoIGN66MjlGUNRnXPZwRcM/F51lZBrQ37J5mlW0abEk41PjLmJ?=
 =?us-ascii?Q?V0QzwcQHyHv9VmtM5OdhZSiT8t/HlER/AeQcE7zlOQYobTI6llEZbcJDxQ/A?=
 =?us-ascii?Q?4vlqNIXMg41LMetOjYslEP01YdokBRJlM0LxOQFuUMW7RwNJQSRXw7cYtJFN?=
 =?us-ascii?Q?j8/5nh5ruN43s0tSiFe7aGG6SR4sUrAxWpahsEj0iZSmTMm01YCXK7ZKi4Nv?=
 =?us-ascii?Q?HYCwuD4LlbjtkRQQoL6syuCARm6kfFytEXSmX+2dxL4HnH07G4tUeaI4cSpJ?=
 =?us-ascii?Q?6C6YdHLqJtMB/WGEGq5/94Zp7P8uiFvZbB1NKwlgx1ibDvlK+DrOpuy4pKIb?=
 =?us-ascii?Q?ArrNr4YIB2OJF6mPOyNVmJ2kE2Q5u9382Yq7yhOKw7KC3wlJYIM594A9QysF?=
 =?us-ascii?Q?uC4aATBmmoMjmzivL+HxIkQravfUIA3k78tpG7trdlnZz0bYspGDs/pm+fTj?=
 =?us-ascii?Q?nHFBABkSebfHKpkK9Zuxb7SLj0/qFY7/L1n/VO1ReN8dtny5+bWBfeCSObK3?=
X-MS-Exchange-AntiSpam-MessageData-1: IcokuLT3z498Yg==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc290210-3732-4bd2-43c2-08df3ae5141e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:32:47.2752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpkm/bZnmGaCw2K+KZyQAYgFU+7rQwPnxf9BbJzHySVVSsAA9P8pxwZI3Fd49WsEG2Vd2lIbwLdLbrZ9ngx4jG/VdR36GkRLVNZwTWyPsuhVcDnTvBwo6wBJpBh8ywiSBr9VSi9PuOTNBsV64ZjGNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_183259_606421_3A10FA01 
X-CRM114-Status: GOOD (  15.41  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Agilex5 and other SoCFPGA platforms can wire per-DMA-channel TX/RX
completion interrupts through the GIC as named platform IRQs. The common
stmmac platform code already parses "tx-queue-N" / "rx-queue-N".

Follow the same approach as dwmac-s32: if all configured TX and RX queue
IRQs are present, set STMMAC_FLAG_MULTI_MSI_EN so the existing multi-IRQ
request path and INTM=1 programming are used. Otherwise keep the single
macirq path.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Background:

Per DMA channel interrupt support was first merged in 2024 as part of
Leong Ching Swee's series [1], and then reverted in commit e9ee910218ff
because the devicetree binding had not been reviewed yet [2].

Since then, the remaining pieces have landed upstream separately: the
binding allows the "tx-queue-N"/"rx-queue-N" interrupts, the platform
code parses them, and the DWMAC4 and XGMAC DMA code programs INTM for
multi-MSI. The Agilex5 DTS also describes the per-queue interrupts.

The only missing part is enabling STMMAC_FLAG_MULTI_MSI_EN in
dwmac-socfpga, which this patch adds. It was posted before [3], but was
deferred because net-next was closed for the merge window.

[1] https://lore.kernel.org/all/20240105070925.2948871-1-leong.ching.swee@intel.com/
[2] https://lore.kernel.org/all/2df9fe3e-7971-4aa2-89a9-0e085b3b00d7@linaro.org/
[3] https://lore.kernel.org/all/20260817074221.27459-2-muhammad.nazim.amirul.nazle.asmade@altera.com/

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 6d4bc1fe8f75..2ca45b3dfa90 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -596,6 +596,35 @@ static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
 	plat_dat->crosststamp = smtg_crosststamp;
 }
 
+static void socfpga_dwmac_setup_multi_irq(struct device *dev,
+					  struct plat_stmmacenet_data *plat,
+					  struct stmmac_resources *res)
+{
+	int i;
+
+	for (i = 0; i < plat->rx_queues_to_use; i++) {
+		if (res->rx_irq[i] <= 0) {
+			dev_dbg(dev, "Missing RX queue %d interrupt\n", i);
+			goto mac_irq_mode;
+		}
+	}
+
+	for (i = 0; i < plat->tx_queues_to_use; i++) {
+		if (res->tx_irq[i] <= 0) {
+			dev_dbg(dev, "Missing TX queue %d interrupt\n", i);
+			goto mac_irq_mode;
+		}
+	}
+
+	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
+	dev_info(dev, "Multi-IRQ mode (per queue IRQs) selected\n");
+	return;
+
+mac_irq_mode:
+	plat->flags &= ~STMMAC_FLAG_MULTI_MSI_EN;
+	dev_dbg(dev, "MAC IRQ mode selected\n");
+}
+
 static int socfpga_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -655,6 +684,8 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 
 	ops->setup_plat_dat(dwmac);
 
+	socfpga_dwmac_setup_multi_irq(dev, plat_dat, &stmmac_res);
+
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
-- 
2.43.7


