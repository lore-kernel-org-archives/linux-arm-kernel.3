Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC758F44873
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUTaySjIgh6lfu9rWtVOEFr4avLmeO2LROURou8Y2uw=; b=eJ9uAGoI3OnUA4QcY+8g60Cst9
	omaPlFz41/q9QT7enWGTR3ciW/nCpHawL0Srbvy6pxvoeQZhA8cL2uuAuzibd7S1mLBLm103jLoT3
	+R0pbbxHBdHbmI7Fr34A2a30vJzEk6rsT3VOWjN42A3CBmFV14Ut2OAM1GuHdZ9xusvakdf59+2xA
	52oCbTCrPSOk7aXddJz7z8RcRDHY3kIPo6KJt0n45EHt9oUF0+b0gLk10dWlSezCJEJWlbu9u29gM
	ZHprCsx/Gi24rN6XlBeN1keG60ZFk58QGMBQmfyHVSZDjJ/LP054rD6GxgppPtok4r2gEXCKhgCgV
	MRZVEfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCVv-0000000CMJI-2iM7;
	Fri, 10 Apr 2026 14:07:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCVr-0000000CMGH-2Sa4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 14:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=aUTaySjIgh6lfu9rWtVOEFr4avLmeO2LROURou8Y2uw=; b=rTmYEw0TijhMcz5MdrRV3FUwKU
	oT40dMLUtkwXgoA6Wun9q8oREvMkf/Wez96SuqeMmQ2+6jZYP+ZsfdTjVFuZaQJeNu0livV/1j3E8
	E8GlFwJY3kOllwDkNYsS80oZ7pfGLZNpqRKeWOOr2+eGJzT9W6cu9oEt2OreyUaAYAKpjuVOINKW4
	zfJdfcDDGxG/6nhgpf2lPIIeFc1q0c1+LR3H6wMbJE3bF8bEjOFqzCpT7JfEAf7dTKmLdWFXVr0xi
	78QLFH93rXOeiGQXSSxvwS0VOeEEQSkU89WJHGzCVAgiAlIkyGtD6adiFKnkXCTOoNe/jJusvL5NN
	C3f8Sw5Q==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCVo-0000000Dd0I-2djb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 14:07:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso32947655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775830027; x=1776434827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUTaySjIgh6lfu9rWtVOEFr4avLmeO2LROURou8Y2uw=;
        b=gnhhXkItDyMX4J75IAow42Dkw4OxdOkoOP848vfFkDghMTyuOanDe6gjk7MagZhgyp
         W1jRcjvtQYO3I4rnS+5wHTGjlB5opKwiDKu2QzUhk2PHdk3/xCUzDQwE1WgcvfB1+do3
         G+cAJVVWw8dOBXtZY6QL2aldejHVc9DIpAO+Nfdjz4UFqfwgQVl/MhNyKIvY8HcUgl6V
         y/XwEXw01uQHJtiiaPLfPI4PvtuQQERzlfsmEdpmyGVSMKo1GzcvywWXV0Su5NsZNUcL
         FXSePTnyFSbT1OELwxIdBtIc3jtbZ129Fl/1tc477DrRsHQgfvbu/cAMIifRg1s2IS1x
         YctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775830027; x=1776434827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aUTaySjIgh6lfu9rWtVOEFr4avLmeO2LROURou8Y2uw=;
        b=UJIO4Yqc0RDCy/hIBVMyrkWzgaO9DZ4KglS04+XgHgGz3sLMmA8fp0Vt4ce34oNVC1
         s2h7q11Os1KLqwUPI/nsZIc0s4scSVVcf5+62b4TQ9u0+jlFPB5qQtrcNhWeTVf9xFzV
         yKJpSCSLJRkYV1aiF/7kYR5uEaH9Sre3rZOpNc1LoVXwmY9HEuDYEwfuuqXTS2+2+Efa
         USFKkXvKtSci0WFcf+MW8Mvwlz/dS8CpHqMygeOxlbuvWZDbZRH5DougbUkI72FdVYzV
         HNF6niLePs7kbIp4kEpkKohzm5Y5268Ncw1cW2sUg8B6RwicVfGZBl2C/9o4FBFPKUzY
         mSZw==
X-Forwarded-Encrypted: i=1; AJvYcCW2dbEpZy76rEdODF52oBb3QqTvJDcoTHbKTDFV6bUNKAZD0QmdciG/+gkpyNyZEg4QDXZHzZxl0ehecsD3yy0s@lists.infradead.org
X-Gm-Message-State: AOJu0YwwdINNzVrMUOmkdbvLjk0LgJ8DhYxjwoXi3M39P+boY25zDcYk
	wnVMtMqRCP1HMBtucroTA+rmzthKk9vY/W2VCcut+eAFC2aLriZ2PBT7YMp7vJW+frxXJZZkQqy
	NwoWN5yY=
X-Gm-Gg: AeBDievlTQjgLa5cw627iOFRCRpFjhM9mJE3EAfqIEf7DeaUfgeRe2nzvs5qfb2PEiT
	t0Qoz/i9m4bKjA0YE+hKzmom8p6s1OmgYn5cGTMAxi+pJx5Z37KTVgNjOqDUM+4zwcLkCS2XTDK
	z8mC/CJwcSHmWtnk5Q0Gf733loTGb6qjHWz98bwp0TB5E6JgocjcRztr1kon9lYXbok+ak8AwCw
	8iqyo9Eb98Tio2aSozVt01VkfwRmJG3ovv4VYKW+PtOUGEA1iP7axtBiWGg7xLj5KNinyQs8S+V
	kzFV8bDBqXnb/dV8XX4sLBEFLV2pGNDr0vtbLkgzlvcCF1kl0/gljhJchLYJRZKby5GG+/imgVq
	fKs876dM5VBCrjDolJXRix0Vou/OFd2Yexc1CUMywyWKoqbYneCFzdiGbn4xmmMo9cLygUtNKlT
	mnR95SuVoXi2pILEpHDZBFkQFtEy5V/+zUPa4Zq+18SZGxN4Ma9AJxSdgozK+Y
X-Received: by 2002:a05:600c:608e:b0:488:8185:e672 with SMTP id 5b1f17b1804b1-488d688d2fbmr43720335e9.30.1775830026934;
        Fri, 10 Apr 2026 07:07:06 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63deb904sm8504646f8f.9.2026.04.10.07.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:07:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com
Subject: [PATCH v2 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Fri, 10 Apr 2026 16:09:59 +0200
Message-ID: <ba57b3b38757d37cf09ea1b8b9e6b6a106d0b292.1775829499.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1775829499.git.andrea.porta@suse.com>
References: <cover.1775829499.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_150708_903262_B16CBD1E 
X-CRM114-Status: GOOD (  11.55  )
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

From: Stanimir Varbanov <svarbanov@suse.de>

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan.

Add the corresponding DT node for this PWM controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 2856082814462..a4e5ba23bf536 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,12 +64,24 @@ phy1: ethernet-phy@1 {
 };
 
 &rp1_gpio {
+	fan_pwm_default_state: fan-pwm-default-state {
+		function = "pwm1";
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
 	usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
 	};
 };
 
+&rp1_pwm {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 5a815c3797945..d0f4d6be75500 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -26,6 +26,16 @@ rp1_clocks: clocks@40018000 {
 				       <200000000>;  // RP1_CLK_SYS
 	};
 
+	rp1_pwm: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
 	rp1_gpio: pinctrl@400d0000 {
 		compatible = "raspberrypi,rp1-gpio";
 		reg = <0x00 0x400d0000  0x0 0xc000>,
-- 
2.35.3


