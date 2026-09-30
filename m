Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A024ACA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+0BZdGRdvEFmuDuVk4rhgJ6D4Ekp5JlHxfNwF559ihs=; b=pOlaxRt3754ns8mFkzOLfpKRnd
	hZDngIXsytPuN1f2lOp6sTBzb1/6lOxlA6GwnJJpLs1Hryx1IuV+MjBwrdBW1McVJNHibTqxtNZw9
	UR+yc1Q+Nj7WHjCDf14zDDFFmm8vamTRVNOLMy7Fcxq973YcoRTzGRRTNSDjcl/njxR50xGgJ1/Q9
	DnF2GGrp0rpmxP6C1nLajLQf9+Nwn7lg8rfRfVMR7S+BO5Qw5bKL+YuSqld81X56GNngE8j5dyLkf
	z0aEmioAfbNeuTONwdEu7tYEvnj09g4I4jIOF2PkzhONiUCwyw3Af2miD/O+MPrNvUVasqFxztDJc
	y2+FM6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwq6-00000006dXm-2wen;
	Wed, 30 Sep 2026 16:07:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwpp-00000006dQC-0eaF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 16:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+0BZdGRdvEFmuDuVk4rhgJ6D4Ekp5JlHxfNwF559ihs=; b=g+pKUrnTsVzrcA1oCma1X2arGz
	XucrmaYjOVBOlvCQqyGAzT88lRcduPQUxslibdDfLdQ8VoKI4+eMyVuJsDtG/NW/lBrk1PkDDDgEe
	C3u623HgZyJ2/47FjNSBxIfSthORUGXNfdll8DkkShdtg8sQWQqVqX/hSzxgL7aL/3XJ9aT2wgTwD
	VIYWNkyOkQEHzDCbLF7L796eaN4/932qSbGtQtHT4ZItKxL12a/ZszyoxaVyERZRRRQzc2vMQ4ds+
	ZyKYT1oKF2WWpM1OpQ1zI9yCexeiCfxBYCJ0vcOPo8BeRF1XskCpo+fxsz07yfADneO0vlSM+USt2
	4nKjmisA==;
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwpl-0000000434t-3qEO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+0BZdGRdvEFmuDuVk4rhgJ6D4Ekp5JlHxfNwF559ihs=; b=Mjrq401IxyYujswkhyiFsQFv8+
	WKDTI7ujJxWADS74sjQSEeW/A9Sw8kRQ1229jxZsqisEIB5vXNEaGKEn5J7u1kSRwtFaXcIedY2Cc
	cHtAScTvu+9JDboFmqCOBU5Gp7xpFu8q4QmZCRTCClwBUfz8/edfn3IdektdgxXE4JYJn7ZhsAQh/
	xGIkq+eCfKEJGBwuJCS6oEynz/T15HerHsLjelfIBgiYRW7AjGjshrM3GGxFsDNKcNQeglf56Rv2C
	u25SVJ8k8Iosuz1RmVDBXvQO/n3AVcZB9/0fDngCMsX+cUU9VS0bJyEOxAKMNNeFomNZpDiljF4BQ
	EnBVFTdQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <fourdollars@debian.org>)
	id 1xBwpT-009IoV-0c;
	Wed, 30 Sep 2026 16:06:47 +0000
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v17 0/6] spi: pxa2xx: PM fixes, teardown overhaul, and LPSS restore for MacBook8,1
Date: Thu,  1 Oct 2026 00:06:23 +0800
Message-Id: <20260930160629.1822-1-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Debian-User: fourdollars
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_170706_004960_BF240DF0 
X-CRM114-Status: GOOD (  14.41  )
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

This series addresses power management, interrupt synchronization, and
S3 suspend/resume issues on Intel LPSS SPI controllers, particularly
focusing on making PIO mode robust and enabling reliable operation
for the SPI keyboard and touchpad on Apple MacBook8,1.

Patch breakdown:
- Patch 1: Rename status variable to ret in pxa2xx_spi_probe(), suspend,
  and resume to align with coding standards.
- Patch 2: Introduce serialized clock enable/disable helpers with clk_lock
  and a clk_enabled flag.
- Patch 3: Guard MMIO register access in ssp_int() by acquiring an active
  PM runtime reference, properly distinguishing suspended state (0) from
  RPM disabled state (-EINVAL), and synchronize probe IRQ registration.
- Patch 4: Overhaul teardown and suspend sequences to ensure in-flight
  interrupt handlers complete before the SOC clock is gated.
- Patch 5: Restore LPSS private registers and deassert functional, APB, and
  iDMA resets across S3 system resume in the PCI glue layer, scoped to
  Lynxpoint-LP (is_lpt), taking the register snapshot after the queue is
  quiesced, restoring registers and deasserting resets before power/clock
  resumption, and disabling D3cold during runtime PM.
- Patch 6: Disable DMA channel allocation to force PIO mode as a workaround
  and keep the controller in D0 specifically for Apple MacBook8,1 using a
  cached PXA2XX_SPI_QUIRK_NO_AUTOSUSPEND quirk, resolving DMA timeouts and
  eliminating 60-125 Hz input latency spikes while keeping safe autosuspend
  configuration in sysfs.

Changes since v16:
- Series restructured to 6 patches:
  - Merged runtime autosuspend lockout into the MacBook8,1 DMI quirk in
    the PCI glue driver (Patch 6/6), avoiding any generic core driver
    pinning.
  - Used PXA2XX_SPI_QUIRK_NO_AUTOSUSPEND in struct pxa2xx_spi_pci_config
    to keep MacBook8,1 in D0 without calling pm_runtime_allow().

- Clock management helpers (Patch 2/6):
  - Documented that pxa2xx_spi_clk_disable() provides idempotency to
    avoid Common Clock Framework underflow warnings when removing a
    device that is already runtime-suspended with its clock gated.

- Interrupt handler and PM synchronization (Patch 3/6):
  - In ssp_int(), distinguish between RPM suspended (return value 0)
    and RPM disabled / !CONFIG_PM (return value -EINVAL), servicing
    interrupts when RPM is not active and guarding pm_runtime_put*()
    with active > 0.
  - Dropped redundant lockless pm_runtime_status_suspended() pre-check.
  - Pair READ_ONCE(drv_data->clk_enabled) with WRITE_ONCE() updates.

- Teardown and suspend overhaul (Patch 4/6):
  - Documented that pm_runtime_force_resume() failure returns immediately
    without resuming the controller queue to prevent queuing messages to
    unpowered or unclocked hardware.

- LPSS S3 context restoration (Patch 5/6):
  - Renamed 'is_lpss' to 'is_lpt' in struct pxa2xx_spi_pci_config to
    accurately reflect Lynxpoint-LP scoping.
  - Verified structure packing with pahole (152 bytes, 0 internal
    padding holes).
  - In pxa2xx_spi_pci_suspend(), quiesce the controller queue with
    spi_controller_suspend() before capturing the LPSS register
    snapshot to ensure registers are in a clean idle state with chip
    select deasserted.
  - In pxa2xx_spi_pci_resume(), restore LPSS private registers and
    deassert functional, APB, and iDMA resets before calling
    pm_runtime_force_resume(), guaranteeing that the controller is out of
    reset before the clock is enabled and eliminating the shared IRQ
    window against unclocked/reset hardware.
  - Eliminated dead was_suspended branch in resume and kept clock helpers
    static to spi-pxa2xx.c.
  - Added pci_d3cold_disable() in probe for Lynxpoint-LP to guarantee
    registers are retained across S0 idle states.

- Apple MacBook8,1 Quirk (Patch 6/6):
  - Added 'quirks' field in struct pxa2xx_spi_pci_config placed right
    before 'is_lpt' (152 bytes, 0 internal holes verified by pahole).
  - Cached DMI match once during lpss_spi_setup() to avoid duplicate
    scans.
  - Documented forced PIO mode as a workaround for EFI leaving the
    companion DMAC held in reset and unrouted DMA completion interrupts.
  - In pxa2xx_spi_pci_probe(), always configure autosuspend delay to 50 ms
    and arm pm_runtime_use_autosuspend(), but conditionally skip
    pm_runtime_allow() when PXA2XX_SPI_QUIRK_NO_AUTOSUSPEND is set.
    This keeps the device in D0 by default while ensuring that if userspace
    enables autosuspend via sysfs, the safe 50 ms delay is preserved.
  - Maintained factual documentation reflecting OS parity (macOS Big
    Sur and Windows 10 Boot Camp) and logic board schematics.

Shih-Yuan Lee (6):
  spi: pxa2xx: rename local status variable to ret
  spi: pxa2xx: introduce clock enable and disable helper functions
  spi: pxa2xx: acquire active PM runtime reference in interrupt handler
  spi: pxa2xx: overhaul teardown and suspend sequence to synchronize IRQ
    before clock gating
  spi: pxa2xx-pci: restore LPSS private register state across S3 resume
  spi: pxa2xx-pci: disable DMA and runtime autosuspend for Apple
    MacBook8,1

 drivers/spi/spi-pxa2xx-pci.c | 212 ++++++++++++++++++++++++++++++++++-
 drivers/spi/spi-pxa2xx.c     | 177 +++++++++++++++++++----------
 drivers/spi/spi-pxa2xx.h     |   6 +
 3 files changed, 332 insertions(+), 63 deletions(-)

-- 
2.39.5

