Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A8A606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=URPFRj62;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Cfp+gkfy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UzQfDTRTmS+gaX7dqM9/WJ8Qsplgm21FfSEcaEcN9j4=; b=URPFRj62Krbwha
	v98m4hL4DlJ/mXvYlUIvagJfPWhZ+8AlyPb2JPBj3K4eiB0/y2WdasEIAm80cNlGIfiN14gZVN+ww
	UlHTAZVoCLY8plAGh4W+Wnyx4pXjE2SJM5RSfVUvbAGzUsIE/fHsFHY0tVrp0lMlGBzobxZJYBPCC
	jTndwd5BOnYPIojFbrRNGPE9Aq5Ae86oKa3incKPuaJ5ptdlpmVS5vP4tdt/43drq8kOc0ZJY/tTt
	/N6vSAhEqrNd5/z1c2psx53Z8tOe4L0sibydhDOxZ2FEmJR79qDnvGM9ZBkSNK4WEH1beSGSDSict
	7oIWxg1Rt2FVpOjIY1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVZf-00000004YgT-372v;
	Wed, 04 Nov 2026 07:38:23 +0000
Received: from mail-francecentralazon11013047.outbound.protection.outlook.com ([40.107.162.47] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVZb-00000004YQ4-1sxb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:38:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxFDaszw6h6+jF1vhYb7DC5HYhiM3/3DHfwQP7Iz86kyKJMLU8h5ClGmMiWkRLKgDBaaqucp9y3bcFM2ixzORuLzRtV2f/uvn5egeABwInPb+UOCWkJurO+TDgodFPpUx3aHosSjoOHK/toqNRBXo3N972TS1orUHtbhI8sM8GvquwKshGmNWg/S5+PNsn2ts2LjtCQMGA1ZXNwpGtdd8F6CulouaQaihZ04A+41fg/JxrxYBfauUkQMvZZY6w0l5UkTFYwX5FiKQ5RlBHHQVSB3Gscu5lG4eCL6M3me0OFIfDTuEDrVLRqvOURa+QNNFin+zLzXzwKYcclzKLwjlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzQfDTRTmS+gaX7dqM9/WJ8Qsplgm21FfSEcaEcN9j4=;
 b=fO9sFnMg2pqvt+7yHO95+4Ng6YZciHrEAhvQKRryF/NKzVwP8mDL7aE9+wQz9lnkKmlVQ08V+QUNbSyPbkad195tBrWyuknTlwwVxemQeEEz8ODNzg9rekX7Dc9LGO/s31kDS9SGePk7nDo9C673jP20vjiRHe1EvrPgKfvbAyQCCeRUKjfhb1Ihl6LAM+RmMcjwhOL2/TeTPmqZ1KibvBFInM512MlfhZPKD4yPqoFeWxQx3Lv7QcH23evXmzG8GFDTp0tQdc25dbegq5Vb3ZhHbUGDhAqFO8TMKU+MeNGTdgi4v63FR4rLds5SCbTHvsgfvIlK+mUFFXaNZPDVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzQfDTRTmS+gaX7dqM9/WJ8Qsplgm21FfSEcaEcN9j4=;
 b=Cfp+gkfy/Mb2+ke8zwqGi50lC6J8NtC25SFzpfyGw6mGuGEp9fv7raGU9sr8w54UnLzOkpFIGDKzjgpHrHSPgOZPwd72DIHviBgVpvZsAqHeyNyNM2xxwzsNIcJWeHE5hGy7O2YrZXTpvUz/dip0rD1ZpIQ14lXtcX7dhWcOmjFSP8zpt08s07CUT3SUmwMn1tyoaxdGWwu3t56hgdbOFQR5YODPPvaUrp9SKY5tLWHBBp9Zmy56u4i27qNyXUF2ILBzjEBzduRvBr6dJmZqYWqyklifw6o8fkHavm2avdJKzrF1bbKpQ9BmbPMuuFQ1DBxKqqf/fbjpMx+F7l0iMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:38:15 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:38:14 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabio Estevam <festevam@nabladev.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 01/10] irqchip/imx-irqsteer: Call chained_irq_exit() on the handler error path
Date: Wed,  4 Nov 2026 16:37:49 +0900
Message-Id: <20261104073759.386777-2-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To AM0PR04MB6849.eurprd04.prod.outlook.com
 (2603:10a6:208:181::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6849:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: c6413cff-f9bd-4974-8c03-08df3a4695d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|3023799007|261102123227099003|11063799006|261026121527099003|261022075727099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|56012099006|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: gt/JDGuGTkTSFizJRnoH0aTXq3Qz/UjrdxztqozNYXjMuIkeNxvUJh6tPKs1Hy8ZT/oLVqwEsPhR68dcPQy9hkh9ztW2lCX+XRSfIiuciPhygG5vCUibqvuJIFF01mfoyki/SHb4m5WZUFPdLB1uJw9Bnvff5WPxE7UzC3KNgYVfj1Y/4rODKu31zPc2rlwrsyW9IaqP6s/bhTg0qrEVQQ9bfCc6L7AHzn3OlaSoFycMo6i/WQ3uPTZWVbocsem12IJR2HORjiJEP3KAMXermtLAgKpSCvCnJ/bs+trA1ypUmLsaBFAhECC6uo/yF3lcBMmgplZRtA5k93RSA2qfemsQLwoledO0MEQArkux8KKWaRXBEunAWud18Hch0KgAKHmpzo/clhkFkKmJk0jfBHsl0/AQ4PknjRL8pJ4HOAzB8i64gvw3ZKFQ5tHoAoazdO7NuTrh0e0PPjIL5VLnLSW2ogfnn2hq2lFjHrL58U+PVQ0rQfux5vJWBNAij+y7nrdHs9W8N6J2FgMnMmStwJ5pFqhXepXoNEQoBbyN2UawolKsxSBVI0upv1+Pu8goSIQTaOlGySh2D80tAEjV/D9VL+OvBogSf9qDZlU+MMGZHTRleLoEayoPkN4gASPOyr0DdzorQZvj/N8h/E557PwZB+FTa4r4rhAUsqk5/18=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(261102123227099003)(11063799006)(261026121527099003)(261022075727099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2EdQ4WWo9YND6qMYfhFngcFjyVakPDnYy6LAnX6+/Fde6vJYIPY3rxF1e/ql?=
 =?us-ascii?Q?00B62K3F16dIGHJDznthkJxVoWZQA09TT3VqgG1Ys5RedQouOhKnrcJD51oc?=
 =?us-ascii?Q?A7rEXf576PNixYJvKoOns+5+vQzy5Zsk0c8Qm1vkrH8bxtv/HWJgCcMF3zVy?=
 =?us-ascii?Q?ncWUt6TMBmEOWyWgEWQmfAqXrIx7gpsFIfFFn/eNn0FIEnhQwMwijTa1lZgy?=
 =?us-ascii?Q?LCyftT2VyF2nM535vHN/QfKUkZwhQiSVMd16NuJFW+wpnMf8LSfhMhP3HjMh?=
 =?us-ascii?Q?lMINJAcgeqIn0hPG8wYkE9lvJk3HWhgJ/1Xdb389s1TP4L0dIN7OKv9FgfeT?=
 =?us-ascii?Q?x5FZHWd5VX6RtFVo1QzNT/zIDZlwcKCg9yKiK2xE5kgA7w+wHemXD6SzkJMp?=
 =?us-ascii?Q?kbsDZZqUjWFogR+ODVvcRbhtJPyGCTIlBHbgH59fF44Hwgij6xTy8PW7C52o?=
 =?us-ascii?Q?y/HdgKovC0WJ+V1VtOTmujdT3ucZJ3FdgSRDB1J2I/JW4YxS6N9SK/QnWcOr?=
 =?us-ascii?Q?YzBRDeDN+mPruXHmV7HfsXmfRsN9T4H0FjRrpVMXwOZonBqUUnXLQ64WiyS5?=
 =?us-ascii?Q?1RdXEbKZKnt+V1UFoC+bHOVR7StyL208WUSlTHBZ+JMW/JPbkQRzosaAxmrT?=
 =?us-ascii?Q?rnPgpIsDultlJUgdniK+M1QoeICBDy1NPSDEynM2NE2yZUGnadNk08f8kLAo?=
 =?us-ascii?Q?/U1tnWMgcFznmsDHEkEoLnnR3OrqYmhRI7lLA28wRKkfi2dvqblwHTDZ/9jB?=
 =?us-ascii?Q?So035vJYebhMS7w36u5VLDLDPpXtzkDOaJHBC/UzdRfeg5dmnG5iqQL6O+AR?=
 =?us-ascii?Q?9elEM6+WgNkmVWJHhnUDbkYBaveOL0X7fUxWjxrIf0rz7gqU52nkdz1wpelz?=
 =?us-ascii?Q?wWmC8K3E6MKB4CaROzxBwWW9m4RZXBF/dsp+el6wGFhkqVo9p+qYXvJnjvNT?=
 =?us-ascii?Q?KMg9V95tfpvYK9FVvfw60V/MitQvTERvVfa4i3XXllTzklx7kpKjt6QJSbGG?=
 =?us-ascii?Q?2yehjvRMbYAOG5oxnh1SrHT55gvkniCsbRyy4Sy76kj81ObLiP1TDBB+Oev7?=
 =?us-ascii?Q?syZN+UQusQW3jZEAY1ZZC/gjltIM7ELvBa8y3GUq83YcnK3RHQ7sQzbZ18wA?=
 =?us-ascii?Q?HWgBv6ztRfwjvjCZNqVCWbj5UOFt77GQKmk5EehCq2NJu0rgKqPcHuw+nzao?=
 =?us-ascii?Q?+fSRmjSCYzKXQ8Lu/ZzHdZack9ynj/x7ga124ByeWcA041eZjL5BqSVNzXLl?=
 =?us-ascii?Q?wq2X5ywg2rLe8UaZbKJG0R2tkuvvuw05SsGsnUgFSSMyLXbMp13auDheO7+s?=
 =?us-ascii?Q?uy0P0Tt9w7FrR5l2AJzVhRySONe3af5mLeiSNFHAuPK/2ALPo7hhkBUNBrvM?=
 =?us-ascii?Q?eeipBc7Yekk6PaicwKVbI+L+JRf33H31QJejK699b/X3/OSJvACB38oPZUel?=
 =?us-ascii?Q?MfHyto5QBx6UxIrSmyYHA/ZD5yO09L5be63dzmtpj8PbBgEDx76hHlQfn8ye?=
 =?us-ascii?Q?9JbILILeZHyeh0o8UJ+cg5d6HV2JUY1K70J+FsKuhTjLFEfTwIR4oNUa0o8L?=
 =?us-ascii?Q?l8gRQOjKo9zUZ1L4P0uajnYVBykExXwPSzzLqRyqqPrA7omYex1DXsz2PWo/?=
 =?us-ascii?Q?Zhf+ho3Nkg6Hn9JYfd82ciTTQhfFawIclhJFaSbNQ90MU1PYCL9FgaoYb8B4?=
 =?us-ascii?Q?9Coqw6iNKevLWZlCf+YFV0IPopGGJ3hruYKKb3fLkSi+0WcoxBRRz1rm3w3+?=
 =?us-ascii?Q?fpSKuYG9zw7KWgKphaxq82bccDWpRzHWsqRS+ByaLg6bFONxvv+58AmHN9vz?=
X-MS-Exchange-AntiSpam-MessageData-1: kKHVA5l+4OTPtA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6413cff-f9bd-4974-8c03-08df3a4695d6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:14.9059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFEJaEVLUJ9VJtYicgxz+MhdN3rAfFlPyijsF3sFyL105eaFwzUd76a5Pxe/hAKiXA6e3myIKl5d0rcj8043e9JfvhdPft0UFK54/yr1QapWCzD+Zud6a6dVB1+CNKnW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_233819_568116_D0EB46A6 
X-CRM114-Status: GOOD (  12.31  )
X-Spam-Score: -1.9 (-)
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

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

A chained handler must pair every chained_irq_enter() with a
chained_irq_exit() before returning, so that the parent interrupt's flow
control is completed (EOI for fasteoi parents, unmask for level-triggered
parents). Skipping it leaves the parent interrupt unacknowledged, blocking
further interrupts multiplexed through that line.

When imx_irqsteer_get_hwirq_base() fails, the handler returned early
without calling chained_irq_exit(). Route the error path through the
existing chained_irq_exit() so the parent interrupt is always completed
before returning.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/irq-imx-irqsteer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..1b8d0c8eedb9 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -154,7 +154,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 	if (hwirq < 0) {
 		pr_warn("%s: unable to get hwirq base for irq %d\n",
 			__func__, irq);
-		return;
+		goto out;
 	}
 
 	for (i = 0; i < 2; i++, hwirq += 32) {
@@ -172,6 +172,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 			generic_handle_domain_irq(data->domain, pos + hwirq);
 	}
 
+out:
 	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 
-- 
2.34.1


