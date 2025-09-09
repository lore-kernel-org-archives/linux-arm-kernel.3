Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E532ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vf227nmbBVr78eoCmY1YIfO+zmAzbc+5L95fUaWK5oM=; b=zPU5naXX/HGTxGQeOTkwduneph
	1jRxC6TwCPeanyfLWu08wjSxzzNbSAPvPmnf6kYIGS+9c/wkiFULdBoOtVjrMUgBOf+OFaT6TY+dQ
	6qRHu6H4fWzD6mFIplAlGczrgKFo19C/3fohmRLLg4Qc6yBZhkEk/X4KbWRpvaFuKEEk6DAmrJi8Y
	eOGKTGI/4gTIfh/tvqx2EM+mlX7aR54q60QhAC8rOTO44cbFV/6YTuCQu0I+T5yvPHiVa7rUGN34p
	v0kyJ8u6LTfxmWMZO6wMLAKMp4chRL20bcXYdB51BGOYZVDKnNvkjaX8ObTEq21x4uTCoTvhuNXkY
	pONzE3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zG-00000008tA7-32jv;
	Tue, 09 Sep 2025 17:18:34 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyRY-00000007Ozs-2uwd;
	Tue, 09 Sep 2025 13:31:33 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so3863095a12.0;
        Tue, 09 Sep 2025 06:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757424692; x=1758029492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vf227nmbBVr78eoCmY1YIfO+zmAzbc+5L95fUaWK5oM=;
        b=kpJvaWbdDFf3Z+U9IITOZ6U4Y6taRpGrgnymRO2yuRo+ont1nG/fQV3LvV8bLT2I1Y
         myhy7qK/AJRCk1CLhqYo6VI43zITTauzi+TkiECsXKFYgC+BTQ5PZxo5KclOHWsv2R3r
         +KaC3MnlEhIb9CfK5Nst+wlQd+LQtEpuhKgramG/nceWUDbiybhmGvcLsEvBp8wZEBo1
         O2lzQMk9bCbofoGAK1XKUmJk7MbbIwFWQrb3BzyCXtBH3pNeUrddg6GQPOtQ3GFKh5bw
         IG/KJID+7ceFlRWAiXl+5EZ8nA4JHj1aEcIgx94bnQGrcwRychGlnbyLv4pZiG472wk1
         /fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424692; x=1758029492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vf227nmbBVr78eoCmY1YIfO+zmAzbc+5L95fUaWK5oM=;
        b=AKKQ9NpoxLE+VYy4jWd8Yi15HMK8aA+Cu41tF/jb/Y7wX49XElOYs/dFbMWmPd4kZ8
         gP0U9GPvRCi1jUd+UEQbEIAhWCSGFMDhfn3ZmtK8M9iLxuhQf8ZDyuF5bbschDd3uwvf
         TTmlcEx23+F89ugzB7hiRq2S4zRS3j07d/P2FB/3xG29cpBsVxmEa4dGSfEtRsYidG0c
         7FYPWFRz0JeojrYbnKyJUGK5Bs6Gj9q9Ly21Y87+LOYy0RK0lUVtajmMmN4+B436/1cd
         3FPLvz5pHG8askWqvRFoXoUTP92563NNp2XYOMyNyrtfWf18r5BRvSkk69/76nzRFxbg
         wTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlTAM+q8AyGqVpjpVUueUmiIEG5YJ2GKuV+Junmq4yZEuTDBPTpM/qYfwxBgc9yxum/gt2liURwZ7VoTJib24=@lists.infradead.org, AJvYcCWCz1nZPG63C6oQFRJiUYWWX7raHTetbyvly/CQ6NXCtrlmJidTk/8aUNV8uNIjoRXzaBfvRVlwwnpR@lists.infradead.org, AJvYcCWfvU9TY2fMp/xcmVIKE8RnyMpDkFfJTJmExLOQyZ8RWFA9nmzO9D8mMblelNRMQhe/CfreaXGf8Bw038WsDcaY@lists.infradead.org
X-Gm-Message-State: AOJu0YyxLaNENJP9dVFVMHpPZ1Z9JsEbORgYto62q9YmMIOZ5acqH9CF
	ut/W4cYQQNmpvPrfFDAinf06HsRXwrbWQsMQuQ+J1lrFXI63R9XEUSHT
X-Gm-Gg: ASbGncvvcVM122jgJNYUn1/b4R81wUXkLzLqgOLU0iXxV8cozGxAJ18A7SsYPXq2Ns9
	FSVL4IRyI6FJTHyUpEYhfqmUUJEi0Q4wp1DzF35+mpjoYganh1NVs0srFqArM7TPEbWplDw/1lx
	M3b53i+Gu90QUnW9iP16RCvnUTwRQxDyhmEKZQijoSwvCu6XtToEVoX67sRwC4JkhROIIYcPJnv
	nELHeWjtawZ/hw1YOQbwelbwTMul2BW/a2lloZVhtJcgDbVUk2FpNytKbpH8iTQYJjQZyXThmuh
	8YvaFyC5ucVZAKiSonJUCCXxIIMhIm24PV0SkRiAkJRlNE0zUrv+GxNq+BXOgJezZvHrL6HG/aj
	5K4frGzHK0KqDbdqrvJjG+Sk1CaLQWvF+K9ogbf5e5hB7qXvEMKA=
X-Google-Smtp-Source: AGHT+IEthdGhsisvIyGN1Z48pv9jWv3jpKaTdVzpsB9Py8tu3c9ndMxLN9nH0PnL8uY/ax5mYMCrtQ==
X-Received: by 2002:a17:90a:d403:b0:327:9345:7097 with SMTP id 98e67ed59e1d1-32d43f003bemr16178584a91.10.1757424690779;
        Tue, 09 Sep 2025 06:31:30 -0700 (PDT)
Received: from localhost.localdomain ([240e:3a6:1c4b:13c0:db95:4539:1490:64d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab173060sm810778a91.5.2025.09.09.06.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:31:29 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Add phys attribute of USB host node for RK3368
Date: Tue,  9 Sep 2025 21:29:58 +0800
Message-ID: <20250909132958.26423-5-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250909132958.26423-1-cn.liweihao@gmail.com>
References: <20250909132958.26423-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063132_732123_4C3BE326 
X-CRM114-Status: GOOD (  11.11  )
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

RK3368 has a USB host controller and a OTG controller, both of them use
a extra phy, this add missing ohci node and add phys attribute for them.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index b09e431a64..cdcbc0a944 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -503,9 +503,21 @@ gmac: ethernet@ff290000 {
 
 	usb_host0_ehci: usb@ff500000 {
 		compatible = "generic-ehci";
-		reg = <0x0 0xff500000 0x0 0x100>;
+		reg = <0x0 0xff500000 0x0 0x20000>;
 		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru HCLK_HOST0>;
+		clocks = <&cru HCLK_HOST0>, <&u2phy>;
+		phys = <&u2phy_host>;
+		phy-names = "usb";
+		status = "disabled";
+	};
+
+	usb_host0_ohci: usb@ff520000 {
+		compatible = "generic-ohci";
+		reg = <0x0 0xff520000 0x0 0x20000>;
+		interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST0>, <&u2phy>;
+		phys = <&u2phy_host>;
+		phy-names = "usb";
 		status = "disabled";
 	};
 
@@ -520,6 +532,8 @@ usb_otg: usb@ff580000 {
 		g-np-tx-fifo-size = <16>;
 		g-rx-fifo-size = <275>;
 		g-tx-fifo-size = <256 128 128 64 64 32>;
+		phys = <&u2phy_otg>;
+		phy-names = "usb2-phy";
 		status = "disabled";
 	};
 
-- 
2.47.2


