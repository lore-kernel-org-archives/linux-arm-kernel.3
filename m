Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC2606D802
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ol3m7wUL;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U8gU7w4a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4tPenR+/9h0LCzZJprU/jbaqrKPBMlOXgrDY4zMH4eg=; b=ol3m7wULRzheSlIMQ/E999DYyR
	O5Io683+cf21WQ2aVQD1cS5zyjnqd5STlwiBph4ZSKuB7dIbdk53teTJOd41/2qO+OKtIm+N6fK8S
	894Cx64OHd3pRP4BsFbsliOxrHDvDTjr+VC/yuF15zLcFYSTULGx2c+wVYyCRGQ2Hme+IR3AE2zYx
	pMS0mpHzDwi7mrnZa7IVKPofmOYC2kW2hX6Rq7EznR3mx0sYLPRJSt0o/hobJBG+lwNRFVCFaPrt0
	DDnhQBqvmyJmdKvVfvKzcsEwwmiKDCU8EUIaHNkbMd8xszoIf6DgAgxeyx2k8fUVTDk1bMlnHebbh
	X/Dz/dNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWd-00000002Xjk-0iiq;
	Tue, 03 Nov 2026 13:26:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWa-00000002Xi0-3brc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:26:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so28376345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712360; x=1794317160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tPenR+/9h0LCzZJprU/jbaqrKPBMlOXgrDY4zMH4eg=;
        b=U8gU7w4akXjRYJ96WBEwsmXSvIQzkEk6fz+ZoqST2VfyRcPemqjpJZyQSa4SvZYmGM
         bCGi9zVuU666kmmPVzMOFc5LAjI6DKOTw2EdDu7f92QFHXwJ1i4ekhR8+Es6Igu2QRyQ
         L80aPGyfDhDddn/yTYPBDepsQkbp5c1YgbG16n7S4Fw3eJGZCbMq29IYq/oo+r93FYif
         a4Iz9AAP1btdVrYkhNHOexLnNGwY55F/I6wK5+KdqMo7FtriSfIol54L6uVGjykDJBKz
         mYYslVbxP3/toFw4bla2levco6gdOlna0z+SyrFoN1sUJxmN4i8pxTDLjMYfnmY7XxpX
         0F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712360; x=1794317160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tPenR+/9h0LCzZJprU/jbaqrKPBMlOXgrDY4zMH4eg=;
        b=OKvHhuvMfeBcPT0yd0MEyeX747GeZ6B163bhUDhrTgIQZwQ61MJZucUbLRSZGhQsm5
         vCq5JOePjnOTyFB9tnhOM7SzZqTZCkonPV4HvYuhLb5Aqvzt0J6gbp8X8ThlLVZevAEe
         VxuXCAK7pQ11rllNCSJw/6bimjsnzNGBbMtzp9W6u/5xWJ9fpnMKT3vv8uOcb6E+K6zr
         norJf466bNeBcRWA5SzUEY6isS6IZQGjmDgWxMBz6vthCfeoHR5GpFwuuAeK/Z8kf20m
         kaIwFUA5C/90fJdaENWg57uh7frdxq6hRJpH6yRG/fz2jMntlVw9m2B5PB0WInSluyJy
         GIww==
X-Forwarded-Encrypted: i=1; AKwUvBzVm9loWM6ZA6CekjE2YQuxeqHxrBDFFWh3Slg9+QE/kCJG/ehVP249/5rbH++7xnb8TPJ6LQQYq90dhLicaV+8@lists.infradead.org
X-Gm-Message-State: APuU4Z/qOFMrqY8JH3mWjSEboDQU5HLNm9x88gCs3l8G58VkDMexjSV7
	XRMU1MBpkbsG2fU2vP/hA+NYoNf50YSGZwX8g8BfK4TCcPlJ3+4OlOH9
X-Gm-Gg: AYBFou0JxO5QOz/WpOid1GWqNO4c1JOLGT3bn46fvMoOcTi7H/mvGf79Wc6eXzwchbO
	QeZeoHk7zMRwWfif7Cu4NV2uNJdJ68IFhYlYSJoBTORqcntNRz1yaDSFQxbeynD+TFLlVQpqxCd
	dhzjr7n6LwyLUCGutOjQVljKVTa0OqB2UOgCR5MLbKNyfjFT6JoN9xNF450xmLPN0O3tbF/jyt2
	dhjIAbZV7mAboiGmnwcM4Rsfl8/iIg1NqYxvtW6Hxb8l5Jm1MEG4Dj5R4HhiKdtEO3m/c+GSaH7
	JWtnBbDHh+MoEhBeX1nTEJf85BGksNjtZcyH+/9J6+mSnu2UZwsyI0/pB2yuDkui8ZYFQpb+s3S
	Rz+5JA4wC51nWo1yijfaxxBJxi2JS/MscTh5ygXMEzXEF7G13f+BD0VHdS478Ydn8dOOdLjHV8+
	ct4i05yr+jqP/uq/87kgenenMNqOT+6YB9bpa3pbV4IVvfDt96IgmeK0byZUOLwx8mY+CL0osSs
	cKeQBp7LamHVW7vYbjwDDHnTSq0sL730Wv1FBAHi3KegwkNm71AnuMFVxxoYBk7jMjHPGCeUfSt
	UFv26w4xZtir1+rQukStQfSkJzDb/KdeUEUJRySvbWUZXEfnZj8nc3kJjnbHQ7KuDe681kAahQj
	bInn9ehi/NRlyA6C84IklNfk=
X-Received: by 2002:a05:600c:a00b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4ac1765d8abmr303491105e9.22.1793712360411;
        Tue, 03 Nov 2026 05:26:00 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:25:59 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 0/5] ASoC: rockchip: fix missing REGMAP_MMIO dependencies
Date: Tue,  3 Nov 2026 14:25:32 +0100
Message-ID: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_052604_922815_923DCDC8 
X-CRM114-Status: GOOD (  10.81  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Each of these drivers can be built into vmlinux while the code
providing a symbol it calls is a module, which fails to link.  The
same shape in 5 drivers, so they are here as one series.

Affected: rockchip_i2s, rockchip_i2s_tdm, rockchip_pdm, rockchip_sai,
rockchip_spdif.

The fix is a select rather than a depends on: the providers have no
prompt of their own and are only ever enabled by a select, so a
depends on would leave these drivers unselectable.

Each was reproduced on v7.3, x86_64, by a vmlinux link that failed on
the named symbol, and each links once the select is added.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

Jude Gyimah (5):
  ASoC: rockchip_i2s: select REGMAP_MMIO
  ASoC: rockchip_i2s_tdm: select REGMAP_MMIO
  ASoC: rockchip_pdm: select REGMAP_MMIO
  ASoC: rockchip_sai: select REGMAP_MMIO
  ASoC: rockchip_spdif: select REGMAP_MMIO

 sound/soc/rockchip/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.43.0


