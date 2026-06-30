Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6E4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xXf4We4g7UqeQwdurv3O8BsA5z1dsSy1EnxUpT9Yfk=; b=o/gcghT8j2YBKNVonZyV0vprRt
	TUa+a0lKJvej4brNJQwllutBrBsEokzFGQdEHO1Ah4r41JXxo0WnjW9Irt/r2yXLBNDPNGoA4Hft8
	iK83tQ96U3wjkGfgQf2sWdak7A87K0bWrsZgnvYD0APYD7a2bqnUf44sC9Z2eseg6drrDakmQoXsk
	aA1CxRnmMPztNuq6+oHX7b668+tL/YIBoDpF9eOTkWaKaBVrfdIrSVuEXjdIGTm6XTD6VlrARWa77
	0Cuugi4g4RllU8KElYN/qeoKTaTgzZbCptx1bOA3xjOmvCji9JBYZaRDJorbIWw5RbM38jU8+4CGS
	BaQ3m0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDu-0000000GBcH-3L0Q;
	Tue, 30 Jun 2026 07:49:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDg-0000000GBDv-0dmG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 07:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4xXf4We4g7UqeQwdurv3O8BsA5z1dsSy1EnxUpT9Yfk=; b=u1IFwg47c5TGXJTdT6BEDluMK/
	wRqBdKti38f1n+TZgVQ2Z8YNLrb3tqXQanm7N7/uZ4H/oazQg3z5MjJmmpf9k16/QqA81A1UYLruA
	nCDEMxbT9SalP0bxn8t79hEAI7CZUpsw30K5WLmHrHvo9UXYHtcF8XuLPUuOvkEh270aDMPW/PNkK
	lRrWOaDLiWVVxM1yyb2ceTECFFg7xsFIH0xI8a4BX+EIKmmtlNBFw2VBKetrf3mRZsNciN9LpTWAQ
	fNBvuSlSnqfcKVx1yA4mJ+DuvLSoet74+zAeM4La/MGmgi7cTZNEqWtNlShJo2IHaAfimjfcCthaS
	KqhZSAXA==;
Received: from mail-westeuropeazon11011009.outbound.protection.outlook.com ([52.101.70.9] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDd-00000004Xfr-19u1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 07:49:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSjAtkX+Y5y1vXjShmMvEFm2NHe3/3VRqljIeC2aACSC7VXbLLuj3aAqjiUAGyhmaGKeYa1nZFN/U9gQsUEdGIzePoXzxUgYXX3BQlW9Fx4IeXvcjfW5maiJEMhA7h4f2guKm1QRsQvTH4hDuSOW+P5k/dp0uHnX2Hg8JqgAWMVxAwr+1t5xDs56B7ML1h6krPQtiBty1+yWYfOVxv2l2Hn/3+eLk9icGdlfydufwhbi7PKUM/SCF60PsIZFeGFk5Zx2akD0wN8DLvlHcJlZ8EHQvJ6+hNXE2EFovSMnvDH5MdxPkukQqhwPGmruP+kMshdyDzvh4QrQwDb4NJNL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xXf4We4g7UqeQwdurv3O8BsA5z1dsSy1EnxUpT9Yfk=;
 b=SZExL2SLbPmNRf1C9W477xNyvjstZcGHzY77CAWMNq79FubekFHG7x/1Q/FyzEQDYcjet6ILkVPpd1fSj1RWLusMLqLNlQYr0u9MC1w8isD1dtNhxhCAucFghTEqS5/wmankAr7MjhFK3gwGJ3A6nXRN51eqi9Nbd6Sim42Z8ilE39e58+ORZHcC8dD9KYs7aJx7BQyageXCWqSMDaNOamR67PrXgczic6uA/LzIVVlryJcTTs8J+yt8tCIvKWYuycrYFA77jj71gSjkmUNIsYzCz2fui45zUk1HzMtQ8JTV5AfDe7YTzvkpL1wLAjkrJWD6Ig5ufGRJFrsrq0OxnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xXf4We4g7UqeQwdurv3O8BsA5z1dsSy1EnxUpT9Yfk=;
 b=FEFbDF1eTTaNaJLZ/lMtg0tXtKKN88Rm4zJPlsd66Gw6jvuYL8+kv+q6Xb2ZalA09LBcZQL8GfIN3jIoTDWoD85ME2uoA5nRjV8HVoZq9pikUtybfj+SlRhfYVhhEULX6CQxMbiwlLSd1KsZEjDKYsIJvJv43Ctn6H4h2djtoiPS+KgA2iHom5RweY93oxk/ZsibXMjJcVlsugCOZ9IAEZTWCSji0PHqZrqzwdluKdIil2c8IhmW9anpf1zE4iXqqljiWd4ZvbiMZ83YsYi8jsXfQ9LJxX/JxHQdWFrrmixdc9G8Yal3Zlj7IX307SZqpkhzRVz+LRPuPCdzBpA4Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:49:16 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 07:49:16 +0000
From: wei.fang@oss.nxp.com
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	wei.fang@nxp.com,
	chleroy@kernel.org
Cc: imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 07/14] net: enetc: differentiate phylink capabilities for pseudo-MAC and standalone MAC
Date: Tue, 30 Jun 2026 15:20:29 +0800
Message-Id: <20260630072036.382761-8-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630072036.382761-1-wei.fang@oss.nxp.com>
References: <20260630072036.382761-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|DU0PR04MB9561:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0a26e9-ce3b-4de7-c9b1-08ded67c15ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|23010399003|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info: OLD3d2R9OZ07Sxv3+cRXIv0z0Z5IcTYazP3v5uHPu33YUNH/rAP8nenfY+1OFaz97sFyub3BupDESfpjSS0CchHVaayvRfhQAdta47fTskxrKLE6S+r0guPO6+nCEQ70APIx7650j9oZhMtK7u53Vz0pU7Gj9wnDW7LReLGkc6BM/bSOIFAY45LiC1KEMtLypCBOFSyNcfVqRdNvzGqDuMoIH4duJMkvFNrAksCmcEbzTTwWYoP+CN9hCGxfpkslHpXcy+7FJIsh2IJho5ocZ3cgQHqai1jWuZ/dVxUFExHzLouekcD9JcYvhxyUWqVzw7dNk9N3mvUYA4KO601L/xnNC54ADWyK3wcvI+DAUWrp9iWQyMTtw0M4C1atoCA7mATBel4+zS8DzdT+Ev9NGJg5L8t1QlPuFP2G1kKL+TJYXXQnm/7dRHwY6bfGsKTfEtJaCw1o8002ShuwojeUgOUVUct0hzkmC51ioniZ8HaWyxBYBNWtwlVzgHgTHQsDSsEVp4sP0YA/AlTT0WnsLh9kvfxC5NP0/WGPeppiCcfAq+OymjUDYXdnvQuKY2ykkCkDm+yUbEyVa4b8LJmp/cQ2LYkIVtPWMitSH0+GPAbUKHUnCrWpoaG7Vj4CLF1yQDsMuBCOTuUwZ/V2TI6o6oFecfcfw9jT9VZM/m4frpEJmWwz3W+3gSutZ8xFJcvc8EEb66aej8VHszQCV/+FzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V75AJ9+HoK3nXIcR4DJsRtHmmDZ2Wn+19SB59wHeqaXLOkEWdDz7dwjPQs4z?=
 =?us-ascii?Q?CJrjY/wguZqVSHKpR8N26OcN8KroG/EWmpp2aLYITplfGOLntJfc/GimmG/c?=
 =?us-ascii?Q?4S6sPm7+gMNJ/CFj6qOYYB3fNwTUOAyf3xB5AyW9qxZW4k5oyQGhDRCFwvvy?=
 =?us-ascii?Q?E36MHtu+pSVxwUj9XGGo5xTBKSo4JgX0/EC+pxVoiD2tXkOQg5JTwmbBajhB?=
 =?us-ascii?Q?SdrOYdkWYb6/dskv8U1EoQxlNNZA0565TNX3Qtt91uBMshLWdWmgCWtY9EO7?=
 =?us-ascii?Q?PmhiEp+sIlsSb1G/CHyRWtyzPmENCkSnc5TN9ggS0I3Sf9wyLjvRtrISOJzU?=
 =?us-ascii?Q?EbHc/AVNWLG8YuBcNZ/uibgum1+LsxlvMBpfL5VH83B47GGMDYq1+tqtez6e?=
 =?us-ascii?Q?Hy9h9gJ33Qsylzi+PoBYWnNUy7T6VfVtOAX4eGqfFBYvoFyXgLCMRaerpbLS?=
 =?us-ascii?Q?sZHwIli6yG6YqoopG5CEkFZtL8t3rapsBTFyGXEgjmsYtJV1Ig3ZClHuiCfO?=
 =?us-ascii?Q?naIOLMYxHAn44xesPz45tpWkyBiKZ01z7G2ERQVNFHtqnj6aMLAL/J2JoQpW?=
 =?us-ascii?Q?kjgymPqy8dxZ35TpBYFKmo9ZZLwc2wOIbmT1S4NNDdT3DjYVUUf08iKBjczW?=
 =?us-ascii?Q?k5ILy9bcgnqQh2PHiUe+lS8kkH4DD6/MEJvgBzBKA9DP54FPKtgi6i+nh4aV?=
 =?us-ascii?Q?UX5Tz/eb26vW7VHFwBhlNkgx1q3gJ93t3CGvs8PbFanoiq/oWhHQjCnnmjgn?=
 =?us-ascii?Q?5VnYYUSCHP3aVtJ4I2IGf+jmGCmGU8E5RkducivkexB04Pjsd3zdVS/bFwNc?=
 =?us-ascii?Q?/5/qh9D1JNYKLQLqc3jqjv7K0RPxY2tfxWK5KmrOqQ8RTt4vxz3szz5SzR+T?=
 =?us-ascii?Q?b5L2LwAEb+BfOPC3OYCbH/se/AOMcXn5qEXAsBVWU9qBLK2TaLniIyhx1nx1?=
 =?us-ascii?Q?lOQsOt50WyxNwdcgznb20JTL6MRp11GlyLYMO6/PiOkGTVIgoy4NjzKOZgqi?=
 =?us-ascii?Q?Lo1NPjWDKrPwflsAdft7lKmS8rOmU7Nr3KUG/iyHQOHsX13qUkLgiUHJ4ETd?=
 =?us-ascii?Q?Hz8A6iYtlRZd18DpNAWsXU2g+WV7VpbDFJP3DQWfXUNxmcw8sus0CJBlQVYd?=
 =?us-ascii?Q?S8Ke5kAfrRznGUhg2SoCr0pDYKhTLvUcJIpp2yFAt6Ko5QS9TW/+P9MRtmSp?=
 =?us-ascii?Q?QUFxgcXR6njmglXj31DDIPLUbfPeVb9Yp26sjod9bRtlYD4VP2xzBQ2m4Nan?=
 =?us-ascii?Q?XHEsUekQC4E7OzYeF/A1KICvEjVUab1toeVAGn6CZbXBD+8pyJOXFZ7t+y/r?=
 =?us-ascii?Q?lnsoVjMr5JEu/ekIS4QLxthoZ6452N4SAuabbZYgO26edmxZGk9vGqW3CuEt?=
 =?us-ascii?Q?SKcQQtzYGHK7lz0vILB4ikqZUegHv9q3jLPbCi7aLXRqT4+uTpy8ZLZ255fH?=
 =?us-ascii?Q?rXqy7wqqTXjih5b4/FMFZm3teMv0fv7OXQ+KKBjEeO9SzGqm87lRgFs0TldA?=
 =?us-ascii?Q?WqR1xEPG99BFNJCWj8zXaN3XYKUE1R9B/RIajv27MWfkKCkEbdiHDZTcmWw1?=
 =?us-ascii?Q?kBmRsdnCTNaR9XUQ97hU2xnej9oWJkkb9AMtLWKFY6LQJoWzGR9qkoF40Saf?=
 =?us-ascii?Q?Xt7bcrjjMrcXLtvHPZcubhxcuYxfYiOtpTtNUT/WXoufGBjsQ0yCf/P1nkgB?=
 =?us-ascii?Q?kpADAyEI3QVBqrJ8St2ulfkBDHAsb0rElbo5o7j2LNkbnfhWRNbr/U39hbQ+?=
 =?us-ascii?Q?kCvcQbcCJ3ybDirJcQE7yh9Rpb0X3hhN1qZDZ1IrwFy683boKBsv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0a26e9-ce3b-4de7-c9b1-08ded67c15ff
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:49:16.7842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljI2aCX+EgusRDIHcwaAJifiwKWFLOFXp4OX4blRSt+dlLT0KmJsM2cGNW6wFnegRt2JQT9tgELGzqcMYuzRGddNE9guAKiqU5FRjIhaaPn6LqQETD51EOKFbP7PscGf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084921_496425_DA77CAEB 
X-CRM114-Status: GOOD (  12.14  )
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

From: Claudiu Manoil <claudiu.manoil@nxp.com>

The ENETC pseudo-MACs are proprietary internal links that do not
implement any standard MII interface, so restrict their supported PHY
interface modes to PHY_INTERFACE_MODE_INTERNAL only.

Since pseudo-MACs can operate at any speed between 10Mbps and 25Gbps
in multiples of 10Mbps, set their MAC capabilities to cover the full
range of standard full-duplex speeds: 10/100/1000/2500/5000/10000/
20000/25000 Mbps.

For standalone ENETC, expand the supported interface modes to include
10GBASER and XGMII in addition to the existing RGMII, SGMII, 1000BASEX,
2500BASEX and USXGMII modes, with MAC capabilities up to 10G. MAC_1000
is replaced with MAC_1000FD to explicitly exclude 1000M half-duplex,
which is not supported.

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc.h  |  2 +-
 .../freescale/enetc/enetc_pf_common.c         | 39 +++++++++++++------
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 06a9f1ee0970..8839cfb49bcf 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
-/* Copyright 2017-2019 NXP */
+/* Copyright 2017-2019, 2025-2026 NXP */
 
 #include <linux/timer.h>
 #include <linux/pci.h>
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index 3597cb81a7cc..adf79a99a8c8 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/* Copyright 2024 NXP */
+/* Copyright 2024-2026 NXP */
 
 #include <linux/fsl/enetc_mdio.h>
 #include <linux/of_mdio.h>
@@ -400,25 +400,40 @@ int enetc_phylink_create(struct enetc_ndev_priv *priv, struct device_node *node,
 {
 	struct enetc_pf *pf = enetc_si_priv(priv->si);
 	struct phylink *phylink;
+	unsigned long mac_caps;
 	int err;
 
 	pf->phylink_config.dev = &priv->ndev->dev;
 	pf->phylink_config.type = PHYLINK_NETDEV;
-	pf->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
-		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
 
 	__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 		  pf->phylink_config.supported_interfaces);
-	__set_bit(PHY_INTERFACE_MODE_SGMII,
-		  pf->phylink_config.supported_interfaces);
-	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
-		  pf->phylink_config.supported_interfaces);
-	__set_bit(PHY_INTERFACE_MODE_2500BASEX,
-		  pf->phylink_config.supported_interfaces);
-	__set_bit(PHY_INTERFACE_MODE_USXGMII,
-		  pf->phylink_config.supported_interfaces);
-	phy_interface_set_rgmii(pf->phylink_config.supported_interfaces);
 
+	mac_caps = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
+	if (!enetc_is_pseudo_mac(priv->si)) {
+		mac_caps |= MAC_10 | MAC_100 | MAC_1000FD | MAC_2500FD |
+			    MAC_5000FD | MAC_10000FD;
+
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  pf->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  pf->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+			  pf->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_USXGMII,
+			  pf->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_10GBASER,
+			  pf->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_XGMII,
+			  pf->phylink_config.supported_interfaces);
+		phy_interface_set_rgmii(pf->phylink_config.supported_interfaces);
+	} else {
+		mac_caps |= MAC_10FD | MAC_100FD | MAC_1000FD | MAC_2500FD |
+			    MAC_5000FD | MAC_10000FD | MAC_20000FD |
+			    MAC_25000FD;
+	}
+
+	pf->phylink_config.mac_capabilities = mac_caps;
 	phylink = phylink_create(&pf->phylink_config, of_fwnode_handle(node),
 				 pf->if_mode, ops);
 	if (IS_ERR(phylink)) {
-- 
2.34.1


