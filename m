Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8F3C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFr9VUb0cj8rwbbjZXrPXjG5Re+YcSIhPghSrgnatjw=; b=sWEuda8UhohjNH6Ip++8v1pAQe
	UUspJW+ZQSr5PUdFyFYzhpCa4cwro8nHY2BB2EKBXK6DdJ+YJ0GWejtHVbJRIMj2GpoNuleD8oMED
	ozc0wwuzzsNXMzh5kWVNAibPCXonV9FCJJtb/jouE+QETu3LSpL/Nj9CQzHs1B1HHtVJD9DE8Oek+
	TTPm22utrFLx3LeOgkebnwBH7Z9hoJQkZ4hPnq7SFMw5Kb2OuQoa47Nf6AJ+Zh5jDAsIDCLcHDeDY
	kdp/JZdtAFR0eCbZnrKf6mMWCAP850lhKtTTUuBTpLDQGwa1XONwN7CmjllADoyhildyL6BikZhpQ
	8BjArpOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyjK-000000090F6-3MRy;
	Mon, 19 May 2025 11:32:26 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyYZ-00000008yad-2Umh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=cFr9VUb0cj8rwbbjZXrPXjG5Re+YcSIhPghSrgnatjw=; b=EUFBgE
	BTgoE8AtOfKHRt6Zr1dyV7/kHE/2mTiCOd0xjmUA21PHHSYN6+d8gbxm4xLj2YTO
	PdeuosKYiEpZuKccC/KZ0ppKElylCzbsjRmpY4JfQPoLAnnrLMKdJ+vJCuFzH1pK
	Z+vi+MHGuRMMZ819XwraxHjCP4F/n9JeX3GnCG9oaUkD8c0jDCMVaakohvA7eAgd
	PhdhcL0gIVErvb4DMs3Xz4p6VVElqqOa7mPsFzo2obuZGn2lsmn/vjzMjqlZLffB
	hfqVr7kvpXPhyelw9PqLudHgnPsfO/zDD3nPcLjjtcPXS+Whwcl1ArFz+deMnckG
	MiphKQsK2JKfJgFw==
Received: (qmail 2456994 invoked from network); 19 May 2025 13:21:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:21:17 +0200
X-UD-Smtp-Session: l3s3148p1@GdSYVHs1DN5Zz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: stm32: use recent scl/sda gpio bindings
Date: Mon, 19 May 2025 13:21:06 +0200
Message-ID: <20250519112107.2980-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
References: <20250519112107.2980-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_042119_904274_DAACCE65 
X-CRM114-Status: GOOD (  10.98  )
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

We have dedictaded bindings for scl/sda nowadays. Switch away from the
deprecated plain 'gpios' property.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/st/ste-nomadik-s8815.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-nomadik-s8815.dts b/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
index c905c2643a12..aeb58d2c08a1 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
+++ b/arch/arm/boot/dts/st/ste-nomadik-s8815.dts
@@ -117,8 +117,8 @@ lis3lv02dl@1d {
 	/* GPIO I2C connected to the USB portions of the STw4811 only */
 	gpio-i2c {
 		compatible = "i2c-gpio";
-		gpios = <&gpio2 10 0>, /* sda */
-			<&gpio2 9 0>; /* scl */
+		sda-gpios = <&gpio2 10 0>;
+		scl-gpios = <&gpio2 9 0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		pinctrl-names = "default";
-- 
2.47.2


