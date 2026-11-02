Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6298C606A338
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ndPXJof+;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rEw+WBij
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=s2tcK0Cc3ep5KvjWN5BJvi0CbZ+xHrd6b+RZvnPa0Q0=; b=ndPXJof+Ycco7YxehCr/1gmPB2
	12XmoRk8K/IwFPPX34AyeDKvqEH9kKJR6qyzwNEwYIvXudCFWcKVunQxDICh0VepRodWgntA6nQYv
	KdbmpWuJ2UoBitI3OgP1eAds7rXVvyMts2GftIvFTm2q2J8ywNiqzh+Lz6uQeG9H1UG2ZYhVaVnzU
	4EWS7bBLEpgLw3m7L/TBrJGFhoGheb5mxwWQHwyAMnf+sQfpzNHfKzNvWqorwbJONS3bGqQVIDmwn
	nAvB5MTiHLDyOX4rOOg4xakLQiuiDGwPtlBf6kn/8ZNY12X0CBYcPyETMgyXHY0CqaNvEY7g0KnSP
	7MPBCGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw7j-0000000HWHf-0GIZ;
	Mon, 02 Nov 2026 17:47:11 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw7f-0000000HWFL-18Ts
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:47:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/4cBFQP48YL3pHQ2TL0EUFikoZC8xw41zOnyTzfxZzFThxlYxQMmhyuFfMPAwExoF1HXbzzfUQVu0lEijsBemK3dkNEhrPinLrnmO0m1kmJrd45d/Q/9M3rGGwaAkmKM/MZyoqKtwR3D8i+C81YSPPVLKLyBWsFxCGeTK5E53lO1RQ0pUkRIMDYxVW+C1ehdH+PofmfJxLujNYEJjFlycg+UCI9eB3u79tb7jbZm0OY+l5GHcN3/jgcL8hmh8zsqAvDhcWh6XfdJB0C0/jIWEvCfEhSZxEg2Ac3VI7xz04CUj1MdsnUYla7vIPHEB08Mk6m+BjR7u+lYwvHOoNYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2tcK0Cc3ep5KvjWN5BJvi0CbZ+xHrd6b+RZvnPa0Q0=;
 b=CUfhzbMBlGgdmKyn2GAQipYewcnf753UbNxIRAqeTIZcelNpznPfk1rt/tKECbasKspq9viovXbwtgfYpPLkpVCXs6IEtTUq/Qbf+AhISSZoXA4n9Stjhf60+FXPYxuuSg8dadqMFIWBO7HlqTNto+fnhisUUZgHr5sW05ufLugx9eV65dEkzzE5yaOMAxNSnvljkNne0wDMCdifqXyoXrtR5CcQhGkULzIEXZuxlpoRViS0hlJKO6KzT2ekMNKmoOW22D1ur8Yu6bwji/RwGJXjv9Xd+9q2vYRdYFSoDS5HC3Hn0E4yjAIhBAeN17EA8nr15UpoLT1UeJwXC/Rclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2tcK0Cc3ep5KvjWN5BJvi0CbZ+xHrd6b+RZvnPa0Q0=;
 b=rEw+WBijspKNHEEt1qYezHpsv3Zjtil0oZLtPNpoEbnv7LiNle5/EVUZUBa9fIdAFgF/9YqoiJrh7Nmojdir91tlQOLFANrkcqrK1Pio7k2y8NJsvaq0Yh1N0TAZYQ2UyS6aBjCtzHvmzC5H7de95ZfNctJSzSfkDWyTqDXEWopPMB+aNuo32P74nZCmAqVCImR2bCquVHlCMZXQ78NwEPPI33RhA7XpCD3egf63yV7Y8fYGrylZ3PWSV0A+Ukyek8ydpgfV4WnvhHFPJOFC0SWyyfnV2kyGnbWOUmEg6gL/WQJZCvZZwt2yXkYSfLYA7QTon8uizO88v6HeCbDYFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB7495.eurprd04.prod.outlook.com (2603:10a6:20b:295::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 17:47:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 17:47:02 +0000
From: Frank.Li@oss.nxp.com
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] mfd: stm32-timers: use dmaengine_desc_set_callback()
Date: Mon,  2 Nov 2026 12:46:56 -0500
Message-ID: <20261102174656.3939832-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS1P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:451::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e212bcc-3543-4505-1a90-08df39094d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|56012099006|261021123027099003|261021121427099003|11063799006|261009223027099003|261026121527099003|10067099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info: WJcjniOzVGW+nsD54xwbhLeNidLO9GnbdEWCFwU4Csz/pY6OBmsKzwHTJMM/CLPAA3KSLO3nMm+3JekmRiITGTxJv6HOtO5wEs8H80JY+sar4tqZfpxJz+qOFc23SEBGMNw1AZribtHhHkccx4MumRCC/2UcXeFgiIcZtL7QJxqmJieIZ7UU7hLLTJpNA1ECuwdkGNqZ/NAPW/Us0COUEQs0lAhW04vVDyLzNcRkD7dA1Ww/ue/GcdEhUp3iD5ND4sMHsZIgRsrGOLTfx3yo719vugz+clNOL2i8zaZqA95pS/N39/9qaZxpxOxPmR/8WD0y5kk25/AmvOQ3LEBN95SKghqof5EoGKIcbAhK/jxVGfrR0pOo5J7p1HaS2w46UfwDGp0YtWsnQb1plN92EcOa09G5wR45IvNXLrkjoJ7ZljuBFvn+gF4UpmRvDYktQ8WC+gSZyHKxCklhBedxSQG/it3qtlEpaq9b/MV6/IrtI7B6RQmq/eM9FbDUDFiPd2KhT0yaMS843Au27MnURujAfz4U5s9xJxqZHaYu1nCEyKEwjkRoiI6m4IKpUcm8EhXXsZpzQj5G2rcWiEfnkgbkTHJVhYVL5q7FiuQQa0I6r8X6R1pR5fnia3qAchsXICCtPSJQSwNkD4nSbNXn2jd0fP07/iey/QJ5fm0uU90=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(56012099006)(261021123027099003)(261021121427099003)(11063799006)(261009223027099003)(261026121527099003)(10067099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4gJilw0yzH30crnd5gwyyxfZdxzAfTxxyyhdzUZDPs4onh7ZAeH3VQvUjLHg?=
 =?us-ascii?Q?BByoRvhstLRFRpmq0id5Vfq7yuh1pr2swAvHxkomuE9Y24APdO4dF58XvF/u?=
 =?us-ascii?Q?bRfbmwrkb7EQpFKIzoemQ2qVEoIwe5CLAkykmsnzvvx2GPh8ggs8UNACfpl9?=
 =?us-ascii?Q?9bI5c/KjNwPmRPZ9Ilb518GQkUnJpjzA/DXmlOBolc/UMMfHIhkWodyBfi1k?=
 =?us-ascii?Q?Au6Qk1UgzqoR5hcpYNHsRZQagGjQNbE6aMjYKrftVcOnGuwMW0NTzHTTNsqQ?=
 =?us-ascii?Q?nWIfRo8mqbdnhtEYfjoM7KKIcyRTlk5Y9RHrnVujAXTMzroknwGGu7M64XrF?=
 =?us-ascii?Q?GpXdumiYZ0fZC4vz0PUxVhiXbEt4ydt1ejvw3jQnpbpb3vEex89DGvDtIHAb?=
 =?us-ascii?Q?toxJxAZdwKn73gXNrhdy3MVXiyuUyH+hnJtnk1Ws+Miya3iY/UFKxPn4QXIW?=
 =?us-ascii?Q?8zBe0gAwOp9VhfFqX4Lg9jiCjrMyluegnYKM+5wlXN9RKIxAVlhWc7dkWUEt?=
 =?us-ascii?Q?DYuT0xo2oFMlVP9lkUMI+wHUgRQDH3eeIXqzRDhp9ktGyIjqhLB2wkaR8P/J?=
 =?us-ascii?Q?OONkR02MOIwxzS9XYVYkEfwFz4uiQIR7NKSkEeBzBebxgRBdUQ/RQ0eqUDEK?=
 =?us-ascii?Q?BArz/9/rzFLxsiwaz2n7GdTEcX7R8nQm32Pxot5WZOBxYVBz5Trjv5042Xf0?=
 =?us-ascii?Q?3FAplaLl77b1ZVe1Ga5s88JegAmm//csC+QhX3qJjC0pvlPCd+JvMb4GeGtI?=
 =?us-ascii?Q?WnIF3XFrr/eD+y2PEvy672BHDn2LaJOoeHvhX2yZI7s6PhzNXY7HdmSX3jjp?=
 =?us-ascii?Q?qnujosbJyY0PD6nrVjPfvYiIskmbgefjCZEqvOHiyRMWSzR/+N0rPnRzc+n0?=
 =?us-ascii?Q?5LYu4Nx3q26+LCb2N0KG0EfggEXNOGOqMX7JGIkoYf27PpWCtYOIfg9fV8Ij?=
 =?us-ascii?Q?AMuD6NzwAk2FYVslEJq3X+zjkt0X1B0EDAOKk/F05p9mkxWlb9VOvqIXkLKN?=
 =?us-ascii?Q?jNscuvzlYQtY7nkoZND71WtolwhVVCplXnD2zO+6pZFMMhUahlAEK86+GSxI?=
 =?us-ascii?Q?X2xmWQPDkoiXmMdF/jWMFZiuX7kpsmIBttF2Mp+/4l3CshdcCzwbyU9wRpPh?=
 =?us-ascii?Q?LT/9UyRC4YePIGLyIEUDPGsOh/eW9FgVionHsCx8Qhk1iJP5RxJeioKI4n57?=
 =?us-ascii?Q?TyUdt1a/kuueOdmUpaF193qBkTiVgc6eLxdzogZA6HVHwHjO7C1oMMDQBmpv?=
 =?us-ascii?Q?HeSiKgOn+4zHqIo9l/vXWbp6Qn2nUZwxlezO7MABGbK0q9JuX2fe1rlVWLUx?=
 =?us-ascii?Q?qCD/TzMtfyWgi8wscOf0A7btc04fNCPbTw3gqyQ9bQglVgQBbgYdbeMAJDai?=
 =?us-ascii?Q?Fv28Q5QwqyvKle+JjQVmKZJQrz0x3cZ2CurJrz3TE1L27PaJfE3ebYxJy07J?=
 =?us-ascii?Q?DXRNcsgsd19EHSFT92nYXb57EDhNHbhlFWAfbDPFHk4TRZToYs/wGByzuyrW?=
 =?us-ascii?Q?u7YOWvxjZwSlbKqVM3mUPQUZXNFVLWKPvqFu/M8fmjTWx5zLnEgErp06PfaE?=
 =?us-ascii?Q?pvOu0mkz28VrAhS514SFr4QxGj0pJxoKyO04PWWaObWklaLsvgzqMP51jmzs?=
 =?us-ascii?Q?gRQcDDYBQH9O4vwNqwGIoYW0eNXCuuuxlyGXSbRIymYVJPwaKP/LY0Aee4+s?=
 =?us-ascii?Q?Fj8aznV+uZPzw6kJ4IDI387mAhEheFL2DGej9DgzcTV+Xc0ZWFrKiiEY4Xm4?=
 =?us-ascii?Q?q6UthysGDg4m/YDpmWVboFH09Os8+JrCQHas7gkW8CBTwK9JLC+R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e212bcc-3543-4505-1a90-08df39094d55
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 17:47:02.5419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X60JWWW9q4Q7W828jHXC96qpsR+pcv/HDOpe697xpFcY1nK+CTI+wsiavCmKF8a7wSkmMKrLq9mohUDeqPNsBD/ElCSTWbM97FCsG5LZDC88SDtOGtFgHxkMovO7HG8B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_094708_728639_E5098883 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.0 (-)
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

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with a call to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare make to struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/mfd/stm32-timers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
index b3dbc02aaf798..4f344f2a5a26c 100644
--- a/drivers/mfd/stm32-timers.c
+++ b/drivers/mfd/stm32-timers.c
@@ -102,8 +102,7 @@ int stm32_timers_dma_burst_read(struct device *dev, u32 *buf,
 		goto unmap;
 	}
 
-	desc->callback = stm32_timers_dma_done;
-	desc->callback_param = dma;
+	dmaengine_desc_set_callback(desc, stm32_timers_dma_done, NULL, dma);
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
 	if (ret)
-- 
2.43.0


