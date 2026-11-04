Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222CF607074F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 20:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YwdrXRGe;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g7cp7vBX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3UVuJp9suHpU/bcUbGQtVZZLAsWzNqQmKiQooc6/R4w=; b=YwdrXRGemzrUJu8Y6xFlAWbg8l
	LwNfNhHtFJPLNSCOtZqLaCUb54kaAgQdiqCSHZ44Uk67Zpk+mIvgmy0i8T9oPLlyg8cW5BUDwzhzH
	PVhs3t7PeGZkJXpEXBE7V/Oo0Wy4O7YnW6NzrzGcibH6HuA9iE20FWOJA6pXu0Kp5WfK+z4ETz8dp
	vFHtcQ4gc6RbtqsU8jMgU6LFNg1jInNxEcZES0MVpvc3hw36TFnbseqOfQk0PgaPQTgyCTXU15bwK
	CQB0SK70vgqfB72nnL2iFV6QJfjkPXJzwO27USQV6T12povkIhDXIBP0tmvYrWyvzzrTu7YfX2JgY
	c44b8LBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgbe-00000006b6X-464m;
	Wed, 04 Nov 2026 19:25:10 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgbZ-00000006b0S-06cH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:25:07 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-55651e7de9bso611003b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 11:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820302; x=1794425102; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3UVuJp9suHpU/bcUbGQtVZZLAsWzNqQmKiQooc6/R4w=;
        b=g7cp7vBXmXxJk2l1OhEBIHsvmrLnkGLXaMv/PJZSjI6IVSWH0q+sV2R+NdmEyKeogh
         UEkZGvUOa0jvrjGAPXOqohwStGR6mBVKM9PA4nIVoS7maqvH/QSG4jHZPcnHbgN7BS0k
         VXi3wFqufAtgmpUhE/yNSZaiThYXAntKGz+ItAN00befsog2a+uAN7fhBuVfM6yai/fj
         Rm36/nDPoTGDoInFhkT8Upol6UQNH4pWZliyN7eYJiNgTuEvQ8bc74H9tDnMuBTyPmRz
         sjNAlGo9szTLuQffGqlD2dVS+9Ey8u70Xq0TOivoi4hXI8VegxT3R4MaMW5s1ROaWOJi
         UuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820302; x=1794425102;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3UVuJp9suHpU/bcUbGQtVZZLAsWzNqQmKiQooc6/R4w=;
        b=i2cCvFwBjEbbmPPVFboD+f+9VFYyuEuH4MTTUaru7EF61GHXdPReC9UvdYpcXfGR5a
         0M/IU/0RAN5fSxQOJ25eD35OW4KuNREt9IGOJFOgJ8CtPkylNYqGCgQJRoBlpsLQYobO
         AvvMpytDz4f2CqqeO9g5q4QDG/GaGPMHw8kWzaE8Ya8C0Ex5CtNeYY4mTuOg2T9BpsOM
         DvniO5syDBsFjUsy6PdwQskxQOqkSKxjXHIlTn/1gmiCsdwI2eGrrapWv3zmdaj39Zhv
         s8Ljy+yuzeaJvQPhGIdoQ3rPp88RjbFXvimG9iVYryOb8+7vjKJW41Od4QtHp6Gt5apx
         YhZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwPLSHbQKXqxN+W7IhS5lc51IaAprTeBqVxBKp33xd/sViJ2+aF95TNvDAu9QY7SBro30LjvOQZsYhcqCQCJem@lists.infradead.org
X-Gm-Message-State: APuU4Z9MCd8tM19UBwJDeW73i+LSvAYrHYFv9mffLID27UrJvqW9FSTd
	KmfoTqPsCK6B9hoYMMlXU4HcNSMCVaWXLI3c0S7LBXx9QFdrZLHFdNjn
X-Gm-Gg: AYBFou2Huy3MAXoRfcmAFG1qrc1GxPQ2stopqevEjbFQ8CErqsnfI2Uew9Bxpnq2n1K
	aSf8tPFaBlOKrHi8w/NUgnW0Z83DSHRUpfrsR4UXDjLplkKK71D/7T6Bjn7eVKYCIeuNfGVsSRs
	yNWNAVxmPr0V0N0qdmPOerDbjsobzz6mAayLZADESaWJRwBRvUNCThmu5OIyW4wH+6UjbWldvgf
	rmWmNJkZ1Xd9qiI7CET5bHEcRSUQWr7UQjHoKstg/zaIV7bcwWnM3NvQrMv5m6P3OyDlUdD+2gt
	PHVZFwbMsvs9u2+30BQrDr458jBBi1VwpWcA1JB2jYhe6P+x0B+YVfNGSdctESYLDm7e4D99Zix
	CG4nI4MOyybdUbEEQubO25lRqvbM/KM4/VfYgr7qEvylwgZdF6yZUvaC6+p1I0+twiE054e/NO/
	2Wa/dsfwIiZeiYrhTLkNQOMo29G7ISA3ppQHKh6WrrgujWRk/yuHt59+KdOA75hxLa2PwG31ZIo
	WmO1rO3UGwkQbKLZfhENrOS31F3DhXHukasHKiDqc5wc0pDa4q+dYpskxsaQaKlHUXVfGvW9TDz
	qc7o7zmtcq5QJACpszJIPt0VWJWfSj/xUuRk08cOSfW8Pf5+EO57X0MVkpZ0cdwunbZ1TeTMCmr
	/G6H+s+O2WGGqw8cS0ecw2LL0jDuZyGYilEmMVyQwhXqRF/1H68/YWtj+QgU9gP+XNYb1QbUM2c
	KKmCyPqybTSy0sxeSVtfuFDwiDHjUUMlHIMNZdP0lG/gk/6HSbU3eRkBtBjt4qNUjzAWkncCWsU
	g==
X-Received: by 2002:a05:6808:3088:b0:4f7:867a:bfa with SMTP id 5614622812f47-5640d953ccamr14448820b6e.5.1793820302514;
        Wed, 04 Nov 2026 11:25:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v12 0/5] Introduce Allwinner H616 PWM controller
Date: Wed, 04 Nov 2026 12:24:50 -0700
Message-Id: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XT3WqDMBQH8FcpXi9yPnLysau+x9iFsbHNWLVo2
 22Uvvtix2bbwXAQkER//3OIyakYYp/iUDwuTkUfj2lIXZsnSA+Lot5U7TqqtMoLBQEZcMBqY9C
 o3dtWHZ2KhJUnbcETF1ns+tik90vc0/PXfDiEl1jvx4jxi6bvtmq/6WM1pVpgFCKUEj058QpVn
 3LxflWuY9sdVsvQdfvX1JZ1tx1DNmnYd/3HpekjjsXGIEECQQBiX6IYZuG/k8YOj3TF0YIjAV0
 6IDIzMH9jA0gMnpmoRCbLzs/geuIMAh69+JKEga2ewWXiGg0yavTluJX5OYObO65z2cwNCNsZ3
 E78fz/wot2kHeibQ5UHqFVgWwVnSFdxud5W6XWyfrKe8Nb6bNmGWBsCbBq5twjXmG4xwli5rmM
 IEasqNL/0z2EziHd3Ib/MGnLXQbxYqflan8/nT0hEYglsAwAA
X-Change-ID: 20260803-h616-pwm-v8-e21a92470923
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_112505_100829_56BE3D1B 
X-CRM114-Status: GOOD (  21.91  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H616 controller has six PWM outputs, paired as 0/1, 2/3 and 4/5.
Each pair shares a source mux, gate and power-of-two divider. Each channel
adds a prescaler and waveform generator, with a bypass for clock output.
The bypass can supply the input clock for the co-packaged AC200/AC300 PHY.

The series separates PWM waveform support and exported bypass clocks into
distinct patches. Internal CCF pair clocks model
the shared hardware, while PWM request/free and clock prepare/unprepare
arbitrate ownership of each output. Active PWM outputs and prepared bypass
clocks protect their shared rate against incompatible sibling requests.

Firmware-active outputs are preserved until a consumer changes them.
Hardware-enable checks protect their shared gate and rate even before
Linux has an owner for them; there is no driver-local unused-output sweep.
A conflicting shared-rate request is rejected while an inherited output
remains enabled. In particular, assigned-clock-rates cannot override an
incompatible firmware-active output. Firmware must leave a compatible
configuration or disable the conflicting outputs for that request to work.

The clock-provider interface reports the actual pair rate and makes rate
protection visible to CCF. In contrast, drivers/clk/clk-pwm.c advertises a
fixed frequency without checking the rounded PWM result: a 42 ns, 21 ns
request selects 24 MHz bypass when available, but can become 25 MHz when
a sibling holds the pair at 100 MHz. The direct provider still permits
CCF rounding; it does not guarantee that every requested rate is available.

The bounded TLA+ models and accompanying implementation checks are
available with their assumptions and limitations at:
https://github.com/jameshilliard/linux-h616-pwm-tla

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Assisted-by: Codex:gpt-5
---
Changes v11 -> v12:
  - rebase onto pwm/for-next at e0e4cc8505f2
  - keep the PWM rate-protection flag set until CCF releases the hold,
    so sibling rounding cannot assume that the rate is already available
  - clear dormant dead-zone configuration when enabled outputs use bypass,
    which does not use the dead-zone generator
  - leave PER and bypass disabled and release the rate hold if restoring
    the previous rate fails
  - check enumerated rates through the PWM consumer's clk_round_rate()
    handle, respecting external rate holds even before clock preparation
  - retry rounding and readback when rate notifications invalidate their
    snapshots; avoid temporary readback holds that clamp concurrent
    bypass-clock rate requests
  - Link to v11:
    https://patch.msgid.link/20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com

Changes v10 -> v11:
  - rebase onto pwm/for-next at 9ad5602d4943
  - compare candidate waveforms before nanosecond rounding, retaining
    period-first ordering across pair rates and bypass half-cycles
  - protect the pair rate across waveform readback so an exported-clock
    consumer cannot mix a new register configuration with a stale rate
  - use the provider-owned handle for the temporary hold, separately from
    the PWM handles used to change the rate
  - Link to v10:
    https://patch.msgid.link/20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com

Changes v9 -> v10:
  - validate the single clock-specifier argument before reading its channel
    index (reported by Sashiko)
  - Link to v9:
    https://patch.msgid.link/20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com

Changes v8 -> v9:
  - split PWM waveform support and exported bypass-clock support into
    separate patches, retaining internal CCF pair clocks in the PWM patch
  - preserve unclaimed firmware outputs instead of stopping them at
    sync_state(); replace the empty disable_unused callback with
    CLK_IGNORE_UNUSED
  - embed the fixed six-channel topology in the pwm_chip allocation, remove
    single-variant match data, and use a channel-indexed clock lookup
  - store bypass clock state directly in each channel and recover the channel
    from its clk_hw without a separate wrapper
  - avoid module self-pinning by acquiring internal clock consumer handles
    only while a PWM is requested; use provider-owned handles for notifiers
    and rate readback
  - use scoped locking and protect rate_exclusive with the register lock,
    keeping CCF operations outside it; remove ownership WARN_ON_ONCE calls
  - explain unsupported pulse/dead-zone reads and rename the waveform
    conversion helper to match its callback
  - pre-encode waveform registers, isolate update preparation and rollback,
    combine candidate comparison/selection, and remove redundant rounding
    corrections and private waveform-field checks
  - normalize polarity readback, use ordinary boolean waveform flags, and
    remove the redundant bypass recalc_rate callback
  - clarify the clk-pwm rounding limitation and correct the v7 topology
    description
  - Link to v8:
    https://patch.msgid.link/20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com

Changes v7 -> v8:
  - require both the module and bus input clocks for H616
  - clear the complete two-bit clock-source selector field
  - leave rate and period registers untouched when disabling a channel
  - distinguish PWM-owned bypass signals from clock-owned bypass outputs
  - round shortest-period requests using the fastest achievable clock
  - encode constant levels without overflowing the 16-bit active-cycle field
  - require #clock-cells for the H616 clock provider  (reported by Sashiko)
  - allocate clock topology state per device, use the fixed two-parent map,
    and use managed clock registration
    (reported by Sashiko and suggested by Philipp)
  - deassert reset before registering clocks and keep the reset handle local
    (reported by Sashiko and suggested by Philipp)
  - arbitrate channel ownership in clock prepare/unprepare and select bypass
    only while the clock output is enabled  (reported by Sashiko)
  - roll back failed PWM requests and serialize channel release
    (reported by Sashiko)
  - protect the shared pair source while either sibling channel is active
    (reported by Sashiko)
  - preserve the 65536-tick duty intermediate before polarity conversion
    (reported by Sashiko)
  - keep the hardware-waveform state within the PWM core storage limit
  - clarify that either co-packaged AC200 or AC300 PHY uses the bypass clock
  - drop driver Tested-by tags after the clock implementation was reworked
  - quantize inverted waveforms in hardware ticks and report their
    physical offset
  - force released channels off so stale waveforms cannot restart with a
    sibling
  - track the active and pending cycle for the period-update handshake,
    adapt the sleep interval to bound MMIO polling on long periods, and
    honor the PCLK rate constraint
  - quiesce rate, polarity and bypass transitions before reprogramming the
    output
  - clear unsupported pulse mode when programming periodic waveforms
  - describe the bypass clock cells and simplify the fixed parent topology
  - avoid resetting active pair registers during probe
  - model only shared pair clocks in CCF and program per-channel dividers
    directly
  - make pair-rate changes transactional and hold exclusivity only while
    an output is active
  - implement formal waveform rounding across all parent, divider and
    bypass choices
  - preserve firmware-active outputs through generic unused-clock cleanup,
    stop any still-unclaimed channels at sync_state(), reconcile empty pair
    gates through CCF, and reject pair retuning while either output is
    active
  - clear dormant dead-zone state when both pair outputs are disabled,
    while rejecting active dead-zone and pulse modes which the PWM API
    cannot represent
  - correct the hardware topology to show the pair gate before div_m
  - Link to v7:
    https://patch.msgid.link/20260703152215.192859-1-richard.genoud@bootlin.com

Changes v6 -> v7:
  - Cc Common Clock Framework maintainers  (suggested by Uwe)
  - add missing static before SUN8I_PWM_X_BYPASS_GATE
  - reorder code in probe to fix potential lifecycle issues
  - set pwmcc_data[i].parent_names to NULL in sun8i_pwm_unregister_clk

Changes v5 -> v6:
  - remove trailing junk after the patch 4 commit message
  - remove Tested-by tags where they do not apply

Changes v4 -> v5:
  - fix bypass handling for channels greater than 1
  - add colons to clarify two debug messages
  - switch from H616 to sun8i prefixes in code, filenames and module names
  - fix consistency issues in macro parameters
  - rename confusing macros

Changes v3 -> v4:
  - gather Acked-by and Tested-by tags
  - fix a pointer-to-integer cast size warning on ARC
  - add a managed action for clk_hw_unregister_composite
    (suggested by Philipp)
  - remove the unused pwm_remove function  (suggested by Philipp)

Changes v2 -> v3:
  - use U32_MAX instead of defining UINT32_MAX
  - document U32_MAX usage in clk_round_rate()
  - define clk_table_div_m using macros
  - fix formatting
  - correct the parent clock order
  - simplify code using scoped_guard()
  - add a missing const qualifier and rename to_h616_pwm_chip() to
    h616_pwm_from_chip()
  - add missing error messages and remove redundant ones
  - rename cnt to period_ticks and duty_cnt to duty_ticks
  - fix PWM_PERIOD_MAX
  - add the remove callback
  - replace DIV_ROUND_CLOSEST_ULL with DIV_ROUND_UP_ULL
  - add H616 prefixes
  - protect _reg in macros
  - switch from apply/get_state to waveforms
  - shrink struct h616_pwm_channel

Changes v1 -> v2:
  - add missing headers
  - remove MODULE_ALIAS  (suggested by Krzysztof)
  - use the sun4i-pwm binding instead of adding a new one
    (suggested by Krzysztof)
  - retrieve parent clocks from the device tree
  - change num_parents to unsigned int

To: Uwe Kleine-König <ukleinek@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>
To: Richard Genoud <richard.genoud@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pwm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Richard Genoud (5):
      dt-bindings: pwm: allwinner: add h616 pwm compatible
      pwm: sun8i: Add H616 PWM support
      pwm: sun8i: export the bypass outputs as clocks
      arm64: dts: allwinner: h616: add PWM controller
      MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM driver

 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      |   33 +-
 MAINTAINERS                                        |    5 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |   47 +
 drivers/pwm/Kconfig                                |   12 +
 drivers/pwm/Makefile                               |    1 +
 drivers/pwm/pwm-sun8i.c                            | 1365 ++++++++++++++++++++
 6 files changed, 1462 insertions(+), 1 deletion(-)
---
base-commit: e0e4cc8505f2f0f15758457b798f9f391c2bae0d
change-id: 20260803-h616-pwm-v8-e21a92470923

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


