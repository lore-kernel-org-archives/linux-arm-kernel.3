Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B54FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z4YPN2a1724ERpeTq05iIb6Sk6BGrlz93FpHuJBlSq8=; b=n/wVMRRlUqKKtk
	yXh3wrYll+xJCNdRFdB2x4EyUEVvtd+h0yGoLhwx49ZEpDy2LAO8f5ROaVLhoAt6n4Lo8AcAolHKb
	VObPETljnrs8keW2nmhmWcUIXtbnaQDFalIWwGT9srxqwe9NQKmf3RhlpL1NTIAcRkqZYS5BUZJeL
	Sjyl/By61kZzHXqplHYWIS0l1/0JSj2A9dJlFLMhYV6Sk0IgMK3JwuTmJmZSA9Qd8HGenZ5iPTsBM
	qG1zFhjQ1TOzUxnM7OBC13Ta1BD/LNSb30bVwZhP1RV9q9uE/HhnktoUTarybpQCJQvTbRcMcuaN/
	3nbm+jfVXmlY/46OvrTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMJ-000000047vX-3g8C;
	Wed, 29 Apr 2026 19:14:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAMH-000000047vB-3R74
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:14:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d43e09de5so72976f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 12:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490043; x=1778094843; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4YPN2a1724ERpeTq05iIb6Sk6BGrlz93FpHuJBlSq8=;
        b=KmERiHR+VWiz7JCO9T6cX/vr0Ocq+SI6gmWSt2WoNUnGw5LZvpjo9vvmceR740U+BS
         WQpOycUctECf+SYa/k3GroZtpR5c9mBZfDwLntW+KEGn2wwjAQvJTJJtz09KKmQdnJsN
         FEK1toxsBqIASF+jXVC2iTnvEkZpqiZdixxSgW1eo1phAqZX8DAtQBmAl+Rxp5HH4FFQ
         M0w2YslKiPXtuuDlC/xCvCOmMaf0pmvoU4/ba3gkZ3BIA55I1EciSFlTZ8PqRV4y6m2P
         qlFwWv39e+jGOXYXIDlQh7HDV8OFT4BxzQIGZ1sBuTU2daLySfprqpCGN1Zyq2wxf2LM
         8RPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490043; x=1778094843;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4YPN2a1724ERpeTq05iIb6Sk6BGrlz93FpHuJBlSq8=;
        b=SRekqeqYPhN0iUc9t9PI8+wgITAjAo2yQcc47cSXEVi55eN9wpIQC+PYetn0admyqr
         tBm9QoxWtBQvEku181bqKQmOEcabITD6I/Iz3TfsxOEX8oTW+7pX74pk/SE7Wi87gr2h
         PubvZIzJBxqTFkRUJFgoWbNyFO6uu0oiQ7UxQJccwtpiiwiRofY9Os7jJlG7LNqFK4dx
         fwRezpo8mbDWG3OemvhpXfmzXb2r19CJsi+2q8uNocQN4xHPMb1yHJrxxWla6NZiYyg0
         7P4wZp1dVDgm0hJ9jjblLVGK3jC35WNrSPegh4nUG31lk9OjUqpwSkvzeas3XYUSgLKN
         0RLw==
X-Forwarded-Encrypted: i=1; AFNElJ9cLe0aKSIJparfcwp4Kq+TEQwnJG6EfeTaj8sB1Pwj1b/qo7pKWOGBmB+5BdwR8t7NbZYycLvU5WGgModSlzuq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5jVyytCVzvlj2Uz0GeQPp48TVwhlT7BWQ2DQJIYb/AqABm+YY
	bcqngR8W+5voDLVy4awW72ZkEzMGWBD1yzZglstCnpHILDwvFgs7Uww91QSkf2OgHDQ=
X-Gm-Gg: AeBDies8NHRQNi4c87t0Ah7dI690yeqTGybjt8GaNH2pgZorQEKeLVMP2TsfNS2y4eu
	X3jz8QeCFiqGgLP5QaGoJiliTZbct0w1XGn1g+cpz91m9dVTlszpB/bDfmvxge9R42UbgDeqFmg
	fM+5GULyXLFvbjFx0lNUQc7XEzFhfv4TTC1q6x2t5nM3EQR30+x2BSikBaYcyM9joSBJcS73l8J
	I3YXOJjVyOEi4Nv5ZH5w+hwo+bb3VRJVpjEe4ChLP10ORRiOCPpFLCH05/qU9Oxkl9JmTXq2rFu
	OLrXCyMC4rbZvLK/m7VgyayIy77BWOW+91k4tlUEyV0YiVeQey7aCfby0hWi5RrgBlG5kfJuGN0
	6yPAA55UaM/yrvj3ptXZcKP4Nh/otXwJjFkOXBr4PR7XszLiYVm+La394JQq5XiFIk6LA8+wk8J
	PgIRFY1ey0tQ8FKZIVFetqovbCd6ANrmv39GaR7LXEZZM=
X-Received: by 2002:a05:600c:528d:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-48a7b546b7dmr93117815e9.24.1777490043058;
        Wed, 29 Apr 2026 12:14:03 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:02 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v7 0/6] Add support for ZTE zx297520v3
Date: Wed, 29 Apr 2026 22:13:11 +0300
Message-Id: <20260429-send-v7-0-b432e00d2db8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEdY8mkC/13N0QqDIBTG8VcJr+c4mlruau8xdmF6KmHV0CEb0
 bvPYoPo8jv4+zuTiMFjJJdiJgGTj34a86hOBbG9GTuk3uVNOHAFgikacXRUWqgRtERpNclPnwF
 b/94yt3vevY+vKXy2ahLr9RBIggJFph3wRguB9toNxj/OdhrIGkhyhzj7IZmRsQhljaqUTB6R2
 qP/TyojJzS2puJNA3qPlmX5Au3xbZUCAQAA
X-Change-ID: 20260416-send-5c08e095e5c9
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4820;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=t5k3po+A4cuSA2YIZhcJJigylx7p9W5bSmm5u0NQ+Cw=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lhvyzAaWRv3CHmoM3cqn8kYjaOUR7FHRYCRn
 nzhcNhgreSJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYbxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKJMQ//WPAwdy4kKKxkQcYfsF2g/x7pkl+ujmg
 qFJHkbWSz7P/SDMYH9diyoX56Cyljvt3n7tzX+wnJBHM2scfszzNo4odcWtiOOGi8zymKnvo3V3
 Gc9OZRM+d8XI3/+mCOZXGHCO4s3D4+37J+Cjw35Y3RbMU4R0NnBFsUOdpl5zEoheV/Zs6QPjd/L
 alXQtCdqkGZsXvfze9L69t3Ln6YnPiv8zXiVFoCXQbI98JX955jw8BRrQJR6ixxqYu7oU6/G+3J
 JoINggCygb/JzuYWpmEyQIRNRPVOBXXDCiogMRpBdBfIdu2tap4FHcH6nbF12usC3q8+BBqJgDP
 kfIm3/zLnRyGfpaFgDkkEmQgdBeroW2eaMrYgjTGqAD4Hn21dRHI9D/UgSt+1w1JOGm21ODqNDe
 jxcCr1jx+JLIhFDh8d76I2K0/R+HqmA09UrCcnhjg8eVwRmmfHF+dDKkmZqZrHaXoTwMc98EuoK
 SLmQ2W3ki2AuvP1YUGzdnDn75t0qA5pTKZlyhgTVc0D6qTt1oAVL+72hQxgQgAoJ8vnb7mHMTA8
 6kYW1UyxOmrssAvfAQyvRho4qAgpOa98eD35PTSfh8sFpyaqyYqHNva5FuQQXIZDKh7RUJ7VR/a
 Oq8/lb3MpIcBTRwlGoXxZ4pfJFw76UK4bLUmQh2xVDIafUfXXecs=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_121405_901267_726E2A8B 
X-CRM114-Status: GOOD (  24.00  )
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

Hi,

This is a follow-up on my RFC patches from January [0] for ZTE's 
zx297520v3 chipset. This chipset is popular in cheap LTE-to-wifi routers
sold in developing countries. My goal is to run OpenWRT on them. I made 
more progress in more work on this SoC and it is time to get serious 
about code review and upstreaming.

Since my version in January I managed to get more hardware running: SPI, 
I2C, PMIC with real time clock and voltage regulators, Watchdog. LTE is 
not working yet, but I am able to start the coprocessor that handles it 
and talk to it via mailbox + shared memory. Wifi is working on a few 
more devices. Since WiFi, USB and Ethernet are working, the devices can 
have actual use with OpenWRT even without LTE.

Another hacker created a free software program to talk to the USB loader 
[1] and boot U-Boot and Linux without modifying the on disk files. At 
the moment it needs a proprietary blob, so my documentation is 
emphasising booting with the on-device U-Boot.

This patchset here is mostly unmodified from the version I sent in 
January. It is the bare minimum to get an interactive shell working on 
the UART. Future patches can be found on my git repository [2] for those 
curious to peek ahead. The first 30 patches are in reasonable shape, but 
the further you go the more cleanup is necessary. I expect all of the 
patches go require a few rounds of feedback though.

My plan for upstreaming is largly this:

1) This bare minimum boot patchset
2) Add clock and pinctrl drivers
3) Add standard hardware to the device tree
4) Add zx29 specific drivers one by one: Watchdog, spi, i2c, DMA, PMIC, 
battery
5) SDIO backend for rtl8xxxu
6) rproc, mailbox and rpmsg

I am willing to maintain support for the SoC within reason. My patches 
add myself as maintainer. This is a hobby project for me though, keep 
that in mind if you want to ship a commercial product with these SoCs 
and upstreaming Linux.

Cheers,
Stefan

0: https://lists.infradead.org/pipermail/linux-arm-kernel/2026-January/1099306.html
1: https://github.com/zx297520v3-mainline/zx297520v3-loader
2: https://gitlab.com/stefandoesinger/zx297520-kernel/

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v7:
Fix line order in mach-zte/Kconfig
Use "zx297520v3 SoC" as the option name for CONFIG_SOC_ZX297520V3

Changes in v6:
Squashed DT commits into one
Removed for-now unused board DT bindings
Add "zte" to DT patch subject
Regenerate the defconfig with make savedefconfig
- Link to v5: https://lore.kernel.org/r/20260421-send-v5-0-ace038e63515@gmail.com

v5:
Spelling fixes
Renamed dlink-dwr-932m.dts to zx297520v3-dlink-dwr932m.dts
DT binding indentation fixes
Use a manufacturer 0x8b for the UART, fix patch prefix
Declare all UARTs, remove uart aliases for now
Consistent license declarations. I made every new file except the DT 
binding GPL-2.0-only but I don't particularly mind GPL-2.0-or-later 
either.
- Link to v4: https://lore.kernel.org/r/20260416-send-v4-0-e19d02b944ec@gmail.com

v4: rename zx29.yaml to zte.yaml and add board enums
v3: Remove [RFC] tag, add defconfig
v2: checkpatch.pl fixes

---
Stefan Dösinger (6):
      dt-bindings: arm: zte: Add D-Link DWR932M board based on zx297520v3 SoC
      ARM: zte: Add zx297520v3 platform support
      ARM: zte: Add support for zx29 low level debug
      amba/serial: amba-pl011: Bring back zx29 UART support
      ARM: dts: zte: Add D-Link DWR-932M support
      ARM: zte: defconfig: Add a zx29 defconfig file

 Documentation/arch/arm/zte/zx297520v3.rst          | 158 +++++++++++++++++++++
 Documentation/devicetree/bindings/arm/zte.yaml     |  26 ++++
 MAINTAINERS                                        |   7 +
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Kconfig.debug                             |  12 ++
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 ++++++++++++++
 arch/arm/configs/zx29_defconfig                    |  54 +++++++
 arch/arm/include/debug/pl01x.S                     |   7 +
 arch/arm/mach-zte/Kconfig                          |  26 ++++
 arch/arm/mach-zte/Makefile                         |   2 +
 arch/arm/mach-zte/zx297520v3.c                     |  19 +++
 drivers/tty/serial/amba-pl011.c                    |  42 ++++++
 16 files changed, 485 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260416-send-5c08e095e5c9

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


