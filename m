Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09934C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvO84suPbZhKZGDYkQX/SHnsEdEztbuEn9bVrV/RisI=; b=b8doRG5T0e2RiqJImpf95g+k4j
	nVa3hqsmiNcDLdsQVj3oI8YWr9E3fJ4jaSaL4a8s50Dj9G+87nI0XeVBOhEy8Aacxrr4A5HkMq0fT
	9CmmIZNkx7OgBrKPF3OqORhYjfLsGi3MlWth0rCg5k3thfIvUXzBVkWKvLmIDfBVwzOsU/N0gK13S
	pTMs59zM4AN4UhbSbMhCCY8A8csDRTW5SS7USz/v+c1DQ1o9yQhwIGyUEAIyJYw5hxlEFIbB47krv
	9QO0r+Gm2shi4RKSQpgC4M/Jyge1dQexY5zzlaRiXYAR0rZQzLJtejF78+LxT8oJMtjGpBCWN/brD
	8qVhTI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P5g-00000008mCP-19cV;
	Wed, 23 Sep 2026 15:41:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P4W-00000008lRK-16mf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=CC:To:In-Reply-To:References:Message-ID
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=rvO84suPbZhKZGDYkQX/SHnsEdEztbuEn9bVrV/RisI=; b=R3sJl2kDJUzNRUTDNh3NI47B01
	jtYqRz+NHpacFRMRudnNVOgh52ZaVqsECV9QjrxwpyW4r7RXtLeeawXpplz+SZWGw3jAlhCs70PXA
	0QL1ralnXv2Zza4lQ7uy5LKJ+VG7WlHCIJhkIl3bqDNfTheeCDcrfoSm6w1RwJDSmaPU5a//kP3QL
	gUfofkl2KC6mGr/6QR8xnySBtk1q17pJzcrPQNqvi+lL9+2CMeUjgYcxWsj20P3sEAQz9n0oXd5Vb
	7rQWBgtj8Ci+5wlTgnytvO22398hJpDtIaBawA7QJJi2QfFLvgoxaswyCrXYPGAPIdxeIkxhJJRaX
	gYklOm5Q==;
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P4T-0000000Ddxy-0M6u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:39:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmG5y3ITr3POlDGE0m0/ZHnRSdDaKfv0DfzgL3+RR+kXnUUvqDIqAaNjy6X0GcX4sm9TWkS2Tn1T2S6EfDMltfpBIzeishrfSnZBMukp7v4HoqiuclA7H5Xq435l9YDxN7hX2h+0QldI4tvy6TS4lIjcjfqzzFiZNzJJXZUscIRlR/EOW0JsJKNFNk6e2dGiFTTJZkypBYR9s8w1t9zjVDdeTN8qD6VNijaMJW8OqUI13UynJElBLrN6jgl/kBtCXyDU1/rMYTCBSwUw3OJVC7UFhoj8UWZrRp7rZ1TZbNhP8W07zAS4Lk0v13Aurw1suCWXYL6co9/a4VuzwjUzOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvO84suPbZhKZGDYkQX/SHnsEdEztbuEn9bVrV/RisI=;
 b=of7hkZIrpmniJDqlTqKJiHCCnHUYCDTPheOu9dB3DTD81UFJWtfpzjuHsxi/aqI39JCiHJoqDWh9MKrOT7OKVszAJZ2W2s27z7FFc3wiWtXEkn5e0vJ0BZIHmcQErN837HIK7QccsVaX9RDmY0WvMXENLAhIyRxtf7TUoYGnMZFq+pNkMK3QvYxVU50H2vCYNiqePB2rJmbS38AFEf2l86R18I/NFFWIgSyFPYqls7HktNopJc3+bJF6LQkvUXgeUyQWhkFzVMS4KLuN05d4dgw1u8bMrZOjadpjkIdl1Ew5UmHnX1ldNWPSvhSOhJKXBEAh/g9MXABxQ7aw19Gvpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvO84suPbZhKZGDYkQX/SHnsEdEztbuEn9bVrV/RisI=;
 b=FJMaY/0XWx/kN4mGwPctRexvM9HLazqAwVlOo8AZoGDVHv1nd0/HWAkrSb+rRUWZv83sDsXMxaIg2L5TPsprLTKo+kzzpH/4193m05HtTtd1spiF+1jzh7ZDZrfDpgRfQWv52MUI/p4xq5INL4HvClLGeOC9/Dk3w4hbgWMv894GQi6EuTDEdhaGWpVTYf7rbBq5TU21zHEt+ECs5H9WjsWyccCh3WU7d4Q8ayrPcxsOJUv0dVwZJEtMyyxg0G4RfVhgstshqNkLq6u+jPiwFTbkQvwSPJLj+XpT7WOtXb4JTG4fvWsrNOTAHs8i/+iOV0Wija095Un3K3AJBQUTSw==
Received: from OL1P279CA0044.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:14::13)
 by DU0PR10MB9327.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:5c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 15:39:34 +0000
Received: from WA1PEPF000099CF.eurprd04.prod.outlook.com
 (2603:10a6:e10:14:cafe::85) by OL1P279CA0044.outlook.office365.com
 (2603:10a6:e10:14::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 15:39:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099CF.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 15:39:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 23 Sep
 2026 17:45:23 +0200
Received: from localhost (10.252.7.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 23 Sep
 2026 17:39:33 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 23 Sep 2026 17:39:12 +0200
Subject: [PATCH v2 09/14] iio: adc: stm32: add support for vddgpu on
 stm32mp23 and stm32mp25
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260923-adc-stm32mp25-v1-v2-9-46bc019537c6@foss.st.com>
References: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
In-Reply-To: <20260923-adc-stm32mp25-v1-v2-0-46bc019537c6@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.7.7]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CF:EE_|DU0PR10MB9327:EE_
X-MS-Office365-Filtering-Correlation-Id: f516d114-874f-49e7-f692-08df1988de2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|23010399003|36860700016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /JR1FGUovlp41QcjYiBZbDtmVi0Jeis0CsfKXBQvq8i1c3eJ7/cnfszM3GFmiQ3qWVORMsjZTaK+3CV260/Mjn1cPWbWnulBNINFOMOBsIhTVN05Rw1uNTM72qQhSqNFsLWnGk92WnOIRUxhEzi7p31IGbr0g565sqrB/qf0uA6a10LNnY5/O2ZJPbHmEyT5lTVAxJvP540jRANAUfSLIgjzE02B3HdMBMGHza23O90QqVYYgrgO2JlxQpbMv51Id0dYVrTcqi/wlTY/hwyozDnIRcikJIN5twSOEQokFjksd2WV3/LBcEV6RJR7ZG6A5JdqbMy2GyeTijKfpUEeXaTJ3c44FRrRYwZm71ETpf6ApsIhIChVSaZ4QmpegMJfEkUEUbT/W7VVURFPOyP4muUQASp/tnQ8ZQxi9GVpCmnlNYIDj9EFN9bUTlqRvxiQ3EpOBwrAV9hfqG0Aa0884WlfX9cNet33Wf2f8CDnwoy0q/FUXtzA3JOPRwXecIsnHaQv/771hL7ZO3GnUVDGbmuUThYBRUEqx0eSHvVWXWs9VtZNVtjM1sB69ILqQVh/yZIRww100zBhlhzwP7Ycu6OTfzqJ1LFd4KRmTVtBsUkqIODIoKStou67WvCNwFoPnZMPHc2fp9bXMYAT37TkrOdqHYzlPvdTesfnRlfREZVAbonlY4Fwc2TPMpVgsjGGibds3hXzUQ1lAZ9Hal9b4w==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m1AVUqPdtoiJOEFRXUev9oYocXJ5cSfM+vV1JTFtJFmQV6439iOBqJ+deGn0oZDaGZ+2Rzbbz4GxAdw2T2kRxCoM48mI2FNJIYC42gG1P3gDI9uOb5GXm7jQLIr5Fa72VCgA1GK+oJbyhmc5GEujZv3YD/4j/7QphmTTBpQ+Q685t0eIJRboQAXhYVvuBj+nXkwKUCVkirslMKmEfq2aQAhAkj5NFS3vHPqFJ6SoBDWUb+7ouzkmqXDX/mejAk6CKYBy6blWHs0Hg98pic58yrDwQWktiEfLjkRNbt3BaCxYCJfAQyDiO8U0geTwB2WXPxiEL5+879zS5wwo6LrnzQtx9l+KkLz2HofcIWq6x6jVk12092iZuGZmUWLREjNgRp/pWYvM4fBVdRNkhV3lUR1cSOXwV9nsYCCqKP9+jQOasIjFhg66JPSrAGWpEhcq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:39:34.2710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f516d114-874f-49e7-f692-08df1988de2f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099CF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB9327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_163945_260799_39DAF6F4 
X-CRM114-Status: GOOD (  13.49  )
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

Add support for the vddgpu internal channel available on stm32mp23 and
stm32mp25. It is enabled by using ADC2 and ADC3 option register. Add
VDDGPU to the list of supported internal channels. Add sampling time
information from the datasheet.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- New patch split from V1, to avoid mixing new SoC / feature.
---
 drivers/iio/adc/stm32-adc-core.h |  1 +
 drivers/iio/adc/stm32-adc.c      | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/iio/adc/stm32-adc-core.h b/drivers/iio/adc/stm32-adc-core.h
index 68b937e3819f..330c6c30e4f5 100644
--- a/drivers/iio/adc/stm32-adc-core.h
+++ b/drivers/iio/adc/stm32-adc-core.h
@@ -273,6 +273,7 @@ enum stm32h7_adc_dmngt {
 #define STM32MP25_RES_MASK		GENMASK(3, 2)
 
 /* STM32MP25_ADC23_OR - specific bit fields */
+#define STM32MP25_VDDGPUEN		BIT(4)
 #define STM32MP25_VDDCPUEN		BIT(3)
 #define STM32MP25_VDDCOREEN		BIT(2)
 
diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index a14f858299ae..a2ed3abffa58 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -97,6 +97,7 @@ enum stm32_adc_int_ch {
 	STM32_ADC_INT_CH_VDDQ_DDR,
 	STM32_ADC_INT_CH_VREFINT,
 	STM32_ADC_INT_CH_VBAT,
+	STM32_ADC_INT_CH_VDDGPU,
 	STM32_ADC_INT_CH_NB
 };
 
@@ -107,6 +108,7 @@ static const char stm32_adc_ic[STM32_ADC_INT_CH_NB][STM32_ADC_CH_SZ] = {
 	[STM32_ADC_INT_CH_VDDQ_DDR] = "vddq_ddr",
 	[STM32_ADC_INT_CH_VREFINT] = "vrefint",
 	[STM32_ADC_INT_CH_VBAT] = "vbat",
+	[STM32_ADC_INT_CH_VDDGPU] = "vddgpu"
 };
 
 /**
@@ -167,6 +169,7 @@ struct stm32_adc_vrefint {
  * @smp_bits:		smpr1 & smpr2 index and bitfields
  * @or_vddcore:		option register & vddcore bitfield
  * @or_vddcpu:		option register & vddcpu bitfield
+ * @or_vddgpu:		option register & vddgpu bitfield
  * @or_vddq_ddr:	option register & vddq_ddr bitfield
  * @ccr_vbat:		common register & vbat bitfield
  * @ccr_vref:		common register & vrefint bitfield
@@ -186,6 +189,7 @@ struct stm32_adc_regspec {
 	const struct stm32_adc_regs *smp_bits;
 	const struct stm32_adc_regs or_vddcore;
 	const struct stm32_adc_regs or_vddcpu;
+	const struct stm32_adc_regs or_vddgpu;
 	const struct stm32_adc_regs or_vddq_ddr;
 	const struct stm32_adc_regs ccr_vbat;
 	const struct stm32_adc_regs ccr_vref;
@@ -725,6 +729,7 @@ static const struct stm32_adc_regspec stm32mp25_adc2_adc3_regspec = {
 	.smp_bits = stm32h7_smp_bits,
 	.or_vddcore = { STM32MP25_ADC23_OR, STM32MP25_VDDCOREEN },
 	.or_vddcpu = { STM32MP25_ADC23_OR, STM32MP25_VDDCPUEN },
+	.or_vddgpu = { STM32MP25_ADC23_OR, STM32MP25_VDDGPUEN },
 	.ccr_vbat = { STM32H7_ADC_CCR, STM32H7_VBATEN },
 	.ccr_vref = { STM32H7_ADC_CCR, STM32H7_VREFEN },
 };
@@ -953,6 +958,11 @@ static void stm32_adc_int_ch_enable(struct iio_dev *indio_dev)
 			stm32_adc_set_bits_common(adc, adc->cfg->regs->ccr_vbat.reg,
 						  adc->cfg->regs->ccr_vbat.mask);
 			break;
+		case STM32_ADC_INT_CH_VDDGPU:
+			dev_dbg(&indio_dev->dev, "Enable VDDGPU\n");
+			stm32_adc_set_bits(adc, adc->cfg->regs->or_vddgpu.reg,
+					   adc->cfg->regs->or_vddgpu.mask);
+			break;
 		}
 	}
 }
@@ -986,6 +996,10 @@ static void stm32_adc_int_ch_disable(struct stm32_adc *adc)
 			stm32_adc_clr_bits_common(adc, adc->cfg->regs->ccr_vbat.reg,
 						  adc->cfg->regs->ccr_vbat.mask);
 			break;
+		case STM32_ADC_INT_CH_VDDGPU:
+			stm32_adc_clr_bits(adc, adc->cfg->regs->or_vddgpu.reg,
+					   adc->cfg->regs->or_vddgpu.mask);
+			break;
 		}
 	}
 }
@@ -2651,6 +2665,9 @@ static int stm32_adc_populate_int_ch(struct iio_dev *indio_dev, const char *ch_n
 			case STM32_ADC_INT_CH_VBAT:
 				na = !adc->cfg->regs->ccr_vbat.reg;
 				break;
+			case STM32_ADC_INT_CH_VDDGPU:
+				na = !adc->cfg->regs->or_vddgpu.reg;
+				break;
 			default:
 				return -EINVAL;
 			}
@@ -3160,6 +3177,7 @@ static const unsigned int stm32_adc_min_ts_mp25[STM32_ADC_INT_CH_NB] = {
 	[STM32_ADC_INT_CH_VDDCPU] = 34,
 	[STM32_ADC_INT_CH_VREFINT] = 34,
 	[STM32_ADC_INT_CH_VBAT] = 34,
+	[STM32_ADC_INT_CH_VDDGPU] = 34
 };
 
 static const struct stm32_adc_cfg stm32mp23_adc1_cfg = {

-- 
2.43.0


