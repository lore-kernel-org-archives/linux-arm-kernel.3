Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24844D3E786
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKc2i0CrPvuU1yF1mbUmVahRwUdSF7nDlBOZD6lUOdk=; b=J5KN77JO9qr+dwp1BAgeIXFvez
	imM5+J4vSwvtIzSNCaGxNHu38hioarWPWyx/dybpi7HG0O4/9pdBvZtCfRWS3oGWvJQI2hCApfJWr
	RE2Kh2J9aRtDy9JM98Vymhw8M2uZ/4GsIbAC5omecFtpa9YcNWM8eahdDp7B1Yx17zvYzDeb639KG
	RYF/RQtrWIgqb8yyzkI5PsSdlvP+fcuS46qygzIBEwG2754T9k0w5GQx/TAMz+VG7MJRiA+C812pq
	g1VTuhz4VV4RGu3fluQj12pMdW358Ly7wT7FiBXGCtaSZa7waJIteFANhNSCGV7MUdDjZd/sBgVJ7
	2eaQtMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKL-0000000GOor-0oLN;
	Thu, 11 Dec 2025 08:47:09 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTcKI-0000000GOkf-1eLE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442824;
	bh=wKc2i0CrPvuU1yF1mbUmVahRwUdSF7nDlBOZD6lUOdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=B8t9I1BIs5UeAK2qrj6W0cam9GDEz9JQEsllJCfUXrNppjnaHgcRHhW/9sQOYq5Y5
	 Ebhpy5xshRlM30oEfH8+BHfvFLG19aZ98PEloPYo/q9BIbt/YWuDd9UNbUOPY3Ufgf
	 RQs4vTNHdEr+XKoqQF/5SZLFQA36B3Gy8a89R2AhJoXirgahN0C0IjoanRa8wV50pq
	 +Gj9Oy36Q+S4+jRIcknK8OtPGfypeQxD1dBkbHZ2oKjrsey6rUGHSa+OHLwggUKLYG
	 //JetDhyHkm+nCznnAMj+skz8xW533V6aGKRFJQzrd4OmBEiN6NBWEXIdfGYSA5WAq
	 Jw4xesDSSU43g==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7081A7D6B0;
	Thu, 11 Dec 2025 16:46:59 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:49 +0900
Subject: [PATCH RFC 07/16] ARM: dts: aspeed: Remove sdhci-drive-type
 property from AST2600 EVB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-7-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_004706_634612_8E9BA07A 
X-CRM114-Status: UNSURE (   8.76  )
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

The property isn't specified in the bindings and is not used by the
corresponding driver, so drop it.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
index de83c0eb1d6e..3eba676e57f1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
@@ -314,7 +314,6 @@ &sdhci0 {
 	status = "okay";
 	bus-width = <4>;
 	max-frequency = <100000000>;
-	sdhci-drive-type = /bits/ 8 <3>;
 	sdhci-caps-mask = <0x7 0x0>;
 	sdhci,wp-inverted;
 	vmmc-supply = <&vcc_sdhci0>;
@@ -326,7 +325,6 @@ &sdhci1 {
 	status = "okay";
 	bus-width = <4>;
 	max-frequency = <100000000>;
-	sdhci-drive-type = /bits/ 8 <3>;
 	sdhci-caps-mask = <0x7 0x0>;
 	sdhci,wp-inverted;
 	vmmc-supply = <&vcc_sdhci1>;

-- 
2.47.3


