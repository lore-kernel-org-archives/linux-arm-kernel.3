Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F71C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zHG1TEVzidZB3jJv+mxUjAITxuE7BNdYUm0NY7yc8I8=; b=1D4+Z9ZU/qu8K19sI2oTxU3iIC
	IUOJmd4dv7SgWqGHtRVdn/42kOW/fTH9uhFLsfJ37A8nK9n0UF+KgsfRkToq0hHmyf5HdIrU7aaEe
	/D+pCiv0xo2x8WxzQfc201GIDfe9r/5LELgcRibDL+ZYM0Zj/irZ6pSLH8HcZrdI41I43DoWQmFO/
	ozCvBD9x1sTesfEuceAXIs2Ih/BnFaqlq9BsCtjWiTarAFM8qYcLAREkhLW0bunN5GP+5ab5v9qdR
	hag4pFgn55ioNMVOG/wu3VwUuYHj6LCD5+uC5tmn0fFmq3kqe/gb+Bn0Pe29mAllGRyL/3p7ar0tO
	7q3nF+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5D3-0000000HUV8-3AwC;
	Mon, 28 Sep 2026 06:51:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5Cn-0000000HUPD-08D0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:51:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F579415B6;
	Mon, 28 Sep 2026 06:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBAD1F00893;
	Mon, 28 Sep 2026 06:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790578276;
	bh=zHG1TEVzidZB3jJv+mxUjAITxuE7BNdYUm0NY7yc8I8=;
	h=From:To:Cc:Subject:Date;
	b=DLZ4eoPXwN4hh2nj2PBY1DcnztaUGovFz2ht75A3YIDBI12I4OM98PZ5FyC1uCoYZ
	 w0yt8gloYIHQPMmjxJofGJJTwOJUT+X3+3k6VPutuGZS4KoIYmgIV2sM2pf3QBsahu
	 neoASyhbB8aF0P+JKR7BVSfIeFYU7zuXotb+WYJMi947CQFiYq6becB9095JB7MHx2
	 0ftks7G55lo/XqewNAsVqCwJDcwLnZ41oTWsfsltkjoNIl85b2hynTMlnB6Kt2xaOU
	 fpWYe7MFSfOEjgpuwNSFEpJPQx58khMs8YdgxkIcDxmFMRKWwISGVSUITY8pWOxg3+
	 r1gfAfOlSmA8A==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: SoC Team <soc@lists.linux.dev>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v7.4
Date: Mon, 28 Sep 2026 07:51:11 +0100
Message-ID: <20260928065112.2492223-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8
The following changes since commit 8544e0da1a04c77b98e2e313a423a5c72e48ea32:

  Merge branches 'for-next/ffa/fixes' and 'for-next/scmi/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux (2026-09-08 21:04:42 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.4

for you to fetch changes up to aac4e67d6eb93118cfa70c6562b5f9c81a7042ef:

  firmware: arm_scmi: Always create devices for standard protocols (2026-09-24 09:10:43 +0100)

----------------------------------------------------------------
Arm SCMI updates for v7.4

Add an ACPI PCC transport for SCMI. The core now propagates firmware
nodes and supports protocol-specific channel lookup, while the new
transport parses and validates ACPI _DSD mappings for shared and
dedicated command and notification channels. ACPI protocol devices can
be initialized without device tree child nodes.

Enable SCMI protocol driver module autoloading by generating stable
SCMI module aliases and creating standard protocol devices before
their drivers register.

Fix delayed-response completion and raw transfer reuse races, and
release a raw transfer on an error path. Also consolidate reset domain
information queries and use string helpers in SCMI trace events.

----------------------------------------------------------------
Bjorn Andersson (1):
      firmware: arm_scmi: Add SCMI device table alias support

Cristian Marussi (1):
      include: trace: Use string helpers in msg_dump trace events

Geert Uytterhoeven (1):
      firmware: arm_scmi: Merge scmi_reset_proto_ops.name_get() and .latency_get()

Hans de Goede (1):
      firmware: arm_scmi: Always create devices for standard protocols

Roland Dreier (3):
      firmware: arm_scmi: Protect xfer->async_done with xfer->lock
      firmware: arm_scmi: Don't reuse raw xfers with async_done still armed
      firmware: arm_scmi: Fix error path leak in scmi_raw_message_send()

Sudeep Holla (9):
      firmware: arm_scmi: Set generated device fwnode with platform helpers
      firmware: arm_scmi: Extend transport driver macro to support ACPI
      firmware: arm_scmi: Convert OF-only paths to generic fwnode in SCMI core
      firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
      firmware: arm_scmi: Pass protocol ID to transport chan_available()
      firmware: arm_scmi: Refactor protocol device creation logic
      firmware: arm_scmi: Add ACPI PCC transport
      firmware: arm_scmi: Initialise known ACPI protocol devices and channels
      firmware: arm_scmi: Validate PCC shared memory signature

 MAINTAINERS                                    |   1 +
 drivers/firmware/arm_scmi/bus.c                | 109 ++-
 drivers/firmware/arm_scmi/common.h             |  61 +-
 drivers/firmware/arm_scmi/driver.c             | 260 +++++---
 drivers/firmware/arm_scmi/protocols.h          |   9 +-
 drivers/firmware/arm_scmi/raw_mode.c           |  30 +-
 drivers/firmware/arm_scmi/reset.c              |  36 +-
 drivers/firmware/arm_scmi/transports/Kconfig   |  12 +
 drivers/firmware/arm_scmi/transports/Makefile  |   2 +
 drivers/firmware/arm_scmi/transports/mailbox.c |   7 +-
 drivers/firmware/arm_scmi/transports/optee.c   |   7 +-
 drivers/firmware/arm_scmi/transports/pcc.c     | 875 +++++++++++++++++++++++++
 drivers/firmware/arm_scmi/transports/smc.c     |  10 +-
 drivers/firmware/arm_scmi/transports/virtio.c  |   3 +-
 include/linux/device-id/scmi.h                 |  17 +
 include/linux/scmi_protocol.h                  |  20 +-
 include/trace/events/scmi.h                    |   8 +-
 scripts/mod/devicetable-offsets.c              |   5 +
 scripts/mod/file2alias.c                       |  12 +
 19 files changed, 1300 insertions(+), 184 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/transports/pcc.c
 create mode 100644 include/linux/device-id/scmi.h

