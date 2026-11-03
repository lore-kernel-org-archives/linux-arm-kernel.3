Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41371606EEA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 02:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z0+k7cXk;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tyZsrFsZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZAVCWjC4BsIHCAKJErUD6oGwtCjcFIbrNmUrTaY5xKw=; b=z0+k7cXktaCDQc
	km7YCqJu+ght8h9zZabTGkl+JG/Lx3MzxBZGwdjUlVFuAvmA/2VworqnecNa6QaN9tsNI3QDgEPkF
	fThSReED+Us6fBYhfYyDpQ1Wwx0YRLcJ7Pq4/SxXPzaku5O18djwSN19v20UiaH8qwcMzQxxwQba6
	yq8fVr/p+849ZE+H2xTpyRQB9B+leE2SAyfdQ9FU0NFjipAShNQ6nVA7YtFvbRQARaEMMmyLa412a
	l16zBatQbZf6y5zPoI8O3NVH/RpDwXSZjFHH7tnkK07cRgAhL3ZXhOPbUS9El69rcdewcZrZGotsz
	JgmyXpQtMYjdRWXeQoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3v7-00000000qGI-2ZgW;
	Tue, 03 Nov 2026 02:06:41 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3v4-00000000qC1-2I56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 02:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSTgky7egBDEr1rsJ8pz2fGUD8LvA4JMuycrFQGTtFTHVY8fqSXeKVVU02EMN4fk6A+FWXEn4qySdrQV5UNoNcCV9zRWjn2tQfXcUpmqE+T9zz7Cpblh+B5VuVPbOj8V56Def2MEgxL3Ablmuct1g3wWsz4DYASsR6fmKqyQbScyaY+iXKuzXHu6D9VwHU4hRCzEJ3VUTVRBBajy6kpj4i2kuNlxNbcx8LjZDCWx5n8Pv1N/EjnUmXSMDpeC7aRr3Ex2zhWaQKpPYAxXjwSckz600OjkKD1eyIDkqViR2TkqzVPXcNUQnBjJo5IMN1oo5OBmgc7nQw2BGulz1lWP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAVCWjC4BsIHCAKJErUD6oGwtCjcFIbrNmUrTaY5xKw=;
 b=qo3CoDRE5cZahk4nqg0ow8fs26RThN/asbtO7CjH18qpAixlZLZnkfn7YB+WiqGrEdIND2dsbn3kHxfD4b706fe+1ElAosUoqfaIxifvZHXP0MKv/1JPlCP5sCUo5CezVYHORrn/+waFiBrligpVr9oPzrQHkJPbU09QRGsXz1ljIADR0QzYTsueR0oJIH5uyRJ3Zx8qNVL839dVdQ045fcXS+SK4wJjLtqyUmFTq2DD5U74qkcDzciCuO6AaUKLM16+aBm6w7LAvuiefZH93DU1SMEuXvlayiPDn3k/peyUe/UdWdQvax0DO1Y4Rq7oo8KOh32PGlUCdDI5SfZz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAVCWjC4BsIHCAKJErUD6oGwtCjcFIbrNmUrTaY5xKw=;
 b=tyZsrFsZNMkgePf8P8bRjZbw/Pu2v7d4Vx4jGOWAOJdEP+ozHBfNYSm77tDUqiDSz2Or0xycY4z2MQYp0rCVtwMls2jhPzrupDGrvV9Z9PwB3UR1fLPmew9EoPGFZvLcObhG2BHtRqnJx77UOk4yqg6NjyuhMd3B4DTSFNMK21OMFBf/6SIxhKqIR9WGr4Fn3bXIqf1Zjt2KsKIlQpUfZOK03+iPY8rLG51uXO+L1ei6MFtGcXjJbCwQnFxYNQRnBj30XsZ2F3iuHrJ9ySvLLIKvnl08k7Umj46edVd8P/4iKy1xxT+uA52TmRmYW3tjY/pThSJPdIrAjZA67xEfpg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by AM7PR04MB7094.eurprd04.prod.outlook.com (2603:10a6:20b:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 02:06:34 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 02:06:34 +0000
From: wei.fang@oss.nxp.com
To: xiaoning.wang@nxp.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	richardcochran@gmail.com,
	linusw@kernel.org
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 net-next 7/9] net: dsa: netc: enable ingress port filtering lookup by default
Date: Tue,  3 Nov 2026 10:10:22 +0800
Message-Id: <20261103021024.3121936-8-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103021024.3121936-1-wei.fang@oss.nxp.com>
References: <20261103021024.3121936-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|AM7PR04MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 2103239b-acec-4ecd-0f22-08df394f15e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|19092799006|921020|261021123027099003|11063799006|56012099006|261009223027099003|261028144727099003|261026140227099003|261022075727099003|261026121527099003|261021121427099003|261022105027099003|10067099003|18002099003|22082099003|261102123227099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: eYX/PezkkYR+qiHNRalVLzcB/H43pXIjDclt+btFI3frEnFcZXvpPd845ARRIxHBToAk8XvQsmG9IpOYqcc4mozB7XH24jVhQ/TW+uidwRczYNr4WEsAY3pwlBJQouyDAkFp7cxUn1wH1UrREaN1B+Q3SqgVrAKkN4klL9sc6yf/ALs2Yie8GcJ/HL3TmXmwm23PzfEsH1+gOGDv2WDYDgisDHmldIz/nKLvm5e5N1ZmBZ+4V5FEBVqbo3/U+hJPANSWVS+2CSZNNnvU0fWEMUKmfTVCoTe064Y7SdEwjZ5P/kZUez8ftBIK2QIKqydtdxANHyORvtsg+FAyh1qeh3sKSrvc6JSTGMVEoEkz5yHArb+0CYS9a4L4SK3sYQUwzcUeoZIQy9QPkNIn42HjT7uXsex5i9LsZHjJDNPaCleDG1srNL5Q2cRJIRO3LySW+AyEICCF4eg0bw3CCTgz44XAncovYA070NS2MqfugNXuP+NZv7+m3S/qi0BM+PRe4cM86R98CN67uz+UaCgrVlQBrVMJignlv7m2LIjljz6MRh2pqQN1UfSFa9gNDzQCq79zOXPKxmCHqwFlpWm5k6bIxN/6XViwTgW0g6PWxIFqyeFZa5Wo8F7vjAqarqHXMIBNwKgX4TJZOXc0JAJX97QqQdTmn60qn0nMOG09au+UtBFn5Tc5RcGzltvPrrOAOMg1yh64XR11wZx79ODOig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(19092799006)(921020)(261021123027099003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261026140227099003)(261022075727099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oa+C1ppJ0XcPbLYRKCy04CqjU01CtKE50fQUr1znTAyNbyLJmQ1AVFEU1r7F?=
 =?us-ascii?Q?pRIdrQLJ//bjBsNup32zZ2bntk2cGiAE8tZhG0GbyILI3xCviZmD967XnrK/?=
 =?us-ascii?Q?Maz0RP7y6KQCB7WS/MJ/sOIpSr2EN4P6G/Ir4EL7oMd3kufGs20TTgw90glF?=
 =?us-ascii?Q?dewBM8Ovp0YmctAhYMyDiSBAbcXnYRfQlCvNv6Aga5T3eeZSJs9qncugo8VD?=
 =?us-ascii?Q?W/R1NyNgnq8jpQ5VNm+FALpCcWF9BNKdbqPnXxgxr2SbeBJhfJRuq0xIxOe3?=
 =?us-ascii?Q?S03n+/htVkqdyowd5q47xCUVGtg6ofkZH8g/n80qA+x2onzk/7aUNDFbg3T+?=
 =?us-ascii?Q?gU2dZVTldNrvCTCbjqckCsjZVS+k36sGaN4y82ZRAeGqdm1t19v+IPds6LSk?=
 =?us-ascii?Q?S/e3EijrfLAodoepCxbYI8UvcoKZVJRJG5MWZcXxbQP5J0NUX9Y0tuP4MLa0?=
 =?us-ascii?Q?8A/EkJL9LJNF8OxsPxHP8Milj2m3/b0WwUi3PbDlheol7zMDUilMD8ZfSQJO?=
 =?us-ascii?Q?bvMWQKlPyTwOywy0s6M598wMjKRxLR78TWdbP0hpLiaQ+vA9/2iGzyZhJ9L0?=
 =?us-ascii?Q?f7RFd3dBNy8XcZi2RxcKSmMItsgDNF/yBFOrqQ8TuY69NRHfB6FXvAWEqqfv?=
 =?us-ascii?Q?9tAlPAcEL31e1mhPKGa6MhF+eCMB2ZUfKs9lMDQ+vtRhtjPXM1EfF0EJiLJV?=
 =?us-ascii?Q?Ks+XukZuDvWQQ/sNegc45JwziJX5gTYRDgzSJRZHdPfFjl2E/sTNQPbneU8i?=
 =?us-ascii?Q?yIFfyOAXY5/ddyq38k0w3XNZ/fu1obMyKmUtWttBunJyzT8LMSQQ5Aif7eRo?=
 =?us-ascii?Q?f9ah8Zj3v7HWvek+diRe2RzM8Q4wAlY76xfrP5Ri9411MTk5Fn8tRDR8HfXU?=
 =?us-ascii?Q?PfmACRJHQZCYeXHu4XWRMdd8I0HG/t5G93quhgt4heeVQOHowQsZ62yZDkab?=
 =?us-ascii?Q?zc3ThK0rkaAbFUQHixKas4/jSNBJBkg/FOcteP+hgquxRyvivhbmrVth6tTG?=
 =?us-ascii?Q?qIWfhHtKPieYXDSscYGHWY3oYMVl6mipj3w91j6JtJaEkAKU1zLd4u2Tk3r4?=
 =?us-ascii?Q?1Y4SbhMeHDzpoUsgVUvjb7AqNJV7Dphu/Ll3A1WBMpWCfyjvFDPzmDDWvL70?=
 =?us-ascii?Q?0YT0Srz97i30+a1U/HSIvug/EUtp3JKW8vTlajLCZv1Ky6tZxfzO5K5FuVIi?=
 =?us-ascii?Q?WTg3yN0IGcmYv2nv6XLoPlAGelc2mzvAUmwkDOJrXGzquXwni1s5SE+YBfGO?=
 =?us-ascii?Q?OHch5lkeqFJsDoYKk8DmpzJagd5zpJQdVreg/DuZVuxS7kf2ysR4o5TjYbyf?=
 =?us-ascii?Q?VM7VgkQoNRT2YP9mTw28ouojRoGYpTkzqBFDrRRbDX7KHgyXggir1S1uDwCL?=
 =?us-ascii?Q?KAnbthC3MParPMyt0NywIRVzKYk/tE/XjMb5xHZEv5+NNjrPN87kEFlq46/V?=
 =?us-ascii?Q?MSHZRDm4P3TLAHwz59kEbeF2VcPOBqrmpH5KVcpwqmJr5iRgTZUvHqB0YU0+?=
 =?us-ascii?Q?DN3GYduC8d3sjiU7lyYdi0+OkprQ7H+1UX02RUy5o/bhywmV+FOrFBoJUbco?=
 =?us-ascii?Q?NTJAVD3VimUes62GTN+FyaD8AqvTSg7c0Ccxc8vuKf8co+Pq2JC5Tn5kmyAB?=
 =?us-ascii?Q?lys8U/xAHD/A84HSaHl2jjZfmjTEyPxox9VIGUxEC4TYOLj5Wrx7+Zy8I0QY?=
 =?us-ascii?Q?ihhF13dP9A+zGtnMZU1ps2BYrWZtb1zCwXlswblZhWSMS38EiUWVO9jwzmi7?=
 =?us-ascii?Q?r1uU9TnumxTwzSGD6sji8LLvxZMRGBZXM1lAkDH/ARzVDfDimy4j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2103239b-acec-4ecd-0f22-08df394f15e4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 02:06:34.3735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eSX1RcP2nMpI6DtJPFXM/OR0rRK5ES9+Ad9OcQCAaETsPhbx5+MV1Oi+Ws+Ejec6f7eCkgmy6jTdd0GJ3KV+pzEWWCbcVWA/rDoI2kbT43FSRaiv+GrySivTquneQhQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_180639_299010_D5109495 
X-CRM114-Status: GOOD (  14.71  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wei Fang <wei.fang@nxp.com>

The ingress port filtering lookup function involves performing a lookup
against the ingress port filter table (IPFT). If the frame matches an
entry, subsequent frame processing functions will perform corresponding
operations based on the parameters specified in that entry. If no entry
matches the frame, the frame is allowed in, and passed to the next frame
processing function.

In the future, the IPFT will be used to filter PTP frames and support tc
flower. Tracking in software whether any IPFT entry exists for a port in
order to decide whether to enable the ingress port filtering lookup would
increase code complexity unnecessarily. Since enabling the lookup when
the IPFT is empty has no effect on RX frames, enable the ingress port
filtering lookup unconditionally during driver initialization to simplify
code logic.

The only concern is that when deleting an IPFT entry fails, the hardware
will continue filtering RX frames based on that entry. However, we have
no choice. We cannot disable ingress port filter lookup because this
would deactivate other IPFT entries, which is obviously not what we want.
Moreover, deletion failures are almost impossible under normal
circumstances, and we don't need to be bothered by this minor issue.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/dsa/netc/netc_main.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
index be37e29cd650..2e0a9fc6b02c 100644
--- a/drivers/net/dsa/netc/netc_main.c
+++ b/drivers/net/dsa/netc/netc_main.c
@@ -618,6 +618,12 @@ static void netc_port_fixed_config(struct netc_port *np)
 	netc_port_rmw(np, NETC_PCR, PCR_L2DOSE | PCR_L3DOSE,
 		      PCR_L2DOSE | PCR_L3DOSE);
 
+	/* Enable ingress port filter table lookup, if no match is found,
+	 * the frame is allowed and passed to the next frame processing
+	 * function.
+	 */
+	netc_port_wr(np, NETC_PIPFCR, PIPFCR_EN);
+
 	/* Set the quanta value of TX PAUSE frame */
 	netc_mac_port_wr(np, NETC_PM_PAUSE_QUANTA(0), NETC_PAUSE_QUANTA);
 
@@ -1860,8 +1866,6 @@ static int netc_port_add_host_flood_rule(struct netc_port *np,
 	np->uc = uc;
 	np->mc = mc;
 	np->ipft_hf_eid = host_flood->entry_id;
-	/* Enable ingress port filter table lookup */
-	netc_port_wr(np, NETC_PIPFCR, PIPFCR_EN);
 
 free_host_flood:
 	kfree(host_flood);
@@ -1890,7 +1894,6 @@ static int netc_port_remove_host_flood(struct netc_port *np)
 	np->ipft_hf_eid = NTMP_NULL_ENTRY_ID;
 	np->uc = false;
 	np->mc = false;
-	netc_port_wr(np, NETC_PIPFCR, 0);
 
 	return 0;
 }
-- 
2.34.1


