Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64DBC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZLd1/1IT1KQrLTeqsilryM+oTbbpX7k277woXo0CNs=; b=dNXP7LpqC7JLCAGJxaxNFsOSs8
	KRCOotJY6qCcEXgHPXOwVlon56malkAYsKsyAtCT0mvx2c5l3MM2KL0xZOh6vvKINa4rtOLqggzTp
	eLxNnv54L6hcj3x3HR5b0yvZfG3Igq/7LYToUHKkDMHMe2chvHHdlVmEN8RnFh9Oy2sGecm+gb1gw
	mFLhQ08JKoZ58/SueD6Pk7azCnbUkFceOiw9H1tMoPYXXqDppq62KsFpg6HBfPib0KtOpDE/oMBms
	1mh7wCb1YIjpaAbT7Vljtamn1Ll311lHanVcfpFcuP+saMvQ7x6FAIiIMYRoVauJaxm3/fn2zzkju
	ZCI17jZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti13i-00000005mC9-1p4k;
	Wed, 12 Feb 2025 00:56:58 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0w7-00000005kag-1eC6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:49:08 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-8670d630d2dso1172594241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 16:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739321346; x=1739926146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZLd1/1IT1KQrLTeqsilryM+oTbbpX7k277woXo0CNs=;
        b=I5dl13N5VFbTfTHClinDmkIJHFxKSUMRJaoxHVIw61qvkT5kn6tN7zKPonmjDganMx
         wjoUseeT4/s2Z9+C7thWrfv6DOReWUquwvC13NOh0jlJ5gZDn5pn4WR07wM8aoqGxWAm
         y52qQgZ9+NGXEaV8SPsQ/i29/sr6odWWWehf0e0kAAnqX3JqZxgAQOkgQHZfvbyxZbl6
         nuxyvBhWClu5zdxLLDWAmkVEAUcsDnGFJwxJvCec8djKC0/jtyHOgoPNgHW/oBCvTTg6
         PShzLUek/dfdWQy4ZWhQeDaJcxLybY2MiZLw3VA4e4IthvhRMNIFEsFYiQt7dpGfUUFH
         tshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321346; x=1739926146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZLd1/1IT1KQrLTeqsilryM+oTbbpX7k277woXo0CNs=;
        b=cm/4ZxJ73SUO8182DbX9hLx44uH/NUVmePyCHOArt5gI/Jf+n1/Hg4gEmvGMXNWvHN
         xlSgYg3HmwzqU4k/zl0YhXcjY6C87jt3mPg9+EhK4DEwLwuJ6ZYY5Otg0QR8iFH9wcNK
         irF2l+sXNAcg+oqQZvbCOA0TpTYKoItJlTmyFlAsLibQ7SqAnEkrQQFuYsRrkll+IeGw
         axC1DgoX8SCocFAB3YCgP6ss//r759qy06AoAbBV5nU0IqklJRBfBg3Gepa6RLKOuTMa
         sEzXOhBBxCPHfsOP/CMjSOFn2JW0wrPUQhtOIy8GT2PICzUJth4uSsV0XjnpTQNVpZRA
         yc8w==
X-Forwarded-Encrypted: i=1; AJvYcCXG0j9f027BFwLm/6Hvq73S0oaoaCUpuO+T+Z+VL8ocESfMnbOLhgqqkNX5+nR9VG9kWWxPkdbFRCgRhLDXOGI/@lists.infradead.org
X-Gm-Message-State: AOJu0YxwcKxy2yHoQiCDCMQjzOh480peAy/YQR3PBQRddx6pS8lWVDIy
	vcw83GxuQkMEYxCNdVR/gGx1T2cBq73dVSkPLqJxsmMR+qyufStAl3wK2TlH
X-Gm-Gg: ASbGncvIOL5JpBrbbsb11yhr4PJH7CfCUuCVzQkjTMiMyv+KxPQKe6SwCrqinPo2OZZ
	4Vi3Olj7wUulOO6T4FJFTS8EuIgYd4dlgrDmeiXCs24TLNkM9mUamUn1mY2WLFQKCvzYbH4VBCW
	w6eqndPwX+PWgZMcOAQfPR0fmoofE9G5XSXwzvI+Syaqs1rFIoXL9stDovik2pBP/cwV0C62wn4
	Tyg6TTkQORlk7RnwSafTfVYTV97WyjWoAD2xGzhaxd//EGVAb88q5QX8x/AZ1K4u3/A3HFM29QJ
	O2gccPqZW9rdPMX35f0xib2UoTK+UPYCW1UKdmtlaBWPz6UlUsoxhPhkQbj/o7Ds6gG02DzzkSz
	LOQ==
X-Google-Smtp-Source: AGHT+IEkusJS08i56e3/A5ApNn7f580UIg227FWVQE1R58c4fK8LR1PjSKqLhKoph0+OeBxjbqNdCQ==
X-Received: by 2002:a05:6102:50a9:b0:4b2:48ba:9943 with SMTP id ada2fe7eead31-4bbf231076fmr1647416137.24.1739321346111;
        Tue, 11 Feb 2025 16:49:06 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbce4c6fcfsm823832137.23.2025.02.11.16.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:49:05 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	igor.belwon@mentallysanemainliners.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: exyno990: enable cmu-peric0/1 clock controller
Date: Wed, 12 Feb 2025 00:48:24 +0000
Message-Id: <20250212004824.1011-5-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212004824.1011-1-wachiturroxd150@gmail.com>
References: <20250212004824.1011-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_164907_432300_BE83D06F 
X-CRM114-Status: GOOD (  10.07  )
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

Enable the cmu-peric0/1 clock controller. It feeds USI and I2C.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index dd7f99f51..843587b17 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -231,12 +231,34 @@ pinctrl_peric0: pinctrl@10430000 {
 			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric0: clock-controller@10400000 {
+			compatible = "samsung,exynos990-cmu-peric0";
+			reg = <0x10400000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;
 			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric1: clock-controller@10700000 {
+			compatible = "samsung,exynos990-cmu-peric1";
+			reg = <0x10700000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos990-cmu-hsi0";
 			reg = <0x10a00000 0x8000>;
-- 
2.48.1


