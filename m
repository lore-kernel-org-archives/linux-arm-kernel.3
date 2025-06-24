Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3F7C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+wg9qW4GAB9SxeZP4ZPWnnJ0L3cq/NBnSEznhgizvFM=; b=PQ7Czm3+4d59zMM/wHaxQRWws3
	on26/Dgmkds9eOQ8H97uia0l58LBpXhYjBmB0SI8MZm2i+RLB6U3yTZZjf3gAMB7H/33hYxnkZ0kn
	uUtYV/RxB3zUFLMOf5EPFx0Y0h/E3DLQKm5MhDBPj070ksTt6fHz54cfezsG5hqQBFUymZLMJ8EiY
	JCozYRyGCcKRrOCKO7D304/VFzjTKdhDVr0KwGMTHuaTX8I2YAEZorH5zN8kYsY20/X8SZN6+0GKQ
	Rh9Unh8j/2B+uiwmLr33lF75xLcGqbj4KER64+fkc00zpUHer/Ijzo6JBi0SY3Rp6BjBb3HdboDt9
	GJPsmD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU597-000000061JF-20XZ;
	Tue, 24 Jun 2025 15:01:13 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU44i-00000005mvY-3U6P;
	Tue, 24 Jun 2025 13:52:38 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso574135e87.1;
        Tue, 24 Jun 2025 06:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773155; x=1751377955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+wg9qW4GAB9SxeZP4ZPWnnJ0L3cq/NBnSEznhgizvFM=;
        b=PSExRQLI4keRwX9wqtpXBXg9cBP3yyLM8Ck1jx8591DJrkGjGApkKjfJK+DJPdb3/f
         el1ySdFY58fmxa4YzVOiJjliiReQp5+naOO1NLY6PCU1MNeYferYLi2zXHQP9gU5G6a4
         sVYGuNqMpz+fLMpYkgNA2DnaBJzOC6qEUe+UiH7a0E8TtuqIJuTGG4gW99GVwc2OURS0
         fE6CCyh/uALuLmvJ9SnGwc82NlrFS0m0wpiIDVK1/XVXXM2B5maKQGHSRE78HnGk7/BO
         lUELarag5+QpMhuoTKIQET9VqahQ0kVbthAfYscjqbFkXax3K+tOKMTDGQnsW2TcooLj
         XtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773155; x=1751377955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wg9qW4GAB9SxeZP4ZPWnnJ0L3cq/NBnSEznhgizvFM=;
        b=ggtY51qH59868SCImOtwlM37DwJkvCJ1ql440vYEFdpssLlyXAdVmSbmGnQDj5dJzK
         qIt/yTzs5Hew+rjlxaKsZqnDrjN6ua0oorMTu3yZB9ygbUilc/PPby+OwSHmc0JhQXdJ
         r7ZS5mHN+mJsqC1TiDS8uZ0G2P0N46fWWf8qYhZq5+kWsnU9wxlHwMNPJClasTUafJdH
         wNW3gspcGV9QzBfbjEYmd6jcQzDRJfGKCq8J6vgvAL7YOnR2tKKarQEcaez8XLIDzJ2w
         v+U0N2OU9kYOi/oYkDGVTVRfdFDD3YETUl23GR2gamXFFqgarfjmC9PF92b+t/TUMdZf
         MF5g==
X-Forwarded-Encrypted: i=1; AJvYcCU7vpiV3lPtaIq/MojljYPMa254uYWOkPUnfExroMzf/+g5VHU/cLspAoK0F123hcyumm6Jn8ytVwARNoGLOFJ6BQ==@lists.infradead.org, AJvYcCW8+lr+rQEnX6xIouAenMsoBj/oiQF7VJ/K5aEHNjMmxuhBfNqEcPrUlcUp46l+amiQT+toIPBPnIasP9tZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5n4X3gYp2B70wJvlxNeYQTsiKgeo5beUXIpRdLKoiuHIqWWt0
	uKr4zj2ouBZXGqObJ2SGKngJUn1k1gwb3vmG9X2rFjUT3CBr96yvGMhN
X-Gm-Gg: ASbGncsj2p/DO9saLjKEHZjJTXeOMnW9YRDKJ12yHtNeKrSpbTx43yTupy7/B8yo4wU
	TV99PGBbmH1tvENGJW2xdhgHO43FRbSbJxnnO7WNuyAssDdEMmzatyhUguvVOYjI4HerldQX536
	0DPfhjC6FCsANqTPOIzVQLLCGogzwaF36GFDgRryNGpW259j2Dv+1g3Ev+Evmh2Y8A3arTsm9AC
	PgWMdIBdHcCJFdg36jRXzB6x3i+JxpwS/Gv5T85+SoTX4JV1By1G+z42qI5v0xAShDNhNLWQ8rU
	GUyQboZ6Kc2d0BlUgBhWWS7/pp6zpteeH2RpaPFvTG1JjkF1XcRBAYKrd7Qi1S049ocn6rkPYJt
	uCsst8sXL8zaZgvekeffuhk4QAPXIBbt87WVZ9lnOJ6LZ5zDhcHxfTl8rIg4Bmg==
X-Google-Smtp-Source: AGHT+IFOuf5bAzhEktFTfPKfMooaN6q3rqHW9Fgh4cH2Pb5c/Dt3frRC792c/mKVwGvTIdymva9mgw==
X-Received: by 2002:a05:6512:1390:b0:553:aa32:4105 with SMTP id 2adb3069b0e04-553e3bb55cfmr5482884e87.24.1750773154423;
        Tue, 24 Jun 2025 06:52:34 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:52:33 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 00/22] Support more Amlogic SoC families in crypto driver
Date: Tue, 24 Jun 2025 16:51:52 +0300
Message-Id: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065236_872914_B999A905 
X-CRM114-Status: GOOD (  14.01  )
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

Hello!

This patchset expand the funcionality of the Amlogic
crypto driver by adding support for more SoC families:
AXG, G12A, G12B, SM1, A1, S4.

Also specify and enable crypto node in device tree
for reference Amlogic devices.

Tested on GXL, AXG, G12A/B, SM1, A1 and S4 devices via
custom tests [1] and tcrypt module.

---

Changes V1 -> V2 [2]:

- Rebased over linux-next.
- Adjusted device tree bindings description.
- A1 and S4 dts use their own compatible, which is a G12 fallback.

Changes V2 -> V3 [3]:

- Fix errors in dt-bindings and device tree.
- Add new field in platform data, which determines
whether clock controller should be used for crypto IP.
- Place back MODULE_DEVICE_TABLE.
- Correct commit messages.

Changes V3 -> V4 [4]:

- Update dt-bindings as per Krzysztof Kozlowski comments.
- Fix bisection: get rid of compiler errors in some patches.

Changes V4 -> V5 [5]:

- Tested on GXL board:
  1. Fix panic detected by Corentin Labbe [6].
  2. Disable hasher backend for GXL: in its current realization
     is doesn't work. And there are no examples or docs in the
     vendor SDK.
- Fix AES-CTR realization: legacy boards (gxl, g12, axg) requires
  inversion of the keyiv at keys setup stage.
- A1 now uses its own compatible string.
- S4 uses A1 compatible as fallback.
- Code fixes based on comments Neil Atrmstrong and Rob Herring.
- Style fixes (set correct indentations)

Changes V5 -> V6 [7]:

- Fix DMA sync warning reported by Corentin Labbe [8].
- Remove CLK input from driver. Remove clk definition
  and second interrput line from crypto node inside GXL dtsi.

Changes V6 -> V7 [9]:

- Fix dt-schema: power domain now required only for A1.
- Use crypto_skcipher_ctx_dma() helper for cipher instead of
  ____cacheline_aligned.
- Add import/export functions for hasher.
- Fix commit message for patch 17, acorrding to discussion [10].

Changes V7 -> V8 [11]:

- Test patchset with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS: fix some bugs
  in hasher logic.
- Use crypto crypto_ahash_ctx_dma in hasher code.
- Correct clock definition: clk81 is required for all SoC's.
- Add fixed-clock (clk81) definition for A1/S4.
- Add information (in commit messages) why different compatibles are used.

Changes V8 -> V9 [12]:

- Remove required field clk-names from dt-schema according to Rob Herring
recommendation [13].
- Fix commit order: all dt-bindings schema commits now located earlier
than any changes in device tree.
- Fix typos and add more clarifications in dt-schema patches.

Changes V9 -> V10 [14]:

- Rebased over linux-next (20241106).
- Remove patches with AES-CTR support. This was a dishonest implementation of CTR algo.
- Update commit headers in accordance with the accepted rules in each
  of the subsystems.
- Moved adding power-domains (dt-bindings) in desired commit.

Changes V10 -> V11 [15]:

- Rebased over linux-next (20241213).
- Fix unused variable warnings reported by kernel test robot [16].
- Fix dts warnings reported by kernel test robot. [17].
- Add Rob Herring RvB tags for dt-bindings patches.
- Remove ____cacheline_aligned macro. Use crypto_ahash/tfm_ctx_dma(),
  crypto_ahash_set_reqsize_dma() and crypto_dma_align() instead.

Changes V11 -> V12 [18]:

- Rebased over linux-next (20250624).
- Remove digest() method for hasher.
- Add ____cacheline_aligned for meson_hasher_req_ctx structure. Hardware requires
  that these buffers be located in different cache lines.

Links:
  - [1] https://gist.github.com/mRrvz/3fb8943a7487ab7b943ec140706995e7
  - [2] https://lore.kernel.org/all/20240110201216.18016-1-avromanov@salutedevices.com/
  - [3] https://lore.kernel.org/all/20240123165831.970023-1-avromanov@salutedevices.com/
  - [4] https://lore.kernel.org/all/20240205155521.1795552-1-avromanov@salutedevices.com/
  - [5] https://lore.kernel.org/all/20240212135108.549755-1-avromanov@salutedevices.com/
  - [6] https://lore.kernel.org/all/ZcsYaPIUrBSg8iXu@Red/
  - [7] https://lore.kernel.org/all/20240301132936.621238-1-avromanov@salutedevices.com/
  - [8] https://lore.kernel.org/all/Zf1BAlYtiwPOG-Os@Red/
  - [9] https://lore.kernel.org/all/20240326153219.2915080-1-avromanov@salutedevices.com/
  - [10] https://lore.kernel.org/all/20240329-dotted-illusive-9f0593805a05@wendy/
  - [11] https://lore.kernel.org/all/20240411133832.2896463-1-avromanov@salutedevices.com/
  - [12] https://lore.kernel.org/all/20240607141242.2616580-1-avromanov@salutedevices.com/
  - [13] https://lore.kernel.org/all/20240610222827.GA3166929-robh@kernel.org/
  - [14] https://lore.kernel.org/all/20240820145623.3500864-1-avromanov@salutedevices.com/
  - [15] https://lore.kernel.org/all/20241108102907.1788584-1-avromanov@salutedevices.com/
  - [16] https://lore.kernel.org/all/202411090235.a7vEgZQo-lkp@intel.com/
  - [17] https://lore.kernel.org/all/202411090619.fQTDHg7w-lkp@intel.com/
  - [18] https://lore.kernel.org/all/20241213140755.1298323-1-avromanov@salutedevices.com/#t

Alexey Romanov (22):
  crypto: amlogic - Don't hardcode IRQ count
  crypto: amlogic - Add platform data
  crypto: amlogic - Remove clock input
  crypto: amlogic - Add MMIO helpers
  crypto: amlogic - Move get_engine_number()
  crypto: amlogic - Drop status field from meson_flow
  crypto: amlogic - Move algs definition and cipher API to cipher.c
  crypto: amlogic - Cleanup defines
  crypto: amlogic - Process more than MAXDESCS descriptors
  crypto: amlogic - Avoid kzalloc in engine thread
  crypto: amlogic - Introduce hasher
  crypto: amlogic - Use fallback for 192-bit keys
  crypto: amlogic - Add support for G12-series
  crypto: amlogic - Add support for AXG-series
  crypto: amlogic - Add support for A1-series
  dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt
    lines
  dt-bindings: crypto: amlogic,gxl-crypto: support new SoC's
  arm64: dts: amlogic: gxl: correct crypto node definition
  arm64: dts: amlogic: a1: add crypto node
  arm64: dts: amlogic: s4: add crypto node
  arm64: dts: amlogic: g12: add crypto node
  arm64: dts: amlogic: axg: add crypto node

 .../bindings/crypto/amlogic,gxl-crypto.yaml   |  32 +-
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  14 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   7 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   6 +-
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  13 +
 drivers/crypto/amlogic/Makefile               |   2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 587 ++++++++++++------
 drivers/crypto/amlogic/amlogic-gxl-core.c     | 289 +++++----
 drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 485 +++++++++++++++
 drivers/crypto/amlogic/amlogic-gxl.h          | 111 +++-
 11 files changed, 1191 insertions(+), 362 deletions(-)
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c

-- 
2.34.1


