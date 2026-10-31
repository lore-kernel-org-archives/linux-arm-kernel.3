Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C3D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 02:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pZlZzpiT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rvN+Tk8F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WSDe6VAckHzkQ8XkTETzpDW5Bx6aUAkrRS4D3VagePM=; b=pZlZzpiTLNXrvtsyNERRxFuulU
	hN0qth6AVny/WRUgEmH+65LgbvOGsO4sclRY6d3cbzIZ3ezUYCvJXxh0tDF+NDCrWQrFJpJbugFUD
	pJNNF0KFUgEjYzas+Wyec0qCELtxfLqce0rCqGrvbELG+KOojQNxWiWx9D098Pkwi3Glv0bSIxwXa
	o4ztk6Go/fnAHZxa7h1mOYbSl3UGW1ox0hZahCLfKN0noZKJBPeSSHvsgclU9oLecUEMpxabUYonj
	Mg9s40+BYpZAHGRBB+HyPvMwyvaa0JcUA8k+o0xIjoAZRHxVJlKNEnitn2pUaCVsHahLPRDpW53+c
	yLYg7ysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyo5-0000000Cs46-0f8E;
	Sat, 31 Oct 2026 02:26:57 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMyo1-0000000Cs2L-2BYo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 02:26:55 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-85a5455bd3cso801130a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 19:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413612; x=1794018412; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSDe6VAckHzkQ8XkTETzpDW5Bx6aUAkrRS4D3VagePM=;
        b=rvN+Tk8F9rlicK2kjviMsN4VadXe1uPlv5+nGPladbeq2goFZGLifTqxS4v7ZrYrUA
         sHrwGjwfJYmhmcWLTpQBrL4xrPUBsBGdrwC4QcQ06d2/J+pxbsA59dCilxdCRcAT60iW
         oUT8IB90E4P+/5Ssj/RjtMfMhv8dPfsqgfg25YNmfE9j0YWTJQGYwFaJm/bwZOWMgooT
         wVel8iF6hbg1KM/94Al6k2exZAUKhR5HsSOoEtWBM5K48514AsMhpiFwCDbvGmgCCstO
         xokHCiS3G/Cb9hUjx6Y2NsifRYU0aCrYFzdBiUCU1yczG3RZ3qr3oOSqnnYTq0TeXr+d
         e3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413612; x=1794018412;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WSDe6VAckHzkQ8XkTETzpDW5Bx6aUAkrRS4D3VagePM=;
        b=xjFfEpZf5x3s4pXm0uEmZMBtEcLuOzWl/Qqhs9dQnbQ9GlIMRAOWcJiGBMzk0zVxpT
         NHYWYYjRodriupwdpSyu+201sqJHARlVmdKOY5i2kUZEMG41g7hOVldxRnh8OidtXijE
         RhGMzAyKJTol819H7UFzeKf3dsnZcnyxWsW4tbVfGLH9AuhVu4O1UnDXCaiLmylvlrkD
         vJTMwnkc10/cFpTublIGveC3UHDsPDpMZ32/IH6VrDjnGQPtweVycIqqFdwWWfT2tcRv
         B6K978iSHGRaYt8hXQlNC6JSys1Qf7k1AuUx4BhlfDIJnCe8KogfZPJmvnwD8vu2Yq8x
         rNoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKZSppo72EoHhUgWDiFGw9CeUW3WC9LDqWe1Reqg3aM8NKrkPwsXK+YXWwaO1Lhf4kTizNvvA0MSUK2sWz7vFz@lists.infradead.org
X-Gm-Message-State: AFq9FYIuHjP0fKl5Zsexbof7LUa8mzM5bNnKx4wNc6JuVm49CHmeKM/a
	JMPgPiM0SJPGxrJuU/l3vN3QYvjLShk7S6CnFhKjOgkhU19TWzeeRfYl
X-Gm-Gg: AYBFou1+kD0DvRvCrxcj7NFRNzKENdxF5c7+7N6YvEv0YPb1MxTOmwt6arISl8KKsc3
	Y+ySs8g7lFo1IlOM5GUr5G3Mc9aaMQzeuu9wLqVc/eCEukuW56xI3G2Yxpr8R7Q5AxaOSH7DI0u
	C1HD0WSZODgJHRHf9HSlYYOzMfa2jf0V2F3cLZmKCMi555jERWiimzHbCjVqQ06hX5hIk5jQUk6
	FgoHQk9rQtoQ02JiD/dERib5AXfgxUXCjVAgV3rUoXTrjgsCoVZn/CcZDiT0ipxCEfyiwpP5twL
	ITZW3u9c20R+2oICk4reJYLiG0C9Xbfc83H5XJ6OVGzw7QmvVAgTalr2xXp4WyTPdzRYjFD0onq
	0BjR0gYT8qwMpCHtfIpFtfTyyRtZU4owh5n38s81Gy84NKYQXxVVFGy1gllm2xO9o276fPNdhWr
	tSSbKlUflWTH9+UglQvt46PQT4fKFtVYEPKlDQ/19mW0gJzjFQMG05qRdap8AeJZxSJnr7BQkDG
	/jRfxWp/bkhmOUWo6NfIbAauLsTZMamR9RUX7QWF2S76v02Frp8BW6o17JAwKsTz45ANoB4w76r
	eYgKiKwNEd40rpNCKeZu7OhK/7sCON/GMde7lKmihWsBQ7/z1uAYLjPVdEVSbHfJQZQjdDayT7d
	+0o1grLpLhmf17buEMOYH8ZoKyfE=
X-Received: by 2002:a05:6830:4413:b0:81f:22fd:6ed5 with SMTP id 46e09a7af769-85d364de390mr3092732a34.21.1793413612419;
        Fri, 30 Oct 2026 19:26:52 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b89asm3810712a34.6.2026.10.30.19.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:51 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Fri, 30 Oct 2026 22:26:50 -0400
Message-ID: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_192653_591734_47F3770A 
X-CRM114-Status: GOOD (  12.25  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This v2 adds the initial Allwinner A733 SoC description and Radxa Cubie
A7S board support. It incorporates Andre's review of v1: RTC, all main
and R-domain UART/I2C instances, all four MMC controllers and their pin
groups, R-PIO/R-CCU, the GIC maintenance interrupt, ITS description and
the ARMv8.2 EL2 virtual timer interrupt.

The board enables UART0, AXP318W on R-I2C0, and the microSD slot at up to
50 MHz with four data bits and 3.3 V signaling. PMIC input/output, CPU
and pin-bank supplies follow the board schematic. PF6 card detect is
active-high with a pull-down. The firmware-selected PF supply path is
preserved; 1.8 V signaling and dynamic voltage switching are disabled.

The DT patches are separate from three supporting submissions:

* clk: sunxi-ng: a733: preserve system-controller firmware clocks
* pinctrl: sunxi: preserve A733 firmware voltage modes
* dt-bindings: mmc: describe the Allwinner A733 eMMC controller

The clock change keeps firmware-owned timer/mailbox resources available
through Linux's unused-clock cleanup. The pinctrl change follows
Vinicius Pedrosa's recommendation to preserve A733 firmware voltage
modes and give A733-R its own descriptor, without changing A523-R.
The MMC3 binding is distinct because SMHC3's DMA descriptors differ
from SMHC0-2. The node is disabled and has no driver match; the existing
A733/D1 fallback is used only for MMC0-2. ITS is also described disabled.

Base and dependencies
---------------------

The tested base is the official Torvalds commit
d89e1d186ec9271bf78e62771779e9fc03bf0fc3, plus these public inputs:

[1] Junhui Liu, clock helpers, v1 patches 1-4:
https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech
[2] Junhui Liu, A733 CCU/PRCM, v6 patches 1-8:
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech
[3] Jerome Brunet / Andre Przywara, AXP318W, v8 patches 1-5:
https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[4] Pablo Mazzini, pinctrl IRQ-bank numbering, v3 patches 1-3:
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[5] Vinicius Pedrosa, A733 UART, v2 patches 2-4:
https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com

This is the exact 23-patch test stack, not a claim that every patch in
each series is a direct A7S dependency. The A523-only changes in [1]
and [4] accompany those public series. UART patch 1 concerns the real
DLF path; patch 2 excludes the A733 noncontiguous readback from that
path. PMIC patch 5 and UART patch 2 needed context-only adaptations to
this base; their added/deleted implementation lines were unchanged.
The three separate supporting patches above complete the test stack.
The DT series should follow the clock and binding prerequisites through
their respective trees; the external series are not being resubmitted
here. Patch 1 records the exact base and prerequisite patch IDs.

Changes since v1
----------------

* Retain the acknowledged board-compatible binding.
* Drop the old MMC binding patch already present in the selected base.
* Add RTC and its clock connections; use the board's 26 MHz crystal and
  32768 Hz RTC input, and provide all four main-CCU clock inputs.
* Use arm,psci-0.2 without the redundant arm,psci-1.0 string; add the
  fifth architectural timer interrupt and GIC maintenance PPI 9.
* Add the ITS subwindow and retain dma-noncoherent on GIC/ITS, following
  Andre's A733 reference and the A523 integration precedent.
* Add remaining UARTs, MMC controllers, main/R I2C, R-PIO and R-CCU.
* Move UART0 pins into the DTSI; supply explicit MMC/UART pinmux values.
* Add the PMIC and real board power connections, CPU supplies and card
  detection; sort the DTB Makefile entry and use schema-valid node names.

Validation
----------

The full ARM64 dtbs target and W=2 CHECK_DTBS=y for the final A7S DTB
passed. The separate MMC3 binding example passed dt_binding_check.
The W=1 Image build reused the independent build tree and rebuilt the
affected objects; source reconstruction and patch application also pass.

On one Cubie A7S, two final-candidate RAM boots passed with vendor boot
firmware: eight CPUs, RTC counter advancement, AXP318W/R-I2C0, UART0
including 115200/57600/115200 baud changes, and warm reboot. Each boot
completed a read-only SD ladder of 4 + 16 + 128 MiB at the reported
50 MHz/four-bit/3.3 V mode. The first 4 MiB matched a fresh vendor-kernel
read; the later loops checked successful transfers. The second boot
tested after late unused-regulator shutdown. No clk_ignore_unused or
register-writing helper was used. The existing vendor handoff needed a
RAM-only BL31 reservation at 0x48000000/0x01000000.

Limits: card writes, physical hotplug, UHS, other UART/I2C instances,
MMC1-3 operation, RTC alarms and EL2/ITS/MSI delivery were not tested.
The BLDO2 software selector reports 3.3 V, while the schematic implies
a nominal 2.4 V input. Physical measurements are unavailable, so the
board DT preserves that setting without a voltage constraint or newly
enabled LVDS consumer. Assigning its actual voltage requires checking
the fitted RP220/RP298/RP299 values and measuring UP11 LDO2V5-INPUT and
BLDO2/VCC-LVDS0 to ground.

The six source diffs have no checkpatch errors/checks. The requested
Assisted-by: LLM trailer produces a nonstandard-signature/unrecognized
email diagnostic in raw mail checkpatch; it is retained explicitly.
AI assistance: Codex:gpt-6-astra.

v1:
https://lore.kernel.org/r/20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com
Andre's review:
https://lore.kernel.org/r/20260911001805.0a2e033d@ryzen.lan

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

Supporting submission Message-IDs:
  clock: <20261031020640-263f7b05-a7s-clock@gmail.com>
  pinctrl: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
  mmc-binding: <20261031020640-263f7b05-a7s-mmc-binding@gmail.com>

-- 
Enzo Adriano

