Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A0E60A3814
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RltAuIg8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aXQEVoJA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hvif4RPe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=i3eoTk/bStSxof4N8Gfz3DvypjlvmOdA8edsrMpkUbM=; b=RltAuIg8z5MRTNHMXCMeTpXTFn
	LrDu0CtFkLT9agbLuJ7fZhzcvKxN9h2sCIu6SFe4pIYJfhheMs7ZOYhRHj81LVWO7yy32UStJw1Rk
	1gWrL68x2kmMdWhgGQtoc5VxhXU23d+R2za1oywmd0Fq6GDJpPmT03SbDjkn2k482HhvLt85UO0/1
	9IUjhp2YH+prpPI/ovJRRswkeNVWnK2ZkdQGc2hTwsYYmRKmQVn9JCzAZlEjSwYBfVU7/uT26OxKc
	7Tsh3X3uNj0I51Afr65LUaiIzORFtnChej0JPX383hVYxHNLcDd8IgOTQ1biQH/RSrYsWqV3KSRwz
	7HiBbelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcw-00000004hJA-0ujo;
	Tue, 27 Oct 2026 12:50:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcu-00000004hIk-2I3O
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=i3eoTk/bStSxof4N8Gfz3DvypjlvmOdA8edsrMpkUbM=; b=aXQEVoJABSuiP8IRkEPGqe53Ww
	dEaZ30lJKR822sSjzNEbB0gyftjbwwmSMN8qBLCN31Nntc76Xcm9bt8EIextPareaBlsOoGuCF0SR
	xO+IU7co3jdA4CacLQF2G7dVcCAqzlccyFcbSbJdOJWbN9XnR306aaZ/17h53eJzDTJRbrY/SkO3J
	HtQOpAAk0HyyaPVhz9YCv3KmWXiaQBRtNk25SeC8H1JpSow1v7M1iOjc4xRbOC8PUlBsO4Stpqz6c
	fjUHumhk/nHcKfRGwb8NE7fi/T1ia/3ODDLD3RJLkSsGwLjIXXWZFNR9U5MY2KOhGhgxTSxQpnAcj
	avj974TQ==;
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgcq-0000000ExrW-4Aqp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:50:03 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3a9787a156eso35230441fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793105398; x=1793710198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3eoTk/bStSxof4N8Gfz3DvypjlvmOdA8edsrMpkUbM=;
        b=hvif4RPegCx7P/zDIJEPlZtbUs8LV1TntSv1jlic7RKMnOXg4Zgh69BVDnuGxN7MOO
         vgYbdD/YORR52OlFyxTyM4jJewsrTFRwVnYdSR/Z5lVlZ7AlfGTvkweyjpH7lf3suadf
         9YMO7uokMdkaKH7gUV7q46DFnwLFT9ykqJkwAUp3HjdCacuaePLSNls1YNkD6HABgdnR
         qdHwgRzTzOSUYmhTV6u+yRRj2Smf06t2q+mAoG8M4e1XHl9CRoFuWvQzoqcAeyxO30wM
         PuyyEOm8ZQZ5qZHWIXW8XUJ13xKPsrmgopp2e4sHWtUtBwKCJluBbaJ5sMajLf416zaY
         2UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105398; x=1793710198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3eoTk/bStSxof4N8Gfz3DvypjlvmOdA8edsrMpkUbM=;
        b=EDMgTkRx3CnKGMt51HZWB6Odk0EZBzRE0zzfh0lBSgmAh47WEesrEC4fTlMKybZuIm
         wzKogHd7bKYUgYgEhxKBCMxePTIUKkMags4+zHPxEGDJrPSDmV76WEkOFcdm2RJMWnsn
         h58JovxfgFVa+PAQwT4MZ2OK4qE9o++JGwDzKqxNmo37UME4ME5RWK0TCdq7BtkT6kNc
         9S0fW2+Y2tfiEgNUmiaKBFSiWdiX/nrsXhbsuVq5PIUVOIH8d9Sxq1Ytlul1oK/P46Xl
         02diEzEm8Y18nV2obAUstKdQflhKGSMwlVIeH3WHtF5UCN4RGScNyQ1Lawi3FB/xP+tU
         CJ3g==
X-Forwarded-Encrypted: i=1; AKwUvBzbqf4twKiENmsodJ76MRl+vS5EQg97ca5oC6oBnAxOQCheTi4jr6IQK+/I9Soy1n3R2CKGRp2c9Ol9OFMKYibA@lists.infradead.org
X-Gm-Message-State: AFq9FYJysKnBScd25347n8wObmGInVVXnRZgQ1N4E3hMjBrqzqpzi5Ss
	G0qUjGD+U6OV19YB4kuISUXI/fEfMKDPrd26B6gDMr5ower4jU6G4/lL
X-Gm-Gg: AYBFou10XVZ58T1IkL+Hp5v66Asx+ZfmfGaNUXq6YpDL2wZ29HW5pCE288neXib9Xr9
	fXg0o1NJaw6hnDsxz4p9dIVmJVejd6HNKyBd2D3sFBU2cANeEueJWw3d0oTNa2QiAyes5Q4I40F
	QB9/dGVcZcOZ5L1Y6NzXU5kk8BsORhNYkykBpbigES8VGzIWz0fr8hildim4wsDQtiVEli3phV1
	6O0qygqGrrwXp8MgZzDVdCgVFugpWBMaAoGDz+BSPZcAlX3GifTwZNf/9c6I9VqY8Y6Df6oRca/
	OOtJSkNyyNkek/EEyM9P42SJAkyUBNk28lkdtX12OtgyJ9B8U1RFd5fe+M5eScGLgcuSih5IvM3
	ALe7fFjysMsOTZzO5EUqpa5X8x2vOPQ6B8XDOCcuSwbQifyAdBWS9UbFTv52fGNw76yUDPNptRV
	I3YsiGj1UBN5ZgVnHVrfQMc/Fz3R9NZF7EmHG7zwppxhz8S+wN2n4hCB1MPjKT1xUzGNf4zQUJt
	m0DdrQcaOsxs7htmJk1Eb0RxkUlTSLvmxNt1iG5EOWxORcwQFyUajMM6L6gBpwQK+Y1a1AQWFub
	VYbTcl2RT42Cn9Mh5ljtI6vGK1s3fySSftBRRHuxKxi4AS/n1bCBQY4Wlf9RZIkaJK7XeIWzP1t
	v5DOTu2FqYw==
X-Received: by 2002:a05:651c:b27:b0:3a9:e428:d2f8 with SMTP id 38308e7fff4ca-3ac6fd68faamr25300931fa.29.1793105398128;
        Tue, 27 Oct 2026 05:49:58 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:49:57 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v4 0/9] iio: enable context analysis for all drivers
Date: Tue, 27 Oct 2026 14:49:45 +0200
Message-ID: <20261027124954.110697-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125001_277979_3A1DC333 
X-CRM114-Status: GOOD (  15.00  )
X-Spam-Score: -0.2 (/)
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

Jonathan asked for the qcom-spmi-adc5-gen3 fix to become the first
patch of a series that enables context analysis across IIO [1]. This
is that series.

With CONTEXT_ANALYSIS := y in every drivers/iio Makefile, testing gives
256 warnings and 2 errors in 126 files (x86_64 allmodconfig, clang
23.1).

Patch 1 fixes the two qcom errors, as v3 did, but names the lock the
way Bart suggested [2]. Patch 2 annotates the two conditional mode
claims in iio.h, which accounts for 241 of the warnings, in 120 files.
Patch 3 covers the core helpers behind them. Patches 4 to 8 annotate
lock helpers in kx022a, meson_saradc, the DMA buffer, opt3001 and
veml6031x00. None of them is a locking bug. Patch 9 enables the
analysis. The common and sensorhubs Makefiles only list subdirectories
and are left alone.

With the series applied all 726 files build without warnings, also
with W=1. bma180, ab8500-gpadc and intel_dc_ti_adc are not in
allmodconfig and were built on their own. gcc W=1 builds show no
warnings. Removing an unlock or a release is still reported, tried in
kx022a, ms5611 and veml6031x00.

Bart's thread-safety branch [3] has most of the same annotations. For
meson_saradc and the DMA buffer he uses __context_unsafe(). Here they
name the lock, so the helpers are checked, and for meson_saradc the
callers too.

Written with help from an LLM coding assistant.

v4: was a single qcom patch, now the first of nine
v3: https://lore.kernel.org/linux-iio/20261025191510.22261-1-zoone.rupert@gmail.com/

[1] https://lore.kernel.org/linux-iio/20261025215954.73549810@jic23-hlaptop/
[2] https://lore.kernel.org/linux-iio/76bbebb4-7337-486d-8f21-a39bcb6dca93@acm.org/
[3] https://github.com/bvanassche/linux/tree/thread-safety

Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>

Rupesh Majhi (9):
  iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
  iio: core: annotate the conditional mode claims
  iio: core: mark the mode lock helpers __context_unsafe
  iio: accel: kionix-kx022a: annotate the lock helpers
  iio: adc: meson_saradc: annotate the lock helpers
  iio: buffer-dma: annotate the queue lock helpers
  iio: light: opt3001: mark the interrupt handler __context_unsafe
  iio: light: veml6031x00: annotate the event enable helpers
  iio: enable context analysis for all drivers

 drivers/iio/Makefile                         | 2 ++
 drivers/iio/accel/Makefile                   | 2 ++
 drivers/iio/accel/kionix-kx022a.c            | 2 ++
 drivers/iio/adc/Makefile                     | 2 ++
 drivers/iio/adc/meson_saradc.c               | 2 ++
 drivers/iio/adc/qcom-spmi-adc5-gen3.c        | 4 ++--
 drivers/iio/addac/Makefile                   | 2 ++
 drivers/iio/afe/Makefile                     | 2 ++
 drivers/iio/amplifiers/Makefile              | 2 ++
 drivers/iio/buffer/Makefile                  | 2 ++
 drivers/iio/buffer/industrialio-buffer-dma.c | 2 ++
 drivers/iio/cdc/Makefile                     | 2 ++
 drivers/iio/chemical/Makefile                | 2 ++
 drivers/iio/common/cros_ec_sensors/Makefile  | 2 ++
 drivers/iio/common/hid-sensors/Makefile      | 2 ++
 drivers/iio/common/inv_sensors/Makefile      | 2 ++
 drivers/iio/common/ms_sensors/Makefile       | 2 ++
 drivers/iio/common/scmi_sensors/Makefile     | 3 +++
 drivers/iio/common/ssp_sensors/Makefile      | 2 ++
 drivers/iio/common/st_sensors/Makefile       | 2 ++
 drivers/iio/dac/Makefile                     | 2 ++
 drivers/iio/dummy/Makefile                   | 2 ++
 drivers/iio/filter/Makefile                  | 2 ++
 drivers/iio/flow/Makefile                    | 2 ++
 drivers/iio/frequency/Makefile               | 2 ++
 drivers/iio/gyro/Makefile                    | 2 ++
 drivers/iio/health/Makefile                  | 2 ++
 drivers/iio/humidity/Makefile                | 2 ++
 drivers/iio/imu/Makefile                     | 2 ++
 drivers/iio/imu/bmi160/Makefile              | 3 +++
 drivers/iio/imu/bmi270/Makefile              | 3 +++
 drivers/iio/imu/bmi323/Makefile              | 3 +++
 drivers/iio/imu/bno055/Makefile              | 2 ++
 drivers/iio/imu/inv_icm42600/Makefile        | 2 ++
 drivers/iio/imu/inv_icm42607/Makefile        | 2 ++
 drivers/iio/imu/inv_icm45600/Makefile        | 2 ++
 drivers/iio/imu/inv_mpu6050/Makefile         | 2 ++
 drivers/iio/imu/smi330/Makefile              | 3 +++
 drivers/iio/imu/st_lsm6dsx/Makefile          | 3 +++
 drivers/iio/imu/st_lsm9ds0/Makefile          | 3 +++
 drivers/iio/industrialio-core.c              | 2 ++
 drivers/iio/light/Makefile                   | 2 ++
 drivers/iio/light/opt3001.c                  | 1 +
 drivers/iio/light/veml6031x00.c              | 2 ++
 drivers/iio/magnetometer/Makefile            | 2 ++
 drivers/iio/multiplexer/Makefile             | 2 ++
 drivers/iio/orientation/Makefile             | 2 ++
 drivers/iio/position/Makefile                | 2 ++
 drivers/iio/potentiometer/Makefile           | 2 ++
 drivers/iio/potentiostat/Makefile            | 2 ++
 drivers/iio/pressure/Makefile                | 2 +-
 drivers/iio/proximity/Makefile               | 2 ++
 drivers/iio/resolver/Makefile                | 2 ++
 drivers/iio/sensorhubs/osf/Makefile          | 2 ++
 drivers/iio/temperature/Makefile             | 2 ++
 drivers/iio/test/Makefile                    | 2 ++
 drivers/iio/trigger/Makefile                 | 2 ++
 include/linux/iio/iio.h                      | 9 ++-------
 58 files changed, 121 insertions(+), 10 deletions(-)


base-commit: 7d80b4b383bc53b48abd3a30ca4a91cdab568bfa
-- 
2.43.0


