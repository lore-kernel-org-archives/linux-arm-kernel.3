Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94898F588CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sf5UUoR/opi/xerxPv5KH9pGjHhtqiyFO0zE7Ez3e+w=; b=gRPRjECWrWa+u5/i+/rHISY41b
	75p8sHdc86mBaKtsblbMzXy5OQEPRu5xoitbPq7X5q1QGdvQ5y3Em0myxmGPrDpcmvZISgW1wO108
	D5DJo+OYRUvSOH8IQUwWK+dA3KjWtpHIhhumgmAPRSXcwQQ8OJLVDLR07eGeY6eNBO4+m17Gg4501
	NgcK6/FWQX0l1sNW+vS3gLdaYBRzYxElM2+eSKihCtI2fs6iASEB48hAni+t32Bghty6abB/5rjHn
	03Yr5e9pIfhlLdcbatrpqmgZzAxPt/lCjHxvTc0pbsTvndHC8KGDUDeMgb7/h9JmMm/rQfQiejfZZ
	K+mxi+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEp59-000000076p8-1LKr;
	Mon, 20 Apr 2026 13:54:35 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEp52-000000076hX-2vWM;
	Mon, 20 Apr 2026 13:54:31 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776693264;
	bh=TEedfJO5TR8o5gDN9orq4akY5TFlnSMd+EhYF81BVfA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ee7TOVI5f4AKDyzUEEs9t3WC8E/9VBL02/IxTl+n8w0gdU9oBRIKZVB4bqd55Usbg
	 WWjSlF+oWytllwIzTJrmsvYwKFx9f+jcWM6fnDl3KWo8jo5Z92bZcBHIqg70SkE1eW
	 x+f/KhqoCadzriBU4Ja9IosED50Eqt9gvi+9h+YQ=
Date: Mon, 20 Apr 2026 15:54:04 +0200
Subject: [PATCH v4 3/4] arm64: dts: amlogic: t7: khadas-vim4: Remove
 redundant clocks from UART A
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-add-bluetooth-t7-vim4-v4-3-9505df0e7016@aliel.fr>
References: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776693261; l=791;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=TEedfJO5TR8o5gDN9orq4akY5TFlnSMd+EhYF81BVfA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB9Oi22krmUixENvm9gPAV6+FBMaSnSFWTTpfP6HPAwJnP/d9Vpju973LaRA+K1rKFYn37uZIlF
 TeasUHiBbtgg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_065429_208349_B9A4099A 
X-CRM114-Status: UNSURE (   6.57  )
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

Remove clocks and clock-names for UART A, as they are defined in DTSI.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 69d6118ba57e7..3227ab27de107 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -250,6 +250,4 @@ &sd_emmc_c {
 
 &uart_a {
 	status = "okay";
-	clocks = <&xtal>, <&xtal>, <&xtal>;
-	clock-names = "xtal", "pclk", "baud";
 };

-- 
2.49.0


