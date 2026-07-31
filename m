Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07276C55162
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 02:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a7nGbc39gTC+6W7YyaE7zf4mojKQP8S+x93D9t97UTc=; b=yA9jrRYCZmRX6klH/70MyQfnKG
	IGy4l1KdrPWcK5vuy8Fs40OFHYkuvxJLX2mK4f3e6PFtFPqjxQ4M2c4VRF4qrngfemO0OO0lfHuso
	9wXFZgrVwlsidk5c87E9Xskzje2vYF+a7amf39cWfUaKAOKEkcYWLaA5oY7HGPAOugnTL9ppvTeVk
	HgU6ooapgUpIPBWk9ou1o0CxvgWOutKGoumakUPY9RvLZ6+XMTtkqaRu5u+ENkLcwHHs6LAwWLVQk
	FEW2opBAfREJ//5q/ACisz/C4/gEAr64n0IEUqpfjETsR80lBkLgxk1nMzj7KUqol+KRaUEWLtYqR
	gsV07OcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpd8p-0000000BdP0-1zI1;
	Fri, 31 Jul 2026 02:38:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpd8l-0000000BdOe-2oZP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 02:38:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d02b4c3601so5107295ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 19:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785465507; x=1786070307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a7nGbc39gTC+6W7YyaE7zf4mojKQP8S+x93D9t97UTc=;
        b=DZKIr5tBYhxfzI0dp4WXrealgced3CfNGYlexNKKRF603gC38Be0lYYTkXKxfjCtou
         wjdn57JjMd81NxjETIRSoxoaUowTUh0hF1xUreP+Fqu68YnoSxix8R2/5gi+qPl3yyF3
         nuEucaG28GH5s5GeQ2EFvV8MhKo9t+avBpDullF/+FtQbpAc4Zk02KWZjQOn+HA5vaIM
         jkywBs1+O4sotMCtL24vX8UFLwUmeQoNQy1a25RRuE7CSJ+7yU4SCB1mthPnGW5VuLOf
         gYOnmig0QOd3aWsjvxXypq2n6Dh5VbMDQLI+FCxn/DX5LK4xc0vtiIlhktEINAbf9rnv
         Oz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785465507; x=1786070307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a7nGbc39gTC+6W7YyaE7zf4mojKQP8S+x93D9t97UTc=;
        b=XXk5DCP3muAhTF2hDqg8hmA+zPE0VOOuwqeVIpaCxbepK+f6WUwoWiZ3bNtQBkvJBf
         Qkxuy2etJYWujCzhO6e/3gEsKHcbsAPQieGelTT2fasByEZ8aO9wDGPNSP6U2nOo61nP
         kyKORaX+VlqCHFF3a46fE1ap+ianvwSeQw7bkJnwQf9kiWDeaIiJSNMYifTeFoIiwlBU
         3jA8fIQ/Mti9VvbA5Okog167//engEfL4BL/HRC0qATmcN+STC9xws//OeMFEls0au/u
         p0oBLkZZ9jvDZnodzlmA2OxAS59VJFl7m9nVhtrgGHJvCAYk27MPpZCYVST5ltm1tAuf
         KVoQ==
X-Gm-Message-State: AOJu0Yw1LwbhhlAe8x7olNMgLX04YxMn37YtvxQSolgBl2Dfq1bX4gC1
	Tpb1QJa0uC74lcvOGS7/O0UcQOEVbmG3Z88e1agLOJKTTHR1Jq/qWPTP
X-Gm-Gg: AR+sD106eO6C865+hqDNjLe4eRMQthZIIeM2dE1mGCqPJhjRjPzdsXGNxoNNWjuBC2o
	n9hKEspM+lGRO3SXpeFdB8huamv5XaalyLwEorN23Xk0rQuAgnJ1VgKEtKP8vEPH8QNTHdQbpGq
	7KYBHtefFNHVqpx8kuuBcZXdEZxT84hbqQVDd2c8Xzuex45c6UHt1F5Isa4FXXOyaSjwLDjw4k8
	ojIdQY1HYhtTzTNw34VpPPNxDW//SDcNVeY1tX/SnGWH3abMAyiOut7zgzcIALlhjRc4L94VVvo
	SPvBTWHBL6+IwuUmfXvs2uOjRft4LyTpJkvScZAcHsmK+D2AzDfSbjje28gYTE9ydB/bO4EJn81
	LZYHmh1fMESLysgs3zANVBN8XM6XfQSHMYQd9tW7JMMhs0FH8O3v99s3aym/S7VzHvVnzFG7hUz
	yXxIEKZgprQ0cOjo/EuoBgMv0fpoEkcYqPGgO4r0OwZApol5DCq4e13msBVi0nM3ZXyOSCErPaK
	9koqc/iD9ONVynOjQ/uFstOzhK55D0pIm9BSqXgYlMa/4jK39Vk
X-Received: by 2002:a05:6a21:4d02:b0:3c0:9c18:d5ad with SMTP id adf61e73a8af0-3c91b526f6dmr45001637.74.1785465506628;
        Thu, 30 Jul 2026 19:38:26 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3808a8d9sm81938a12.7.2026.07.30.19.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 19:38:25 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v5 0/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller
Date: Fri, 31 Jul 2026 10:38:16 +0800
Message-Id: <20260731023818.1626075-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_193827_735196_4ACA203F 
X-CRM114-Status: GOOD (  14.21  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add devicetree binding and SPI controller driver support for the Quad SPI
controller found in Nuvoton MA35D1 SoCs.

The controller provides two native chip selects and supports standard SPI
and spi-mem operations using single, dual and quad bus widths.

This initial implementation uses 8-bit PIO transfers and supports
per-operation clock configuration, clock and reset handling, and direct
execution of SPI memory operations. DMA and active-high chip select support
are intentionally left out of the initial driver.

Changes in v5:

* Changed dummy cycles to use output direction in both the direct
  spi-mem path and the generic SPI transfer path.

Changes in v4:

* Added minimum 1 and default 2 constraints for num-cs in the devicetree
  binding.
* Made the driver read num-cs and fall back to two chip selects when the
  property is absent.
* Dropped SPI_CS_HIGH support from the initial driver.
* Kept separate chip-select helpers for the SPI core and direct spi-mem
  paths because their boolean arguments have different semantics.
* Protected SSCTL register read-modify-write operations with a spinlock.
* Limited spi-mem operations and individual SPI transfers to 4 KiB.
* Limited complete SPI messages to 8 KiB.
* Restricted the initial driver to 8-bit words.
* Added defensive transfer-size validation to keep the PIO polling path
  bounded.
* Kept bidirectional data pins in input mode during dual and quad dummy
  transfers in the generic spi-mem fallback path.
* Treated zero tx_nbits and rx_nbits values as single-lane transfers in
  the generic SPI path.

Changes in v3:

* Fixed the DCO mismatch by using a consistent author and Signed-off-by
  address.
* Added spi_controller_mem_caps and enabled per-operation frequency
  handling for spi-mem operations.
* Added a short delay after requesting FIFO reset before polling reset
  completion.
* Documented that the controller generates one RX FIFO entry for each TX
  word in single, dual-output and quad-output modes.
* Added the missing linux/delay.h include.
* Removed unused register bit definitions.

Changes in v2:

* Updated patch subject lines to follow SPI subsystem style.
* Added a commit message to the devicetree binding patch.
* Added ARCH_MA35 || COMPILE_TEST dependency to Kconfig.
* Expanded the Kconfig help text.
* Converted the driver file header to C++-style comments.
* Added reset control handling.
* Added the resets property to the binding.
* Added a num-cs constraint to the binding.
* Removed the flash child node from the binding example.
* Used op->max_freq for spi-mem operations.
* Split low-level chip-select register handling from the SPI core callback.
* Limited spi-mem command opcode length to one byte.
* Forced spi-mem operations to use 8-bit words.
* Avoided driving bidirectional data pins during dummy cycles.
* Drained RX FIFO entries during transmit-only transfers.
* Rejected invalid chip-select numbers.
* Rejected unsupported dual and quad full-duplex generic SPI transfers.
* Fixed checkpatch style issues.

Chi-Wen Weng (2):
  dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
  spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller support

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  63 ++
 drivers/spi/Kconfig                           |  10 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1-qspi.c                 | 657 ++++++++++++++++++
 4 files changed, 731 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
 create mode 100644 drivers/spi/spi-ma35d1-qspi.c

-- 
2.25.1


