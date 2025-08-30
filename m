Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EAACA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 20:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XD/MAfd0FmRuxTxg6+ZVnGPk1e/NXFXUrP3nlfdWAi4=; b=k7hWLNuGtgh+BsWm7kbk31jFvD
	maDwCSSOMea9vkYXi7KIZplWBEgsivbrN/xK+xDxFhU0q3x2EnbgOZ6+u3oOIXcTmzpHE4yET29nu
	G+fIxScige+l82Tb46C81nP0c1W5ZiU41r6YLj1++tBm6Wc6buaPLU9s3xxxHE8B6ppf07nBAPGTd
	FicN8vK1YSeViDijOBQtkG9YY3JjjRyrp0A8eGdGhpui1RWFKeF3d8d246/2SMa0/05xod3X4YLLH
	amy7Bsq4dNkQ8Devao/F6q93tO9jljDoy+iTPm/4NbMTW3MUKS2U+xoKx8i7jtGaa7u109mPZcb5j
	JfW6D2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usSOB-00000008PaB-3z7q;
	Sat, 30 Aug 2025 20:41:31 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usSLR-00000008PTH-2aSM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 20:38:43 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4b3289ed834so2317381cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 13:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756586320; x=1757191120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XD/MAfd0FmRuxTxg6+ZVnGPk1e/NXFXUrP3nlfdWAi4=;
        b=jqQi2YCecqApCF5IZ1hg6MTnG3O52d0jLotQvn6IIvBhOFQISc0YuSkKyTgcq/SH/m
         ZcH7cPLSz25dG6zd5BGPj8jVnKQfw/HcTr24L1c8Nu9YKZB/l6TYPVfsBiBivGntFo0H
         iratpApD3qk0i0ZZ7P8Ki8Tux4ty6FQEvrF5lER9QOySn/CuwyRC96adC8ILaASgOnJ6
         GmyprSLNI9Dg7zD+ppFcBpqf8DSoWTb34sgDNsqXlPgJuWIwK0MRNRO6WhNerXhCfl2Q
         p9MkTdON1xIn1HhZ8Ukd75FXf7hrBkWYHHFs+bUXjRD5V+REGtTsS4OCwXppQqBadCOV
         ZXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756586320; x=1757191120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XD/MAfd0FmRuxTxg6+ZVnGPk1e/NXFXUrP3nlfdWAi4=;
        b=amc+ejnbQyAvjgEGjaRS/4suflRgnOZZkHsZ7lEY2OdQs+rF/PMF13lOzOmRM03txq
         OhlzuEDH7bX4JoFTboQx54EkDAiIXDirA4VIQaL0ReHalS5oDw8ej1YkTpN8TQvPTQ38
         triZ301TgsBuCXPZYV8Cfky9GnIZMgyfqgmBtVk8GYMg4RRfIVdjox/eIqftMf4R83EQ
         /oOmUtmc76Mp+El3gVlxIjd4RI4G6KXDiBjaqzDSEoA7o3nZR1ZV60NWt+hwGPk7TYAM
         6ZUJ0sCuFd6dyh5+yGp2CEcIyRw+MR2ZWue16qiBfeT9Rrrk3dqQd3dyAH53/DBBZWb0
         qFKg==
X-Forwarded-Encrypted: i=1; AJvYcCUSKArQZm9uB3JkiqAuW0Kz/kvxXldt5tG8+kjyMSOPWjl/UT75aSSttnh2dOljIj7jnxCCSrvGgaw40LiXLRAE@lists.infradead.org
X-Gm-Message-State: AOJu0YxIsY83oydVfaDlom5kgv8MQJVn4vUjeT8B/MQGg+OhbbVQRNxA
	m0cOVMVTEXcCA/yjwfN8xeOVqxtgkQbkfMSyZE0DG5wTAGmTjm4X73o=
X-Gm-Gg: ASbGncsIhTwUn7P4QzXoIMKr7BwNBrKDi2ngtjXw1KrgOoWvJ6c6eu5G1+U/YZ8sRup
	CguoFA5gLvG6HBFaSY0lEe7CaZ94PV7UHZrYsj4DaTU5R/IK97+Y5TqdRLdQ5Np+jFEUV+UUOH+
	2+wmE9mrEQ1y5ZmPcsNX7a/NA7wahb8iA6B0MHF/YqdtfGqjfj0JLMKusUksTgFmf8jfNtdhD7E
	NnBbRZWVlqe9bLg47QozQ0xYXXsw8/eOQU7V703TqPxmHlicYhMMw9tzq5sq3jcBqcmIRf/c58J
	CATIhVrv2vbnjd3mDckhF3UNrL/XKCbP/b5sRMaiLQqicScEYh3xvFThQqSeNN3eW3ItGNLVbcK
	K8ae54YsX9zGkMpCu+b5WtAOge0X3o2GSV1uzHnyYU0kBFg==
X-Google-Smtp-Source: AGHT+IFS6to5vY2VYlyraxVUNpxIYUirboiZEUashAJKL55g85AvTiIPmQZmSMyY8xN1STzMmDupmw==
X-Received: by 2002:ac8:5e0b:0:b0:4b2:fe63:ade4 with SMTP id d75a77b69052e-4b31dcbfc82mr36311931cf.78.1756586320573;
        Sat, 30 Aug 2025 13:38:40 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:68e:c28d:1818:9595:da56:53b9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b30b53840bsm37557771cf.11.2025.08.30.13.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 13:38:40 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ARM: dts: kirkwood: Fix sound DAI cells for OpenRD clients
Date: Sat, 30 Aug 2025 22:37:50 +0200
Message-Id: <20250830203750.239890-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_133841_661723_DDEA10A1 
X-CRM114-Status: GOOD (  12.95  )
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

A previous commit changed the '#sound-dai-cells' property for the
kirkwood audio controller from 1 to 0 in the kirkwood.dtsi file,
but did not update the corresponding 'sound-dai' property in the
kirkwood-openrd-client.dts file.

This created a mismatch, causing a dtbs_check validation error where
the dts provides one cell (<&audio0 0>) while the .dtsi expects zero.

Remove the extraneous cell from the 'sound-dai' property to fix the
schema validation warning and align with the updated binding.

Fixes: e662e70fa419 ("arm: dts: kirkwood: fix error in #sound-dai-cells size")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/boot/dts/marvell/kirkwood-openrd-client.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-openrd-client.dts b/arch/arm/boot/dts/marvell/kirkwood-openrd-client.dts
index d4e0b8150a8..cf26e2ceaaa 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-openrd-client.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-openrd-client.dts
@@ -38,7 +38,7 @@ sound {
 		simple-audio-card,mclk-fs = <256>;
 
 		simple-audio-card,cpu {
-			sound-dai = <&audio0 0>;
+			sound-dai = <&audio0>;
 		};
 
 		simple-audio-card,codec {
-- 
2.39.5


