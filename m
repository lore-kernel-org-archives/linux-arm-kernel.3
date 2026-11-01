Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA1606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 08:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aAWtzkOM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IncuGR7s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=; b=aAWtzkOMw3rRkgSERWTGQeCaow
	7JqWUBWq2WiA6EsXX5MqLCNcKfDyLevkMBjgOwyHyCYKL0dL9/N28Ih6Hh5SZwLK0RmRK4l8hzZqx
	zg0zmIvXlJhA0QSM/Vn+p5sblKzy8ZtYep27nRfkcumntl5IFvstjqm8JLhAK48+TXfZusXDTK1xk
	+KPtlqz5/HgcPtoSuc+Q7SpwrWsTDpF47XBOFc7aTG9PWVki59YG1B7akHgfb8gdrRzujBk5X4G2r
	kBTcwL2hsV56wygPQotxQ8YIncEBMYWBwbt3h4+TR2PzM0JeP4P2woeFKXTVslsxknfOpUljfG2Zu
	bToibKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQdJ-0000000Dxuo-1aPM;
	Sun, 01 Nov 2026 08:09:41 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNQdF-0000000Dxu3-1VTF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 08:09:39 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so3714181eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 01:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793520576; x=1794125376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=;
        b=IncuGR7susK8VgAmrjXo0DaE5+8Fsvm/csSvRPxvOvPliLwxIt2B4ZTpaKHZYzsIwA
         fwJ2KJVysE3QT2oBqIDApa+pLojkptpJfqhonpUPirrJmQxAs7MbbWpVTFUOxX7rctYR
         ICeqDrS3+KUHWdwx0/KHIPoW4IzJg2AuJGuWZj9i765cUyIUyisM78P1v/LTX0TnVmTi
         XJFbJkkNjgBspgrINfq6zsHbJ1NrB8uJdYn/DOhr8xaMiH6UKJnB/dWG2sH3/wmxtOaG
         JxUbLIcs+34EB5pG00hda3MD58P1El6CzrjwmQ5RzOgIfIIb0p8rRHqkcQk2PNG49cvE
         G6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520576; x=1794125376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=;
        b=1OZGTc/4nxA325LoJ1h8X+iJN+G/AMVzEHfl/ro2QYV90KdyIpxUkpZ8BYG17/qzvS
         7RWbbCn4i8VQxirU8AAfgW3ZNJtl7WJRzQDtQmSRZ/Z5lzGrbnvil4Gck20n476THv5p
         i+NuxzAqvjEfu0piGUPG35E+0LVR8vA+4rQjJWMg8MpBg3S3H5xRoyVXlJYkDC+azKPD
         Nws8Qjxi+GZPsfTX2aubyNdhzfCklJTSV3g7kD7tix13nKa/fIwmOBO7MIXpoXrcAjkN
         F/fgKaxdsHOrwj7MIzoY4/VHNOoUIa+yW8tsmoFd/xlM4PvbjoDm29buPA5Lbev0JP8w
         LyVg==
X-Forwarded-Encrypted: i=1; AKwUvBzDaZKfROrMY5tKz/lMBLY06fXwC7dpvq8C6gKKccFc/tJ88x+pWK5H/ceFr5proc6R/MNeyqdj2xaleMdkKqj/@lists.infradead.org
X-Gm-Message-State: APuU4Z/R8TSxnV9qhHoYyjpcBX1hH9h8iXaEub+94KBlXKxERfHdQi7L
	HWBuf0wkkwXIqAJypIRTIWAXe8f/B7aSKO0gTYpju1Ps4ISMdz1mJD2f
X-Gm-Gg: AYBFou26WyB54WkpaOSMW4AcBa8lwf/dHG96pJb3VIADc20onqOdc96ke6ysLAHviUP
	GHYXfn2U4UY2mr3O+YEXH/gcd6vFsWT8OzId/G2SwfPcEw2p7HUq4/uJX5qFuD9w7j3Jst+6rKb
	IMcMpmdjVolzvLmrjem8H5IXO3C+YlKYmxR2gcuLXpbj79CQtu0NpPhpjEQkg7XVaexi/Jc3Vwg
	ofb3u6ERVlpTp3mH3ZWHQlAmFA5UKSp7v6jj9H/qnaFaPRdtZZRrXmvlF8EUk21Sjqi5gJ0vi9f
	kTWKnNntxInwlbdtIbjzSjK/1nd2JoOjjQWd3ju0uR51+uG2Hs2IqicuJGNdVeDAu7I2DSpR0Rv
	HCaVjgEw0tobClObaohklRtKUGFscEg0yQRUsIArOiojAB/wSu6jsGnvBWXu8OitCVG9a+uqlW0
	wSD9Y3IummXTkkmD6z+eN2JLYXYaU4VJVDLkVHqADdmzjP/NoemIPGaTwYWNT99nDlheiNf0lRC
	1PZV1dhNQQozzVq76lpKdhYX22AtM5o9Ctm5pODRft1LV0PGzdQKMrtmoK7p41Z3qOxma5V1Djr
	MjjmYvVVSJmIR3ICVOiykfo3DRV1tST4BMRvm4ap
X-Received: by 2002:a05:693c:69cf:b0:369:daea:812a with SMTP id 5a478bee46e88-36a423fae73mr9966452eec.30.1793520576167;
        Sun, 01 Nov 2026 01:09:36 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm27611719eec.29.2026.11.01.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:09:35 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jerrysteve1101@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Sun,  1 Nov 2026 16:09:24 +0800
Message-ID: <20261101080926.267041-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_010937_434227_DB342576 
X-CRM114-Status: GOOD (  15.92  )
X-Spam-Score: -1.9 (-)
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

This series adds support for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C.  Patch 1 adds the DT
bindings and patch 2 the ASoC codec driver.

The driver is based on the Rockchip BSP driver, reworked for mainline to
use regmap and devm_ helpers, probe the device ID, and report the actual
per-step PGA gain.

Changes in v3:
- Add SND_SOC_ES7202 to SND_SOC_ALL_CODECS, convert the copyright block
  to C++ comments and drop two unneeded includes.
- Turn the volatile check into a switch: the ID registers are now cached
  after the first read and marked read-only via writeable_reg, so a
  regcache sync never writes them back; ES7202_RESET stays volatile.
- Set use_single_read/use_single_write so a regcache sync cannot become a
  multi-register write.
- Use devm_regulator_get() instead of devm_regulator_get_optional().

Changes in v2:
- Drop the hard-coded 30.75 dB PGA gain from the power-up sequence; the
  PGA keeps its power-on default and the capture volume controls apply
  the requested gain.
- Keep the PDM outputs muted until a capture stream starts, instead of
  unmuting at the end of the init sequence.
- Re-run the power-up sequence on resume before syncing the regmap cache.
- Handle the regulator_get_voltage() error return as an int.
- Drop the unnecessary of_match_ptr().
- Fix the copyright header.

Link to v2: https://lore.kernel.org/linux-sound/20261021124552.767218-1-jerrysteve1101@gmail.com
Link to v1: https://lore.kernel.org/linux-sound/20261020143135.623897-1-jerrysteve1101@gmail.com

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  11 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 373 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 131 ++++++
 5 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

-- 
2.56.0


