Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDF0D4978D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 23:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3n2sCT8MkP4WapXVYlrCUZa0gGtNlMO+qY9Q/noMw3M=; b=mBj4BWfRm5GwVsmDVvYWQ9b+0X
	4IqV1AQGs1qLsuX7fGBxpiNVBkxRbh5MF0U98eAPJGgnkCpJPlav56njP8G+jzdICKp1km+enCGsy
	8PCQ+sxJ9YZwUBp4jk2M7Us9D7Wup+8s0cKJTVHo0aB3g4E76sH6wc0Zf62eZ49/+nlof1+r8mGOu
	q04xmmAsQ6vaofl5NkDxx+XvHAOsrI2951JWV7GKdK6qb/cWCDvkwtNT3glHq6EvTSC5j4EaoF2zd
	17UVs1Yx5TyxcWYzcynf46H7IvK32Oy+9+EUv8cz97AXE8pbBy9AEijF9jCHaTJ6/gGsWF6N951za
	AhuHA1DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHteu-00000004Ye2-3c5D;
	Sun, 01 Dec 2024 23:47:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHtdw-00000004YZP-013z;
	Sun, 01 Dec 2024 23:46:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso2928670f8f.1;
        Sun, 01 Dec 2024 15:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733096782; x=1733701582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n2sCT8MkP4WapXVYlrCUZa0gGtNlMO+qY9Q/noMw3M=;
        b=NBHxhFpvhTtkaelowUV1IJ+U2wJ3RpWEmWJSHkZTD1setMdyikDA5oH6cyNZH8ZCtw
         pKRDRxgX7WQHIEXkdsfgFmZqACHrOms9ZbzCQynFddlXEhXPJlEkjSnlF3MBSkDFo3JX
         KQQwNg3a85lIMJQMGNW3rvQU5s25XzHnpep2Hr/FsVe5335q7jAAnqcbYMa/MD45iQ06
         SjamzZAkiJeJoMF0BSOppPZd3dzBWWEbAb5VLl7m0eXkfMYtx8rcSybdVX1OaHcWHvZX
         HRGn4jEqsxabuIqn6R6Um3DWDsIsMR018m9AOSgssZ4AyfBxXw2be17WKcEvKNbpDVE5
         suNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733096782; x=1733701582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3n2sCT8MkP4WapXVYlrCUZa0gGtNlMO+qY9Q/noMw3M=;
        b=JEm1c+gmXOaX/IeLvI0SUTCsal0epkXKG+sJoWY1Z5XdorP2uohsRZQHfAT4tizeNS
         1VqTJHmRarZnHQfpfn0hJHx06vOR680HhcjabtiCjBs5nr4dsPKTrbejUCx1roOP6e1u
         RfSl8eK0PwJhk/q/keIKvVpZfz272d3M9GVIxE62TlthmFXb9W/Umz3kTv1adh6sLVEU
         hEk0fncU9HtrFW4A5TBffVuhnKIYAwamUKUQUbkRP5yhusbqYhpdDjzS6PrfyDQXx7EC
         5LS1mmvBITSlLil+VSF2Nynu3o8O/dlUs8U/MZyiNS3cj7E75nQJ/6fG2w5h5hWtrJ6r
         /kjw==
X-Forwarded-Encrypted: i=1; AJvYcCUFN5CxmKSHHMiIGPW6+DN6Q0vkpetDq8K5dmjPFPaZ0NJ7LJ+3VCBQ5GX7cL9grbf3VqRQlWJwc04/PKRmne8=@lists.infradead.org, AJvYcCX9scQkHsOpXVisAwMe86F6xHjZLIPvd3N7w05YBNrP7uQIi8S7itWcKUDEFwHIK/tI/hpMUwYVXXHP7GA2iMna@lists.infradead.org
X-Gm-Message-State: AOJu0Yz75W8PogyV8UZKXF44TcwiOaPY3McPBfQN6FL3YaSJEOir7EcD
	qmfZ4NGb5VYYghGcgVkGjGnS2P0e+7Ba19XwEhsJmoSUiJ56S8Gpk5lAcw==
X-Gm-Gg: ASbGncudZjVIou+folnkNNzUpoi9p9gqQjpci/QOKmA2jMpvqkHnqIqqYQZW5PXxKxr
	loGte/62fZJ+wBb5X1/XkgfzXb/E4Q43gBuiJkXb4Sg9sI67rR3ArpW+xu/sSFp/j/0chXoHdXe
	ZWGWeFH/N+jTlNvO1UguBD34R6SeyS0i6/psNsTCSCy1IvD54H1k2YbEr4lh7GALJInZMmK8p9+
	pl4n2YfgdJH+GN6/AtgS7dNHZwoAEfG0fwF3j69LjM94zwJoXUII22o+Sfp9zTGWL0EDi8IlDzj
	L0PLhwI2AA==
X-Google-Smtp-Source: AGHT+IEdd5dpHxDU60Rl23qbbsd+Utd3y4mwZDWURtLTMc8M+gvOWR1ABoBD6snXzArhEA0NYOrLJQ==
X-Received: by 2002:a05:6000:705:b0:382:49fe:6f8a with SMTP id ffacd0b85a97d-385c6edd520mr21824979f8f.55.1733096781435;
        Sun, 01 Dec 2024 15:46:21 -0800 (PST)
Received: from cypher.localdomain (213.95.187.81.in-addr.arpa. [81.187.95.213])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-385e2c84d52sm6116014f8f.49.2024.12.01.15.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 15:46:21 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: enable rng on all rk356x
Date: Sun,  1 Dec 2024 23:46:05 +0000
Message-ID: <20241201234613.52322-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <a>
References: <a>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_154624_064103_AA1E7E77 
X-CRM114-Status: GOOD (  11.27  )
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

The rk356x rng is available on both the rk3566 and rk3568
parts, the IP is all self contained within the SoCs so
it's enabled already by default on rk3568 so let's enable
it in the base rk356x.dtsi so it's enabled consistently
everywhere.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 4 ----
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 1 -
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index ecaefe208e3e..9dc09db5034d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -397,10 +397,6 @@ power-domain@RK3568_PD_PIPE {
 	};
 };
 
-&rng {
-	status = "okay";
-};
-
 &usb_host0_xhci {
 	phys = <&usb2phy0_otg>, <&combphy0 PHY_TYPE_USB3>;
 	phy-names = "usb2-phy", "usb3-phy";
diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 62be06f3b863..2994cddb3464 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1038,7 +1038,6 @@ rng: rng@fe388000 {
 		clocks = <&cru CLK_TRNG_NS>, <&cru HCLK_TRNG_NS>;
 		clock-names = "core", "ahb";
 		resets = <&cru SRST_TRNG_NS>;
-		status = "disabled";
 	};
 
 	i2s0_8ch: i2s@fe400000 {
-- 
2.47.1


