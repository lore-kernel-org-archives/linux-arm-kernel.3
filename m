Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A70606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mUdKSoTi;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdQtIKJR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6kZ202AvHWljwqwG04WTTgSqbAzapYvPwFz9uVKHoOo=; b=mUdKSoTilMM2edA1mZ7vsaYt4K
	Py5ZKfpNepRg1PwCPCx3cegU23udmVTO218RgjJleH1eiJZDP2Jt/SZik+b1IXNrBO16USTPupH2U
	xV0WQks+bonJueb11LWMu3Iy6DvriLmVitnPdT+alNz+sN06YMwo7xcmmwry7Pxup8vly14jnQX6H
	nhGlT9yBsigox4D0Gk6bqIyvSMHDUkmBHaJcCjBME4Bw2ecQTBYmn7UpAejyZITyyy8jq4NACpCZQ
	Tt1yK3uYC9wINUGz/oL4uFHZ5QZ0ggK2HfLIbSwRf7JsspkWjisIJYNFddcYe/nt3DMmIZ5txaTVh
	0l2NnaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNaka-0000000EmNP-0sVc;
	Sun, 01 Nov 2026 18:57:52 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNakX-0000000EmMk-0hcQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 18:57:50 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8b06c0794cfso19786157b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 10:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559467; x=1794164267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kZ202AvHWljwqwG04WTTgSqbAzapYvPwFz9uVKHoOo=;
        b=kdQtIKJRTPvRFQQuc3AqZf9z9LnD8IT5V9AcY0RDP5tgfuJY6zL7KzyfxVRqkxMio/
         OuAv6cSh3EQtOA2uf3WIB5dcCvYDwPbc9ZEdlKvnOO/m9W1CcrlNJ7En/H6SyscP4VJ1
         JtWfsgTZctQCRwPH37dVlPAgxxQhfpGWirkgIHj5dK2OHEkMYMMCoEmYkPQsPjLSODWW
         i4waKSGn9kqXZGZH2UCzzKyPWn/3KIZxzfPejT+ji5Rh9tDrc5k1pHIh7FATZNGkB1KO
         P2Eg9eThwmG/3LFYO4dWYihCbVdsrDxhmihsn+W3Y6Y5c6m7hYHi07GgKdeCqhn9HA5L
         Y8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559467; x=1794164267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kZ202AvHWljwqwG04WTTgSqbAzapYvPwFz9uVKHoOo=;
        b=PZ8VUCzfeph5yw+HwrXAR7QKnamU9+v/7c2kQiTbV1d+iL7NRD5v6QJw98Iip/5W2r
         ZPGh0k6uGWioWieExNgkbVzfHtX8egaD0IukE+crAGyGhzBwteLGdXfEXN5HCfQoi+8d
         Xq4lr/z5jTYo6EHS0nW8ad7PwPIA5HTDbULojpCDD+oRcroRQdAt6ozz3xgcgduEH2lo
         u3zqtKPGbJpb4yxy+KRaELzhQl3w4KiX0aiGVglEOygPYASc1+aXsGZy7SUhoKChSTGp
         mKo3ppN/eUeZf/+ZYgpM+c3j496JYIk1XcwADBOLXHS8cpiSf/mIHWfzC+97tD2Nl4YU
         79CA==
X-Forwarded-Encrypted: i=1; AKwUvBwN03qW8FWZTgugv+F4BRtBHC65LOWVgWz17YjbkWz01T/xuA24RHahe0qHMcf13vGsfUQxscQ1yc1L0473MDMi@lists.infradead.org
X-Gm-Message-State: APuU4Z9BC6IDTpuK0gt+bHCREpIHluWZ6pR9VOXJEcMMNT1nEXubT4W2
	pMBAyEwfhAOmws7KF1TL4muPDHm1VsFueRf6FXOSQ+RMsBKWf0oQwU72
X-Gm-Gg: AYBFou2/qvchFhDpWFwtnUYBfi2533vOL6eKLdHNK/QbVoFdBDiFLIfNSyrmKC4QSxN
	TbAD2si3Nh2moXjNpMtrZuAQKOz/cdSTJvevAha3u5D3bD0s+ubnGJDGYQoYCCBtg868n7/p+cQ
	UBoVbjbJjBnDppd+0Seve/Sw7iAdoubzscZueF+XWbirYUruNLk7K2botFEFpsMxImUcAp5X9ML
	8WwVAtFlkm9kH9D7VpAq2kY8TA4s5aXJ3yzo8hYpFEHsUdJhe4XLjLBKHnVZvOm8b28p7rCKx/V
	L9BZOXKbn2/Jemd/1ZzdSUs9DOJencd2R/HOJD2ob2ZqPfUe83DdZmU+TKyvqJKeR+vrQHZjHkc
	jBu4uekAvvOVuVC39igRrHu6U3ma+QlsGyRCXscPfWjP1EORcn4+yzVJoOAaieHByYpyhNEyHZd
	+TC9Tt5dw5FETFFaxzNX2msrILzcqbaWJhUv8z4lQDkyCin0HAsXDtt0gES5NoXwjbIBa5fV2uL
	d6IZr7Bh1gQlzV2kAZV569y4oFWX6UC41Pbly9C7dD6YiVYqeJt9heQqE5HyYt9lIn15FkORMz6
	n/WI6AvYmb/cJ5vSgTGobHUO4McJFSxPkwCSMY3WsKEGFqW3mjeJ+HVL8rIVXd0SMcY=
X-Received: by 2002:a05:690c:a046:b0:8b0:eab2:f502 with SMTP id 00721157ae682-8b2b67992e6mr47158847b3.61.1793559467403;
        Sun, 01 Nov 2026 10:57:47 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:47 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 0/7] Add Allwinner A523 message box and XuanTie E906 remoteproc support
Date: Sun,  1 Nov 2026 12:57:28 -0600
Message-ID: <20261101185735.762559-1-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_105749_228205_C3C86133 
X-CRM114-Status: GOOD (  25.09  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds a driver for the message box of the Allwinner A523,
A527 and T527 (sun55i) and a remoteproc driver for their T-Head XuanTie
E906 RISC-V core, with bindings, DT nodes and KUnit tests.

v2: https://lore.kernel.org/linux-sunxi/20260927002021.797069-1-tcmichals@gmail.com/

Changes in v3 (details in each patch):
  - Message box: all four banks are clocked and out of reset (an
    unclocked bank drops writes). The FIFO is drained before its pending
    bit is cleared, and messages are delivered after the controller lock
    is dropped. A kick is done once the receiver's FIFO has room; a full
    FIFO is never written, and in poll mode the check and the write are
    under one lock. The shared reset is never asserted, as in
    sun6i-msgbox: the other banks carry traffic between the other
    processors. allwinner,tx-done-irq selects the receiver bank's write
    interrupt instead of the 1 ms poll. OMAP's ti,mbox-send-noirq is the
    same kind of per-mailbox switch, in the other direction: it turns
    the TX interrupt off for the WkupM3.
  - Remoteproc: one mailbox channel; the receive callback is deferred to
    an ordered workqueue; address translation covers only the two SRAM
    windows; debug reset and power domains added; all register regions,
    clocks and resets are required, the mailbox is optional. Carveouts
    and crash dump segments are registered in parse_fw(), and crash
    dumps contain both SRAMs and the carveouts.
  - Bindings: fixed lists for reg, clocks, resets and interrupts;
    "schema" dropped from the subjects (Krzysztof). All four message box
    interrupts are required: every A523 has them. The DSP and CPUS
    message box bank addresses were swapped in v2 and are fixed. The
    SRAMs are named as in the T527 manual (sram-a3-0, sram-a3-1).
  - KUnit patches moved after the drivers. Both suites redirect register
    access with static stubs to mocks, so they run on any architecture,
    UML included. Patches 6 and 7 only add tests and can be dropped or
    taken separately.
  - Rebased on next-20261030.

Notes for review:
  - The remap register (0x07010364, PRCM) is shared with the DSP: bit 1
    shares the 512 KiB SRAM A3_2 with the E906's subsystem, bit 0
    belongs to the DSP. The driver maps only this register and
    read-modify-writes bit 1, which is safe while no other Linux driver
    writes it. I can move it to a syscon or the R-CCU, or describe SRAM
    A3_2 through the sunxi SRAM driver (allwinner,sram), if preferred.
  - memory-region index 0 is the virtio DMA pool, then dram and trace,
    as in the TI K3 and MediaTek SCP bindings.
  - The optional crash interrupt is supported by the driver but not
    wired in any DT and not tested on hardware; the A523 has no
    dedicated line for it and the vendor BSP has none.
  - System suspend is not supported: the E906 runs next to a Linux that
    stays up, so the driver has no PM callbacks.
  - Merging: patches 1, 2 and 6 are for the mailbox tree, 3, 4 and 7
    for remoteproc, and 5 for sunxi. Patch 5 needs the bindings in
    patches 1 and 3.

Testing on a Radxa Cubie A5E (A527), Linux 7.1 PREEMPT_RT and PREEMPT
with the same driver and test files:
  - KUnit: 37/37 message box, 26/26 remoteproc, built in and as
    modules. Under UML on x86_64 one message box test is skipped (it
    needs SMP or spinlock debugging).
  - rpmsg ping (10000 messages, about 167 us round trip) and stress
    (100000 messages, 16 in flight, no loss), with vrings in DRAM and in
    SRAM, TX done by poll and by write interrupt, and message box
    unbind/bind with the remoteproc driver unbound. One interrupt per
    message.
  - The same tests with PROVE_LOCKING and DEBUG_ATOMIC_SLEEP (and
    PROVE_RAW_LOCK_NESTING on PREEMPT): no lockdep or sleep-in-atomic
    report.
  - On next-20261030: W=1 build of each patch with GCC and clang, built
    in and as modules, dt_binding_check and dtbs_check are clean;
    checkpatch --strict reports only "does MAINTAINERS need updating?"
    for the new files, which the entries added in patches 2 and 4 cover.

Tools: I used Claude Code (Anthropic) to help review the code against
the v2 comments, write the KUnit tests, run the board tests and draft
commit messages. I reviewed every change; all tests above ran on my
board.

Thanks to Krzysztof Kozlowski, Chen-Yu Tsai and Rob Herring for
reviewing v1 and v2.

Tim Michals (7):
  dt-bindings: mailbox: Add Allwinner A523 message box
  mailbox: sun55i: Add Allwinner A523 message box driver
  dt-bindings: remoteproc: Add Allwinner A523 RISC-V remote processor
  remoteproc: sunxi: Add Allwinner A523 XuanTie E906 driver
  arm64: dts: allwinner: a523: Add message box and remoteproc nodes
  mailbox: sun55i: Add KUnit tests
  remoteproc: sunxi: Add KUnit tests

 .../mailbox/allwinner,sun55i-a523-msgbox.yaml |  146 ++
 .../allwinner,sun55i-a523-rproc.yaml          |  146 ++
 MAINTAINERS                                   |   15 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |   47 +
 drivers/mailbox/Kconfig                       |   24 +
 drivers/mailbox/Makefile                      |    3 +
 drivers/mailbox/sun55i-msgbox.c               |  613 ++++++++
 drivers/mailbox/sun55i-msgbox.h               |   95 ++
 drivers/mailbox/sun55i_msgbox_kunit.c         | 1387 +++++++++++++++++
 drivers/remoteproc/Kconfig                    |   26 +
 drivers/remoteproc/Makefile                   |    2 +
 drivers/remoteproc/sunxi_rproc.c              |  855 ++++++++++
 drivers/remoteproc/sunxi_rproc.h              |  124 ++
 drivers/remoteproc/sunxi_rproc_kunit.c        | 1314 ++++++++++++++++
 14 files changed, 4797 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/allwinner,sun55i-a523-rproc.yaml
 create mode 100644 drivers/mailbox/sun55i-msgbox.c
 create mode 100644 drivers/mailbox/sun55i-msgbox.h
 create mode 100644 drivers/mailbox/sun55i_msgbox_kunit.c
 create mode 100644 drivers/remoteproc/sunxi_rproc.c
 create mode 100644 drivers/remoteproc/sunxi_rproc.h
 create mode 100644 drivers/remoteproc/sunxi_rproc_kunit.c


base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.53.0


