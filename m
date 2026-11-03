Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B75606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0wu8JbYf;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CO8RmOsc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bT0vWlBzYyvjgkzDecNJSXm99tFnqBd4EIqtDjUFe00=; b=0wu8JbYfe0TYQRVKj5Qu4g/8bI
	apcYajSHcAw3pComDt8TngyY1+LwdoxPKGDfRufxiyrgq6WG3bHqfgumou/kNETGjRbPMitNwe2ZV
	8QOPfzw2T6+XA2YNVOxUibCJe8QV84YO7eHZvNOx/klaZ3DMwAZpKXzDJEMOsyizTKjK6HS716xj0
	k/l1nhwxuNuNW1YHsjVs7z5UatV5J+QDKtnJBkPXLS7zfVwhpqLPFfAKvGlvmU0a7+1uTsN1ZKiMZ
	amuu9Fsm60r5GlJAEhmr1fhL0V9tuqpexLdsgNCpc4/3oLbOo1yTjkZ29gEZ02wHhtE0pQFfg95tP
	jwDfdGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGnO-000000031XI-24eT;
	Tue, 03 Nov 2026 15:51:34 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGnL-000000031W5-3Ebe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:51:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gahwc209U9DwjDX02jlw8c2e9FHLh8E7r8Z9e9VzO4muL3IlcCZY1UiQ6OtdOMd7GTQ2o7CB/GyJznTdVA79UrCXC7e81RTzT4fbnl+jkxf1KN/SAm7eiDxSoUrgiXZGbwdnoQRfoCC8eWd6zVNKk7AUwWzLkW5ar1pzb+9ffyx7OVf97LBwnRlHy8AdpBmQH9fr0ZTYr5Jm1AmeS0YZt9Ns+ediv0xxH0pEo4iZbDistCvcVM4dAZNhqlbDtwGiJlLJ5Zzk1/46ubLMkDkfef0DSv/J4i4unH9u9Ox6Qb3GLTXyiqUzZ3KbI7BvzVoYFC84ytvmKPOCpXQ4UzZbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT0vWlBzYyvjgkzDecNJSXm99tFnqBd4EIqtDjUFe00=;
 b=GnAR6l8tz/sZsMD3NGPkqvikKL5oEA6KSD4OERAu6E/jkGX5hYBxIaLC7mVBvUkRLElo4Jg9/bT+JWDnGdf2IeQxJoFP9lg4zucQdwgZKE/oZUTbPa6yQcfm5DLCY9DFJT71yY/fo3LW4mS+NdoSH2XqC/c9fSbdq3Be/c31EGc0qT4hQr7Tzhcud/E8Z7vKisE8TTz2II9VqmJXFrv9ydszrGuHRnCf0QM1CqAgfOtR0NdMduYq2j8vb4PrVU+MPHYsQUcMW5o73SGyGRtkmE8rvEbF3HiiUFIquLdzTu3DDrp0BIShG43n+untroIMaKiqBltAIQMRoU1duIiyjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT0vWlBzYyvjgkzDecNJSXm99tFnqBd4EIqtDjUFe00=;
 b=CO8RmOscDvQhQh6vPDsW3RuXCvriE/TmIW4M016Mx3hEaIiTXUNoqHkEYCIF4v7/Vlp3eIDyU+/E1d9qFBdy6Ds6hNDUYnmD8mX7yWK8GrZSzXWNoGZ5okfV3Ck1s4WyDUZvB6HdJYxbK9MSfhZji8DcPLh9jrft3NoAt9SUSw3vAsU3P1hOsgGyIOK16/R2228mhdKFwUKxC/BuwWerIbqpVKjE+OBXkBsg54M2RT9iq4gsqj/Ro/37E1313gvu9Q4pw1xCJYibtUQRGh21vxuAUEviJDuNDYRSJj0czJUZaHw2JO5WyucElbSd7gnh8jl4gFQZg3EDZAyJRagT/Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7908.eurprd04.prod.outlook.com (2603:10a6:20b:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 15:51:25 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:51:24 +0000
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
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] mfd: stm32-timers: Use dmaengine_desc_set_callback()
Date: Tue,  3 Nov 2026 10:50:58 -0500
Message-ID: <20261103155059.1247139-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: effc3f31-6010-45c8-a270-08df39c2502b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|10067099003|18002099003|56012099006|11063799006|261022105027099003|261021123027099003|261026121527099003|261028144727099003|261021121427099003|261102123227099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 9mP5CioJv4JvcEsUFukUPvc72wIWK53BesU+qPrUldZEv4l87wGklyd+7l3S+aBtEyZCRj/EN5Obr9O8LuHouGmn+m0OIkcVABWxhCxjYT4wTdsob8x7p8ZUXtYuf0rLg6t6QU+kQCb8/ag5t9shen4x5pToaQEqum2E0vjB6Nz7DgFbJL2JMh+JTriGhvn3TbpMbHjcglcbZoOeTTk9slt7p+/rQBn4wTeqW5eTSRzmGjtG/n5iYOq7iiDO2ro39gB67aNrmhJ/d4X20p1hqZBIChxhTN8bqP/99qLY2OODuynGO0Ev2/yrAXZUNMS4QutgKYc3qVNJvpWTZxWVM3PMkcXYcUI7MRuo2IN8uIwxYscz2QZ9ZwGdMEq5w5/HUVZfx7UZ8MvxUIqlG71pCuidGp1xl/x9rNz2NGzFZuSP6W1K2iOdbZdCdTxLcA8jfMQCDuZeC73lL8Gw+BwOZN8tlUYSxF4o7ty/GgaFyB/BOCp3BkngImKbNLwA5DMbffgfXG3dU3XYTpdkuQviFs+z1oswU30L6Sgta6faTkXSld2CBzH1LcePrpUcGPPvTFlNo+n+lGZMa0zjbocprUEKUrkV6Mdw1+JatprDbWrSqIOEfIARRe41TZVhM8pdQDKTdco8MJUMG/3qaZF+3JmyBrs7U+5zHFygGIuKBtc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(10067099003)(18002099003)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261026121527099003)(261028144727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pN8UdCJitvnNBl6CvvofMEvaPCycmliFNa8PkQt5BQLOYzWOhZVHZDbHtc1G?=
 =?us-ascii?Q?zx/jkeSMbu7+XrUgjobm7f3lZfNq5WxJ8igJO8LKhppV9YpyqaRPJGryRxw5?=
 =?us-ascii?Q?CZoQPMNnxJRwCzrtC8YhA368zyah1MzFUa44SaaRiqx0d3sxrvqBDNXYn2A7?=
 =?us-ascii?Q?2wJi++utxAB3vWKwWE9pUuuSULiKstAySzDeX+1SY84jx/2mziTMQfmby8Hp?=
 =?us-ascii?Q?5inqBvGhtWS/gKdNlYsrk+p7ADH38vF/Hdx8RR5gXi+ZyOBlLRqH/y7C69Pg?=
 =?us-ascii?Q?wSyHNX9QcJ9NQCC2QzUdFbAztkuTbYNXXbWbQO8cqBIxa29ycdhtZpy7hcgQ?=
 =?us-ascii?Q?R87sNVydqb2ty2zMS9E/vO+jpDDyYj91/hA63XlE60nOOM86/FApw/Tvekpw?=
 =?us-ascii?Q?SkLNuw+JM7TqwDNr7mr4tt/w0v5tTScadATGpFeKXxONvW6ScJYYgWbD42N4?=
 =?us-ascii?Q?VYhp+AVZS0EW/EThPFzFhosbzYjZh89HC0fC84GZj4olfZBt3WWtos3PthOO?=
 =?us-ascii?Q?wTAWUy6kZ44TrIiV/hxMJlph5AFOb4UXWaCC7hKOWZADhy/HBdXZ01OqTcrh?=
 =?us-ascii?Q?XEPFCHmwmXADcKrKbtHSUAhF/pBhZLZ0+QkLnxJsBqAhz6GBM2V5YYV6RYjf?=
 =?us-ascii?Q?H3tJJDt3IHyhTonHPebv33Wf9h1CAkjzYrqsrR/EhB8piNrgu/4o44tKQet6?=
 =?us-ascii?Q?0ZHvctyZ18XYCbQlbLJIdpsdPRK4MjUiU+cZkKPYIewLQDYk92yWz3uFAP7t?=
 =?us-ascii?Q?xzGqMHY+pvj/DCpUxiYhf3iYIrf3iAnrvmN3BBgh+4wnvNBIkYsDoJFv8BlE?=
 =?us-ascii?Q?avT4+HE+elfw/NmKg4iIw61+MGyG+yNSvX/XKX4hD9LY+pvrEVu1KXxSmrsI?=
 =?us-ascii?Q?Iya7L+/7kTiQLIOwZkjMVvdeAINlF0tDYgsB9zitmmfl959JOOfoi1VbFDjp?=
 =?us-ascii?Q?UlkzwfnvJjfFCTRgHQMvzsTAqI+Stu1m9Nm1gkPSNYmtG+sZ9bpMfXrxBMRW?=
 =?us-ascii?Q?v4uu/lPbnI3fHUtI5pCO6V1ixxKUIDT55wR4D5EyG+QiGTLclhu21ZLsh6WF?=
 =?us-ascii?Q?zkbTJlWWSMFhUcyN+2Ggjwqvleyi7bMVjWGf6jOzheSC4+IyNHSpIkoF9IBD?=
 =?us-ascii?Q?Mv9cfXP0EuHiG6tm4h+ETRmtu5pcRJcwjmp3h/O16JoFNpblDb/NpEHRZrl6?=
 =?us-ascii?Q?4Y9ec1+YlxZxBwqbajiWrmEwXstPUY0wCee/KIDDnm4CgPRdVqB7b90ypOUO?=
 =?us-ascii?Q?2dF5ZhT8Z06lka9xBrqPoH12FlnwZDci+42J9ku7zP0jtOiLTP4MsF+X6+uh?=
 =?us-ascii?Q?4h/0uMLp1mOXzqOVFi8LFtVyAefSnf4/zTccFi7Rm2yungAWK8BvXPZ5Y7rG?=
 =?us-ascii?Q?etHVLwU5Xwf/qpYYLxY7jrZELyjrwEwGgupUXOK3RI5G6AJ3cF2KdKh62zah?=
 =?us-ascii?Q?vs66Y/nrmHcn1/g1/fBC4WU9qU/ip7QwNak6IvIlFamQS/H8oupNA/abTJPJ?=
 =?us-ascii?Q?EU8P+U6HYhUsZRR9WbiROo2ZHc7ODeEIcIg7m1ciLvmry+ycFPabtc7P4F15?=
 =?us-ascii?Q?1cVL1fSVUfHvLRwHYY+NDsuuxy+iJQdZuXeEI64+Q4m1s832vyVedQwvndfj?=
 =?us-ascii?Q?Wt9LgnSj3usMZkskGF9OI48r9DH+XauNHIFrK4NKCf89WbixTAp9PEdUt1p/?=
 =?us-ascii?Q?ObagXPBIo1spDqz0CDW+yhOxD2H8fJyRL3ANI9gyLboYP38uS8CCdxXZGOou?=
 =?us-ascii?Q?IEmzUcMzepyxNHK44OLxfm7sp+j0i9wNhOBzsWXIPyrhS1KLg6M9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effc3f31-6010-45c8-a270-08df39c2502b
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 15:51:24.2064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yOyPatLz8rYrJjMLJ1P8YyXLUsjdpjLYCWE9b3APT3iYneHpiNHiqnYmpzYDpXovE0M4bRfVRtSLtssjCjFWDaRbmD378Vc1oTOkatfPOeeoXPmYAu+l4s0DPOCUkyP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7908
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_075131_821120_F564AFD0 
X-CRM114-Status: UNSURE (   9.43  )
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
change in v2
- Capitalize description at subject
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


