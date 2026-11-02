Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEB6608509A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZbSitgnj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fM6sFcQU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0KRhRBW/tJdqO8vlvv8X/WEzikIgPAarAzv+Pyz/Urw=; b=ZbSitgnjYOweZNQxFQZpHCc6D9
	7z20g9pFDAOlRZ2TXSd4uc7huG5lQJYwXtYD2cUTn39YyYJIN28lasZvebtjxj+SXZEFaF9+wifAd
	fgNTnFJDLDzxqCjIHeW2j79RGMRooQnuT7ZToECWzZnGA/bM3LvV5OjRYSrRG+NSXjHZ+/Xzanl4C
	OdxoUenQgVaAWlQQZswU1yPtmiEbP8wB7zu3F01yH2p6WqpybByV8lXOkWp5u1LCrM8qGu6c/XMhY
	5JpAc7Fsy7PTS4KUyOb98n8YLCwuZLHcRrgjzbbObC/XK1qDjtIPKtMqRXFPZwCmZLbeJadfeAa1E
	Iir7nJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7t-00000000EHK-1tO0;
	Mon, 02 Nov 2026 19:55:29 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNy7p-00000000EG1-44KN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:55:27 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-4a822463a22so2208002fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 11:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649325; x=1794254125; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0KRhRBW/tJdqO8vlvv8X/WEzikIgPAarAzv+Pyz/Urw=;
        b=fM6sFcQUFFzZ3f4RhNGnujmpW4PXvWi9MJCq66EV9EcSu1yeCt2HoTFORJtOENp05v
         1STZU1gtS8IIEYFyU8EaHLaAFcvJKnpAEpVpk7HanOI0qzvzUs++dQMvwxM2kXXvzyZX
         NKPEQwr0GRN88tCGb/ShmTcnPc+hsQos/EGRfsaH7QMNR8vCV5dHLmqQkpEskICI11bO
         vtn9ztCMrp70WymSnaIRKJKqqEK/n9UV7TH7/QkutFkLmkINJeu3dz0fLE0uUGh4H6B4
         sGyHVyAvLtYR4l8ZmdFAAgTqYxGuz8RvIXXa46PzzFEJbm8kW3RT8ERSA3YFlhpVteLI
         UmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649325; x=1794254125;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0KRhRBW/tJdqO8vlvv8X/WEzikIgPAarAzv+Pyz/Urw=;
        b=QtvpuBuKfbiOhvQF7q98AESU8aCXoX1xAwg80ZLsK8F8+F2wNgHjpUL5WT3a5RF0ZP
         PeK7n1MzcxhJdeyCkxrCHFmBrdiay+jfqlVwXUIgH1maBy8TtQ9Z02oJ/JYeEig2WADS
         JhM5dvUU1bsR/OVqbBKoWRK78P8jqhERryIVQITYY3MDrgze5SpaS+IggyS5pcTQtX6c
         f6p5QYYDQzQ8T6nPT9vllXLRlxSi1mOuoXV8NryZNg3ep/iFZpSa7rMYUZ4NhhutzXw/
         T0Lr1cvoXoB17qa1Xz39MmpZpE1MieUatp4WD/iqpLz2oiCEZVQdAkIVvRU6DPSUp8AX
         e+Kg==
X-Forwarded-Encrypted: i=1; AKwUvBy6xwHzr3bp+0TMCD1hCbw+13U6UWf1S+zPDORLcIYLm5BEhOjauFE4VrAwpaeojs5NIbvL8ApbJsOxS7HsWToU@lists.infradead.org
X-Gm-Message-State: APuU4Z97PJgqb7nPWqkrutStZJViualnDp9XvyWsNfdt4/CyX2+SlmRD
	Xo3b/GojMbEPUKAzJJfkWk8jnetYKjngrXOUoJmx82XmOrNtoye1mEPE
X-Gm-Gg: AYBFou3NbzzsWjPO9kuQBRz4duJvcoqJmOIVVg2wIkHh/zg9Dj+RaLTWGEaBpleIwoy
	UPVkHem8ZCT510tMTBsXRhYqKqoDCr4UEQ0BXUIZD6DZCc59OuzCUD/ZvWM7RADAY4YcEFzMnA2
	uySlwxWQSyh/sRVXZF+XCV8q++g+S+Hq4mHA0yzJC+7zFIMzmFQgNFz6oAkOYIadj5Fy/sQBNo6
	j98kNz/cyAv7yecGTf+gabZQCft4q/K4Y8rvjKJPbbw4M6k9UMrjg5cyAIQDKDLmPy1JQQ64bfj
	GPP+6C445ar64XnHqAfyWR02pvsr6jMzmn0MUpl5TQuaYo8bMWX07zXlPikVnBSxbvZ/kwam6f3
	pbKkSJtI1Ywt0GiwHmvg+3wlXfWrzOybS/q+7Z3Bzm7pYJ7qL7T/6RYYI8CrXIEj1t+ELkMIyYk
	AF+/uHUXWtEyIxDMTNqp6L0x+39fcKqdXFES5BrUdDb0pAx0n3aKug5tHnd3+48iKFR6QIs/n33
	9bJlr11vTwnz32Sr7KQj2G8V+Qx9jqbVHeb++YQ22wl1d5bV667kxFiYv32GC/smB6OG+7zWhll
	J/ZGBAj6FGo8XFVeRYI1bcsJSE3hspuYNzM25Wc3LlM6e17Vb0Jw51U8ltA/SAhMTSXbtoyMaO/
	iZyIwU94Gb1NwA7YXHcNPcHEDljwFlkqn1wj+/IoUq3I/c0fKdTuQNeBW03YW1vwvoV/Q4o1x1E
	/pGrrrD5en8RYvf9h61cLMuEPCFMZiFPZ2XkAyYS5n0MQDXzcdO6U=
X-Received: by 2002:a05:6870:1715:b0:48f:e137:d92f with SMTP id 586e51a60fabf-4a907847e58mr6622301fac.58.1793649324605;
        Mon, 02 Nov 2026 11:55:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v6 0/8] serial: 8250_dw: describe the Allwinner H616 and
 A523 UART configurations
Date: Mon, 02 Nov 2026 12:55:15 -0700
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43SX0/CMBAA8K9C9mxN/3cQY/wehodrd4UaxrQdE
 0P47t4A4yRKTPpyafu7Xu8OVcGcsFSL2aHKOKSSui0F9m5WhTVsV8hSQ3ElubSCS8nKzrepZ2s
 rLNtB7llMsWODYMFADE1EEzyv6Pprxpj2J/p5eY7p7guGfvTGE+tU+i5/nHIPYjz3lUb9nYYWZ
 6hBeUCJHuqnVQtpcx+6thrTDPK/kCQIIjdzZbi2ylxDagrpG5AiSNY2BuHroIK4hvQUcjcgTVC
 jHHJRx4aDvYbMFJrfgAxBRnmtFKD38ccfHc+9yPi2o2735wZVHgoy2ieQuu+1N1pFELUzTs4dB
 Gcs2IgWrY6GW+9qrWFsYoulwGlMFrOH6xrH4YINq6Whwt5Zk2jAunypVTAtnNDgDAoD3098/Iv
 Vv7F53+e0YpsUsU8tXkZEMKcEPbIxnKtmai+Px09sO8Gv9QIAAA==
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_115526_037306_F16974F5 
X-CRM114-Status: GOOD (  20.20  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allwinner UARTs use FIFO-relative receive thresholds and an optional
register layout that differs from the generic DesignWare integration.
Describe the H616 and A523 integrations through dedicated compatibles and
common sunxi setup helpers.

H616 has fixed 256-byte FIFOs without a readable FIFO-depth register. A523,
A527 and T527 have different depths across their UARTs and report each
port's depth in the FIFO Clock Control register. Use a fixed platform-data
depth when provided, otherwise read FCC in the sunxi setup callback.

Derive the transmit load and receive-trigger table from that depth. This
keeps one implementation of the common 1-byte, quarter-full, half-full and
depth-minus-two mapping for both fixed-depth and runtime-discovered ports.
Keep PORT_16550A, configure automatic flow control, preserve BUSY-safe
integer divisor programming and keep the UART clock gate enabled during
termios changes. The sunxi setup uses PIO.

The series first introduces platform setup callbacks and a shared RX
trigger conversion helper, then adds the binding, driver and SoC DTS
changes for each integration. Based on tty-next at 6b4b543fa187 with the
posted RX trigger callback-lifetime fix [0] and DW BUSY-safe divisor fix
v4 [1]. Platform setup runs before installing the BUSY-safe divisor setter.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
[1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v6:
- Export the shared RX trigger conversion in the SERIAL_8250 namespace
  and explain how driver callbacks avoid new legacy port types.
- Lead the H616 trigger description with the FIFO-relative mapping
  and include array_size.h explicitly.
- Name the trigger divisors and full-FIFO margin, reusing them for
  FCC depth validation. Explain that the upper bound follows the
  current byte-sized 8250 interface and can be widened with it.
- Describe the fixed-depth platform-data field independently of sunxi.
- Carry Ilpo's setup/helper review tags and Krzysztof's A523 binding ack.
- Link to v5: https://patch.msgid.link/20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com

Changes in v5:
- Reject FIFO depths that cannot produce positive, byte-sized RX trigger
  thresholds, report the invalid size and propagate setup errors to probe.
- Add the A523 UART compatible and use it for the shared CPUX UART nodes,
  including those inherited by the A527 and T527 boards.
- Read the FIFO depth from FCC when sunxi platform data has no fixed
  depth, preserving the fixed H616 configuration and FCC clock controls.
- Explain why the per-port trigger table is derived from the FIFO depth;
  use the same sunxi helper for the FCC-discovered A523-family ports.
- Move the shared RX trigger conversion helper into 8250_port.c and
  export it, following Ilpo's review; retain Andy's review tags.
- Use FIELD_PREP() and an intermediate trigger value when building the
  sunxi table, following Ilpo's review.
- Select the DMA setup helper directly for the 64-bit-only Octeon
  platform and match the single-line comment style, following Andy's review.
- Carry Krzysztof's Acked-by for the unchanged H616 binding addition.
- Link to v4: https://patch.msgid.link/20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com

Changes in v4:
- Introduce common Allwinner setup helpers with the fixed FIFO depth
  supplied by compatible-specific platform data.
- Rebase onto tty-next at 6b4b543fa187 and the posted DW divisor v4 fix,
  installing the BUSY-safe setter after platform setup.
- Use an early return for FIFO-less DMA setup, following Andy's review.
- Default to generic setup when platform data has no setup callback.
- Select Octeon's optional-register discovery with IS_ENABLED() in its
  setup helper, preserving the existing 32-bit and 64-bit behavior.
- Extract the shared 8250 bytes-to-FCR conversion, including the
  unsupported-table check, into a preparatory patch and use it for
  H616, following Andy's review.
- Set the fixed 256-byte FIFO depth in H616 platform data and omit
  fifo-size from its binding and DTS, following Krzysztof's review.
- Precompute the Allwinner RX thresholds during setup and retain the
  sunxi FIFO-depth helper for filling the table. Use named FCR encodings
  in the helper, following Jiri's review.
- Share threshold-table initialization and callback assignment through
  a sunxi RX trigger setup helper.
- Group and comment the H616 trigger and RS485 setup.
- Link to v3: https://patch.msgid.link/20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com

Changes in v3:
- Introduce a platform-data setup callback in a preparatory patch,
  replacing skip_autocfg and preserving the existing Octeon setup.
- Describe each H616 UART's FIFO capacity with the standard fifo-size DT
  property and use the value already read by uart_read_port_properties().
- Derive the Allwinner RX trigger thresholds from the FIFO depth.
- Use an unsigned trigger index and conditional runtime PM guard,
  preserving error propagation when the device cannot resume.
- Rebase onto tty-next, replacing the earlier DMA prerequisites with the
  posted RX trigger callback-lifetime fix.
- Separate DMA enablement into follow-up work, retaining PIO operation
  for the H616 FIFO configuration.
- Link to v2: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com

Changes in v2:
- Keep PORT_16550A and set the FIFO size, transmit load and capabilities
  during setup, following Andy's review.
- Select H616 setup through the matched platform-data pointer and remove
  the type and DMA burst-size platform-data members.
- Use get_rxtrig/set_rxtrig for the 1/64/128/254-byte receive thresholds,
  with port locking and runtime PM around register updates. Keep the
  standard half-full FCR default, selecting 128 bytes on H616.
- Advertise UART_CAP_AFE so CRTSCTS enables hardware automatic flow control.
- Rebase onto next-20261023 and declare the posted sun6i pause/lifetime
  fixes and their prerequisites for DMA enablement.
- Link to v1: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com

To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev

---
James Hilliard (8):
      serial: 8250_dw: select port setup through platform data
      serial: 8250: share the RX trigger conversion helper
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: describe the UART integration
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner A523
      serial: 8250_dw: discover Allwinner A523 FIFO depths through FCC
      arm64: dts: allwinner: a523: describe the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |   2 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 +-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |  16 +-
 drivers/tty/serial/8250/8250.h                     |   2 +
 drivers/tty/serial/8250/8250_dw.c                  | 172 +++++++++++++++++++--
 drivers/tty/serial/8250/8250_port.c                |  21 ++-
 6 files changed, 192 insertions(+), 33 deletions(-)
---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-message-id: <20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com>
prerequisite-patch-id: d8219673210dac82d3adab41578ff2f76f5862c9
prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


