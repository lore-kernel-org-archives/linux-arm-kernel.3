Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D89606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CmBa4476;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GjIHTezB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=; b=CmBa4476qzYXL8rrR2S2DuJWfp
	/Gzql0jEnxt7tiXn1sROtec/cThxmsXyQFNxqmf3lb06n5YhjJUHbBYtC8YbGkqzt+Fda6vBS997f
	XiNaI2WAk2vEobhjTw+Oe7v52Rd7sM/ZZ+wDbbxZNNci4HwvpG6Jt34ib5gRKtUig0+NW+V/FZxt1
	7OOMd9GqS/+PJCn9ZLVWf4p57pdQHAHVM14ejRKp7yP3pRuLf5J5FNxpNuNFIO4hmfULzOrlqNsiF
	sLP87sfu/R6w5kGosL1geG9J6hBvP0XNOsTTR4ib7Ob+tmPu4CMqyVAntJ5O1xK3rWsLdNiZqw0rB
	qNvhrGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNe5Z-0000000F8jx-1ZSB;
	Sun, 01 Nov 2026 22:31:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNe5X-0000000F8j8-0Qzo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 22:31:44 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2523178f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 14:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572300; x=1794177100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
        b=GjIHTezB4JoRuqF0onRNF9s1KRJtlumpihBntiluadQK79oZV4Be5zFkfbK3QrKMzt
         u6wZPdryf6f/3aorfKIZ1VO0ELENUgd0SnoUxkz0GT2YT9/WuFf9EsMm6/Hva+BHnf+8
         6apZjo04SYSBHWGzntRofiFgb4isDDcOT8i3OrxEwmRnPLCMlXzMLWd73TjZle48zs7B
         hkBtlqUV4NRpyjw+i5Ny2F8T/mGx5FHTJp0xyi0r/UpYKgvZszsBhuU/SItK8XHCFXJ0
         hABcPPmohb3RLkksIwFaMy0xA3vhdmwfXWbwa1FoNTmge6zcJFNcu2U99hwseuclqmBH
         XlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572300; x=1794177100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
        b=10d5houVwQmbja4JgimLfZ7Dg/68Q9bR5+6QL5XhCAwuTOzUkYeTvwJFBVSLe1gWyb
         zClqU0xMmE6l3vCUwRo2SObm70BNLoEzp6GmBWpFxgq3wTGYmwHyAcDPBo49nZ0BleIL
         OyoGO3lATQmrfAKrVedK0OMX1aqkL/+MhmtTiqTKq23HWPwM0Tw1J2x2+zp+JXnjAnNw
         jnBJU2dfpBYaWBqwYD9MaP7I8Z3m4p2wzguGqUh98tR5SY9fi0yiffaa3PbH8i4B0aJ8
         U4rDKED5sofp3S/BXg9EYc02TIcy60/DXHokD+MYkNGNbnri5wdHMLX9AxP8opQh4zAt
         dxRw==
X-Forwarded-Encrypted: i=1; AKwUvBxZx/eImYJ+71v3XOvIqDglyGZ7uE7nz0/kj0CibEieGycwBWrzuO9EGEOXpCzHBnFdx1Na2dAz9PCrUxB1aI3A@lists.infradead.org
X-Gm-Message-State: APuU4Z/7tF2Unnpf6I3ZNnxZneXemUtG+3dzX7xXb6g9YsQ07LTj4S0D
	2y4UhE7jLwfdVOiT4ZkfEUMLun79GIw25m3oN6FAvopvVWGY4IS3/Yic
X-Gm-Gg: AYBFou1+REYuVYaJpo/0F59cL0QYbsSLZoUr36rE5rZfJRJZsTE+JXM1YZZzTOsbLHr
	o1+Yh39ePXlNmtZK9Zmn8hDNmwehWaVznEH9sYblbWdVmRxS8v1Xgni9MuSZTvBMR8Pwv7wba79
	keCGpv8sFHjN3wA/GbCuxlG/d1jgRwB5joSMZoJdFFGy9TOU1W8Y5RcgGa5Xjh7As07GgjrjlPG
	iuc9SCCEg9uvdUXc5atIUU3T4x5Yjz4nn9BlKvEno8I8pQifrs08aY9Y5FLCGW42IR1B+aOACJZ
	PARYnkAY360Gk8EwbUtSKOsX3Nt8X/r/q5ck82uNAFj+urUlvaslfoZfcQG2oLbdj7yabRXkhiv
	KWFQRYmVDrhx4j5I06NMlPjuch/wv5f+pDlqepyb23h5ZTncr2fSYKmB/w7atI+ZnIpfaO+drd4
	EG8WrZtzFhblL7JfiyJcvHQxanlC4SnOPiEB8zZ3zAqLl1RoeXTYA/zoJnUQr8r3mx57R0vDoBe
	mZwcOJq8u7zbH1JyjT7TjI87FmJySCEkgksUwfWbai1cRR2tRCbyMutZ8Nk85oUixd4TBxtS8MD
	GY+5IpZ5530xljCXG5/iab2rGdChYfM9s48WR31ayvRmOVZEmjraHne2QNDHCyU=
X-Received: by 2002:adf:e001:0:20b0:48e:d88:55f4 with SMTP id ffacd0b85a97d-48e6e2bc855mr15509231f8f.2.1793572300404;
        Sun, 01 Nov 2026 14:31:40 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:31:38 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] sy7636a: power the panel only during updates
Date: Sun,  1 Nov 2026 22:31:18 +0000
Message-ID: <20261101223125.302001-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_143143_153668_DE84F1DF 
X-CRM114-Status: GOOD (  13.99  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature only while the rails are on instead, and bind the
regulator to the I2C device directly, with the hwmon driver as its
auxiliary driver. The regulator also gains VCOM voltage control and
waits for power good on enable.

Patch 6 depends on patches 1-5 and touches the regulator, hwmon and
MFD drivers.

Tested on a PocketBook Verse (B288).

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- patch 3: only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch 4: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- patch 5: no VCOM enable at probe, which also removes the probe race
- patch 5: read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (7):
  regulator: sy7636a: fix the chip name
  regulator: sy7636a: add VCOM voltage control
  regulator: sy7636a: wait for power good on enable
  hwmon: sy7636a: fix negative temperatures
  hwmon: sy7636a: read the temperature only while the rails are on
  regulator: sy7636a: bind to the I2C device directly
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig  |   1 -
 drivers/hwmon/Kconfig                 |   2 +-
 drivers/hwmon/sy7636a-hwmon.c         |  58 +++++----
 drivers/mfd/Kconfig                   |  10 --
 drivers/mfd/simple-mfd-i2c.c          |  11 --
 drivers/regulator/Kconfig             |   6 +-
 drivers/regulator/sy7636a-regulator.c | 163 ++++++++++++++++++++------
 include/linux/mfd/sy7636a.h           |  34 ------
 8 files changed, 162 insertions(+), 123 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0


