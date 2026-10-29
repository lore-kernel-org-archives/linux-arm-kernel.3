Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D1C60A2622
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OaH+gbff;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1OwCsAb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TEabyGl5Fif5n7bh2NaQdC92feX3sIX7C9fNc4h7CgA=; b=OaH+gbfffFtvSjuFyrCK0sMQx8
	q2Hsl3GNbWvxdwi9ljuviboXA3+Ejv+2GCYXocAPDd8yxWcm07Uap6ECUaZCYYnfCvzbReqO5xrxF
	26slB6EKJa68if6dnfiRYwa6crGwMcqK6CDNq+4RceagmoSoJyrUnCrvEQY/9TLU2x5kaI3D4AlDl
	rrqkZjRo87wmKOtjipp+75mYjivB47GEuQoyR2bFTdFPcYaP0sj2Tp4rG+gpoqr9pcwaQEmO2ltmj
	Pf/n5azxW17GlbMYK4riSRXZ4Xu3qDONNt92Lhv9q0agTwrD5QwQbjcqFHqU5VFLNyzPq8tn1lCcP
	rSrgg2nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVA0-0000000AA3O-3lZx;
	Thu, 29 Oct 2026 18:47:36 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV9y-0000000AA25-0n87
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:47:35 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-843ea301d60so8256a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299652; x=1793904452; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TEabyGl5Fif5n7bh2NaQdC92feX3sIX7C9fNc4h7CgA=;
        b=q1OwCsAbO0yT6+nKnAtYZpj15YVGcj+yLUZCok9W+d5qNAKnofFTTfn1npo3IEYmmR
         5SL2cDpH2BN78uuw2LOtZt8OKuDmEX2vxBToj+y+VXTRE37+NFwdKg4KkRum37/BfxNM
         1OVM5eykhFZcPs/AwqC/t7NM3hv0nfuFj7gjdNIJng4aMaXFZbw+kM5tDHvZACRu4Cd1
         MVVUfLTJyskeBvLzmeAGJQrdR0yuBjXHiOcZ73RoWyqOUdAVJkwdaYNdBfNXJZLTow6H
         tP99RRwI5zHqkuBOWeIQODIBYiYEBGXHPvIw+S55Ka4FsnEkJUFL3FIthvSsDoQOltKL
         zk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299652; x=1793904452;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TEabyGl5Fif5n7bh2NaQdC92feX3sIX7C9fNc4h7CgA=;
        b=AEJUVTIhPzkWihvEtQwjhGoy2bun9zhJ/YlxUrJQUCzy/L6R9V7s2PEqI9wDqhSvAQ
         y9lnmKfYsbQt+OMoUrolGQC0vsNg28gOF9YkAOdeItMisDWp48/D7BnvRSrudw2W8nti
         c/FeByDy+sjeqGwuQ6g/pvguUu0ExLu+S3uxoH3JUrM3tR+EWfST5Qmvkzl94M/AW8n9
         AcibIXnEEEVRCkiOJqTKAkzbmpgpBu7xBYofkMUYA4PdSuznPok5fr2EhqpOCOxiDOlF
         rMmgeZKiP74FJhedZ2+0vkqGdXV5ZuhjPhCmfq8Jwm8SnYt1v45rHnUpZEW/UiJl45ld
         wYsw==
X-Forwarded-Encrypted: i=1; AKwUvBzbKCVzx5Nu8C86ApQYkJgmRgBfWfQRsb8Wi3Y9Tr7F5AxtwRq4gTdrhcjUkiuhXYRrjpnQLlNcrdgK0EhmE442@lists.infradead.org
X-Gm-Message-State: AFq9FYIOT3qDh3oIRPYWvV+Xl5MXfat8fVY3SfbcjxfR1HJB2bXGhCqQ
	RIxvlM06caAu+SQjtxoA3sCg+ScF/hsEPOatoRVc5AXmaDvQGfrrIxHg
X-Gm-Gg: AYBFou1nlxXtEDh26oLSCgQeBaxNTcdnN9TXtNC56+YYuVPO8iCv18mADG62WMlYm6A
	KAAzaG1XercunGVf3sLATVZIxtF1LjJxQ7jnNS3aYbFMheeEaLRUvhXYeMOhtgb8UWFlbxsC/RK
	13inWIC9JZJ2s4N6QgfETkVvSqiLgSj1DIt9Kr3hDARtbfiXtsrH6FuTzybFnzxQkPGkgzvOgQV
	eSzzBwgMywEPsC4xZIGg208TcrYVkqTIX1XlD3GCMupnpSANm05KhSphIw3m1DDjoGRxnqago9i
	PvmF29LEmugIr08ekNcyISxPzmlyTp1lVcEq76/v0A6LNNwbK/9HenRSDAdoYs6WRkijnOBnlLV
	QhWgH6gvdHa1m8lmGu5lzEgCDvzR9gSF8oqaBr7WzuOHjPTJ4Z4LLGDCXkSNsWC1UfcDcpjGZbu
	i43ocHEhda2II2HavAsNTbEX2M7Cns1hWiweRG2vvse8ibqqMzY3xZ6j0FJFCnVx4ZXWHz0kz9p
	5PBMQRCadU7dIbzriT1L9WXj5sQ2wbFpeMmWiWZG4v5hTZaRMFbSt+OIFcD2vR1lU4LzP9cOzew
	QeBh2I9kDYe0Nq72l55RxNYgugfqaMHY2AmLEXX6EZ8gGHOc8L+BxzDP5XIkc3xM3JV6hGxTppv
	6zx87c/UcJZ+cQ8aqg3QlNPb5Bh9po7YHSM4HsE82VQuda7AROtGcABPIRivnIbaxJOXRntDTzL
	dWA6sGwRZYwTUOLQoYJF96DXvMyiaIloW9kc00w8hj8D5G/LdwiNg=
X-Received: by 2002:a05:6830:25cc:b0:81f:6e05:c1aa with SMTP id 46e09a7af769-85d3657604bmr21613a34.18.1793299652493;
        Thu, 29 Oct 2026 11:47:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v5 0/8] serial: 8250_dw: describe the Allwinner H616 and
 A523 UART configurations
Date: Thu, 29 Oct 2026 12:47:21 -0600
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43S3UrDMBQH8FcpuTaS73RDxPeQXZykJ1ukXTXp6
 mTs3U23iWW4IfTm0OR3/pyTA8mYImayrA4k4Rhz7Lel0A8V8RvYrpHGptREMGE4E4LmneviQDe
 GG7qDNNAQQ09HTr2G4JuA2jtGyvX3hCHuT/Tr6lyXu2/oh8mbTmxiHvr0deo98uncTxt5u035G
 EUF0gEKdFC/rDuI7aPvOzK1GcV/IVEgCEwvpGbKSH0NyTmk7kCyQKI2wXNXe+n5NaTmkL0DqQI
 10iLjdWgYmDl0PI8w4ceuLGk4z5U4yEjL/wIuK+OU00oG4LXVViwseKsNmIAGjQqaGWdrpWCaf
 Yc5w2m7y+rpOtr0JqCltdAlzydtYnkXfbpE5FRxyxVYjVzDb8TnW6z6i037IcU1bWPAIXZ42Sy
 nVvISstGMyWZur47Hbz39dWOsAgAA
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
X-CRM114-CacheID: sfid-20261029_114734_278134_BA35CA07 
X-CRM114-Status: GOOD (  18.78  )
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
 drivers/tty/serial/8250/8250_dw.c                  | 162 +++++++++++++++++++--
 drivers/tty/serial/8250/8250_port.c                |  21 ++-
 6 files changed, 182 insertions(+), 33 deletions(-)
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


