Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCD4CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=je5dBrj3vm985BEWP7xJBvRk6bSW3/nDeB6FvhlFHgM=; b=xDgHQZzLndrBylNdcl3mWjt0/C
	zr0KjMsy3kvZKkruUVpnDW9stL0qLgZGH7tjEMxuRRwKyBz5m3M0q/MdbgOFJgjkurERHxnKCZxEw
	+IwixiDMw9cahl2qOIGizh6uOBXyW6ajzkH1ZN96GPBkTvqB/wx3DKPdJMG4mQPteYjjEieVOiZY7
	TdRgnYjov43sfvzv/pFLVPeN1woaaTKElI80DUnKw803BG7cNa5MYrWL7nQytPnAtEOQ6LdEpNDeL
	UU7C+VeTg2uShbO3MBrSvoCXhwM9ps9nRCyC5pLKGD8miIoqeuL4kyYXV2caem86Q0N+rukZmEyC5
	IyF4jcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usKCt-00000007q70-3SQS;
	Sat, 30 Aug 2025 11:57:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usK7T-00000007pr8-0IGU;
	Sat, 30 Aug 2025 11:51:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b82a21e6bso8437175e9.2;
        Sat, 30 Aug 2025 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756554701; x=1757159501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=je5dBrj3vm985BEWP7xJBvRk6bSW3/nDeB6FvhlFHgM=;
        b=TOxez2IsMaq/nCm+kQ4bw9xu3WPuUwpr8CR8ZpAEfEVB6xTJbEjR4lZ2ua3VD+LcR9
         2HJxpnrf5wa9keoqh7+4/Lh4JVMOfiMiEA8DkDL8Vc32Osc7nm+TE9Yn014xGv9znl5H
         u6wGLnP91zi9UTeefjGlYKduVE7B31jKaMPBlenmRyt3gGlQxXR4EErF2unCL93qHkcU
         5CopKZ74HDmmDjM7lc5Nk+VbaS9mAVQfFsOzIMpzwwFC3MF2804GcN1ml0abmfldpGhK
         qcWXIBSgMT4qISkUG6RTqAyyp8hGpU4cn8npE4Hp9mectn/v4QWMTMaoS+VwFHKiiDk2
         rjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756554701; x=1757159501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=je5dBrj3vm985BEWP7xJBvRk6bSW3/nDeB6FvhlFHgM=;
        b=n6iwW8Ws7Ogk19gaDRYyyY61R+4KoRbNh59YivwWqd2bewkGUxv6Gq3yHp7xIg3b5T
         35WnW2WOCwl4XkPj2E5vtPAfcu9P7SAdrHD3d7XCFAJkq5/AgLbIkHbBwQ77tbcEtb6O
         FjM+RvuphnRngdKj5aJbe79oSkPD4//D0xn+3akTycsBDSDQsgs3rcxNlecea7T6XS5L
         DpJKyklrtlm4l3jDoNgLmcH/7bWuhtEdc3fTBi+VrxSBCgp83xkiDXeWz/EsnSXdY3E4
         02e/fqu7KCelo00QUi0+GgqJ32BDVjaeTAoU/yPVfWq0JEDXV2ihiEvGORH/yrkBW3lw
         NPDw==
X-Forwarded-Encrypted: i=1; AJvYcCVrzEZAPZqkXK3ZT9g32cXp6WytQ7mmRQM45MMxn0Nk10S1UDLdzYN3mHd28BP3bTV45BJl9jC1pAUBUwtyei/F@lists.infradead.org, AJvYcCVsUUpqeSzDPV1sodMPDHhKJdAkSfO/WP4vz226/PgXSRNS1jwbnf6dN4jVC9jeB1mnP/oyDwnFCzkfUcqriuA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpvTn2kWNmZO4ZdlAsFSN8gw3v8yzP511Jd1WrYBQU8lyfWEXE
	kKAvp59Q+cjwOb6b18GExv+z2sfgS4hfC8X9sD6XzztSiKHb1wff/6i5B+TbTuza
X-Gm-Gg: ASbGnctGTwh7k96IQv1HYTfvDSiygMprglyp+4foQ4a5lcwDYoKVZPR6eJOtTWcPFpr
	7F1y3CSZI1waj1o0oC8px9Q4QY+KXyaQv1vXFthEsxXfiyEGggTklwPXeC9nc+1yncCKj/d10Lk
	plzRkSrVBwkjraPGrUl4oqfbLM9k8fBBf9F8o7mPpWuyXZlgZf2ZoSpmRxnRygU/bxu5nIF8rCa
	K5tbYfn0TQ7mH1A3ns8YQlRAbYBDkqFxKp7JFVYZbAhNDa7SQVaZqyV4JZ0LCk4omvczReBGAUS
	IugYhOOVqveSC9R0CCuFkVDjJFA2wNV2QLeQLKvt1Qc2E3iio+pivSAdHT4LXjZzhnqLycrLR4O
	s9ks3J0cfuKSZJhYTSaVLlC+i/fR6x6ryBn3Dtg==
X-Google-Smtp-Source: AGHT+IGGvKDGAltmu1fh2shx8QY2vgKaepr59Vv01ZMlUK3ev4dZ878EJwGDNjdAFH+LHASm8Pr2+g==
X-Received: by 2002:a05:600c:3b9d:b0:45b:7b00:c113 with SMTP id 5b1f17b1804b1-45b8553f25fmr11981225e9.2.1756554701360;
        Sat, 30 Aug 2025 04:51:41 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b732671b7sm68161555e9.3.2025.08.30.04.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:51:41 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: enable the Mali GPU on RK3328 boards
Date: Sat, 30 Aug 2025 11:51:35 +0000
Message-Id: <20250830115135.3549305-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250830115135.3549305-1-christianshewitt@gmail.com>
References: <20250830115135.3549305-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_045143_109765_F8096DFA 
X-CRM114-Status: GOOD (  13.07  )
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

From: Alex Bee <knaerzche@gmail.com>

Add a gpu node to the rock64 board to enable the Mali GPU and
move the existing node from roc-pc to the shared roc dtsi to
enable it also for the roc-cc board.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Note: the a1 board already carries the same change. All other
RK3328 boards appear to be headless designs that have no HDMI
or obvious media capabilities, so no need for a gpu.

 arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts | 4 ----
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi   | 4 ++++
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 4 ++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts
index 329d03172433..c0b7b98ff788 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts
@@ -44,10 +44,6 @@ &codec {
 	mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
 };
 
-&gpu {
-	mali-supply = <&vdd_logic>;
-};
-
 &pinctrl {
 	ir {
 		ir_int: ir-int {
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
index aa1d5a6d7fd5..3fe0c17fd2b1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
@@ -167,6 +167,10 @@ &gmac2io {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_logic>;
+};
+
 &hdmi {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index 5367e5fa9232..592fd8ca21df 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -152,6 +152,10 @@ &gmac2io {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_logic>;
+};
+
 &hdmi {
 	avdd-0v9-supply = <&vdd_10>;
 	avdd-1v8-supply = <&vcc_18>;
-- 
2.34.1


