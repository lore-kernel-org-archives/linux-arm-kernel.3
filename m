Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC719606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 20:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OTETsmFn;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=exBU9jlY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=75yyN+wYPmh4Hv6W18LTzVXcBapZ5SC3mIWHEkYwJ3s=; b=OTETsmFniXr+CSQKzA4qf1Ied1
	xMRKZE0EmhtzMj5mcls72+B2i/jSRedh8u6Tw5EJwiFe3BQAFJySsrsC6FwGShHAT4uYDVpPM9mZv
	EWllev1TwpKbSNXR/k7urfSMNZrPbNs8BqPdHNNPQPdNxk3fh/5y7Oq+QiJ6v3ovDg5k6P4+MYZ+u
	vRBQE53pTapkcziKCdZA8Y+WQ+fSVYYE1bfT3idhpDwVwT8mNvBkum71QyZcc3h33dQw+h8y8fzKV
	hQcIV8KlVX6dWE2QuQpmGcjH0XydWl+qGO7yK3bvvyBn4zCthbn+cub+O491yoi5V6PcEz3y2Gpn2
	8lVe2Afg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKiGE-00000000V31-1FyL;
	Sat, 24 Oct 2026 20:22:38 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKiGB-00000000V23-28nS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 20:22:37 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-53ec92375d2so917401b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873354; x=1793478154; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=75yyN+wYPmh4Hv6W18LTzVXcBapZ5SC3mIWHEkYwJ3s=;
        b=exBU9jlY2NxtlckjOMicB9eLTt0Nj8AK/8xnOmMZQQYuGUJyooOAMT8Af5LOgNWC+0
         kBPkHJplN5NKY9hFxGtycNV6uXkLIaht+ozVLo1xSGR6usnWuqJnAmWuE5vepaxDs99W
         D0NuUt7gwGkq3+Gj4wVF54NKDmYuHrx7a0Jlc20FuuNujaCH675t9uZfqtg9VgjAPdKM
         i2JzXOvWLtpLaY5qzzrH4/WaNJgYJQNXsG1hbgUhMVVecCZYcoUbA6M9C1fajW4ZyOv3
         l6vlKGRh8hC2+HJI/bFLJujsWI7KkJhAZXl7+amm23uhIMXeiXm9GasZSHgL2RLV4NYe
         aNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873354; x=1793478154;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75yyN+wYPmh4Hv6W18LTzVXcBapZ5SC3mIWHEkYwJ3s=;
        b=dD6KhLohp99nvJ8QBpG1jZ9Z7JNh/JVlT7RO/l7yDaD0g5mwWKOYeTxj6QWQc//amw
         uxglQlO+WDW231UDuhUeRdG3lVhgMQycwLQ+VkFbTOGg4Jggm+fVPFYfrY28pUt/poUE
         Owbb2lcEiiCUrt876nSgFF2Fhl8YmbrdCn7mXCqg2Xfp13oM+oUV8za6w+LuggIRxNpO
         f6Z8NLeOLplEOcqLqABQrvquyNF7028R5Bz3i+eBIKzlTnzxW+FND+RSkG4qHsZaKTh3
         TWLv7A1CYoPOBFcoz9VodDl7aXFOcluhfcsMzVdZCVMeHt7LzZaXjo1q+zb7SuW48Y8b
         cKcw==
X-Forwarded-Encrypted: i=1; AKwUvBzAM4ugoY0RwYrD82Y2EsOfTT0iVpU1eu2zK5+SuRagbCk/6YGT0mM+4XsXWSgeEi+gGN4pisL8ykqz4s0Ee87D@lists.infradead.org
X-Gm-Message-State: AFq9FYIGWu8NDgqqvygpW4fqyrQ1psfZcmG5u+RxX0y6BGfi3zJcf8/g
	3gCNBvB+IyTbsjBLr2K11+CnNW+2N+g/VyXoLM0oygrv/dhqtzjZepm4
X-Gm-Gg: AYBFou0I5UNaeyPG1d0Dg4k8dqYNCc9MmW2M6vn+OyRScdVazbVvfK0CDu0vBia8qkE
	2IxLk7l6EjPC40S3/5Ic9fAzwA90oDmJ1kW30eyr/EEAIOjF1utIyQQ6GxtFvwBVo0TNyqEDJDg
	gBDBIULFNgGXJxOd1ymhC1v9L79pXDOEfFQNYkttzNtHBk21X0rYn5Po+/94LwnUbWzpqHm9wau
	tGA+lwQ8mNcI62LTXNAMjJgfvMdwilLEtkuVoWKiEYda14MHsGONDuzSyuyflvXwjNg3gMptsjE
	iLuFA7ofCTdn+10QhgAf7bi7QwIZYMi/2EteTF+qnNeZ5PqgsVO0Y/P/YnK4YeXvlkLCvWQaUYb
	cdHXSESPSsHtKH+1DeYwR9giBBcSP95YFWThc1BwHJYLwAei3JqPyWW0966bDs1lT1yB5ef2iNF
	fCcG/ua3yW2SUwZwk5EfmglXcHdJVdrd18gO5TlBGV7PG2b9DhuIhdzxHj0UY53TqAAt4Vr/Kdq
	ldFIiKPxoj5y5xL3umgPkDVyJUQDpzv24Oqwm+VZ+PMRTfwQlvda7HQTFAQSPBR1M0CCYyVVCjM
	ZbvFEXkbKHAtm2j9HOa/YJ5YO1IcfbFXyalfVkQXVNJrGOHzgmKa1MNop6pK1jwzPElLzwkpUdF
	v56CSotmqoxYw1ZoyWgCrGZHRyv9pZzOgpLhbkZAksBsX5uDWyo5cdQG7dVVsPcN1Jc22+sEJvU
	eR68wP
X-Received: by 2002:a05:6808:14d4:b0:4d6:90f4:48b1 with SMTP id 5614622812f47-55c0038ebe6mr1678982b6e.51.1792873354005;
        Sat, 24 Oct 2026 13:22:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/4] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Sat, 24 Oct 2026 14:22:22 -0600
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42R3UrEMBCFX6Xk2pH8NGlaRHwP8SJpJruRdqtJW
 laWfXfTdhe9EYTcDJn5zjkzF5IwBkykqy4k4hJSmE6lEA8V6Y/mdEAIrtSEU64Y5RzSbMeQ4ai
 YgtnEDD74CRYGvTS+dx5lbykp4x8RfThv6Ne3vS6z79jnlbd2HEPKU/zatBe29t1lxN8y5VHA2
 ghrkKM1+uUwmjA89tNIVpmF/xfEC8h4Klshaa2E/A267oYjfs5lJXlPQaxJCOW/ALuKMV173SB
 vWora+NaiYEx5RbXjqJWtm5a7xq1JR0zJbLvsqqebtfpubb2AGUBzSSGecwwHGILHHEa8BWbQC
 GYb7SSlwv34fC5Gr99XjTWUwwEAAA==
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_132235_842403_EACDA8CE 
X-CRM114-Status: GOOD (  12.71  )
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

H616 has 256-byte UART FIFOs, but lacks the DesignWare component parameter
register used to discover their capacity. Its debug-divisor and RS485
registers also overlap offsets used to probe optional DesignWare features.

Describe the FIFO capacity in DT and add an H616 compatible for the
integration-specific setup. Keep the existing 16550A port type, preserve
the firmware-provided depth and derive the Allwinner receive thresholds
from it. Configure automatic flow control, preserve the BUSY-safe integer
divisor path and keep the UART gate enabled during termios changes.

The series first introduces platform setup callbacks, then adds the
binding, H616 setup and SoC DTS changes. Based on tty-next at
1184f87e2790 with the posted RX trigger callback-lifetime fix [0], so the
custom trigger handlers follow the registered port's lifetime.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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

---
James Hilliard (4):
      serial: 8250_dw: select port setup through platform data
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: describe the UART integration and FIFO size

 .../bindings/serial/snps-dw-apb-uart.yaml          |  17 +++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  18 ++-
 drivers/tty/serial/8250/8250_dw.c                  | 123 +++++++++++++++++++--
 3 files changed, 142 insertions(+), 16 deletions(-)
---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


