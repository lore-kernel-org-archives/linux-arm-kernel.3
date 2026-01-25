Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F38CE63C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DFPjKz3IqMWFjt4Rn+a1wnSK/6MA5d2E3tqnIhACUgU=; b=X7vwQuDaVNvQy0Egs7XNpEpKwu
	sEJrA55ZJ101jY+DQ+Lg5PGUl6x2waLvQB5Gve9PK0KrjRSmUnwtMDPjfIJZG16zNwTJxGm/Aav/1
	wbRWO+6kLqFXcUQrgffernnuVQ7Q44Sv3GARbVKc+o72EcOxcb5iF545vgy1EZhuk+jjSIJF4GFxD
	JS17NuTYKrQ7oznBYZE8g4iIwApPddTNUug0XIUE7knOkGvSOr2pDej2eicHrWgfbPuogXi3kq/9r
	vngG0EU2mH1Ci9IXXE+nFmW6HQtDSEH0afZg2+lbkh9xSVnarDyWQQdbiNlnKXFlzg/3ZQnPSAglH
	QtuZZHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjzoD-0000000BBJk-1hmq;
	Sun, 25 Jan 2026 13:05:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjzoA-0000000BBIP-0I9X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 13:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 150884405C;
	Sun, 25 Jan 2026 13:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9D50C4CEF1;
	Sun, 25 Jan 2026 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769346334;
	bh=3nVJfHoPeIK1kwbJp85jAtXyh/3kl/mn5dtmy7TOuao=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=l5Ngo5pYqzrq0r4RytKaCaq38TZovoV1p/C2/tuzvHGsorbTOJ87tgWUS+L5V2/18
	 OJFDRp6hmHAJhnrucJqKPnEgFosKUwOPLcMWIVSE8kS8vSqkgM2PclZ90XCMF72Vyu
	 0kMDYcNE76EfSG5HtzZPoCfFM3jzj1RAShpdX7KQATmyA5rTXUJeKSQhcl4R6XGtXs
	 QYTft2nMKrnBp4OKPaqFim438ZIE2tQUrsUh6bybBpxRKcZhnNuAlnRUDwG/lOG+H3
	 6SnMtuBlYNpaf53aYa4Grwf+awtMyoPXFhctJAmGD/+bnRK3aQEI3KrA0cMOfYcgpc
	 fff7xUQxFtPEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FB0E63CA2;
	Sun, 25 Jan 2026 13:05:34 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] (no cover subject)
Date: Mon, 26 Jan 2026 00:05:19 +1100
Message-Id: <20260126-b4-macsmc-power-v4-0-aa2a682ca650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABAVdmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNT3SQT3dzE5OLcZN2C/PLUIt2kJGMDYwvLVAPTNEMloK6CotS0zAq
 widGxtbUAXSi/4mEAAAA=
X-Change-ID: 20260125-b4-macsmc-power-bb30389e05f1
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>, Joey Gouly <joey.gouly@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769346333; l=3237;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=3nVJfHoPeIK1kwbJp85jAtXyh/3kl/mn5dtmy7TOuao=;
 b=f9YdilHx6WpwE5bb46PjUgNU7L08sOqM5p/8Q9JPHM5B9FvkIYtQmOg20dkPEpoBQEwM58ZLu
 dqpUzgNEQk5B6TfMg3i/+YeSnSVeYF8d3cXQQgLZoiuhNNf0cUgDHnI
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_050538_185243_8B00FED4 
X-CRM114-Status: GOOD (  13.81  )
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds a power supply driver for the Apple SMC found on
Apple Silicon devices. This allows the kernel to report AC status,
battery charging status, and power metrics, and modify the charging
behaviour.

The first patch adds the driver itself, and the second patch wires it
up to the MFD core.

The driver is based on an original out-of-tree implementation by
Hector Martin. It has been refactored by myself for upstream inclusion, 
including support for newer SMC firmwares, devices without batteries,
dynamic property detection and improved state management, among other
things.

This series is based ontop of the current linux-next at time of writing,
the exact commit hash is listed below.

Tested on: Apple M3 (MacBook Air, J613)

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
Changes in v4:
- Restore Hector Martin as primary author for the series.
- Restore downstream Co-developed-by and Signed-off-by tags.
- Add Reviewed-by: Sven Peter <sven@kernel.org>.
- Simplify MFD patch authorship and remove redundant tags.
- Fix probe return value being overwritten by devm_work_autocancel.
- Return -ENODEV in probe if neither battery nor AC adapter are found.
- Add bounds check for nprops against MACSMC_MAX_BATT_PROPS.
- Refactor macsmc_battery_set_charge_behaviour to remove unnecessary resets.
- Improve critical_work shutdown flags and remove return.
- Add comments explaining SMC key firmware history and flag meanings.
- Clarify event ID descriptions and restore BSFC flag comments.
- Remove redundant dev_dbg logs for missing battery or AC.
- Link to v3: https://lore.kernel.org/r/20260115-b4-macsmc-power-v3-0-c236e09874be@gmail.com

Changes in v3:
- Rebase on top of latest linux-next
- Drop charge control threshold properties.
- Switch to devm_work_autocancel() for critical work.
- Add platform ID table and remove MODULE_ALIAS.
- Simplify property array management in struct macsmc_power.
- Improve probe error handling and device pointer usage.
- Minor style and indentation fixes.
- Link to v2: https://lore.kernel.org/r/20260109-b4-macsmc-power-v2-0-93818f1e7d62@gmail.com

Changes in v2:
- Added Reviewed-by: Neal Gompa <neal@gompa.dev> to all patches.
- Fixed Makefile alignment by using tabs for the macsmc-power entry.
- Upgraded physical battery exhaustion log level to EMERG.
- Downgraded software-triggered orderly poweroff log level to CRIT.
- Added check for CHIS key to skip AC registration on desktop models.
- Link to v1: https://lore.kernel.org/r/20260105-b4-macsmc-power-v1-0-62954c42a555@gmail.com

---
Hector Martin (2):
      power: supply: Add macsmc-power driver for Apple Silicon
      mfd: macsmc: Wire up Apple SMC power driver

 MAINTAINERS                         |   1 +
 drivers/mfd/macsmc.c                |   1 +
 drivers/power/supply/Kconfig        |  11 +
 drivers/power/supply/Makefile       |   1 +
 drivers/power/supply/macsmc-power.c | 851 ++++++++++++++++++++++++++++++++++++
 5 files changed, 865 insertions(+)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260125-b4-macsmc-power-bb30389e05f1

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>



