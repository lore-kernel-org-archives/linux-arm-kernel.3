Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D09CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 07:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPbFNsZLvdThwohuFoxuz7Dt+lLXspWabhIC+wYJaUY=; b=ql7HiW8QiidsphxtXy6lDWisUC
	7z2OY0OJJhIGL5Tloj4A4vRT6+3GyNGFsqNr2BokHp+RPrcL5GJLYWUqGsXuKOr40baNXcFD8bzRB
	sUMBwso/ZtJ/LqwbuZYk54bLN3aqsz07wrJRfKVyrE0+nRiOWZNgKGlAZCxc06wBnyOqb4DRx8+A1
	NmhVFgoKmBdK+5LEG3RWSWN7oAUqEQGbVScez7YwMeRRiP6s+1HhjGSIHKs/OkZ0ZLkbxTfVikPYn
	sGq9ZljCb8sUhEKdb7aCSkU8E/xK/AJexAeWQUirk417CVsS+Al/D0Pqkmm/rgiD5ukmYkSsbsOTm
	sl4N/N3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE04M-00000000FKy-12IL;
	Tue, 06 Oct 2026 07:58:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE04J-00000000FGP-13XK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 Oct 2026 07:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sPbFNsZLvdThwohuFoxuz7Dt+lLXspWabhIC+wYJaUY=; b=gKAFbz9tlNJtEIv/cSaScGi8Hb
	klkjSvkQqzcTI77D6FoUW2frlEHOIuNFTOj3sm9WUrfELeqL0+PFOFEvExFuhRV5Z3fpXJeC49EJo
	tGSmuc3ejE5Qhth5FrNHaWZbsYmBOLsqyMzfVqtVwkrGV7b5iJ6dbmPiFtrEsDJDNn1hAm2DAt3rh
	kUAkkCqHMJFnDrbtvP6kF6zFY0FcATS4z3Qje0ozWKUUJeHnpyhBh2NR6PoZ2bB0hzoUEM7CAW5yy
	sUcEEFe3tpejoE9CXz/0Y216/UXsgVw8nPtm0Ss+K1OGCerqVaG9FD6/A8q568H3ekEKovuvrPS+I
	+CuJwKrA==;
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xE04A-00000008Y4G-0Wkd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 07:58:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Axn6cPXOKAN41BkF3lsm25rH+fhoMJHxJCWFFerihO/a+afMyNAiWfb9JlETJ4AILCrndBwuLZ9fE6x+OyAXT6hYpxv8QHnbQ+bS2jWPJDQUiTI0Pg81uFMyP5mFm+Bp8NvBVk98uYSx4sZBSS1jyXmKmQmtV/j39KOuWonqeyx7u7n7JnmaFin98POtUi7JJTau1Vog2XexnKX0y4NW5JNvfnnQ9eMhiPxtBFTwwHShqA/GOP32uJr0PSqvfnUdjo2NRy+ebJ46Sh24ZydXQn0It0uXlmxzFYL53tv1x8g1v2suD9H4S9q+TdWs6IN/IcgbyLOfPVPFiOCVw2kxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPbFNsZLvdThwohuFoxuz7Dt+lLXspWabhIC+wYJaUY=;
 b=UECx5AQB6HzAWWI7JDzuLDdtNjEadwohSsh9LhoA0EB2Ce8JSrEBOVfQi8tbDWDaw9vZEqkxeA90/FrH+XsG991TIWqvNPmKj2535/kUn4+JkAFXIUqh0JAN2ojN6+7BFFsWwo97XW0EZrrvYfQsnJp+kUgPQNGeJ8KsH62oeqHOb1SXBkIcuHAOFpEUw7wqpKXo157YyU4Y7HODiWFptepA5Un9ZGqUq0njwePFrvE+MkIOCPIdJ70/OX3oLncvkDAvjrJt2PtAQf5tPHh3/rPDvqyUXnbC5uQiYJEr87PVemGVx8f6yeWVDD9HRjAEoLrfQPmqasB84vy/SUu9Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPbFNsZLvdThwohuFoxuz7Dt+lLXspWabhIC+wYJaUY=;
 b=iittIOJ4LSvkoLmjcDVWVfHV0CDYo1lEVrrceb8j8CmwfKjuu5l1gyklI8is1x8KX674En45RiuM/EuwMu2W1pZonSLVnfWNtu6T8IJjDpkRs+S7vm9alpgtNK3JoFra3TMmegUdlwQT7Yst7xIwAapBg38R6nCx3YONtKlyCjmCCCna1W6Do8uIliJ+1rHtLTNR++4wkLnNf6ZI21u5SicURzhsUBMNdFT2caZNGf+KI7hDopfe8jg3qeXxnpunqkbQ3sFEuO6LL19d5UgtHM0iYJ6wEd0m3u3Ai+KonJSQMc36pW1JeZaFVUKTUU6ilrPhgolG5BMh0QAqzPufeQ==
Received: from BE1P281CA0457.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:7f::17)
 by AS4PR10MB5743.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 6 Oct
 2026 07:58:19 +0000
Received: from WA1PEPF000099CE.eurprd04.prod.outlook.com
 (2603:10a6:b10:7f:cafe::43) by BE1P281CA0457.outlook.office365.com
 (2603:10a6:b10:7f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.14 via Frontend Transport; Tue, 6
 Oct 2026 07:58:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099CE.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 07:58:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 6 Oct
 2026 10:05:02 +0200
Received: from localhost (10.252.27.219) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 6 Oct
 2026 09:58:16 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Tue, 6 Oct 2026 09:57:43 +0200
Subject: [PATCH v4 12/15] arm64: dts: st: add vrefint calibration on
 stm32mp25
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261006-adc-stm32mp25-v1-v4-12-d31ec75aecf3@foss.st.com>
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
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Patrice Chotard
	<patrice.chotard@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.27.219]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CE:EE_|AS4PR10MB5743:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f2eee4-bd16-4c7b-af07-08df237f95e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|23010399003|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Ma5TL750dgnc0aLbG+9Nzo70NXt4uJocOMdhUfbjFREK1Mde1pItpx3j07pqErKP8X/tV33gOyVYvYoLrcQzgPmUQ8e/zNnw5t88xKhME6KzDNDXtBFB9b6K5bZi9W/ea++cxJtV0CEkHg6F8HyDH3RtZ47TvgszIllkpkEPT6U5tbJK2kV8yKEg5MnEHCh/pNZjnvTqbLRRV9RAn3dxxgFU6yuvqJf1lxTZzBMM/GnKrgPsXwoAk5P6CwiPPYr9TLMcq3aZ9FI2IAz05MaP46C38Wu67oGjdoqHykOlQ/+L80TI5QQH/CMGy5LDs951xVN2rdXG7QMfTR0HhD21gQmlc/u/6Dc99XmubEy1AG+Yy9Om+8cib92A1upeD9m9vjwXRPpSFQX3QGX9rds9SuEaSo9nymQ+Du7gwaVnB4JRTXdyOsCb209Rkj59W811zKLVxC0JRa5PVAmlYksMeTOW8a2bAO/8biLOJt5JqFnOPOgQ0wiG84TrjBQy8x9TBsHDSaMV68pw8pYTgNRz9AsgmEMg0twWF8ERbSS/hRp4NE9AH9tV9LinzFF4TmcZSj9/mD1MAULMQucJWQV6+tsJ0g/y+xdHBmzumAiRKFGvJs9UD8WXH5KEF8ULAdPPHkjVoEg8swWcXsah7VlH+Da/F0qWhR4AZEMpdLl5ybluFgzbs3h+Nl5Cphgs5aCiA4JeFgXrdIty29tfG/14Rg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PFalVK8DHoh/M50bwar9spI9J/Wq2VdwLHLyE0kNR+m5YWW4qCdXFgKsI5+E9yPPpF2NoAmrZH6HRUV+BR7kJ0SPV9W0o+gwHq8otylPOmwIX7qrGK94EbZq8d+OMCNUCp52WLSqgAOee4mxf6Ja8MVQYpWjm/7KjxEc4yFahKLWPn0BEf1TOdOL4ppF9qFrBkrwdniEJFgDenOlvF4Q9dKKe4DKYhqL0fX73OyEgH1Cz1KYHI3dH1fmhEuavOkSK3zmqESrYT7zYJ0xKZi36d7EzFmYKT2sbuE+3nMKGI79QOGNGTAzM6hKZJteAXyjts4KGuKUH9yRE7jIcbFt21Fk05KK49kwZ0PwT/7Yeq1DVy7eO9ughxeMOzoXi8O4jAnehz8y1pyRjNnVyHDRCggsVfH6m+ddo9V49uQPqdnyMB0DIxGryg/x0LfU3yyw
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 07:58:19.1709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f2eee4-bd16-4c7b-af07-08df237f95e9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099CE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5743
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_085826_623165_422F33E7 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Describe vrefint calibration cell to be retrieved by ADCs through bsec,
on STM32MP25.

Co-developed-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..82a8a6f1f881 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1777,6 +1777,10 @@ part-number-otp@24 {
 				reg = <0x24 0x4>;
 			};
 
+			vrefint: vrefin-cal@1b8 {
+				reg = <0x1b8 0x2>;
+			};
+
 			package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;

-- 
2.43.0


