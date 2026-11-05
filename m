Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD88606D81D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oQnTuJ+N;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=LNjK3UPW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EW7m/0LlDXyV2ZgI0Ke/VVxSTYbwpEwTzrjloltdIDo=; b=oQnTuJ+NdEvBP0xfM+3CksQdgh
	M+7tpYhAh2YR/WcASmNeBXf5D58qTs9755pUgVmU3dO9prIea352ffQP4M2Qjanfdr9un8s0w8w8b
	mU8IUTbF25oIBAQ+3HCKfhWUjq/5SsCt4eG4KQ072jskwAIwRQY2qcRbTq+VRATBLRatMim89JSF+
	Os5t5mqQg+GMbdWG85EyK++Av8X12LXP9dtZzYGuwSRn0OVZ3VrqlDJscYd5tWJr8NHOSWkMzxpaC
	rtBw2RcgOBcUs2HnukKKyKRrzehfzxtVNb3sB9hRsV82mUwxLbcSiP++VHn+3BrnkC2tgzT7wufNR
	SnHCTwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuAS-00000008NBw-27FE;
	Thu, 05 Nov 2026 09:54:00 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuAQ-00000008NAZ-1ZSB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:53:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWV+EEpuCsgUiJHt7aKPsQm53D26MqPTXJ43RJPWq0Qji/KYT0jGtQlPe7Rw0YMK7qxTfOHBLf/wcXO8CHIxWS6Nq2lxY9daqRk8KyAn8FKy/jYztufzCdKfo9q1GEG0bepx6zITtbxzvic1QS8BGqfUdTE3kBesEgCn43qcb1dUzmKTJEKLd533tytVYTq1dejn2i3vyP4qTi5d9f2IoYZo6XjVZq7gmkqkEa1mB7CmaJJ9CHjo6nev+MKZfq4tCAPsgj2rjSwY+tym2oAxP1YWHWEROFeMJ79BGiBbzlo8tGXwMr1g/ZLuzfUhVWUTDn1uk1Wrz6qwuplaU1uFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EW7m/0LlDXyV2ZgI0Ke/VVxSTYbwpEwTzrjloltdIDo=;
 b=Ff6HSJCWecGnVcvT8lPOFTgkKaA0jbJMONf915jnImWqvH3CUirln+kWNA3nIY2Ep2a+DKXMVRsXVY3qa0p+d6N0kHL+3gQ82g0am7Sra83/XiPo+IgOFKyPH4ubdWvWvFUsXu5hFRD0e5hN+GUDVu/+fQZvrT+tp8Z+gbMARlRtzWOii0C/yXaJ0Pa7Lcl4EPcXnyV7qSSOb8M8FVgFxSB3V6J4HM8jFl1LyJa2OAs3BKMRvlwDt6smNl+zCDYe9t3TcTjiqhFcadwF7kZLjFTq3SASdzevXsscLv2SSUaMJRU0C+BwRBdtIlyjWw1JPLyUT8MVDCyYVVRvmU9vqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EW7m/0LlDXyV2ZgI0Ke/VVxSTYbwpEwTzrjloltdIDo=;
 b=LNjK3UPWSDdzFA816YQa6lZF9CbMKOC3gtsnSu1uxkRsuiV589LvUJ2LNUQ7VshQeTw1giFrW71kgmb86+l5h2AACxYizRBoamWQvGuP9s/jeZoUPWEafvOkVkXXpVoz0S+6SdmE4UwU6ygSsBhNGTxzSjyyNA6BIxnNqkX/Hj9bhvAgR7Vbh/Stc4Tv9TUN7o9lCuuQOSHrNiY/md3FtSvwWa01dpJO45C214I+C1+jSO/3Ni5j2Z8q7WG7sxzWFvcamKGWr9LqPHaJRzYXmeKJJ6GmRPmKAmv+NQbNjHBSfFl0BMysWzieTDRzq5cvvJvjQ6dL8qn/HsbLciC2NA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4474.eurprd04.prod.outlook.com (2603:10a6:5:3c::17) by
 DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Thu, 5 Nov 2026 09:53:51 +0000
Received: from DB7PR04MB4474.eurprd04.prod.outlook.com
 ([fe80::c22a:1b5e:12e7:8b3e]) by DB7PR04MB4474.eurprd04.prod.outlook.com
 ([fe80::c22a:1b5e:12e7:8b3e%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 09:53:50 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	sboyd@kernel.org
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Florin Pavelescu <florin.pavelescu@nxp.com>,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [PATCH] clk: imx: pll14xx: Fix potential integer overflow
Date: Thu,  5 Nov 2026 11:46:32 +0200
Message-Id: <20261105094632.159200-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::20) To DB7PR04MB4474.eurprd04.prod.outlook.com
 (2603:10a6:5:3c::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4474:EE_|DBBPR04MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: b5fc1b52-27d7-4b25-478f-08df3b22b1b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|366016|1800799024|10067099003|18002099003|56012099006|11063799006|261026121527099003|261021123027099003|261009223027099003|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: dp5P7cZItx7YK2kNZr/cOJ6qjgJpplIhwjMBO8oUppq8tul/bvVAb4tjWHZveG4y2h1CPdS+i0PImj2hznNkfGIS3NSHbv/nso2BFbewg7IzdqGsSQoYG2Vn51X3zAAbHXnko4wenZNne5X9k7Mdp7oKG6Hog5QE1ieTHGezA74ST+U5dMIKYFme3iU2gPCkGNV5DVGCK8XU5FPV306jiRp6LtvmsFbRtWNu+8PxPrxug0/F8ve0vLjj4ZBCEVSS/cOLJZ9eBwrhoKA0kdQcUvdI+MEQX2BGaNWa6s/gm8D4v5t/xwgXZZTF0AJsSD4/255kuh7B5r/cfhe9OX0z2StcucdbNWGgbGnR2CrG0plpcNPoPRb8fXIJcXW3qzM14weBv1hTXEv3Af98MWaCxN33NFpMaI6MMcppJFfqN7g+P9q0/cDOM2E535kBEDzQye/LHJDSQsiv+fiWgbSMGwEywuY71hzjgFxxQ/h1oZIyg/5e6eTJwdx17zJ26VHCNlTsaa3hfKR5hpxPYAMME/VRUC0BRKt036awCpVog9rRMEbFtyH3vjt1vIQNLu+OORRhwEiags0lkLiXcCKPalseQ8zXWQmd7scC1fQ7tVgyoI22CTcik/5HSSBfpoD0WaMmj4mA0PuItiK5HaZIaz+YfUG6gnhMDuaytNsAQOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4474.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(18002099003)(56012099006)(11063799006)(261026121527099003)(261021123027099003)(261009223027099003)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ide6jZRcPxxJCjQLowAtDssNTgeryIQR65j/GIoDXfljqA28WSw6J70x8wtE?=
 =?us-ascii?Q?lh3DcAT4KKHoP2+zlEa/cQN74t4d4OZM0MKyDYc4jlLXOuy2dwTq5yPW1+Pf?=
 =?us-ascii?Q?jlpfzR7zg6VVNEVoMSeAf7/1easx7ZSvAntscsr9WCOYGxbrKgZw9JIaI3Xm?=
 =?us-ascii?Q?X4gv/fUXhWcJ+oQyQ0zZYnaZx83HI5g7/2cQh7mmrpCrrIb5BAJIG3/QG7vJ?=
 =?us-ascii?Q?zrbvPaVJXD7F4G5mXcYH5cL+fh6ReScgAKZH55WDFM4RzNtXylQkZhoxncaF?=
 =?us-ascii?Q?5PmjBUIopNtJH5aTzcXPzlxd3d0kQ3CserSXy0a7tNo1J7D6yb8HjGGEZCXa?=
 =?us-ascii?Q?d6uF2T95+b+U63aTpdDW110ae8+8SJHRFsZqJqbeSJdk7Zk0LpTl0aallHme?=
 =?us-ascii?Q?Cr92Y1pBdkWCpIKWixrBnmgnxW7M7dj0LpU0bRpXXXtFlANeOMZuJBjiWraE?=
 =?us-ascii?Q?EiSiDMeLIqT9NDJmEWHJLFNgfYoZGsev+LffsZB7A4ZBrf0p9XihXRwmgqen?=
 =?us-ascii?Q?jkYFWaGFjuD8Rf1angE1leFMAaIetKvvXa3ZTyqBVOLh1sSNJ2mJLCHQbE/U?=
 =?us-ascii?Q?6Iy1m6vgUmYs6l2xLywW9PP5QHY0Xpck5p3yYEbn4iAFzveG8CbQ7cCQMNwD?=
 =?us-ascii?Q?R+NYLMGzvIDLhlD0DzHVtUDrGiKN7R3wtB2ju3Cfo7zrBiKXgvE7/iGc779K?=
 =?us-ascii?Q?10OuxKEKZ8yuNCgobVTrAuICle5f0LRJhkf4JXkzQQW/Z4lR/194XwrH9SPF?=
 =?us-ascii?Q?XDuCn4ZEjTx560PovWKevtGx83ML52+3TA65egzTLmIgdSw5PTyIkfe2PX6m?=
 =?us-ascii?Q?wBS5+VGvttTKg+w4r9C1wwJOrOjBdJERvlzS15J1uXcAadMaGTUFLVQFt6Ox?=
 =?us-ascii?Q?3tSLHVa33RNEwx4LNq+Qui2vNssj0xlVKBxpfRp/Uif21nnhqUzQouvYnWJ9?=
 =?us-ascii?Q?reiGtziudxHKLPcql7SJuA3YRlGMNzfHFugM3RvpZShS6TIdYOouAJFJf5w8?=
 =?us-ascii?Q?unsWrTwtr7e90cpAA882Sbz3B5+dI6vi1wqDGXR/QeqjU9c92OJgjaznINeS?=
 =?us-ascii?Q?jLF+GExkRAzIifUCO4l6vpSBUeDM3zTWIcm4XVXHJgChpbca1i6/0e1Wrcy6?=
 =?us-ascii?Q?OyOvTcOFPEMTZHUQHajvS50IawDd2V//jzsVfz6tBgx79vqHaBwfNE8aYjdj?=
 =?us-ascii?Q?Xcqg9BttmASoD5kZ7aGpDKD9SRrtZFhAhvJuAeafQdsKr6DCRJ+GCKxQGrJ+?=
 =?us-ascii?Q?Rxh8k3Bzw+hkY96fE8rvKqB3fgC5BWZT4A2O4VGnUZjIeb7LE6rkJuk2tYba?=
 =?us-ascii?Q?fg4zcEALIyvYXUSzBp085+D02X/BUw5drWs361xRocRxVBTeD7Kd+xSegKIV?=
 =?us-ascii?Q?oAIAoKRX2JneWafQBu0W6IGXX3X7MnUs0zmwvXeZQR0jVmV5WrAg82kgb8Aq?=
 =?us-ascii?Q?wBU18LjYC0lf4qNs+WuQDqKTw9HdQ5c9+rlE1TmnvVjLClySjDOpGIigmOTo?=
 =?us-ascii?Q?qCd+7rT9oBC3cbuVWy0hRLH77h1oSGb2dwZD5w+eJcDsxSO/9KyVK3UJBphC?=
 =?us-ascii?Q?Nfr7LRaFAp23AIWG16Luaeo9ct3ivv1HBTClAAgfQ6mluo8vMPZSK//+lqJR?=
 =?us-ascii?Q?AhKid/5yDmiWnWXNVAGpVtbBafMRoWYpIusXTsONGpd83KKC0rMKqMghkEtx?=
 =?us-ascii?Q?7Dl0sA83HWjnSugVMNVBNx6nQkMEhTwoXoyGuUcZCg6ArMhIVFUhgYV3Kqiz?=
 =?us-ascii?Q?e9RsWNo9ng=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fc1b52-27d7-4b25-478f-08df3b22b1b8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4474.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 09:53:50.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMJ7teK+1cjWiVY6suVIx4Re0avQe49dvf9ogHNi2GLFnYzUtqahlcaLMqCy2f9GaLyCJp/VMBvpgV9CsIR0HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_015358_428678_B24020F0 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: -1.1 (-)
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

From: Florin Pavelescu <florin.pavelescu@nxp.com>

Cast to u64, so that multiplications and additions will be done
in 64-bit arithmetic (and the results will also be 64-bit)
and the possibility of integer overflow is eliminated.

Fixes: 53990cf9d5b48 ("clk: imx: pll14xx: consolidate rate calculation")
Signed-off-by: Florin Pavelescu <florin.pavelescu@nxp.com>
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
 drivers/clk/imx/clk-pll14xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index c6438144e507..08f9d3fbc75f 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -124,7 +124,7 @@ static long pll14xx_calc_rate(struct clk_pll14xx *pll, int mdiv, int pdiv,
 	u64 fout = prate;
 
 	/* fout = (m * 65536 + k) * Fin / (p * 65536) / (1 << sdiv) */
-	fout *= (mdiv * 65536 + kdiv);
+	fout *= ((u64)mdiv * 65536 + (u64)kdiv);
 	pdiv *= 65536;
 
 	do_div(fout, pdiv << sdiv);
-- 
2.34.1


