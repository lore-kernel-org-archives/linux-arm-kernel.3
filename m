Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFB3C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 11:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71w4/rq4K9yb8GmFJtMWkONctoSy21P/XVfk3Fhsusk=; b=qyi2+mvfHxTzDY1TVj+Es1kiN5
	GP0R5uo+SKN8FudZxBzfx/scR4R3NL1DClDtQaw0ixH2BfzRx0GeIAgCKppSOP2WY2v/OarhshXSC
	Tj66wIJ0eJlt3bIXRmbZIBmGjOz/XZGhrN5RCzQS1Wm6b5Z1W/rFecYXpB9Y3l2IeGCoui1XHh9Il
	j1fUZNIDjhUMgI5dir8x/yRIBsV1NzfLEhpJ+xkh7Earc+tUg6f+u+hDH/YY0I6lKj+a/lCKCJe+2
	gZKoNaM7Ql9nH6nEGOkwFN1SbdVi0/bbWaLiPIOjoF4BGdOaSHki5H31TaEJns2zN8j78AwkKG92L
	eq7Rs4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6m0-0000000FJUS-1rcy;
	Sun, 23 Aug 2026 11:54:00 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6ls-0000000FJPr-3kAo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 11:53:54 +0000
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso13680685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 04:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787486031; x=1788090831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71w4/rq4K9yb8GmFJtMWkONctoSy21P/XVfk3Fhsusk=;
        b=i9cn9Vn2+MWcfEPD4/uE5qqn6Ue8rgUpP+dEmPfpHAizazKsmzaFp38PRI9t/qKNgb
         ZyKqDbvnhO61p0VYFdLOQLEdbAM6iIEqQyhV4gGjQqkI5fndCOA3Jpv7fIhsb7XGP6Sd
         b2JRUOW4f3E25DPPsKxME+aBtVdG9jczjdTOAi4A8YIul0TkCvoOctIWwdAain49WQiw
         oPY0pw6LBM64teX5h5YMEuHTxGr8B+0gZw6IOlL0NgjVosQHG8KLJIh3heDK5ai/7Sv+
         1JRIlA6a92kmIpFORoyAToJ/NxWUn1GUZZ+KPHWHJl+ck9Xot7muN4pWuCT85sa0idMS
         sGLA==
X-Gm-Message-State: AFuF++nZri6m+bIfnw1lRal6izlDW+rfX19VfTh07pAgSZjfYO5JOQk/
	YxShVJ++MEBoCrRTn5xKL3vH22nDBFoHLAHwpxhYppMi+lSv+PrqkZOd
X-Gm-Gg: AR+sD10Rham5C+juc7hPq/uQr93MXkeFqo+gsKZA4bxfrbFZPO/UyR/+LIEC5fsoG0o
	QlxU0ps8lRWhaEnMVShbjVDM/QuylKYjkdWwf/miFHgYuEG4Y5BK9BVQ8xv9HNCA1IPi9yqIP+s
	gdMeHWTicCW8VmYct/rAff0RkqgGjzfN6iv06D/byPU7PXLME2uzk17kn5oyjL4Ns+p6p7Z5jcT
	TJk3Amhsr/LMAY2fwbq4SfCb0Hb8EkKUpuIIMQCuovHq46iy++moWVhpH595WaAkLQZ9fzP06GS
	S6g0ey+Gq1JAAlGxzNT2mvFghdgceH6tlunnYMSGN52ann6rLdmRubCI7ZADIv1T0IlNR6Q3doT
	UvhQUu7f9Lx23YNB705ieIxLKdF0sTrc+aey7HGONc8heJzXWy6Y+MiRbB5xbZXIyGKnxDgtbWA
	13gYYFpDLd026uUl/2pqxHORSVRHHS4lNXdubYTO6U2MUzFGVaXto9HKj5CvgeTqIXDgG2XNMIx
	pVz3zCmTiKp7u48TRJJRGu2qm6gge6Lxk5XXg==
X-Received: by 2002:a05:600c:1548:b0:499:841c:2016 with SMTP id 5b1f17b1804b1-499b8273456mr224164355e9.0.1787486030800;
        Sun, 23 Aug 2026 04:53:50 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c355e1ddsm48680935e9.5.2026.08.23.04.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:53:50 -0700 (PDT)
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
Subject: [PATCH v2 1/2] arm64: dts: amlogic: t7: use the real UART pclk
Date: Sun, 23 Aug 2026 12:53:34 +0100
Message-ID: <20260823115335.102219-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823115335.102219-1-tanure@linux.com>
References: <20260823115335.102219-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_045352_972390_CBE41571 
X-CRM114-Status: GOOD (  13.79  )
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

uart_a listed the 24MHz crystal for all three of its clocks because the
T7 clock controller driver did not exist when these boards were added.

That leaves the real UART bus clock without a user, so the kernel
turns it off when it disables unused clocks at the end of boot, and
the board hangs.

Update the board DTS files to point uart_a's pclk to CLKID_SYS_UART_A
instead of the dummy crystal clock.

Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree")
Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
Signed-off-by: Lucas Tanure <tanure@linux.com>
Assisted-by: Claude:claude-fable-5
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
index cab2ee9ea0d3..ca7536f772ff 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
@@ -33,7 +33,7 @@ xtal: xtal-clk {
 };
 
 &uart_a {
-	clocks = <&xtal>, <&xtal>, <&xtal>;
+	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index c41525a34b72..75d81ad6830d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -266,6 +266,6 @@ &sd_emmc_c {
 
 &uart_a {
 	status = "okay";
-	clocks = <&xtal>, <&xtal>, <&xtal>;
+	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 };
-- 
2.55.0


