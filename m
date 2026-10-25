Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82755606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 05:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PE0MTsEl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXUSkc1V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4DzG5D7v2La/sD4DyNjoiERdLKEODMg4TWNG90dgHBE=; b=PE0MTsElf/MAkwzaMAfwwgdyO2
	0ivnC1k7+mFakqnOm8ilXtooDbr56LM3H93XHTyTRH/yDPdUXDwFNsRnzgm8xjsZg0mYGXJPHlcEg
	qKrJDC+N4fj/BmKvmaC+6CswR2l6ShJvb1c/yBmVfcIO+5K/3LIqadDCyZ9ixW3A7G8qKOHKGXJiw
	kCzm1lZ1SViGXPB2NuFee/j0zoc+BtcA/8DbhFyIrO+MG43B2lYb1oDaKoI2/ZsfiKMY5MVSdAQoC
	hH0UiVnV18/RzGa4hSzVJKKpyPBwMdcLgAE2V1cBLpqOUiFC/PnXq5Ms1bj+3VQO4qP5sXJUUcKsS
	ZTl8b00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqOA-00000000jgZ-2QYZ;
	Sun, 25 Oct 2026 05:03:22 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqO8-00000000jg0-0BQC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 05:03:21 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-35943f55c06so2738011eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 22:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904599; x=1793509399; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4DzG5D7v2La/sD4DyNjoiERdLKEODMg4TWNG90dgHBE=;
        b=jXUSkc1VCb//hzpA4ftWgdLOQTc9btde92xo2aSjOvohb4DR0I2jNNNNst407X8Yp2
         xYH9Iq3YSFcf2AZNBClMLT49psCulSoDJWOU/QjrWhq8Lh+dg5VquyrN+75cV3IVnR5z
         FxpsS/h2P7bCMLzMYm2kCMBPEVjtojH99xdb2/J1kTzAkNL7OadCk0iFY/u1zGVbHn95
         sRXFbWTPGat4P0G8ls+KRj3yZtGRcWbCigO0in7oIJiGRsFbtxV9+cOK5rHQSBfpOsIu
         7vyYVoU1hwG0Wb2g93Bn/SJa/BTH8dUpHYXT/aFs9C3pC7HOV4BC2l9A7PKk8ZEufoT5
         E4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904599; x=1793509399;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4DzG5D7v2La/sD4DyNjoiERdLKEODMg4TWNG90dgHBE=;
        b=Fp29ChCJfjSZjlbTE1WRJONsS4NOj/y2px65PbZ5Ehd0Xl4BDJ592rs9ZqEVoCHnNL
         Miok0QKf4wzFgwd5EJ/a/e09vQqu32znNhLgqnfHPMl4LMKq4VF+bmyjRvVAEUPOUekf
         BjmXzCt16FhCRUQRknoiH7bDalVmP/s6GBQP2Z2sSGrspPxRIQdJAp2yJlxYv4KZs3gl
         9S9bAKDDgOiIUnimbaVo2/iyW8bor4crXBlTDHAuHW7CyCAzLbMRIQt+253SnU59mkSM
         qc+FfWGMPuBwVdB/VtzXzbF3gYwAna1a7z2vbk0U8xgJsusN49GT1rPoPXP2s45H4aHb
         qqOA==
X-Forwarded-Encrypted: i=1; AKwUvBwNXGmZEnxRwiC7G0ET4SWuz1f41ceijNR1fqBRWzJh2Xq9Z5D6widX3lxNI8HgXYkw6k0HGUcMYka0II0E6VV5@lists.infradead.org
X-Gm-Message-State: AFq9FYInjdpJXA70S+GNEx6o/BHh75haP5G0BXqwZEMIlwib55rXWegB
	lHUQ1fLcNqqhCqVkLb+rzXNnnvJbTPkcxOKaGp98JqG2AehcAYy/Ngek
X-Gm-Gg: AYBFou16irttU5OPNgn6cxNaQkHqmxS3m0DzwPOEAk6E2kMZqFf4F161/FvxAfcCc8A
	FTfeX930ObqFjJ1ww4PMX64+ErfNFidzXwiXMpYdg5YspkW2wrrdynSXIh1KukuF0hFGXnJghCM
	JDv6hQYnNnLLWOgmbdIp9GQDA6tYOzbiEKmI9hvdbOTLzkiE6rDugNf9d5+/pvb7V8Hfp2qdfMv
	FbFaNDHbyMw133yen8LOSBS54Qew4m+YyZX+V7GdsIrcooov2E7CJ414mwqdnCkz9JsnF2hEGFs
	EaSKoiBRpLATYuZMNommk6n/hP5i0fnDrQJ8UHNlWWacy+OrtoRk/Q3pIlpyiBqamwy9Wa1J6l7
	gHF0tS351gurSpCqvvRFWvmH5XzvDauPxmyja+GBg76FM7iduAcCe/9Ti9QFoawfugtduYM6W6S
	FUpKEJ33pG/cjzgP3acJ4/73YeBY0Cw4XVdI8QZ+wNBIP9hrH4SREWAzFatnKsk1DSL0S5cI/fa
	knYmdI13oizho/vwIEArK+eqIs+DIXtZal5rp9ObWZP6fR8iqS+rDrojJxkBEKvjy6T3EavnHXR
	7gDBACck3ynQLjlOP+7el1/hHPyLBq5aXThFsXXoEbQ=
X-Received: by 2002:a05:7300:fc02:b0:366:eabf:ad9c with SMTP id 5a478bee46e88-369e8759b5fmr5049781eec.5.1792904598560;
        Sat, 24 Oct 2026 22:03:18 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:17 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v4 0/4] ARM: s3c: crag6410: Convert to software nodes and
 properties
Date: Sat, 24 Oct 2026 22:03:11 -0700
Message-Id: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+N3WoC/1WOwY7CIBRFf8Ww9jXwwLa68j/MLCg8WqIUAx0yx
 vTfh7qqy5Obc3LfLFPylNnl8GaJis8+zhXU8cDMpOeRwNvKDDkq3oszZB3y7zzC/QmGyFrl0HX
 IWRWeiZz/+8RuP5VdigGWKZH+SnB16oVsUJxUqxAE2OCX9GqWmOJ9iuU6Bu0fjYlhi04+1+H1O
 VhwS2+hlne8338pCBykackqcx7k0O4q25cid6oQX6qs6oDO6EF3nXZur67r+g+Z/U5xJAEAAA=
 =
X-Change-ID: 20240819-samsung-kp-ceedd4f2f720
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e56a4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_220320_093539_1AA7F53F 
X-CRM114-Status: GOOD (  17.11  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series converts the Cragganmore 6410 board to generic software nodes
and device properties, allowing the removal of legacy GPIO lookup tables.

We add software node propagation support to the wm831x MFD core to route
DVS GPIOs to the PMIC regulator, and convert the peripherals on the
Cragganmore board (PMIC DVS GPIO, basic-mmio-gpio, LEDs, WM1250, and SPI0)
from legacy GPIO lookup tables to software nodes and properties. This
eliminates the legacy GPIO lookup tables on the board and fixes incorrect
GPIO chip names from previous conversions.

Hopefully Krzysztof can finish merging the series through the soc tree
once Lee acks the MFD part.

Thanks!

Changes in v4:
- Patches 1-6 from v3 were applied to the samsung-soc tree
- Rebased onto latest linux-next
- Capitalized the MFD patch subject per MFD subsystem conventions
- Added Lee Jones and the MFD mailing list to recipients
- Link to v3: https://patch.msgid.link/20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com

Changes in v3:
- Fixed legacy property handling regression in the keypad driver by
  separating compact and verbose binding paths
- Removed redundant registration of crag6410_mmgpio_node from
  mach-crag6410.c
- Removed dead S3C64XX_SETUP_KEYPAD Kconfig symbol definition and
  selection
- Fixed missing newline in pr_err() message in mach-crag6410.c
- Redesigned PMIC DVS support to keep regulator driver changes minimal
  (untouched) and only use software nodes for GPIO routing via MFD core
- Link to v2: https://patch.msgid.link/20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com

Changes in v2:
- Patches 1-8 of v1 were merged into mainline, dropping them from this
  series
- Rebased patches 9-14 of v1 onto latest next
- Resolved conflicts in mach-crag6410.c
- Removed redundant "out of memory" error messages from the keypad
  driver
- Added an infrastructure patch to register and attach software nodes
  for Samsung gpio_chips
- Converted basic-mmio-gpio and LEDs on Cragganmore 6410 to software
  properties in a new separate patch
- Addressed DT bindings feedback on the compact binding patch
- Fixed proximity switch event type for GPIO keys
- Added support for software nodes in wm831x regulator driver
- Converted PMIC DVS on Cragganmore 6410 to software properties using
  the new driver support
- Removed legacy DVS platform data fields and cleaned up driver
  fallback.

---
Dmitry Torokhov (4):
      mfd: wm831x: Support software nodes for DCDC regulators
      ARM: s3c: crag6410: convert PMIC DVS GPIO to software properties
      ARM: s3c: crag6410: convert basic-mmio-gpio and LEDs to software properties
      ARM: s3c: crag6410: convert WM1250 and SPI0 GPIO lookup tables to property entries

 arch/arm/mach-s3c/devs.c          |  35 ------
 arch/arm/mach-s3c/devs.h          |   1 -
 arch/arm/mach-s3c/mach-crag6410.c | 234 ++++++++++++++++++++++----------------
 drivers/mfd/wm831x-core.c         |  47 ++++++--
 include/linux/mfd/wm831x/pdata.h  |   2 +
 5 files changed, 175 insertions(+), 144 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20240819-samsung-kp-ceedd4f2f720

Thanks.

-- 
Dmitry


