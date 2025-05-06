Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D232C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y3vbxhBSLqLe3XjcC4EERoFFbogworhDxS7+05BBfYk=; b=A0qA0qbY7VoGNMGpaeVJWcd+ae
	RFB3XpV04SDqXTXN6HnKpc3gD+7hgL9muhp7gRW/K0+S3J81TreRpe05kmdgyClQ4XDI7HPfiVwOS
	Ony1xMr38ksfobBQYTt+EiXBaBn+GUlHbo2ZKniFsyENY8tfCcBXlLByivY0RIjmgO0BSUf0e84Qt
	TiWydvhexjjKbkfCVF5LI5TcUNdiFkkJdBwWU3k5YSUtiUqoIpnmNLjhWJahC89HxbKMr0BnSE3qq
	bADkNvQjG97qI5xpUFmT8pZksy07QQ623t6nWEeehHOhsBlXYmbB1Pab5VwGz8gBrobsO/fgzdHpI
	sEXh08eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUaX-0000000DuVx-0qnQ;
	Wed, 07 May 2025 02:32:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOPb-0000000DIHs-3H8R;
	Tue, 06 May 2025 19:57:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso4103463f8f.1;
        Tue, 06 May 2025 12:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746561425; x=1747166225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3vbxhBSLqLe3XjcC4EERoFFbogworhDxS7+05BBfYk=;
        b=Zn1cY1AD5VH+gyfAqlPcsiZX9F5hp/EOMYyNkA06g02dA/QNfSf0mZuzoW0QXu+4l3
         O77Ev5UFGwwi4LLpFaQ3NejgExLQLK+7z6CJdqSP58ZtaNjJ+GHffQUrRuiBxVgZy3Uj
         CJvJf4DsTFCQenJInIwekkL7M+676QOXDtkONMm/GNtBLSXUacz+80euEjNV6e3dAUdU
         8HiY9fzXdihL/Jp2qNIYoXyYINsfNoOtSVWgusxSlr72nVPeO198Rd8bqYVbx3Bn3Aqn
         7xdl7jRs1g6ueV3mL8rsqkcazdvoJblTV30r/pwFCX5PIcS9U3mGx/iLmZKUUJWZ1lbm
         9rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746561425; x=1747166225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3vbxhBSLqLe3XjcC4EERoFFbogworhDxS7+05BBfYk=;
        b=T/Vu/3c8voK9SLYeBn1/kPWjBpMzWUcU+hZAN0Mfc7ZnFMn9WQMWgyui7HVVC15VFc
         3SJ/azI5OCDdt3GeTK4rgKMD2Jnc7e57sbXeLsCxcvwoREGyAxB9NyRsKjmGFtnO+qPd
         RvpaOl56NLZII19vfWWWLtH9Sxd3QmFP3q9CsUZvtLvT0M4dw9KwNRGq3I8CKl+66N3O
         jML/SIuIYXyPTHmCotk0349dLmqvnRbUD1Gy+NkYaxW3tZjbJv6vjOy3cdHnZ8tdl2sH
         YdqI0IXnDfOvrs3f4xi4HuY/V6fxF6ncsD+ZukkJOscP0WdzQHbfYi6IqMYRiM5RcJPl
         AA3g==
X-Forwarded-Encrypted: i=1; AJvYcCU6OooVt9HB39nmJ7kwEdrz6dPWf+20cd2JFs3Xjn2xPK9HxIVL8/05UF5EqIGel1IQBSRTN15Kii6ccnLVhdk=@lists.infradead.org, AJvYcCVe9Vu6jnUhatNpEHPOmLLWHiH51g37vtYjHGTADa9EcIzkIHm9hh1tmCcxiTZxAW45VTPSPxGdbfS9o9OqZSI6@lists.infradead.org
X-Gm-Message-State: AOJu0YyIpeB2Og6/VMlOysDZF01iRcwhckG6R7fTqPkjGo+bo9m4I5xc
	8Z40foZfbd1Pn+w23y5d8ZllIc69IKxA+riXVsPfsUXoyCRRsPst
X-Gm-Gg: ASbGnctdNRBY3kmcI+vOjZVfz95WQwS8S+mla1xIAUWJsSRjw8cXbvOwLTkxnL4sxim
	AmCiL1Y3OUA4VSdR/mWDM6CRFN6iN0pAVx+eRp2vaDcjiCmsjZQaT3YNbz9HVl77YiYihNn0USa
	XiYTQGvspwWP/Xlq9yLEm2mmzL2NcFQcakoTDBinh8gCPhk9tcdBuv90hR0AfRGkjYuM6h7mntq
	bNPjMjKSKuCsTQqAerkNm54/qkTvwSCDGW7D5J2YsJU+frhwyASdVlgHmgGjoTqqQ3OU5U4kXOD
	dKKXZZ/buLH/r6mHC52ygZ5y3gCa99OVCYfa7SdXpG60Y+SNwtMZtdyHRWbeH0XjtEsxlyzpKa1
	CY+6wssDcFeSTPkc+O4Ug7f0eHPdCLloZe48eeFiWPAqLhSA95IRnhbN1h/iZa/EkUGAJgmJRGB
	E=
X-Google-Smtp-Source: AGHT+IG1PEHQDubohmsoatevOOLhijpxe1NphokuiP/Nu7Ncl0qkD97C4xKqr2gLqznzH6itSftAng==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a5d:bc02 with SMTP id ffacd0b85a97d-3a0b49ea159mr641969f8f.7.1746561424910;
        Tue, 06 May 2025 12:57:04 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a0b3d0a77asm885636f8f.56.2025.05.06.12.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 12:57:04 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c
Date: Tue,  6 May 2025 20:56:55 +0100
Message-ID: <20250506195702.593044-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_125707_816597_C7D1C408 
X-CRM114-Status: GOOD (  11.96  )
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

As described in the radxa_rock_3c_v1400_schematic.pdf, the SPI Flash's
VCC connector is connected to VCCIO_FLASH and according to the
that same schematic, that belongs to the VCC_1V8 power source.

This fixes the following warning:

  spi-nor spi4.0: supply vcc not found, using dummy regulator

Fixes: ee219017ddb5 ("arm64: dts: rockchip: Add Radxa ROCK 3C")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts b/arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts
index 53e71528e4c4c..6224d72813e59 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts
@@ -636,6 +636,7 @@ flash@0 {
 		spi-max-frequency = <104000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&vcc_1v8>;
 	};
 };
 
-- 
2.49.0


