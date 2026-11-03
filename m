Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59EF606A94B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nMxhOFkV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOrz5Utg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gKEeZqtZAu8+s0Ua1x2I8P/JLZraxDn6ha7UOnJcDMc=; b=nMxhOFkV+PgTu+SSti3Royer1T
	PrzluPXB40UC1ARKAjMKt+OMxo/kVF7KGxfAuRngOzAPSTHMBZGBOa60ivP/8hO7hGD+riIEXwe4b
	3EPWRdPLn00ftMuD3LWlpDhC/8bQGY7gkwIt9DPmxuU6KGyiH2d0CfRWkZK2sy1Phx3N0JqCx0iEE
	cPTCMTZMSWXgaQ2+1fianDtuWwfM1Cl23FcuftXjsaZ/z+2KZQhRkFb+3La/72D4gQXHCgZuYHfbk
	/RdVTkEWiR17OtJPVhNJZGGkJcGL8OZDxP2Ve69RSgFR+5a7gEBeX0B5t630URx8foVO4elor58ad
	J7Do0tLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA4S-00000001bIz-3Wu9;
	Tue, 03 Nov 2026 08:40:44 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA4J-00000001bGP-0uFt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:40:41 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6aa9606ddadso3010062eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695234; x=1794300034; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gKEeZqtZAu8+s0Ua1x2I8P/JLZraxDn6ha7UOnJcDMc=;
        b=OOrz5UtgEWznaZxxtPxqIii0V9mCirCpnQ1qGOAiMFaMh/+rV7rwS84FeaVLOKs5Gc
         09vj77tMdC8AMi8+ZKUirHFwU0KXgkDdWBmCKik0KVcEKKv1dlyDWOyR7lRkqUc7kfGW
         aBtCt2FUw7zYJ3Sm9hpWGckHTmU4IL6PTg2WRVxWPNBCxv0yMbr4MiJj+hyy3HqVPq4S
         VEgN5jkysTFL6Kme9fWjNqr2duNN+tEbiV2q+6AQx6l+VQm2ZBO7VP/n+Nqn80xRsW3c
         V8kfVtROJ3oGUDh1r56EyEyrg0f33RrfNpGOKI6Q1gHjxya+vkRq18tztNKiNgBSg0hT
         hvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695234; x=1794300034;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gKEeZqtZAu8+s0Ua1x2I8P/JLZraxDn6ha7UOnJcDMc=;
        b=o/IYW9ei6GVixteauf9oY5V0QoPBPyD88MYHguveoigwTGzc609KudnJnt0/iQePWs
         AYD0DUqLszNYT16GvTbv/zNOnT8lB2rFm0G/jUrh/7NuIRgWkFBcme625ozlk7KOMqwF
         zRUF4NyUAdgeERbUbpoDV6MBJ5d1gJzQuaO84c51Uk7NacUt0Pu6BOa8dVZTiY6OEE+n
         y+qAA5auJUXwWtGq8N3iNprqV0qfvj8cF31jahW/pGwafX5qRB/jbSYIZlPD/sPMW7dG
         gAzf675DFu919th/OcnYXNtonTNcKTwZRDdbfBqDzcxTPanLPG4S0puFOHImnexKVcVE
         iPEw==
X-Forwarded-Encrypted: i=1; AKwUvByonRW4BONIcXZrmfE4wWtUQs+PKilDRnR77eTa8Z+4X/CrQv6KV4xclZkYVSckfrBE4oLMi99ktBd/n0Gcxo3w@lists.infradead.org
X-Gm-Message-State: APuU4Z8utrgG+/VUy138tqUwktrSyVTf2bLfPbB/pdKODszUt4UKTfzR
	1k1NcFctXf6mi3uhnWGc3mVVxJXL2M+a4E7hVMSboSRnLAnpgKZff4u4
X-Gm-Gg: AYBFou2uKsOvcvwgf33SNhSRfVRBrLtCmnV3Fjr+0OMmF38Pp89otuxjzkZlSgfUkNO
	pf1SDEjdvEGFxRUw5Yy0uF5U/z5d7Whi/RU5r08xr/8geUbmkjSbv7aCPuG/rYSVrcXVFa8N5v4
	tVTBD0tPOSjgTvGHLBZmmbT49rpUSa8FmrRFRkaHpyBmwWxmpcWBvRRZMQtKN3w6Pu7nvCjmQxl
	UNaSbQR/Yv3MOnEHlWqUH29Juz3xfDeQCgVC4RQOwIViNXV+L3TxqR4KHTWo0Fsdo1UazKbv05E
	qCC3rxh6u6iW6GIqI+ORofjCP1G4ps4wRR8QdhAqBMY8PvHgouUaMeq10yvGdZ/bIJ2vR/RxFfp
	Iu/n+lvdALqgTNCXOA4PLHfgG5Cx4eII/cFYhG1UurCLo3QsL6eMQq195EH47NJo7MLD8rQjPqa
	Qw0G1wtYb6PdfpuPMGMZ0V5zntnsdKWCF9emBtN7qQzcJRYO+TgMdrO/s/F4sgBWo36Hn5/MVdX
	ACWOv2leOOkNwB0SGK/YOZ25Ry10jsq/R5Qa0Vq9ox8t7wM5LX2FQXE1feZjmPvo+NatOOKBpUW
	WI/u0mwfh+pKDtAvnGdwEjCtdFhi7yIp/F03Y3aRcKtTpxyAnuTDZZVBoSiS4pd6vsF2Q4uVo/E
	wJRv4scSE709mB0zz+JkkWFnr64GHzxK0bQmn/D8fclehVmRcyTu0c28der6h+g/mkYos1q3o6K
	HiSFVwmC8/wgcAIcgY6MPG/ERuWVCGjyqcde/EjAAwdAt/oz8vV4c=
X-Received: by 2002:a05:6820:4888:b0:70a:598b:12a9 with SMTP id 006d021491bc7-714f2a077b4mr6082560eaf.53.1793695233866;
        Tue, 03 Nov 2026 00:40:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f3081097sm10520397eaf.13.2026.11.03.00.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:40:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v11 0/5] Introduce Allwinner H616 PWM controller
Date: Tue, 03 Nov 2026 01:40:25 -0700
Message-Id: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XSyWrDMBAG4FcJPldmFq095T1KD17kWKW2g+y4L
 SHvXjmlOMmhuCAQEvr+GSSds9HH4MfseXfOop/DGIY+LRCfdlnVFv3Bi1CnjYyANFhg0WrU4vj
 RidkKT1g4kgYccZbEMfomfF7jXl5/1uOpfPPVtEQsJ5o4dGJqoy/WVAOMighVjo6scgJFDKl4r
 POD74dTvS+HYXoPfV4N3RLShnEa4te16RmXYkuQQgKFAMQuR6WZFf+dtHQ40w1HA5YUyNwCkd6
 A+RdrQGJwzEQ5Mhm2bgOXK2dQ4NApl5NiYCM3cLVyiRoZJbp8uco0b+D6gctUNnENis0Gblb+v
 we8artqC/LuU6UBoi7ZFKXVJAu/P3RFeF+tW60jvLcuWTalrzQBNo16tAi3mO4xwlK5qnxZeiy
 KsrnVl8vlG6RM7EguAwAA
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
X-CRM114-CacheID: sfid-20261103_004037_537714_8D5CBDCF 
X-CRM114-Status: GOOD (  25.61  )
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
 drivers/pwm/pwm-sun8i.c                            | 1317 ++++++++++++++++++++
 6 files changed, 1414 insertions(+), 1 deletion(-)
---
base-commit: 9ad5602d4943635ea2b3b73d1a720161f88da1a1
change-id: 20260803-h616-pwm-v8-e21a92470923

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


