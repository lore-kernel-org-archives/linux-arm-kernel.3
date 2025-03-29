Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A41C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5GVWx3U81+0/GXIOVP80B3wI0lY+sgpXX7M13r9xpuc=; b=jnsCgpgiZBvo3tiOUrLzFKjA/d
	EpuVfTnIjNpOfistHrcZNrA40EPWRDm6OMinwYJFIxzz2nhnIw0ErSaDXuNBcSXGxdoFvvg/wf2G8
	D5Zwfw67uKNKX3SNGivjqwm+skdDbx3eccN2XIUizBoBBSmLa8H+Jdrdh7c2x/cshcl/r6Nea2QC6
	vvQ4gIi1koKZSP+3k90F4KSRWL4uihaNRzu740QNvDhPE2eCkjlVyOYA+pIicplZYcWIDa8s1x2a8
	8+oNM4lsWTMTqje6zM7H3pGbYSbf+iGiHSelW6/1XVCToGh0MGwCbEbOba3lQ6xTeTfVvUisz52TT
	BIoRaLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybQX-0000000FQT3-3gX1;
	Sat, 29 Mar 2025 19:01:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybOn-0000000FPwo-2xrH;
	Sat, 29 Mar 2025 18:59:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abf3d64849dso495819866b.3;
        Sat, 29 Mar 2025 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274755; x=1743879555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5GVWx3U81+0/GXIOVP80B3wI0lY+sgpXX7M13r9xpuc=;
        b=lVGGhAfUnMkOHvwWdirx2DyNPdRYbH7I4+6snxAhAE7YfGZyNWUNyocvGPyxilLW+C
         7EmLeLm9daGYCkRi/w0GnT0RsqscgXiWyC0xmqkCzQzYqMRcO7wKanxseDNFy4md0Q4R
         IHXzdVb5+ZmoAhuM6FEmMXgPUdGlP+zjo0xyDO+LvE3/MX51uTLJSOLWsy17H01na1St
         pch7DTEJqAkfrXc3I/hDCFLyisMf6hWO4USQE40rZY7L/kYRuP/vKNIIbEwc9HLsso7Q
         KPvR4qMNVRctN12R56vGnmvXv8gxip61AYar2yBDWb53pX2BFGH908KIo+cOrhsBPJym
         VWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274755; x=1743879555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GVWx3U81+0/GXIOVP80B3wI0lY+sgpXX7M13r9xpuc=;
        b=EU6q/njodHUZhZLqbLJykRSAoicfq8qqrZaI8cK+2Zd98QNhENLSH56wtWxvW3rCwk
         grqtx23iP7UGB35Z3C5uKkJA6ePUtwHTybShMqxl+VdiPLXbkvbRASE8QjWufg7sygzl
         revqvC2YM4woUzDcYFc5POyIl64sSfVJQYl/K7CYS79nyindlyXj00uKE4NcImpuod37
         h+ozpu6Pip4+bjX3WStS37EgXXMLn64765o7LSNsrY2YcbtssKnRi/TEv0q23WMbVGIG
         Q6pIvQiMww/QzNTpC52G/M0doge4uwj15RK0Udbg+8ZwY1Shh63EUDUiUXdxbbeGUMEa
         UwtQ==
X-Gm-Message-State: AOJu0Yw7ICoBFeIjCamM484hme/0XZpCKb7coH1vTfxlLWfS7mBWtbJD
	0qEdkM4vbVPSn55r0no7fiuXFTSHHT5luQhqYGivMnhRzeeM5jzIdIj6CQ==
X-Gm-Gg: ASbGncuJklE3Qvy+oTr1UJOUKbjWMGN9gBgfzaLU2qRRkFCbRqoWgT1/Pno2hrWiMfS
	9aTQqNBD2R/q9OKcC1maRqclyFzsKezZ3hNUP8TxnmD6P7/qhSTp1rBSabz2OCB1mY/wkQSO8L5
	XdfGLoFHgfBf5USSB1xxbpTcj8TY6D0fI9jiKw/a5oRv99mD+f6BbQ5TTLvum1ibpDz+fv4LXmi
	olgoUjGGwV/y7MNrpxvWlvOg+CO/urrZ4RrnHKiEP4XP6Z45eyY8urTfwsXh7AMFzyAncdOPxmk
	nEVWfyaNS6w4zB1FFo6Cqsf1ukv+fsCcGH0+Wzq2n1IYMB1lb0I2OLSqqdrlhksRXq11uj4ML0f
	UL9IUingc7r9Sxj1Sj3v08b9nEWkkcDdRBnGzAuYbw3kdUBOJoWMwI6Wgr1kWIBIFlXZyBw==
X-Google-Smtp-Source: AGHT+IFk/KARCjCUyhGU/vgF6K1Sn2uPB37x4iuQwrcxiHKFEPycVyCYu/EqsFuwOcWYcCe/tapuaQ==
X-Received: by 2002:a17:907:6d27:b0:ac7:1aff:1183 with SMTP id a640c23a62f3a-ac738932eecmr276308566b.2.1743274754676;
        Sat, 29 Mar 2025 11:59:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:13 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/7] dts: amlogic: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:48 +0100
Message-ID: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_115917_761169_7E7ABA61 
X-CRM114-Status: GOOD (  15.07  )
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

On the LibreELEC forum there have been reports that Odroid-C2 does not
boot when UART is left disconnected [0]. It turns out that this can be
solved by enabling the SoCs pull-up resistor on the UART RX and TX
pads [1].
It's not clear whether that specific Odroid-C2 board has a broken
resistor, the resistor is not populated (either by accident or on
purpose) or if there's another reason.

Testing on an SM1 X96-Air shows that pull-ups being enabled on UART
RX and TX is actually the default (either set in vendor u-boot or an
actual hardware default).

This series enables the UART RX and TX pull up resistors in the
default pin configuration on all supported SoCs.

Testing has been done on:
- GXBB Odroid-C1 on u-boot by a user in the LibreELEC forums [2]
- Meson8b Odroid-C1 on Linux (with vendor u-boot)
- SM1 X96-Air on Linux (with vendor u-boot)

Please include this early so the various CI systems can test these
patches.


[0] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195481#post195481
[1] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195667#post195667
[2] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195674#post195674


Martin Blumenstingl (7):
  ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
  ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default
  arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
  arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
  arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
  arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
  arm64: dts: amlogic: a1: enable UART RX and TX pull up by default

 arch/arm/boot/dts/amlogic/meson8.dtsi             |  4 ++--
 arch/arm/boot/dts/amlogic/meson8b.dtsi            |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi         |  1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 12 ++++++------
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 12 ++++++------
 7 files changed, 27 insertions(+), 26 deletions(-)

-- 
2.49.0


