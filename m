Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB0D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OoTH830r;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2/vKGrh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pV1f3+gzRgGvdb3V8PW5kPXYcDo6WZ/i+3ryF+G/nqM=; b=OoTH830r/5PzX+Q0Sxre0z2AMY
	+VmnVir+PvmdAcQ94HlmfpGML7VUVdF2B8seSiP6sVM0bl3qbDdvjfD6paQI2i6oYe9maHmPAgbcA
	bbV1U0E/Q1cCY94M8KvozyvfW4YNgzRFBYrKp66/RxfZ7YxJQUa3OgVlpbapPX4WrtGjn1HYveUzE
	gf/eLEjNRKpL0JWxOxIMcV5imvqV/CTe9DfGDkpj6DCAZMoy3P+DFSF/8tGwDrmi9DH90kNCOhwLJ
	1GUaUHWj1H3isLJvDIT2z2ybZcPPxKzZSiawLYmsPn0DL5kw6uznHb/hDKQKyz8/OvEfntqblqMf0
	YwVPX4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEs-00000005tV5-1fCU;
	Tue, 27 Oct 2026 23:05:54 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqEi-00000005tRx-19lQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 23:05:49 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-81b54d0cb17so436907a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 16:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142343; x=1793747143; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pV1f3+gzRgGvdb3V8PW5kPXYcDo6WZ/i+3ryF+G/nqM=;
        b=w2/vKGrhuhnlqlVIApx9jjv6GUZyZ5yD4KO8VbRNKo7F2pKGgt87mrAIqVyv49E3/r
         3JxiCjWVfLGKfMLbckOWpcb+szeTz3hIADxXxSjCl9pch6emQfIl2DC/BscMod85ZzaF
         l/9t13dfgz+5lOgOvBTdMI/FFFXl0Tdo6M58nZ+RDNljZKSWqxwMfCrM+vLdabRk06GE
         3p2mB4ApAU7tbpXO7CeM0bAoYuCgoSUHpFmrBTg3R/Asp8Qny2UlzC3fYmNXSaRmleC8
         cCdghlT7SCuOTOOASvYiWaeLM6L2I2OhP9DChqb/Ie/lr7rqVNSzHy0mdTcldd9OqiUR
         flIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142343; x=1793747143;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pV1f3+gzRgGvdb3V8PW5kPXYcDo6WZ/i+3ryF+G/nqM=;
        b=g9fyh7MNMIqtNJY0GPDUkGp7IRU+R9ivXhYwY9VnnVqjAvaxBwXP5/rzsiRKIVjFYT
         zIBjj1U4FaB6/sT317eK38nnREDwPN0bN075HwKzYfS0yfv10ut62FD0+uPcIP2vBi69
         71PO+1dBwq6jCGvPcQJnHZLGMSiXlRh/M6mpatGQA84N7xUp+zH1Q6wAxOmnRVuJgkjc
         kULPpWfLY2zzDgoAJCs1mP9CLNn4TVLZVrRQh4JaHCzR4376C9zMIPMvM7sdOSIEJtUy
         r6yxPsWKXj5aCG4TJ+vir/fqU8a/CF7Y+SsYH4QKJlGT4dfDTKQMluvTpMlv+045Hpr0
         rsdw==
X-Forwarded-Encrypted: i=1; AKwUvBwrr4jRH8VoQDX3IJjDHpdjY8ZhPkTfpe+egyrpKdbs0Fosl8HCB5UZnLY3YMllX7lWI2Ucci/lBWkRxdWQ9iwq@lists.infradead.org
X-Gm-Message-State: AFq9FYLxGF2NuebM0nTnM6IE1P38e+Ge60sQIieG1QvUnotwd6lKVS6n
	MsX4f9HQzAcUQZ37gu2QZ6yr00bW0ktmxv/3416YJfUwV4L/eVFGi0+z0T/4q85G
X-Gm-Gg: AYBFou3tyVblZxCI7DKdRCTLxRPN97048+olH2cc9YQDogvmQUFUK/7NI6w+qDzTqWr
	kM6TT8nFC/GU62AnuxCodSbkq61M75HdjvbYfzszXcuF6BUoQiR3SlF4kp3KTLBEuC5qB5NkUjt
	VvqK0ucDSYrkh4C39+9ts6sceItS83t84K98pijP/OJABtq1vidJE6kBMWPeJCW3rwpbv83PhHA
	LZs4ImSVajnftdUUQrM9ffSVgn496nhY3guYWg8oggA8sUSbeoKI3wjocKTmD8pFJtK+FfqI7hO
	TeQ7O1DGAdBy7osemfU2Zs8R5bEAsIeUZaE6sSer5kojgvXuB/qP0uBvzrEMEV2kC2VR0JLkjZv
	IyEu1+amRFZYEJltazo5zbASfHFw55xjbIP1F8ytp+jbGl8VyXRKtERX8/R5PqCe8hRBbE6oaZO
	yRqOe4WwvUeGKZBKiqecmkXgWBHtWZinD63Ezo8L6XYwJSCrtLK9X9fOu1H/GjZPPu1kz/QV9aA
	+oCl2MdVSwGqqbuFZ9Ito/xQoplusbTH1Ma80jFKStVojhw24AxuSDxt8KIt2CoLqrewBDzhaY+
	b4exHKcMWFvdbrlri/rLF1GJfcUx9WyRybUgjczeONirteT4hnRQRfmPKAxDXZ8gcWz4JkGKTgt
	ol/ZthIgsBg0BgKtQ5cfc3uaSfn7kQYi48N6uUA29Ap0nF+KCSPHM84M2dygeTs2iJXY+q6H1nW
	LBXQ==
X-Received: by 2002:a05:6830:449e:b0:80c:d30f:97b with SMTP id 46e09a7af769-85abeab270cmr903574a34.28.1793142343158;
        Tue, 27 Oct 2026 16:05:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v4 0/5] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Tue, 27 Oct 2026 17:05:28 -0600
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42R3U7DMAyFX6XqNUb5T5kQ4j3QLpzU2YLWFZKuD
 E17d9JuExNiCCk3VuzvHPsc6kwpUq4X1aFONMYc+20p1F1V+zVuVwSxLXUtmDCcCQF557o4wNp
 wAztMA4QYehg5eI3Bt4G0d6wu42+JQtzP6JflqS6zr+SHiTd1rGMe+vQ5a4986rvIyNsy5TEgh
 dIhCXLYPK86jJt733f1JDOK/4JEAWFg+kFqpozUP0HyGqT+AMkCEo0JnrvGS8+vQcfT5oned+W
 2w+kctcNMUP4LcFEZp5xWMiBvrLbiwaK32qAJZMiooJlxtlEKp5N1lDPOoSyqx7M1e7E2RYkba
 IRm0H5AG0ucfZotKuCguOUKrSau8dvi0y2s+g2b9kOKK9jEQEPs6BwIByt5MdlqxmR7zV4ej1/
 X+joJYwIAAA==
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
X-CRM114-CacheID: sfid-20261027_160544_333372_6A695EC2 
X-CRM114-Status: GOOD (  18.14  )
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

Add an H616 compatible for the integration-specific setup. Keep the
existing 16550A port type and describe its fixed FIFO depth in platform
data. Use common Allwinner helpers to configure the transmit load and
receive thresholds from that depth. Configure automatic flow control,
preserve the BUSY-safe integer divisor path and keep the UART gate enabled
during termios changes. The H616 configuration uses PIO.

The series first introduces platform setup callbacks and a shared RX
trigger conversion helper, then adds the binding, H616 setup and SoC DTS
changes. Based on tty-next at 6b4b543fa187 with the posted RX
trigger callback-lifetime fix [0] and DW BUSY-safe divisor fix v4 [1].
Platform setup runs before installing the BUSY-safe divisor setter.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
[1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
James Hilliard (5):
      serial: 8250_dw: select port setup through platform data
      serial: 8250: share the RX trigger conversion helper
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: describe the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 +-
 drivers/tty/serial/8250/8250.h                     |  16 +++
 drivers/tty/serial/8250/8250_dw.c                  | 138 +++++++++++++++++++--
 drivers/tty/serial/8250/8250_port.c                |  12 +-
 5 files changed, 151 insertions(+), 28 deletions(-)
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


