Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3974EC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SSV8oGTACxJ77/sOcrKC+cMYGnFLM5ZJhrfSXvvMA2c=; b=EZl4iMCnmCTz+iwcUxkhasOYQC
	wHzi66k0vBPJEifc1RRPJyccPEjtX7+vu2QpJqzyTj3oQiGg7jXuCkfyppClcNgyBHjEJ3zp6zpQ+
	sme48s6GTW7rY1PuLs67mzttLqCCM7Lhbgqe1J9ezCuRCgKK605dOIzAfoNUx9m+YGSLD31jM4iPF
	qKqNfA64VP5EAg9aViCs8pp6UYQTxxOJUIoqXK9wEismeXvSgw96z8Dm+vPmRAi45hS0z4C67o6Cl
	/DMcFg3DupmoM8nDdnftxrWBk2r/+tKH27jkX9JiGnbNVNe98Ihh89vA7WlIGVy9DvBdLJkiBvv1b
	nmkaBT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYUA-00000003kLV-2vyv;
	Tue, 29 Sep 2026 14:07:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYU9-00000003kKB-31Uj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 14:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SSV8oGTACxJ77/sOcrKC+cMYGnFLM5ZJhrfSXvvMA2c=; b=EVi11gURxmzvlWU2HALdFPLIFR
	tlUmT1Ju5rqDoqivO9B62WJs0I6KvqxVJjgPxVl7sQT75PoxGiYR6SW5Ie9raAW0HePFKCKlIOt92
	7Bldm87G90R9OyMSSRJSxcBeMfyIrzw7iwVs3RaGn3aQ+hWEa/uAz2y0hehWuxWuTmAt8J74a7OvY
	L2pFhHOsB9iYw0444PHeEvSlxK/QYuL2kCWKpkNR6PPRqeNtLI/hF7s7dPg+yqRHIobhLpJEmuHuE
	TVyP4w6etLYlShChYJeuDKX91mZlljCynwlKk09veT1CuloIPsXXL93/tX2YYYaYEx8zpTkzKx9NO
	F/Ti4u6A==;
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBYU6-00000002iYT-17QS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:07:08 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so2452853b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690823; x=1791295623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSV8oGTACxJ77/sOcrKC+cMYGnFLM5ZJhrfSXvvMA2c=;
        b=KMZLxfS++VFZ8h8xVSaIUMRnWTvEkkasrWJfLODdwy5Z/3bvQodSYpLzuR9B5b5VJS
         Qlec7XI4U8pGqCu3LNaznh+P2G+4xVMPOSwDwjAmVyeU8enopUvKU+3hu43zog2GBXjD
         x30vXXxw5ZKgdKhR2fPugO1fdCimHqQB5XXjGClF4DAjPNTRw6wN6T9OKKVEVncviCbm
         +rbUYc9eCP2VfRw1pKEl9VIOf+Kp5/Sthvvjs5gfGn8qMJCebMcOjFgItSfFUqyZhswJ
         lEueZjp1i31rK8qAI5+lgj+XUolvobAl6aJggFcw2/nV8pn9Hn9kHx7oumA3opnnY3Bt
         sIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690823; x=1791295623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSV8oGTACxJ77/sOcrKC+cMYGnFLM5ZJhrfSXvvMA2c=;
        b=Qj1SUUWTnX3fKt55PJ6RPVcbX33SQMBwGGcsyykrAmL1uRG+mJTw/n4+DmnlfnMN1X
         HT7YL/xNerIdTBtR9JzYI0K83sFOOze+NcVP5BeDBXGrsxI4RIG+dWOm5CgYarBZ11Qp
         bTkDTUF5kvQEojNlhgoQsCuvZJSEsxsG7vQMWSpQ8Cy8MHNAyQI0FeHSvhfj/ksJTFzg
         8z2v/LdR70kTEkItEE0milp0AnSxvtZPT9XALH1LUefkIdo47u0eI01ofRkwn2hvzU95
         lS1MvHmVCnPMVet/0VScvmOYZ+eavgXOMfCnqsj2DlhVe7UZnAxpDQCqtQqSJDvL01NR
         /HQA==
X-Forwarded-Encrypted: i=1; AKwUvBzwio3ArbtAmmIUDn2cYujzSn/NGFKa8pgvOy4EjhjMzE+hF9hRRtd2XUmCsPt5D4SVK8qcMFvcAibZnqnDF1od@lists.infradead.org
X-Gm-Message-State: AFuF++mXEneQg0OqHg7pbHdkWdOlDRuMchHzh8vcPSpjnzqrEVY2Tzmq
	mL1MsbuwZe0MKSwoytb8k02EK0Pjg5IZjTOYjs2bePN//S+urDHgoTV3
X-Gm-Gg: AYBFou3E3e7ooljzKnDjz1YEXLNzQbxZJENjFyB36iM0a6vZs5RdZAdqIIbE+RbxdqZ
	wXpI0LN4/cFMSu0f4ktw5Ngk1rKcWIUQCzSUn+YPhsjSxtX92t5VE4U6TRaXjLhY7z2kcH3v5jP
	a0Co1Rg2kMRoZMwvbWVtLrTUiO4wR8jipSg/Ukc8jj42dN2eboup0joBW2kvWywC4Ox1Ob/YbF1
	uXvpJFc0uC3UD0M17xYSpLmxDcrAT3s0X/QSD/oahdXRWSeJERqFBv/jLtHBQWCEP15wc9y77BQ
	B04Fj12t/wdieqdxbHO+HtAsVs/ZwXACk+JakROTShV7IOKjtbP6T0LCOqAGxlcWHWr4REQRVVR
	9deXJZ66VUO5FGEpvqoX1CBhCcIGZfq9aoZM+nCn1VFadpaLY/0qeTDDMvhqndl2lth0iK2dSst
	f2wFyfLt9TBKqz398MRKD7rVUcEb2szCiQJsqhth3BPgVs8/DBOBdAmTR3llLMxrbcDK+GG4COT
	TiB4Hmzreyx
X-Received: by 2002:a05:6a21:9198:b0:3dd:a197:cf22 with SMTP id adf61e73a8af0-3de0e8f5e7emr15327959637.70.1790690823269;
        Tue, 29 Sep 2026 07:07:03 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b0f4ab05sm3526989a12.29.2026.09.29.07.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:07:02 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v3 0/3] Fix poweroff restarting the board on Firefly-RK3399
Date: Tue, 29 Sep 2026 22:06:45 +0800
Message-ID: <20260929140649.55-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_150706_572944_436DB905 
X-CRM114-Status: GOOD (  36.96  )
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

Still an RFC: the patched kernel has not been booted on hardware (see
Testing), and the placement and naming questions are still open.

v2: https://lore.kernel.org/all/20260919122930.1418-1-yaozhonguwl@gmail.com/
v1: https://lore.kernel.org/all/20260909092728.1859-1-yaozhonguwl@gmail.com/

Changes since v2
----------------

The main change is in 3/3, and it reverses what v2 did there.

* v2 described both GPIO1_D0 and GPIO1_B5 and dropped the backlight's
  enable-gpios, on the grounds that the backlight could otherwise keep
  GPIO1_B5 asserted. That reasoning was wrong. device_shutdown() runs
  before the power-off prepare handlers, and pwm-backlight's shutdown
  callback drives its enable GPIO low there when the backlight is on; when
  it is off, pwm-backlight has already driven the pin low. So with the
  backlight bound, GPIO1_B5 is low when the PMIC's handler runs. The v2
  failure case - GPIO1_B5 still high at that point - came from a test
  module holding the pin, which the real shutdown sequence does not do.

  v3 describes GPIO1_D0 only and leaves the backlight alone. It was tested
  with pwm-backlight bound and at full brightness, i.e. with the backlight
  driving GPIO1_B5 high while the system ran: 3 of 3 stayed off (see
  Testing).

  v2 also said pwm-backlight does not bind on this board. That was wrong
  too: my own workaround unbound it to take GPIO1_B5. Without that it binds
  normally.

Lee's review of 2/3:

* "What is i here? Can it have a better name?"
  Renamed to "line" and declared in the for statement.

* "Why wrap here? Some of the surrounding lines are clearly longer."
  The devm_gpiod_get_array_optional() call now starts on the assignment
  line; only the last argument is continued.

* "What if this doesn't return a value?" (power-hold-delay-ms)
  The property is optional and the binding documents a default of 0. rk808
  comes from devm_kzalloc(), so when the property is absent the delay stays
  0 and the shutdown request follows the release with no wait. A comment
  now says so at the call. I did not add an explicit assignment, as it
  would only repeat the zeroing. A malformed value is not reported either:
  the read fails and the delay likewise stays 0. If you would rather have
  probe fail in that case, I can do that.

* "Do we do this for all of the other structs? Why not add the include?"
  The forward declaration is gone; rk808.h includes
  <linux/gpio/consumer.h>.

Sashiko's [Low] on 1/3, not addressed in v2:

* It asked for power-hold-gpios to depend on system-power-controller. v2
  declined because the driver also accepts the deprecated
  rockchip,system-power-controller, and a plain dependency on one spelling
  would reject device trees using the other - including the binding's own
  example. v3 adds it as a dependentSchemas entry with an anyOf over both
  spellings. Checked with dtbs_check on rk3399-firefly in three variants:
  the current spelling and the deprecated one both pass, and with neither
  present the anyOf fails naming both properties.

Other:

* The binding description names both spellings, and no longer says that
  every line involved must be listed, which 3/3 no longer follows.
* The 1/3 commit message now says where the bound of two entries comes
  from (see Prior art below).
* Each patch now carries Assisted-by: LLM. v1 and v2 disclosed the
  assistance only in the cover letter.

The problem
-----------

On the Firefly-RK3399, "poweroff" drops the rails and immediately brings
them back up, so the board reboots instead of staying off. U-Boot reports
the result as a power-on reset.

Firefly's BSP drives two SoC pins low during shutdown, before writing the
RK808's shutdown bit: GPIO1_D0 and GPIO1_B5. Mainline does not describe
GPIO1_D0 at all, so nothing ever drives it.

What was established on the board is the sequence, not what happens inside
the PMIC. In the cases tested, the shutdown stuck when GPIO1_D0 went from
high to low during power-off prepare, with GPIO1_B5 low, and the shutdown
bit was written after a settle delay. It did not stick when GPIO1_D0 was
never driven, or when GPIO1_B5 was held high. With the backlight bound,
GPIO1_B5 is low at that point, as described above, so only GPIO1_D0 needs
to be described.

Prior art
---------

The vendor behaviour comes from Firefly's own change to the rk808 driver
in their BSP; it is not in Rockchip's develop-4.4 or develop-4.19 trees.
It reads two single GPIOs from the PMIC node, pmic,hold-gpio and
pmic,stby-gpio, drives both high at probe, and at power-off drives stby
low, then hold low, waits 200 ms and writes the shutdown bit. On this
board stby is GPIO1_D0 and hold is GPIO1_B5.

Its board files use one or both: both on the Firefly-RK3399 and
Firefly-RK3128 FirePrime, hold only on the ROC-RK3399-PC family, stby only
on a few others. That is where minItems 1 and maxItems 2 come from. None
of those boards other than this one uses the new property in mainline.

One of them is relevant to question 1 below. On the ROC-RK3399-PC, the
vendor describes GPIO2_A6 as pmic,hold-gpio, while mainline's
rk3399-roc-pc.dtsi describes the same pin as the enable GPIO of the vcc_sys
fixed regulator. I have not checked whether that board powers off
correctly on mainline.

The vendor device tree marks stby as GPIO_ACTIVE_LOW, but the vendor driver
uses the legacy integer GPIO API, which ignores the flag, and drives the
line high at runtime. That matches the physical level measured here, so
this series describes the line as active high.

Why not gpio-poweroff
---------------------

gpio-poweroff drives the line active, back to inactive, then active again,
waits timeout-ms and then WARN()s on the assumption that it is itself
performing the power off, and it registers at SYS_OFF_MODE_POWER_OFF. Here
the RK808 performs the power off from its own POWER_OFF_PREPARE handler,
and the line only has to be released and left released before that.

rk3188-bqedison2qc.dts does drive a pwr_hold pin from gpio-poweroff, which
works there because pulling that line low is by itself enough to cut the
power. That is not the case here - driving a line low at runtime, with no
PMIC access at all, left this board running for the 10 s it was observed.

Open questions
--------------

1. Does this belong in the PMIC driver at all, rather than a small separate
   driver registering at POWER_OFF_PREPARE with a higher priority? Or, as
   mainline already does for the ROC-RK3399-PC, should such a line be
   described as a regulator enable instead? On this board the line was
   tested going low from power-off prepare, 200 ms before the PMIC write;
   I do not know whether a regulator description would achieve that.
2. Should the property be rockchip,power-hold-gpios? And since the vendor
   has two named roles, hold and standby, would two named properties be
   preferred over an array whose order sets the release order? This board
   only needs one line, but other boards in that family use both.
3. Should the DT also carry a pinctrl group for the pin, as the vendor does?
4. The vendor calls GPIO1_B5 pmic-hold and its backlight node has no enable
   GPIO, so mainline's backlight enable-gpios on that pin may be wrong.
   This series no longer depends on the answer. On this board the pin was
   low when the shutdown bit was written in both configurations tested:
   with pwm-backlight not bound, leaving the pin an input (the v2 runs),
   and with it bound and the backlight on (v3). Without a schematic I have
   left it alone.

Testing
-------

The patched kernel has NOT been booted: CONFIG_MFD_RK8XX is built in on the
test system and a full kernel build does not fit on it.

Build and schema, on the board against a clean mainline tree (28924df2a):
the unpatched tree was built first as a control, then the series applied
and drivers/mfd/rk8xx-core.o built with W=1 with no warnings. drivers/mfd,
drivers/regulator and drivers/rtc were rebuilt for the new include in
rk808.h with no errors or warnings. dt_binding_check is clean, and
dtbs_check reports only the pre-existing usb2phy diagnostics for this
board, which the unpatched tree reports unchanged. The built DTB carries
power-hold-gpios for GPIO1_D0 only, and the backlight's enable-gpios is
still present. checkpatch is clean apart from an unknown-commit-id warning
for the Fixes: tag, caused by the shallow clone; the commit exists
upstream.

Functional, v3 configuration: the board's own device tree with the
properties of 3/3 added - power-hold-gpios for GPIO1_D0 only and a
200 ms delay, with the backlight's enable-gpios unchanged - and an
out-of-tree module using the same gpiod array consumer name, the same
GPIOD_OUT_HIGH, the same per-descriptor gpiod_set_value_cansleep() loop
and the same msleep() as this series, registered at POWER_OFF_PREPARE
with SYS_OFF_PRIO_HIGH + 1.
pwm-backlight was bound at full brightness. Before each run, a script
checked that the backlight owned GPIO1_B5 and drove it high, that the
module owned GPIO1_D0 and drove it high, and that the GPIO1 input register
read both lines high:

  GPIO1_D0 not driven (control):            restarted after 39 s
  GPIO1_D0 only, backlight owning B5:      3 of 3 stayed off

The serial console was not available for these runs. "Stayed off" was
judged by the board not coming back on the network within 5 minutes and
the fan being seen to stop; this caught the control run's restart.
As a result the level of GPIO1_B5 at the prepare handler was not recorded
directly - the module samples it, but only to the console.

The module does not exercise the probe path, so the claim ordering in 2/3
is covered only by review and the build.

Earlier runs from v2, judged on the serial console (nothing for 150 s, no
ICMP reply, no USB gadget), each from a cold boot with both pins at their
reset state (inputs, low), still apply. The fourth line is the case v2
mistook for the backlight's behaviour: there the test module held
GPIO1_B5 high.

  both lines, as in v2:                     3 of 3 stayed off
  GPIO1_D0 only, GPIO1_B5 left low:        3 of 3 stayed off
  GPIO1_B5 only, GPIO1_D0 left low:        0 of 2 stayed off
  GPIO1_D0 released, GPIO1_B5 held high:   0 of 2 stayed off
  nothing driven (mainline today):         restarts after about 2 s

The 200 ms is the value the vendor uses; the threshold was not
characterised. The msleep() was measured at 200 to 201 ms on the console
timestamps.

This series was prepared with the help of LLM-based assistants (Claude
Code, cross-reviewed with OpenAI Codex): the analysis, the code and the
text were drafted with them. The measurements were taken on my board, and
I have reviewed the result.


Yaozhong Li (3):
  dt-bindings: mfd: rk808: add board level power hold GPIOs
  mfd: rk8xx: Release the power hold GPIOs before powering off
  arm64: dts: rockchip: fix power-off on Firefly-RK3399

 .../bindings/mfd/rockchip,rk808.yaml          | 27 ++++++++++
 .../boot/dts/rockchip/rk3399-firefly.dts      |  2 +
 drivers/mfd/rk8xx-core.c                      | 49 ++++++++++++++++++-
 include/linux/mfd/rk808.h                     |  3 ++
 4 files changed, 79 insertions(+), 2 deletions(-)


base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3


