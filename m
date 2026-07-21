Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E88C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0cwBADZ+M6LWlMFTgIEAl7+KkE8RhKrW3GGwqzI7cnM=; b=xXUwmctXyrTsqg8l7YXyByyBR7
	OQ2Etx37ZgAl5UVtqLs5oIH/IxrQ0SLoRqYNlmJugRcpUkdlupFRdnB8MpE9QOiNzlY/A0ehGu4tj
	2R59qzfjx9REtdgPrKDdKKA33RsLvQzP0MTTehtz9zWrW5I22m0qgUsq0oSfEnZbcx6x8QFY81aGd
	8uFO8RVWZKy1kuxWq0/rKREHr60tK6XlTbVilYXXXjHPszLqQCs1mOyszozHGwScUsJaj5E6N4rRx
	cpzZnOg4Z1Wgdmz7b42E5G0noZe+TgWUaND2s1mnu0qziVXQ0Smc4+iqq967mrsUXrRw5Zy8EwiD9
	hSQoqH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7g6-000000097oo-3T9G;
	Tue, 21 Jul 2026 10:26:22 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7g4-000000097nv-24se
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:26:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ceaf8a1265so110054325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629579; x=1785234379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0cwBADZ+M6LWlMFTgIEAl7+KkE8RhKrW3GGwqzI7cnM=;
        b=d9lRAgwez66yNl/Z4aTSDT93pxrbP6iCSOkDCWRZpdGNxTrEZEIjXzJLMI+rm3SSV4
         cU0agykiiiBUVuosZigixCGqGZW5mRXI/iib+5V4F1S0Tz8jEqx2rmPWGVEu/k9GhE/0
         bsc+KJ6UPqwKS/bTJ3WgUM0kMcH5/22SoYFp8TL+tj+lQLDc0EfJEL/dup3jE+vqjxNL
         3Fj6xS1N6tY4Xz1e6E6xR6eIKO3MjMtMv3J7ZJ9aIG4Ai5UBv6UgnGl5GbHjGlnfcUC/
         eyl+qiKQG7/M0TvsncOrfXoSDe4ybQI8mez7o7uQCMEwdmNFk/0TZamhSlxzXzyyWz9z
         QsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629579; x=1785234379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cwBADZ+M6LWlMFTgIEAl7+KkE8RhKrW3GGwqzI7cnM=;
        b=JlOatPtIh+tX86lOGvFFNroOYnnoQhMFJzYU4d2BgSen1S3rJI4drSq86gSUjSzYr3
         NU5ueo/Bs85khHzMsngE7CB9bijw6ehJphROCHH3TC6tEuNVNW9SNx0nMUfLnz8Gj4hy
         fBCQfwZYPeI4lSXHsxG82kJxT89DXicwKl1zHcXfM5lB+TwJbXhPjS30Qnk8t3mMhG9P
         DGI/3TsWWjw0MzFdkttPmZUG5eKUYlHJZmACihZ1EG4wFRD4wFBRNJp1USj8v5cJgm1l
         bwlRxZrxOs1yWRWHJ2O6IsEtzgQqgcDR0PRif73wgyq914Jx2jBLdq+5TOs9IM4Ty6Jt
         0h9g==
X-Forwarded-Encrypted: i=1; AHgh+RpqbYYmAF74apbG56OTGMFQxs/sJk/5YR6LTuFZauzhPs9xSjLt0xCeoB3Boew6aHIhLHaXfO1Ng2mmMv82kIUc@lists.infradead.org
X-Gm-Message-State: AOJu0YwhJY5DjNEJau/jtDeQRPo4l4yVEWTnLt5BiUkZjyiNJGpeySQy
	tTQ5IVdoWM6U167HQgbgMYnp57aqJvS1JA2QGkXm8VB8No2jZ6HviRjP
X-Gm-Gg: AR+sD12ICng2e4uJhFZd8Dr6YFBzwBYcNBstiuuhkrjwdESaDcF7Z6pg544DXc9n5l1
	vDT+ENRwxpsQJycln6Qum3ycg7fvJ8UDNmgeSmTdGpD0VJGkNsifTHE+A9W98T26KfxwA8NXTPz
	y0K1MBOkfA5aSxLsZae00Mky3alusyHs0Q+HnXcKf6t0SJO2ChBaQhqFmu06/HEG7ztgRYSEQSz
	iYALVCiTHt9Gg+augzCqackiQUxPJpw7whjrKPGcIVZaAeDiI4hdKp4ItlHPHi1R6lYOhgeTC4y
	nYzbXoMKZjhcNKAKxoVe0ggHJyM23U8FAJx7K4MgZUp70+QpFeGnVw9BVv8gZ5gdSaxLkc7Qhya
	8QrVzIT0i6O4vsLsQ2SiVeYkBQ84kXUWsjk6GWWGhK28x3KjLgakWAl51qrvU6NFomR1n2vjdfH
	njb3+AMkrKqzks4u4zElw6l6HdyMa3Aj+GRnyo
X-Received: by 2002:a17:903:1210:b0:2c9:d298:6c06 with SMTP id d9443c01a7336-2cf34a0a6c0mr183821275ad.25.1784629579348;
        Tue, 21 Jul 2026 03:26:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:26:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 00/29] ASoC: codecs: Use guard() for mutex & spin locks - part 2
Date: Tue, 21 Jul 2026 17:25:31 +0700
Message-ID: <20260721102600.523199-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032620_541739_BA83CBF8 
X-CRM114-Status: GOOD (  11.68  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in ASoC codec drivers
to use the guard() and scoped_guard() helpers.

Compile-tested only.

Changes in v4:
 - Included 2 additional codec drivers for cleanup.
 - Simplify regcache error handling in resume for both rt712 and rt721.
 - Remove goto labels to streamline error paths and prepare for guard 
   cleanup.

Changes in v3:
 - Rebased onto the latest broonie/for-next.

Changes in v2: 
 - Add Reviewed-by tags from Charles and Herve.
 - Address Herve's review comments.

Link v3: 
https://lore.kernel.org/all/20260709045902.498848-1-phucduc.bui@gmail.com/
Link v2: 
https://lore.kernel.org/all/20260708141734.578926-1-phucduc.bui@gmail.com/
Link v1 : 
https://lore.kernel.org/all/20260630063449.503996-1-phucduc.bui@gmail.com/


Best regards,
Phuc

bui duc phuc (29):
  ASoC: codecs: da7213: Use guard() for mutex locks
  ASoC: codecs: da7219: Use guard() for mutex locks
  ASoC: codecs: es8316: Use guard() for mutex locks
  ASoC: codecs: es8326: Use guard() for mutex locks
  ASoC: codecs: es9356: Use guard() for mutex locks
  ASoC: codecs: fs210x: Use guard() for mutex locks
  ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
  ASoC: codecs: hdmi-codec: Use guard() for mutex locks
  ASoC: codecs: idt821034: Use guard() for mutex locks
  ASoC: codecs: lpass-macro: Use guard() for mutex locks
  ASoC: codecs: madera: Use guard() for mutex locks
  ASoC: codecs: max98095: Use guard() for mutex locks
  ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
  ASoC: codecs: pcm512x: Use guard() for mutex locks
  ASoC: codecs: pcm6240: Use guard() for mutex locks
  ASoC: codecs: peb2466: Use guard() for mutex locks
  ASoC: codecs: rt5514-spi: Use guard() for mutex locks
  ASoC: codecs: rt5645: Use guard() for mutex locks
  ASoC: codecs: rt5665: Use guard() for mutex locks
  ASoC: codecs: rt5668: Use guard() for mutex locks
  ASoC: codecs: rt5677: Use guard() for mutex locks
  ASoC: codecs: rt5682: Use guard() for mutex locks
  ASoC: codecs: rt700: Use guard() for mutex locks
  ASoC: codecs: rt711: Use guard() for mutex locks
  ASoC: codecs: rt712-sdca-sdw: Simplify regcache error handling in
    resume
  ASoC: codecs: rt712: Use guard() for mutex locks
  ASoC: codecs: rt721-sdca-sdw: Simplify regcache error handling in
    resume
  ASoC: codecs: rt721: Use guard() for mutex locks
  ASoC: codecs: rt722: Use guard() for mutex locks

 sound/soc/codecs/da7213.c             |  37 ++----
 sound/soc/codecs/da7219.c             |  62 +++-------
 sound/soc/codecs/es8316.c             |  31 +++--
 sound/soc/codecs/es8326.c             |  30 +++--
 sound/soc/codecs/es9356.c             |  29 ++---
 sound/soc/codecs/fs210x.c             |  89 +++++---------
 sound/soc/codecs/hdac_hdmi.c          | 117 +++++++++----------
 sound/soc/codecs/hdmi-codec.c         |  15 +--
 sound/soc/codecs/idt821034.c          | 144 +++++++++--------------
 sound/soc/codecs/lpass-macro-common.c |  12 +-
 sound/soc/codecs/madera.c             |  39 +++----
 sound/soc/codecs/max98095.c           |  35 +++---
 sound/soc/codecs/mt6359-accdet.c      |  13 +--
 sound/soc/codecs/pcm512x.c            |  19 +--
 sound/soc/codecs/pcm6240.c            |  25 ++--
 sound/soc/codecs/peb2466.c            |  16 +--
 sound/soc/codecs/rt5514-spi.c         |  21 ++--
 sound/soc/codecs/rt5645.c             | 160 +++++++++++++-------------
 sound/soc/codecs/rt5665.c             |  15 ++-
 sound/soc/codecs/rt5668.c             |  10 +-
 sound/soc/codecs/rt5677-spi.c         |  36 +++---
 sound/soc/codecs/rt5677.c             |  75 ++++++------
 sound/soc/codecs/rt5682-sdw.c         |  24 ++--
 sound/soc/codecs/rt5682.c             |   5 +-
 sound/soc/codecs/rt5682s.c            |  17 +--
 sound/soc/codecs/rt700-sdw.c          |  14 +--
 sound/soc/codecs/rt711-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt711-sdca.c         |   5 +-
 sound/soc/codecs/rt711-sdw.c          |  24 ++--
 sound/soc/codecs/rt711.c              |  50 ++++----
 sound/soc/codecs/rt712-sdca-sdw.c     |  50 ++++----
 sound/soc/codecs/rt712-sdca.c         |   5 +-
 sound/soc/codecs/rt721-sdca-sdw.c     |  49 ++++----
 sound/soc/codecs/rt721-sdca.c         |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt722-sdca.c         |   4 +-
 36 files changed, 587 insertions(+), 753 deletions(-)

-- 
2.43.0


