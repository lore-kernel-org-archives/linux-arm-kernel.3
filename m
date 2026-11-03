Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEE6606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=10yzcKO4;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RlHWoKMs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=; b=10yzcKO4jChlJjXGb+JTVPk0J5
	39S0w6LYh7cbqjb5E2eLlsR+fKvU1cy8EYHuV7uENJmoXklFj3JWCLIyhPCOxLV0N0KesjwbGMO/I
	eeKNaDchrXnXoTOqHRFy0FnCqPo36b4osMPEOM4xcHg9w2iMLyoi/7XfphgdsAQECLh/mnUrz1oZG
	PCLVNxcnYA+pz4gEd0tD1YKpe+Cp1iKNUtGHuNYqGdJhxbT7JF+40TpiHXaQlm71vZmLwXu8ql0vy
	Pf15cL5j9L5KBC0MvmCqukGAgemr5RBUK+HmpU4gVlZ7dTmcz0Pm2J8hpxLrZSas/A/1qAtQ/zs5w
	Ar/BqJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6HL-000000013az-0Uew;
	Tue, 03 Nov 2026 04:37:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6HI-000000013aJ-1KAZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:37:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2773534a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680663; x=1794285463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=;
        b=RlHWoKMs74fabe9aq5aEd/LE3P+Q2XftjQtVpL1SI5G1HnmWH7ZM4QI1R87sLtsYr4
         LZJelditsqxbBFGmx/ZrXKzPeKvPr4Im0pbIbyX6o5WYu35zR6NflcuNr8U4NlT3ek6k
         hrMSyO9QJKnukqJTWkRlwbbzPjhNwlgqNMxUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680663; x=1794285463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=;
        b=A7/uMnm+da8SR0it9q5IDLJaHkR72Yju+cjVgVR8+MfbVEZvFUj0MWJMNF7OgJ75hI
         ASY2bkZ/wRlWFoi2hgrYmkWMlprFiUlt1Sg62q5fO9cq5o8Na641Rk5m8cwxnNHdp1Yy
         yY9Phdjq2P8bZM+43Q7EuheIO/xA8/wsA/Sp2VB/KAkVVxSh6ibeuFC1VRANEh3nxV8x
         ybUHTU4wm/UCgqxMCirvi/lH2KExBLOWMEt/MYKxQj8ihHOoRtmfVwa8dZkn7QoGj2b0
         xMHd/YSzkhsOlHrrHBPZG3GFjBBLxLbLSUTPzbH84MS4tZ87p3glPjSEBc5joVkTit9l
         KioA==
X-Forwarded-Encrypted: i=1; AKwUvBwGimaW1L2ICOtQWXmGyVSH7aLXnOnLUWH8yGXZodXQMXGCJxtuFhz2+vjh3oKFt3XrrJOCOCjPKus0Wf3lqvjj@lists.infradead.org
X-Gm-Message-State: APuU4Z+C+wAjXEy9WlzFHfRmHwWpQOTYkxj5Zfd3Zk2Qcumb8WOyYgGL
	l+9ByWiA32GXjoewPVFq7UjUvJNRX2QVvkODyIf19rO+bPHaEV6lpKMncwOH6S2f/w==
X-Gm-Gg: AYBFou2NENwVf6zCgR/d5yI9X37mCFP2AhCELx2Fs5HSuJO4yDtZOBUCU3ynvKKU5Jg
	IwWIowlFNO+IClbNsZKsoWVK+LGuRHkZHG+sKYGWxr9ev0SuBPiVF08mTNqh0/dOxbONaXef06a
	K2GHZ5i5w0zSebrZ/5s6d8XGT+Wpnxs/LWmQdD0MiG3HqFx1ApijeMjGM6MmU21ReP6NZggwLEe
	No/51JnOHOHgliGSNtr2aRFSc5ybcZc5buyiqA0rgUZQauxt8+paeuynIEMiLJYfRKFmLKKnTAN
	e99iVOUIfRp77F3AJysju+HXMTDPgsxaTjvk1dyR3HOdcjYlq/gpN08JatODWNLSIIwpFvsOukw
	cS1SsODeVt9Xt0vhvkjgQm9A1li406l97xAHPgfKRfskpVbR1kLdziWJkjWSBl7+hURI9puAJRF
	7k2gTLKqqcuiVXLQGMaHyr2ecl2IpmoXhAn7L8cZ+SKkKUM/If0NTAFeNNfkZK2HQZBffJgQA49
	3OQa1ID0BqiQZ4r+PAyRcrsWsDSyKlzO9G59gueqTMcgiYkpIg/+Deej+zNBnCuRHOEP1OwWz4p
	C5bCxfyJRkpvylh24v4IbuejZzAn5OvDKJYHKZLbjrks4V8m2M0DitAXwPxhhBTWLo6DthDEe82
	SC2CQlkzrwjJmGcExQsIk+JD60L9eY8w1YA==
X-Received: by 2002:a17:90a:b890:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3ae8e5bdcc9mr6988054a91.5.1793680662787;
        Mon, 02 Nov 2026 20:37:42 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:41 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/8] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue,  3 Nov 2026 12:37:24 +0800
Message-ID: <20261103043734.2179858-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_203744_396866_CE14532B 
X-CRM114-Status: GOOD (  28.03  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi everyone,

This is v7 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v6:
- Patch 1 (regulator)
  - Fixed rust build
- Patch 5 (cleanup op)
  - Fixed missing parameter in cleanup op type declaration
  - Fixed typos in commit message and comments
- Link to v6:
  https://lore.kernel.org/all/20260901074930.764550-1-wenst@chromium.org/


Changes since v5:
- Patch 1 (regulator)
  - Correctly assign wait_us to all bulk consumers (Sashiko)
  - Check _regulator_is_enabled() > 0 to check for enabled regulators
    (Sashiko)
  - Lock regulator_dev on final _regulator_is_enabled() check in
    regulator_register() (Sashiko)
  - Make it clear that _regulator_is_enabled_recursive() assumes that
    supplies have been resolved (local AI review)
  - Consider supply's last_on timestamp for regulators that are already
    enabled or have no .is_enabled() ops (local AI review)
- Added noautosel tag for some patches
- Added patch to pass component probe success or not to cleanup callback
  (patch 5)
- Only defer regulator disable if a device was found (patch 6)
- Link to v5:
  https://lore.kernel.org/all/20260825041628.988369-1-wenst@chromium.org/

Changes since v4:
- Made regulator core try to set last_on timestamp for regulators that
  were left on by reset default or firmware, but not enabled in kernel
- Dropped two patches that were merged
- Link to v4:
  https://lore.kernel.org/all/20260811122011.3539250-1-wenst@chromium.org/

Changes since v3:
- Added __private modified to regulator_bulk_data.wait_us field and
  switched to ACCESS_PRIVATE accessor for the field (Andy)
- Moved wait outside regulator lock scope (Sashiko)
- Moved "remaining" value assignment closer to conditional (Andy)
- Fixed variable unit name in regulator_enable_and_wait() prototype
  (Andy, Sashiko)
- Added commit message section showing average delay needed for I2C
  prober (patch 6) (Andy)
- Link to v3:
  https://lore.kernel.org/all/20260721075226.2347933-1-wenst@chromium.org/

Changes since v2:
- Added new regulator "enable and wait" functions that wait until at
  least the given amount of time has passed since the regulator was
  last enabled.
- Converted patches to use the new functions
- New header inclusion cleanup patch for elan_i2c driver

This series fixes the trackpad descriptions on some MediaTek-based
Chromebooks: either the trackpad's supply was set as always-on to
workaround missing delays in the driver, or the delay and supply
are missing from the trackpad's device node.

v1 was just the first patch [1]. It has since grown to cover multiple
drivers and devices.


Patch 1 adds new "enable and wait" functions for single and bulk
regulator enable.

Patch 2 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. This uses the new "enable and wait"
regulator enable function.

Patch 3 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 4 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 5 makes the I2C component prober let the cleanup callback know
whether a component was found and enabled. Needed for the next patch
to only delay calling regulator_disable() if a component was enabled.

Patch 6 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 7 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description. Should not be backported without
the other driver patches.

Patch 8 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 2, 3, and 4 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers.

The DT changes must go in after all the driver changes land, especially
patch 2 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (8):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: Let cleanup op know if a device was found
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   8 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |   2 +
 drivers/hid/i2c-hid/i2c-hid-of.c              |   9 +-
 drivers/i2c/i2c-core-of-prober.c              |  34 +++--
 drivers/input/mouse/elan_i2c_core.c           |   7 +-
 drivers/regulator/core.c                      | 129 ++++++++++++++++--
 include/linux/i2c-of-prober.h                 |   7 +-
 include/linux/regulator/consumer.h            |  21 ++-
 include/linux/regulator/driver.h              |   2 +
 rust/helpers/regulator.c                      |   5 +-
 rust/kernel/regulator.rs                      |   2 +-
 12 files changed, 176 insertions(+), 51 deletions(-)

-- 
2.56.0.385.gac671c819a-goog


