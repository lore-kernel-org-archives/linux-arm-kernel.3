Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6E6082BF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X8JJ3JN3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkX6gtMg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=S3kBGMpJUDqyGZZ/3EY9QtmjH3XQ/06sMAWybkANdok=; b=X8JJ3JN3708/BdyzBq8NtHZpCP
	L8TqVbUE0/e9KtBaT1RAj+pycEzmFp9n2VU9Vtc5JIChLKT2HF06OqTyfGVsN0Qw/WPZ2KNNRrROu
	lD0bIfWYk2s+qFRBMx+cR/2rYvUWQffQ7Lp2vaV3sXfEV2plk9waEKkcyhgFREvm5hgkfSPyzal4y
	LFjmNmKCS5F1EyMp7l8JAJz8jPbJvYkQ6nVmVLmpOkdXplu9JhsuiUCvMkA85AwgK2szdNrC7U2O8
	1Ny8eeBRmwM72tcWbCW1dd41C1eFDLh2TenTJz4A0lnYKHewmIJbndDv8krxo3aUDYomlM5xL4u7h
	mKPMw00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv7j-00000008Ve8-1LT1;
	Thu, 05 Nov 2026 10:55:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv7f-00000008VbZ-0WB0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:55:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so11185855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876109; x=1794480909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3kBGMpJUDqyGZZ/3EY9QtmjH3XQ/06sMAWybkANdok=;
        b=DkX6gtMgpNIp/xB3jP0BL+xquD1tWJ6bZuaXQLzzeLZCuYn/s037JmxoHM1tZLgelG
         7bZ72jdOmSVYV/R7t0CvOEjmgXg9dmT+wFki99FMjpiNztYW6ReloLEPrDEI4oaJwqr/
         7pxx/WHcikyVt5JWu1eUhnLFgUxva4Xo7HAWJAEfH/R94wAsYo0Oofx2Uig5fUZ/x6xA
         IzeTpEyaEU5f0LMCkLDfv2ASlrM8Dx4v+M/P9/wbhwckcuy3+OwDeAOahefT51ZGYncZ
         hK40CEkTxSytluBB55yMk5EgmPl8kqYd7bzlVXz1P0oS+cB6cSMDdz3cPCUMW7X7ihZV
         KiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876109; x=1794480909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S3kBGMpJUDqyGZZ/3EY9QtmjH3XQ/06sMAWybkANdok=;
        b=BL0KuAvdT6iy1qA7beYhHWSmBOM3V4d6x1jSOb1/RIUBOYBD96xBYaZYOK6Nc7hIM+
         t1/macgFYvFuA6pL4R/vF1Ue1b49OyChbQk+xDVRKAF0z/HANJZinoAn9wfSa31jpdvQ
         mFRMOmhnEXO8QVw+xHwJ11X6yxHv60HdAaCBid7p6ZSnGdT80FvakYqasf41GJsSMDgN
         d4YtPZUiOAHhcb00KIrcwr3emCA74gRLxyLomjf9/WNh9E3qiAfkhjBd5PGzUJy2hFrV
         f4KUOrCFv2W/UXmAYBbc7aB3b3uvVDWKr0aumjERVXqO0kf6qvaZXIOfYSww5M3NeIUN
         xu9g==
X-Forwarded-Encrypted: i=1; AKwUvBwuEDx95V0ZoCI3GkqktwgbtHttjDiYLPX7V/G1a7E2whOSFku2B0EJEDs+3OzRzXw9IyNEJA+PlSLMD2BtFSzH@lists.infradead.org
X-Gm-Message-State: APuU4Z/gXNvUmjn2cL9u3zZSOQRLm4xJ2duvXWH+bNcqqR4V0LUP3g6Q
	9LQ5zJiEjk+R96afKuGjKE/huQWUPmdwMifDQJI/vkdZr6v9oqV89Rgz
X-Gm-Gg: AYBFou3LnC+M+DR7sPpeRz3A97iBw8DknpoPGALbwv4I+ReMRh3NNupOh5s/Rev07Fh
	SK3ujxrZlaIVh8Zt807TwdhE0ilH2PzL0H+gln2p1gByXrhk5mLlaPJwlDMzjmcilXGPKcQQ32c
	99KPAjsVpMYjqE3oTLJB0kG3tqdetyTJk4dL4eics+5xb8F51nYWtVM1o7UmztVMsHSgkIowTt8
	g2B5PpWafdbuh50dkZKKtI+Guqjlgc08PuXzDobM5rGK4Ya2xYQpZCxVHhRf4r55S1gwdtKRjXB
	y46YNXKqBV7W18phS5d/DHmNgFO0k9uSYHab4fho50PiUWbN9VMFf35Ej+ZsUYBCubxQgfHUdM6
	Ow3YC4IHNYF5xANc2uZdhJq93sAbryPJORfGooFWUza6ABCUiSMsGgDRnDYRiAedUOcZzdRz+yP
	5ztrUn19IvzEgtevSASf8NjS0Iycb0FJJzL+Y0v4S8Ygbwz8G17S9rYWbr8Xfa0jxrn24+z3Plw
	O7ZQ1TrMQRpWN5I/1wNdJfOuGBjVnkEyumc3C0a4Brau1+RvJIpJhvZOnCx6vCLfKJGBbMLxQR/
	yDPcRKBzw9N1rto9etNP8OdN6171+MpN4AZXViYdNcesE/JrLX/Vw7KYDxaVxK8plc8dR8nLBEw
	oNNXnnv7IBwkwwc8Omg7EVCUA
X-Received: by 2002:a05:600c:5397:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ac16acfceamr398713475e9.9.1793876108729;
        Thu, 05 Nov 2026 02:55:08 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b57317cb8esm59576355e9.13.2026.11.05.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:55:08 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 0/6] net: phy: mediatek: calibration for AN7581/3
Date: Thu,  5 Nov 2026 11:54:56 +0100
Message-ID: <20261105105504.1024-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_025511_175231_14059EAA 
X-CRM114-Status: GOOD (  17.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This small series adds calibration support for Airoha AN7581 and
AN7583 integrated PHYs.

The calibration logic is quite big so I decided to split
the driver from the mediatek one to keep things organized.

Minor change were needed and just additional symbol to use what
is common between mediatek and airoha PHYs.

I followed the naming pattern of mtk by calling the new source
airoha-ge-soc and related config.

The calibration use lots of static table and software calibration
at runtime instead of using efuse to calibrate.

There is one pecularity where some register and calibration needs
to be done on port0 first and then with the related port.

This is O.K. as port0 presence is mandatory for the functionality
of the integrated switch and it's assumed to be always present
on the MDIO bus.

MAINTAINERS is updated to reflect the changed code.

(this was tested from a long time and also verified by Airoha for
correct order of calibration)

Changes v5:
- Add review tag
- Add additional helper for phy package
- Use __phy_package helper instead of phydev_p0
- Better use lock and unlock for phy package
- Configure base address for the phy package

Changes v4:
- Fix typo in Kconfig
- Prevent out-of-bounds for zcal_ctrl
- Protect concurrent rext_sw_calib_done
- Validate port 0 presence for calibration
- Correctly set shared local variable
- Use phy_package_init_once for shared tables
- Better handle early exit restore
- Better handle phy_select_page

Changes v3:
- Address comments from sashiko bot
- Apply review and suggested changes from Airoha
- Rebase on top of net-next

Changes v2:
- Split header register patch from cal_cycle part
- Fix missing EXPORT_SYMBOL_GPL

Christian Marangi (6):
  net: phy: mediatek: export __mtk_tr_write
  net: phy: mediatek: move MTK GE SoC registers define to dedicated
    header
  net: phy: add additional helper for PHY package
  net: phy: mediatek: split Airoha code to dedicated source
  net: phy: mediatek: add calibration logic for AN7581
  net: phy: mediatek: add calibration logic for AN7583

 MAINTAINERS                              |    9 +
 drivers/net/phy/mediatek/Kconfig         |   18 +-
 drivers/net/phy/mediatek/Makefile        |    1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1917 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  521 +-----
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  374 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 drivers/net/phy/phy_package.c            |   57 +
 drivers/net/phy/phylib.h                 |   73 +
 10 files changed, 2537 insertions(+), 525 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.55.0


