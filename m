Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE97C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iDHJIqp5FLLywri4WBqUbQEMXacNkK0ILuDy9FjFATE=; b=zEnWr1TnbOQgz3Ml5W4AHowdiK
	r9Iunph7cIHC3wlP6bZfBH/u7GDWROJhYOy/K8XB+rwlPv24bd3PR7gVf16ZO5fn4ZRDJW9vS1MXb
	UQZD2XK5lgl6zWL/rLuH5fADhVVbZS4KD6kNOS0wlvhsDRSYGygW8imqKvUe4CIomXuDcKBa/cNAk
	Zw455agZr+ELnt5YG7LUXa+i+msntKT0whD04vxVwvJx3fg/xB2KiBmJBGGWHe0gX4Z3F7LysCb+g
	uFNIeBLa+VeI5wlUY33OZmXRvw0OsS6YFqtarHroGmp/I2ubHKUfERYzhOtEbZTmuPjLf3pEJtErr
	RIBJo8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlT9-0000000E00L-1caq;
	Tue, 11 Aug 2026 12:20:35 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlT6-0000000DzzX-3Mt6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:20:34 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so732338b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450831; x=1787055631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDHJIqp5FLLywri4WBqUbQEMXacNkK0ILuDy9FjFATE=;
        b=ItDfdUo4KQhqE/sIQ2S5Qd4KMahVHfLw6hej6gv+7m4b92zmAiCb6dUJfTOM9PrpOS
         CkA9ISpozm+/3AH008xr6QIqS8BodtS6WUlKGgS5V9e85OHRdQ1jLqhcFN9crYiIdvul
         TLmIKeQrDnHdSNlcfJ6GBepBosMngXNIvZp24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450831; x=1787055631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDHJIqp5FLLywri4WBqUbQEMXacNkK0ILuDy9FjFATE=;
        b=In/QNE0C9kYv6OGCLloY4LFdZIakw6T4sn5kgzcY3ufhwSAGftndiaX9JsRpbJfbcQ
         xVQbJXetrxD5eHu/DVsD6ZByC98ta6cEpTUr2wjVt5P/uQnADB3fCGOYwvHG04JDoFBu
         7RLMHNzxKQHs4+gKV03JJ6hZ0VZGMsUuT3/zuc5FP9GL9jIbY/XhNKbMAa+hS+NzaMbx
         bidVsq6TgfYnLtyk09cop6BqjHCptzUO3jc2Gs/XtFpNaLzQNBzlbdAZCbjn3r3jlaYR
         MHmWr0H266nso7i87Y2cRh/q/41HAMw1Jz4XNhQHXtCiD8gAE8ZesOwhAc91RHHBsT68
         k0VA==
X-Forwarded-Encrypted: i=1; AHgh+RqS954Py/uMf3CLM1kubCdN1rTHWVxvhZzSViuZ/Vehh/IFiCuQUpgXf74cgG9fJnhnUY3ZbSXMySzuOzlITt9/@lists.infradead.org
X-Gm-Message-State: AOJu0YxmWLeIpJpESxZFSr5GymHh0JfWRKO11gBJ/qxB3aiJ5XcVIqHx
	EKvDPmHdWEgm1v4rUKKOqSKAZHava6k5+HQq2Ps8X3Z/8x6VSmEkO/ljz2SRvyIm2Q==
X-Gm-Gg: AR+sD10evmOX8emTFisM9GjrtME0HX2G9AV249R4OEesbdABVOg3BamiCBc3DgsS9TX
	BeVqw6H9woMfp6m8TD8BFZiSfG2Hfk66QuDnjr38iYGAhQPE7PKi0UoNRduRelavijusrXJjZ/r
	2QS+Vapaq0h5KufKVNIois4ToALsuLjTERiZl4kt2X7VdOHULfD452ROH8Wwtl9fYSYfQcSE69w
	5pwsX8udCDUHurTluuB6wD0KbrbSihspVhYO99O2cONQCeYkoSXDwlNmcqMHMQ/Hnc6cp00yWVc
	ocVVM+V4SIGC3aIoQwqyvz9NQEq9LdoPI0kJg4/V6RNbHRV62XtPHhnH61xn+0czpW4p224L3GJ
	CxfNhpXKeMLV560Kw/q3yidIv9/+BkDCk7Sbxy1SVDcKq7F/rbduOP1hWID0Pr5aMh04mMXzzG6
	jzaKYXD6eUAnBjfxipabDxwILLEuym9LfArDGc1NTxFkmGTJnonBQl1c0ILymOD5Z6HUdee10jF
	ev5lldA5ZAoFf/EthhfHRtXd6Lo/Dm/U4uB+U1pyM47kw==
X-Received: by 2002:a05:6a00:9286:b0:848:63c9:ee39 with SMTP id d2e1a72fcca58-84fa8842387mr2815346b3a.12.1786450831335;
        Tue, 11 Aug 2026 05:20:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue, 11 Aug 2026 20:20:00 +0800
Message-ID: <20260811122011.3539250-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052032_887351_DC7A10EE 
X-CRM114-Status: GOOD (  27.29  )
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

Hi everyone,

This is v4 of my Chromebook trackpad supply fixes and optimization
series.

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

Patch 2 cleans up header inclusion for elan_i2c driver.

Patch 3 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. This uses the new "enable and wait"
regulator enable function.

Patch 4 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 5 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 6 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 7 adds the correct delay for probing trackpads for Hana devices
to the ChromeOS OF component prober.

Patch 8 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description.

Patch 9 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 3, 4, and 5 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers. Or if it's not too late, Mark could take patch
1 for v7.3-rc1 and the rest can go in later.

The DT changes must go in after all the driver changes land, especially
patch 3 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/


Chen-Yu Tsai (9):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - sort include statements
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  platform/chrome: of_hw_prober: Add delay for hana trackpads
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  8 +--
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |  2 +
 drivers/hid/i2c-hid/i2c-hid-of.c              |  9 ++-
 drivers/i2c/i2c-core-of-prober.c              | 25 ++++++--
 drivers/input/mouse/elan_i2c_core.c           | 23 ++++---
 .../platform/chrome/chromeos_of_hw_prober.c   |  4 +-
 drivers/regulator/core.c                      | 64 ++++++++++++++-----
 include/linux/regulator/consumer.h            | 21 ++++--
 include/linux/regulator/driver.h              |  2 +
 10 files changed, 105 insertions(+), 54 deletions(-)

-- 
2.55.0.679.g6767b8d81c-goog


