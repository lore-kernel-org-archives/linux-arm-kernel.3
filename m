Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED35CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fw5nXFVyb5GRYqiTkdD93jih+EMJUvklwZZGtUHOoyQ=; b=EQ6Tz0qc7hjg9uGdRS4Q0rp2Se
	7UXMASrNpe5Th5B9NBqIhzIwqyztcjgbjwefk5em7+flZCATdXzLsK/10bCABe0fM4tCwHVG9owA/
	TAnBk9B4hQhw/+eWrn7OcseP16CORZj8JAvu5QKoxLpcllkiKOVzoDybuYer7smT1HB9PafnSDDHc
	yVBIBx0VJOoYFB8iAWtbh9DWUWI/z76PVauxDZAaSfdVaYSPWDCzwPu6kBWywA4As4egvjDN+XM9e
	4prNbSrWX7ecPiUByrEekyeljsjg6eajThe+mma5dTpOzGGgcYTZggwyaC/ghknBxrwM4Tzp9acZT
	itA1DUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWQ4E-00000002kBZ-0DdR;
	Mon, 08 Jun 2026 02:50:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWQ4B-00000002kAo-0EWe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:50:20 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf2247e38eso39533015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 19:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780887017; x=1781491817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fw5nXFVyb5GRYqiTkdD93jih+EMJUvklwZZGtUHOoyQ=;
        b=EOhu2d0OUQPsb0dWozBOKAPUqayTrbc6ekAwwqRN4hT/ci8nq4/XGFlM2alqnSSRoX
         UCDmWTHYqWywD7l2znpq/c2GoZhQ5MbgeuvB/6JEfGgoW6108D2+SHi2G7QROUaOK6bd
         EYPrLuQ5wDHkOcqMHfE57jci3niunkk0Ni+Su816+w1UlSYxGPPnacLdlKq7YAzq6JVg
         yjo9Ix9SyUQXuGuhKerNpIGKiaVxb/snv02FKJTfpMQysdN6fpvzWxDpsN7GkzpTM1XL
         g2OhOOdGat6z/fdrhfTJlQF4r2HeH4fr/TRoO647dmhsgQzOsysUTMSMmjdzc56+EC/F
         j42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780887017; x=1781491817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw5nXFVyb5GRYqiTkdD93jih+EMJUvklwZZGtUHOoyQ=;
        b=T3KQv8FK9Xu9r6gAkvTN/30QuxpRGvaQm4+Apa10FJGqR2CvUJh6F9u/DchPveaPMf
         +1IvPPJVvBH5ERyUo3RTrLt48udWbISSspdtkdLSc+LvHYFo1bWdxS9+MaB7S9Z1pXSa
         /15iyM9XDx5KxFojNaWvNS/zbrkg+tw4ExhQiriL757cnfoXJC2RMS+nYJ3lirTja0gR
         RumSBrDj74DFRtfUL6CaXOUmBK3g1vS7hJcM27mzEMG+xFlh6hg1pD/yLOji7U5qP4mc
         KGPdDBwbmB0W5YKKuy81haJRv2vs4CrLS3ud5kjiv12GjpcBnw0yaD0lPEkoeGYbKz9b
         RqHg==
X-Gm-Message-State: AOJu0YxQ1YVPEHqS5ZvhLDO4C9EwkwMUVdrgQHOkM83R+utyTP51hSTn
	UDCzrI63sW6sR+fe87mNqf0cTrMwPO5voBNMmNs9DtcE3We1wArIYmey8hqklg==
X-Gm-Gg: Acq92OFfIi6H3rSVRyDXmUEnuHjEo8ehOywUYgUdsL5Inls0VU1j4njswPMYNiIxdgf
	+d9YN/coFASrd+U/AKUHFgv1s6nVzfc04xky4gIjD19VMv66XjTrwt3tVVsTh6RbJy2xUO8Z+s6
	3MSyLS667Ln81/W4VKHvhaOOkLTgkXxtcXhoijYrDTXUxfz7xI/mira1FoIlGnoz4Yb/gKJ4hq3
	kP0RVL112ulaNeYqb+oRaL1ko5ilWgFBbGMuawfJhI5QRzeYZsg88Vo9SohkyEzpqB4DpCiqCn9
	2xbIeU3Owql1ArG/7BTjHPY9NlrFbvJ+MhO7l/gncczRKMomWAzJ8WE3X4Z39iL33giXFeQ97lr
	Mg0G9wKGyzzmwX15pTNTvfLaaZDKhi6IfXQ5VNM0Pw4dg3FNK56/NN+dvM7PlAFRdh0Hl/cSz7f
	wNR63/NvErWuiaUGkZphzf+yNzwVbcnsueEjKVeNG0ySTeC4exJcqzEmXuBBCofnJfK2800mZh0
	CIEezhcduUMmolbNvg=
X-Received: by 2002:a17:902:ccc3:b0:2c0:c38d:9d37 with SMTP id d9443c01a7336-2c1e849534amr141810325ad.25.1780887017485;
        Sun, 07 Jun 2026 19:50:17 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm165745555ad.3.2026.06.07.19.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:50:15 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
X-Google-Original-From: Chi-Wen Weng <cwweng@nuvoton.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: [PATCH v2 0/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller
Date: Mon,  8 Jun 2026 10:50:07 +0800
Message-Id: <20260608025009.1504971-1-cwweng@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_195019_122667_CBCB47EA 
X-CRM114-Status: GOOD (  12.43  )
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

Add devicetree binding and SPI controller driver support for the
Nuvoton MA35D1 Quad SPI controller.

The MA35D1 QSPI controller supports SPI memory devices such as SPI NOR
and SPI NAND flashes in single, dual and quad I/O modes. This initial
driver implements a conservative PIO-based transfer path and spi-mem
operation support.

Changes in v2:
- Updated patch subject lines to match SPI subsystem style.
- Added commit message to the dt-bindings patch.
- Added ARCH_MA35 || COMPILE_TEST dependency to Kconfig.
- Expanded Kconfig help text.
- Converted the driver file header to // comments.
- Added reset control handling to the driver.
- Added resets property to the binding.
- Added num-cs constraint to the binding.
- Dropped the flash child node from the binding example.
- Used op->max_freq for spi-mem operations.
- Split low-level CS register handling from the SPI core .set_cs()
  callback.
- Handled SPI_CS_HIGH explicitly for the spi-mem direct CS path.
- Fixed spi-mem opcode transfer to use a u8 buffer.
- Limited spi-mem command opcode length to one byte.
- Forced spi-mem operations to 8-bit word size.
- Avoided driving bidirectional data pins during dummy cycles.
- Drained RX FIFO during TX-only transfers.
- Rejected invalid chip-select numbers instead of mapping them to SS1.
- Rejected unsupported dual/quad full-duplex generic SPI transfers.
- Fixed checkpatch style issues.

Chi-Wen Weng (2):
  dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
  spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller support

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  62 ++
 drivers/spi/Kconfig                           |  10 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1-qspi.c                 | 622 ++++++++++++++++++
 4 files changed, 695 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
 create mode 100644 drivers/spi/spi-ma35d1-qspi.c

-- 
2.25.1


