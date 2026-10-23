Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97389606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 21:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=37AmVWbS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nxGOHpIN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=t/OVPwISYIuAdc7Q10pLScYKXWaZFmDPlbXzHuMOEjM=; b=37AmVWbSll1e3EblSYiOtKiUzl
	OiNcKNpcj2i8RIPY0NJHO7mGaHJ+GC7O8yLpsAptwZjXWxRHkNXVFExQSHxOqkoGrhJHDX9ywb/PW
	pWl44Lmt2WASfWnuM+/iXa+pu1XTGsvaWrrw0z4CfohKX4VY4WfMYFoGHI91aPYUL9JUVp+55ydy3
	yOqbpiU3wTnK/pbc1lfDyFaue12pEmuBTsj0ReRZLdVWLwjrpSiNlF2hwHrv3DwM0Jas5l2fjbBA6
	R65qANSAg4+mTcvnUFLaE6pCDlPaAc8+MRtWcvjmsTAYsTkSkOc46/DH8r43EDDhrkJycLCW+rydr
	wjZVW9KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMfm-0000000Gyns-2rJm;
	Fri, 23 Oct 2026 21:19:34 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMfk-0000000GynF-2UYS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 21:19:33 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-843ea301d60so957163a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 14:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790371; x=1793395171; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t/OVPwISYIuAdc7Q10pLScYKXWaZFmDPlbXzHuMOEjM=;
        b=nxGOHpIN1tiBCaubI2X5sN6cUo2JkAX53hSwJPB5lJcrkEc6iZjweJ9s2VlhYAXD0y
         kN027mR94q/RgAkuIJFChKA9UmEcR5SrfRWuZtZMNInK/HnzuoSUx4A24FbtQ+Ben9hG
         RfWLXePNfWHwem39rtgmzFo6xH79uvIHje1/OC6IvYaHbuEFPKtKcl78JLqFGBKys4t1
         beDtwnQAAbvYE2qPhUEnDTj7r1hwbbUrV6BKQAqyq5Mqx9oY8agBWNRcklnwY8/RG0JV
         rwUUax4DNFm3UGaPkL9/uzTT1FbcJAxsQHHjmCfanYU/F5wneIK7lFpEbHUERQ45WqKk
         LyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790371; x=1793395171;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t/OVPwISYIuAdc7Q10pLScYKXWaZFmDPlbXzHuMOEjM=;
        b=G6LoRKG+TODI6NoBADKPDRYPmmhNgIGKxsnJoDSNb1AbaVLDYui1YcA4KbqFRZN3nS
         ngasgjmBh4++Ptlwqy3XVnZCvSViD4PbFG0RH5jssXq+Uk5e+61Eb+Nkyfw0Cw4wNn3K
         wl7X6KQSy2SziU7RYph/AYy0rRM8OQTMlUOskQrXPB+iZt7CTg0ncod5boawucJykBP8
         dn7cB/S5AwigCJYb99zEZlbCXOuWYHf0pdqXV5XpEqa/h6Ho3Nvjo/6VN/F1LUUkyDlB
         N2QbHAzE2vXtIfJ9hasDhoyPByo9tPscv3Pi7auU0VinMo3lgVlr07LvzVOgtTa5yWuS
         UbjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCYS1p3W4gY5eU0cRpcwYBlWYDSW85SlfyGBF/WPv3G59Efz1t2nucTUdc+rmcDYHyGFCTbO+oafFemVgy1kPU@lists.infradead.org
X-Gm-Message-State: AFq9FYIFfuJ2gsVFtUDIH1RdYh/Mh99AIPvYfhtXtRT+xbCCQRA5yI20
	4dsKX/vEUha+4r0pWE7hUgRZT6FsRcSOXy6uO2psRId3P+BgpLYX/Rel
X-Gm-Gg: AYBFou03tMjavcJ9tvDrLrhk5OhjWp87gpeDokeEPBNeUrAfbRiesP7S8qIs8aLzLkm
	6IYCkMbR+GckHKlsIhZ3+eTwck4f+mqQ2C9PSTqWF42RnTZMVhgbdNuHRKp0QnMBc/2F4HN0jOp
	NE5YW+RjTLAHGCSlnFbkm8Z3EkZbHtl8zLDlNquzEviAGxEfS1aOOEjr07UHYYk3uH2v+MOvXI0
	pzmERD5vSuNji7FOlFP0EyGEIJa9VCDydQuX+qi7XgLrCetqyut/frR/Q92CbpAFlygw9i9trHT
	BDagZ2kh4vq1vPog6jVeO/Y7fOekcKuxW08rVZEr3ThYLjxRv3okVaTKnJvPCCASwE4WDfEnxKD
	FIxPhfQUOgxLUxdp9XpcMP6q76Fx8VaGjlCWjkwBYjpp00RtDIcOaKKNIhUsoqZ88SmqJYyHh4D
	y/nSnW9uKTeLE0UN869PIwg8+6zprwMgMzuPkRp/kr0rAc3YVlgmsGhPwRop3QWpTCyDFHBWa0T
	JjcNRk820AOxczn6raFvSE/dWGN6PJ+3NCQnUacdc5n8skchyT4N6Q41LuYbUNsmdcZBRRzilU+
	ASjq+iGMTYRkDIsDUyHarsyMXjMxNPI300Rj0sGowkhIoKladm86x3Tg40qyYGpoJymyZRvMVeS
	OzqBU/TTYx1xLpcSJ/WcVHvLqW79xJnDhYR0EVLnXtoS1X+jZW7CxloMFUPu9qpfHX/00HWB4RB
	ukCg==
X-Received: by 2002:a05:6830:44aa:b0:845:3cfe:608 with SMTP id 46e09a7af769-850f7f763b5mr662878a34.0.1792790370828;
        Fri, 23 Oct 2026 14:19:30 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Fri, 23 Oct 2026 15:19:26 -0600
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WSzW4bMQyEXyXYc7egRImUcup7FDlI/Im3aOLWd
 oIWQd69tIMetkCBvRCrb4Yz0ttyttNm5+X+7m052et23o7PMeRPd4scxvOjrZvGvGTIlCDn9fw
 yn7bLeqBE68s4XVbf/Li+plXqcFG3KhOWwH+czLdfN+mvDx9zsN9MLle964nDdr4cT79v3q/pe
 u6vDf7fJj5YrQycw7LN0b48Po3t+2c5Pi0P7x8+J/v5EkkuH+bLHGdb438IRjIYiEKTZBpbaVD
 VY1BqLVFHLgXHSKXdIoyLHKKA+zsl7K0UpsJjgM4JUGc10lAanYxKNh+N9pQTS/KmTbtBKiJUw
 bNjyDSiXBAEJ/PcU63m3LipFxMtHlYsrhjFJKzdyGZtI5nvqa7uNQH3KVUxlsnduPXBgg6lNWn
 JKzPuKRtpdPfJXQujskYJKc3J4eWS0yRUYfxnQyuTmBxqyb2SIoQ5qCZqyhFMoBp2qmNPVcjKZ
 rVL5EfrOZo0FshdZCIbUayOXfdUSgDxINg7QEi7DvbEUT+kuEkoKTP7mLKnUKRJmg08RZ0aN5R
 nZRNW6MM7VitSEo54Mu9/AE2U8xkEAwAA
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
X-CRM114-CacheID: sfid-20261023_141932_664779_0FCB6BFF 
X-CRM114-Status: GOOD (  12.96  )
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

Add an H616 compatible and configure the existing 16550A port type with
the documented FIFO capacity, receive thresholds and automatic flow
control. Preserve the BUSY-safe integer divisor path and keep the UART
gate enabled during termios changes. Attach the existing 8250 DMA path
using single-byte peripheral bursts, with channel acquisition and PIO
fallback handled by the normal startup path.

The patches add the binding, driver configuration and SoC DTS compatible
in that order. Based on next-20261023, which includes the TTY changes and
A733 DMA register-layout updates, with the posted IRQ-safe locking fix [0],
pause-bit fix [1], virt-dma synchronization helper [2], and sun6i channel
lifetime v2 series [3] applied first. The sun6i pause bookkeeping lets an
8250 RX flush account the paused transfer and release its running state,
including when it is flushed before the allocator starts it.

Apply [3] with git am -3 on this base to combine its tx_status() changes
with the intervening NULL-descriptor cleanup.

[0] https://lore.kernel.org/r/20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog
[1] https://lore.kernel.org/r/20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com
[2] https://lore.kernel.org/r/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com
[3] https://lore.kernel.org/r/20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
James Hilliard (3):
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: identify the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 12 +--
 drivers/tty/serial/8250/8250_dw.c                  | 87 ++++++++++++++++++++--
 3 files changed, 86 insertions(+), 14 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef
prerequisite-patch-id: 9dff51079bc5d3efa29e789a7c3f0488c81f5773
prerequisite-patch-id: ea1a9ffb79d473d7d81611bb7113fc21b63dc73b
prerequisite-patch-id: e4b676f0542956d309df0dd168d7866c05e3965a
prerequisite-patch-id: 502d7ee59c7643e92aa0e7c029ccb37e66bc539d
prerequisite-patch-id: 11000237f90066cfda7f17005010a3041277fabc
prerequisite-patch-id: 3cc8c1b80f1852d96e2b57ec7d09af935e4c413a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


