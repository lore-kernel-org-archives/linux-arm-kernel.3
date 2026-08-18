Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0315C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 19:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0MjCxxweOWbMxqY3PtSk4sO3PpZ21pT7dUMkgSduns=; b=ZIL0GzBmkkxj6Kd+Dyk0zG/TEM
	ic1aEvupjL7IDvmRFf82xyw0P4aniRk5wIHsIo+0JYbr0a6F7SEgKVgWTTj+vRFjg/KWR7hgz2RaJ
	YG4ZgtpbtBSQIeBfxchBikd509x2EojryaRz8iDF2w+hzHVbEYAub3teQekdjioPjnqX492kwuBxQ
	/mscmt+Vb3OrkwbzTzy8+lvlnPWJO7TqbbdbpnS77tMjh2N39ZcYpgUiXhpIHYzRZmUzr/r8t3MhB
	nND97RNhaWUaK0wZRCHuu2vOMHAjG7vPu7GvQkju1G8y3tIhN5YRXbIqkUfB94AuWW5gisX2OW2pJ
	U89nW98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEM-00000008Z0C-3zd9;
	Tue, 18 Aug 2026 19:12:14 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPEG-00000008Yx4-3OSj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 19:12:09 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4998590d392so1978695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 12:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080327; x=1787685127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0MjCxxweOWbMxqY3PtSk4sO3PpZ21pT7dUMkgSduns=;
        b=cntdiAJZ7aFnnwUcJ4C7xo4Ph61ypRljc8PqopsCliiT8tQQphcqAz8mLIZFUbXo1I
         1743UqgQgDrFovMyS/IeU0dUKKGXpBjyP0p1wOtJRBnMnoLq7NEHGF9oWf4/ntrUcbFt
         Da/9WzzponX95qBG4VlywjhPxjAS4XxLqzffYwyDvZjefjZJyP9fRwyU9ufRZ1+Nf1TX
         9qfn1bW83nptoeKt2w5URbEsJXaGqUVGw9/hrnXdeF4tgHs9J/IP7x/KF16rHahwgvA7
         inuZy0MUxHyBpB82ihmTc/jOwAxTUE/aBqUFS/TKOG34++gepF/OOaF3+XltHLk6JPTT
         oBGA==
X-Gm-Message-State: AOJu0Yy6zisZGf3jHcYn6sJvstkMF1afnczqYDqb/oP66RJPKvT+QMZK
	d1a0f92FuMD7EQpk0Yc2SiCzhrp/hAcReWY3qsLPZMolvkxOGU5E+fgz
X-Gm-Gg: AR+sD11fBf0jHgTBkEOZVctv/71FoWuTZktOv9v1XS3+hp0hlyanXI3CtiZykk6btL8
	zaSERRfl/qsiIPdQItLsIHFy+JFByy37uuRqakkUkmGmrMH3GmgCLae2GZMv+6U2sYmPzwovOS1
	LsrAl+ezWmIR7wpirR/9jQOGZ2Ued9y9WMPmUNeFgpVzbe8A//LCjV0i+aSkTygsEbZvarNU19E
	QRvVclhrpc7PBQn1gp4KYLmBpyk9Yi7s3+vA76MyKv4ydC0rp8+ImvNa4pcRNELSnka9+3U7mnC
	NgCa38Fg/2tcDj4uwZxDvzplZ3grt6Ekx/1X1Z1+iJURjhz/JUEiu6logU5+ZoEi0GxWMwcIsh+
	/rY+defGYJBgXDE4mbRk6pjvXzzjmPGmE5DOO9cHoBS/PCoiKSLb8GIntNWJX9W8l00wOR2LarY
	F3uOM8fzzV1l2R0AYPOBzPYiAmWX/KSUpr33uioXZPmFph9I6B7Z3FRCPsl+Yd/kvfumzSf8jB2
	1t/6aQQVtdQR0s+T6p+G3pA5P0=
X-Received: by 2002:a05:600c:3151:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499a9052a5amr2327525e9.15.1787080326827;
        Tue, 18 Aug 2026 12:12:06 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783c6sm14673154f8f.31.2026.08.18.12.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:12:06 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
Date: Tue, 18 Aug 2026 20:11:58 +0100
Message-ID: <20260818191159.11523-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818191159.11523-1-tanure@linux.com>
References: <20260818191159.11523-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_121208_855895_EBB84165 
X-CRM114-Status: GOOD (  12.97  )
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

uart_a lists the 24MHz crystal for all three of its clocks, because
the T7 clock controller driver did not exist when these boards were
added.

That leaves the real UART bus clock without a user, so the kernel
turns it off when it disables unused clocks at the end of boot, and
the board hangs.

Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
the placeholders from the two board files.

Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree")
Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
Signed-off-by: Lucas Tanure <tanure@linux.com>
Assisted-by: Claude:claude-fable-5
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
index cab2ee9ea0d3..dcbcd08a78b9 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
@@ -33,7 +33,5 @@ xtal: xtal-clk {
 };
 
 &uart_a {
-	clocks = <&xtal>, <&xtal>, <&xtal>;
-	clock-names = "xtal", "pclk", "baud";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index c41525a34b72..677069e58f30 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -266,6 +266,4 @@ &sd_emmc_c {
 
 &uart_a {
 	status = "okay";
-	clocks = <&xtal>, <&xtal>, <&xtal>;
-	clock-names = "xtal", "pclk", "baud";
 };
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index cc371fcd1896..7847582e77ed 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -587,6 +587,10 @@ uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
 				interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>,
+					 <&clkc_periphs CLKID_SYS_UART_A>,
+					 <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
 
-- 
2.55.0


