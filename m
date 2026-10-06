Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253BDCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 07:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snt3z6lX0YM1KylFCj8Y9+bIZo5gvJmfX7t7Ui2nSqo=; b=FDLYO+B+/AWcxaxZI4/BHM9wFk
	IBGt5PhhOmNghaBIvUGaAHTzm8w92I4Nx8NJV3GHtXBg06pzjVyVeUa/Wn28r8btLzOyeUaif2Z+Q
	RW8HcGPe59zT/h/b0OWvzXUy/YIYBkPAeaefOzOMiLYzKkccMKkcgR9GRa9rrdI5BVmL9SV+LZCHw
	pt8D3WKMqg0ttD+ADxDQOkpJB6HuDy57eFFnExmyVdX+V7d+xmQ5VKUAvKzJM2c8BGl1kjZR4uPK3
	RzTyemtoq3uaDaQsyAfjiEF42eKdz962NfpUlH5SXy3swsFf2gt+DHPvWX4bz6+pNIXEu/10SW58D
	A1tlq4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE04D-00000000F9o-3BhA;
	Tue, 06 Oct 2026 07:58:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE04B-00000000F6l-16Fh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 Oct 2026 07:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=snt3z6lX0YM1KylFCj8Y9+bIZo5gvJmfX7t7Ui2nSqo=; b=CuGlo39P/lRNuvLPrbF/hPKZPa
	NVVx/c0Yiio7Enyeg2yamNf7S5EB7xmSLj7P1iJf0m730rY88Wn2dCdok2waW3PuV3rYtnZlR3D21
	qrhtzv3DNte5G7n9/6Am+AzhGptD7MkkO0384OLNBtKpvBKvjXK+xS5VXwxyzED4VewfKqGfTFaOq
	lWBhPHwVsGpqnx1Ho6unYOu1Wh2434UprhT8NOAA16f8o4xOrydesdgAOkJdP5dLsMj8XD0lvCvwQ
	cMwpZ+VdgQmRlpBTxMSjF0H1Y7rM38NRft1pHpYF8IbML8DZnriTQmWEoDQklfJZn4cTQFnPmjO1Y
	aWyIj3Cw==;
Received: from mail-norwayeastazon11013027.outbound.protection.outlook.com ([40.107.159.27] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xE044-00000008Y3T-25qT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 07:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9LFB5pSrKakRYHB+NYCC514a5srbM39oBD/Dq1jcC1nViIwS/hRV9K4PK4Cy/8nyI1hRjES/ra+A75BA585q4VzNeZZ3PI0+hC7gw8+j0vH5ihdCLxOZSs3Dt4rJf6DLn2u+mQY03amEoYHbvyi0VXBJLIkMZg0GgsCHVw33FrqMBIdGodaRepQpUuteD35WA5qCh8lpKKUlAcN/xZVi28WZHyvPWOKe6kFy+qNT4n68F5LGjtfeYU46PupdbAg3mudOP9SKeRKrUwBUHbtAhh48sb1SvfY0FKl3q0VSXqR36wqeGFHGsk/mLVbeIplsuBWPaialrk7q345I8+xWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snt3z6lX0YM1KylFCj8Y9+bIZo5gvJmfX7t7Ui2nSqo=;
 b=mQMa8q6XZeHxP/IjLt010DpdgvFl+5u4rZNjg2tYq72Vj6eM9pWtWMizRwVR4UoRhrKYwX964c4eXOxSMskAHiuyZVeQ8/9n4gWBbmvE1MmlGX0nyV2/ZSW5Vyo65hyHTuHgDYRag7ucNsRMc8GwWWRYL8oBRjwMsEdFWI/VkDsZJawKUKS5NFFbBwTO5JKRgEqBZGQU4shRhVOexUR71a8i2L3KdNuNyN8mDxcUrpNRAzMjz3qQeo3/LPHUQcltBTNi8SS7R6sA44j+Nn3QZv2RbhvHX0Rz0G0UteVYscXnJLMQeo+4KEtB4UB9KBpIM0EyVeRZrBNDQDrkWxko4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snt3z6lX0YM1KylFCj8Y9+bIZo5gvJmfX7t7Ui2nSqo=;
 b=ATpxqYOuSqA+YLwKTnTaKFbbRKdPga0xOr/l4RF/ny/rY4B0RTOUYQGI1NUmQPRqw4i+sBvFhcpZL14pst51vJuHktdFE2EHx5eudljCpl3Wk1Cs17R69SjGoQD0ARg6haznXs+rhL0FNlPBpoa2AY/egyvXtJmx35L4k5z9CJkhVlU7i0oNRi+eZ0BSFMePnLjCGJOFF/mR3FbSPpUS29GY3LQQh5yjlUBuEcr2uRjSaXLSyMX6p+IxRCHW5kcRtOlr8R0Zrvk0nkESR+yLo18eoR8U7SL0uA/bbtDEb3/zaxCgooqHqxgkyK5VhGtd/JnXcalOxGkWuOvL5Cp1LQ==
Received: from OS6P279CA0164.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:39::17)
 by DU0PR10MB7553.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:425::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 07:58:09 +0000
Received: from WA1PEPF000099CD.eurprd04.prod.outlook.com
 (2603:10a6:e10:39:cafe::8b) by OS6P279CA0164.outlook.office365.com
 (2603:10a6:e10:39::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 07:58:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099CD.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 07:58:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 6 Oct
 2026 10:04:54 +0200
Received: from localhost (10.252.27.219) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 6 Oct
 2026 09:58:08 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Tue, 6 Oct 2026 09:57:34 +0200
Subject: [PATCH v4 03/15] iio: adc: stm32-adc: core: configurable number of
 interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261006-adc-stm32mp25-v1-v4-3-d31ec75aecf3@foss.st.com>
References: <20261006-adc-stm32mp25-v1-v4-0-d31ec75aecf3@foss.st.com>
In-Reply-To: <20261006-adc-stm32mp25-v1-v4-0-d31ec75aecf3@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Joshua Crofts <joshua.crofts1@gmail.com>, Marek Vasut
	<marex@nabladev.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Cheick Traore
	<cheick.traore-ext@st.com>, Olivier Moysan <olivier.moysan@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.27.219]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CD:EE_|DU0PR10MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f4ee99-5224-41d3-d515-08df237f9031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6ITF0dEq7QBOpk7Fyy3BwP8hf114ODZ12cR5MdZUjhavnAwqZ4xFvOoijRGuyTcOjQ6y+zjg2ILqIB00F/uwgH6883vV/M586edDTu3l4tcnTWUgZrrSiyExoSRRNJ0t3AlBA6UqbL39WFGOW8LR7fjXYjN5tzmBMRci+jX89hd9peR7ruh2NhcQpLgwVwtDrfEnLDJ8zfZL9UcNywm8W3WWf3JBTvDLlscqojMPrg2Rjqsp8hv/d3Ij0XjWDZKv19nDVSYZD32mqz2ikXAKPT3hmSf5QfYAPAthel/3ttTnAtlc49PPqoTo+jsjvhZnzuzTT8BUKLlpLsEvuK+umTK0Bhi17gx5YfE7tS/heE48+DMKWJKMNy/2nCb+97vxfpijGn3m/5NnkK6NOyV6u7Xsewx4BpoajV+kiJ8soIOcoFaIISvKLeuJyXhbE16PwqisywQPbhQoSjkuYWit03EBnbAgJg9bpkqbZ4NgXX4TKCyvPSbWpLe46jO6fKttDSglHaOYkx3yk3XX9RE1e4jSWjtAF8hZHcEgJbOgm/0Op5y9k5MjsFTomvgMB2jdOMFY4jpR6xO2UaB1+2sqfLxe/bEAa5awH462HO5v7j6E8uTrAbZFiCjQMVpXIrKpgwwqUWfao7NYA5PMk4dOGJnGmBGJc8mykXCyK5pn+tMPHVt4lZVPSd8WGR55ISErWtyCdW4cIDXYWaRZ/Eu2MQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eqEEk5fxAp6eonoQGT+5yFV9rGG3QnaJuCJcoUY+Da3oyBwk1p75MqyrVwyl1R2LOiEPNzdIjy9ojxWraAuY5DAQnWxg0zuWA4SEPpsI4TMmr9Y4uBEIky/vT8jkijp5zwX73lR6mXlje2CEYi2QKO45384HTgoGVBoz0+uf3wIN4fyKpR22PLvKLFRbtwRU8OKiBDMcq7KFVgdDr2LRE4z4xETfN10/hteRF+5B4Ze7CH+z8bDAL6m/KxgIftjXDHOolA6bT3pDCuIwXNUvmNLnTIfQltld4oVBHckF9Fbps6oNSa+aCF6GISIgvfAdNijSnt1ky1zJ/UZ9dtEYqDIzPV3fZBNDChR3Ik2dwRl6dsEvLHi04Zbnz5b333KvUToS3apNWmEEwj3oYUZlTjIVCw/NgP3Vmnx5ueQ1YWr86GXsN/WwPELOEzfSRzsn
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 07:58:09.5864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f4ee99-5224-41d3-d515-08df237f9031
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099CD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7553
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_085821_980146_A113ACAD 
X-CRM114-Status: GOOD (  15.05  )
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

Make the number of interrupts configurable to prepare stm32mp2
support. Read from the SoC compatible data, and add it to
private data struct.
No functional change intended.

Co-developed-by: Cheick Traore <cheick.traore-ext@st.com>
Signed-off-by: Cheick Traore <cheick.traore-ext@st.com>
Co-developed-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- new precursor patch as advised by Andy and Jonathan to render
  num_irqs configurable
---
 drivers/iio/adc/stm32-adc-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 4b3c00392a73..051875a67bda 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -92,6 +92,7 @@ struct stm32_adc_priv_cfg {
  * struct stm32_adc_priv - stm32 ADC core private data
  * @irq:		irq(s) for ADC block
  * @nb_adc_max:		actual maximum number of instance per ADC block
+ * @nb_irqs:		number of IRQs in the ADC block
  * @domain:		irq domain reference
  * @aclk:		clock reference for the analog circuitry
  * @bclk:		bus clock common for all ADCs, depends on part used
@@ -110,6 +111,7 @@ struct stm32_adc_priv_cfg {
 struct stm32_adc_priv {
 	int				irq[STM32_ADC_MAX_ADCS];
 	unsigned int			nb_adc_max;
+	unsigned int			nb_irqs;
 	struct irq_domain		*domain;
 	struct clk			*aclk;
 	struct clk			*bclk;
@@ -421,7 +423,7 @@ static int stm32_adc_irq_probe(struct platform_device *pdev,
 	 * - stm32f4/h7 shares a common interrupt line.
 	 * - stm32mp1, has one line per ADC
 	 */
-	for (i = 0; i < priv->cfg->num_irqs; i++) {
+	for (i = 0; i < priv->nb_irqs; i++) {
 		priv->irq[i] = platform_get_irq(pdev, i);
 		if (priv->irq[i] < 0)
 			return priv->irq[i];
@@ -436,7 +438,7 @@ static int stm32_adc_irq_probe(struct platform_device *pdev,
 		return -ENOMEM;
 	}
 
-	for (i = 0; i < priv->cfg->num_irqs; i++)
+	for (i = 0; i < priv->nb_irqs; i++)
 		irq_set_chained_handler_and_data(priv->irq[i],
 						 stm32_adc_irq_handler, priv);
 
@@ -453,7 +455,7 @@ static void stm32_adc_irq_remove(struct platform_device *pdev,
 		irq_dispose_mapping(irq_find_mapping(priv->domain, hwirq));
 	irq_domain_remove(priv->domain);
 
-	for (i = 0; i < priv->cfg->num_irqs; i++)
+	for (i = 0; i < priv->nb_irqs; i++)
 		irq_set_chained_handler(priv->irq[i], NULL);
 }
 
@@ -727,6 +729,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
 
 	priv->cfg = device_get_match_data(dev);
 	priv->nb_adc_max = priv->cfg->num_adcs;
+	priv->nb_irqs = priv->cfg->num_irqs;
 	spin_lock_init(&priv->common.lock);
 
 	priv->common.base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);

-- 
2.43.0


