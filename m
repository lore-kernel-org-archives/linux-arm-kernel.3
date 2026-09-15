Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52013C982C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lEu2X9xUZn6AY6NFU/ItLlDKrwVO1WDx68IP+NIvpIA=; b=iymCFM8LvtOSI7
	Q9mF2hvaqqChsOuIenjoRtvcn00xYRQbuj/3ahsnywaqDI+Ulrf9oEcAL6Mom2T0U4oUCCm9U7Chw
	hQ2NzhrQ5UM/0cQzs6ouP5D2fgPLI3WnRp9vefxp5fjzeIXEg1/tR0+bMjrVXiFUaPIOwNVhHzcH/
	23psYFHvXFrp1mZEWOgsstrehh8PF0EmJLM6tuEbGfcA3aAdt+I+FLuhHS8lV+sJHedzXa4etFSJ5
	5jMuv+HEOo1gmHwb04+MEz2H61xGkiZz8SmCJVI2Hh1roWnQ8yOvA6pgzip2jKNdE2cq8Xaw7v9wh
	jnIDH8kFYLk5i37ItywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Uvb-000000078Vt-1guG;
	Tue, 15 Sep 2026 15:18:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UvF-000000078Rr-35BB;
	Tue, 15 Sep 2026 15:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=lEu2X9xUZn6AY6NFU/ItLlDKrwVO1WDx68IP+NIvpIA=; b=LFYBnJuJMCUqtXyqru0ylQD0Dm
	/QBirFAjVt79PPkhwuuDy1/sg7qMxBojI2BmFkB26ejmcZSafoyrybAAIVmrGzLo4B7w6DF3QXjvb
	wFGyd8kiVFs6b3XSeDS6K37xBsx0kSWSybji4K22lWfSP6FLeaRcttaZg9nxA6N8fGfi8qQjLRJ+F
	HX3w+biTr75LfKjSD8faetJtuwf0hexOC98cVz6EZP/lHZ85YXxGK5TE1VoULrOueJf1FifwUbQ8k
	K06Njy3rhm/tuYuu/bP30NOYVfxuoNo/iGKO5r5xamlCOfK6s8RtTlEXG89YbLD7PbVyiRSGKFBIy
	bCOL85Vw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6UvC-00000006vkD-0eJw;
	Tue, 15 Sep 2026 15:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789485488;
	bh=jgdWifKPcWdMtqmrqZ3Slx0WzB872SaeXohnnWZg518=;
	h=From:Subject:Date:To:Cc:From;
	b=TGEJ7Wg05p6fh+Z8loFcMiM9GN5kHSCv/Jir9Tgk3zOHnZre4M/hKtBjn8HkTxUdZ
	 27qAXK6yKAq4M4v/hdmtY6qRB2a7STO+r2ry5HgnVWTzYLZB0iKIbMcptsMWWWqaB/
	 KE8tnmoQQJANTNf1oWo2Yw0GcEIO4Vd6q8w36vCxK7azB1Hin+zgnOf9M3GQg6nEqk
	 RPpVYjtklKtbh1MayUddWDVPX6kHBtpOnLyTZX7bMskPAgFJEcvS10OiJSyjs07JZf
	 kvtp/T82yXmvFgn7JUOLyQnjzD8fRM0azx5aC0b3xgFhOtSPihW3HSME6YZi8jMiPT
	 /8GkKxblGz87A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A6F417E015A;
	Tue, 15 Sep 2026 17:18:08 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BC02348002B; Tue, 15 Sep 2026 17:18:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/5] usb: dwc3: introduce Rockchip glue driver
Date: Tue, 15 Sep 2026 17:17:40 +0200
Message-Id: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ6CMBAAv9Ls2RpK0aZ8hXCAZYVVodgCmhD+b
 hUTj5NMZlYI5JkC5GIFTwsHdkMEdRCAXTW0JLmJDGmSnhOrMlln0ju8YcejbJ6o/9TeZ5LWWKq
 00acm0xAjo6cLv76Dotw5zPWVcPpUf4anxxzP065BXQWS6Pqep1ws5hgfqKDctjdAVniurgAAA
 A==
X-Change-ID: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2372;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jgdWifKPcWdMtqmrqZ3Slx0WzB872SaeXohnnWZg518=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpYa9phPuAtZmEodicGIBpyvzuNcZhYi3ZR
 CWpfFQoDysxz4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWGvAAoJENju1/PI
 O/qakiUP/1HqzGnpqVuhIU6EcsoD2XGnnvkaPnzhq/V0pnbVD2yTcaX4ddS3Ya4Z+RVBD0c3Ubs
 grubOhpN7meIkxoaiz3xozzR9hE0oAaLS6riZ1vIrBysjURQeHbrZlnNfPIGnzt5jVM+xQxhDH9
 KkIs8nDFqys0su6ayx7TMpARtNkVnbRXcQPxdgjlYFOD9SR66T0dHsP58EfVsMR2GOD6hK8A/hX
 2rgF26qhC2fllrZxRh0bvwfwl0xhB+yyvDQiyzSyy19b+7mPfBpqb4CgihisHaNTs15i2aJ4muy
 YEI0btSjA01P1hek/g7Im/o/84jWlECmrIXYgXm6YNFHY7+Vk479i1VgaQxMOFhODCNNCqR6np7
 PgEqdP3F3lh5hgTambwkvYZRx8rFJcYI1vahKFNBxYKhfrX0qkVb74r54ezNn3872kUcqt/Z1g1
 E9TbpcYrZFgNlrRmtYXqcwG+Q3ch5y54UFvTkg2LVPAKLfx4O7JD0F1Q6sNMrVh1Dt2gLRqWqpO
 satKM8/yzwNxxh6E+ZE6j2+2FIHF/Kr5kwkgeDo0BRDXxoYIyQDJCJ3OkXe+HkvmTRtssJ68A7I
 Rh9g+21m3arpO8qAc0bccgajwtYXVns98LZiX9O5P29i89xBTfPrLGAB2o2P+PWPka9l+eypAn2
 MA4o7Qw1hruyNTHGcG2UqfQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_161810_394975_BD91FDE3 
X-CRM114-Status: GOOD (  13.41  )
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

The recent Rockchip platform have a combined PHY, which does USB3 and
DisplayPort as well as muxing the lines in arbitrary order. Changing
its enabled functionality requires a PHY reset and as the PHY provides
a clock to the DWC3 controller, this can result in an SError. Apart
from that the PHY might not start up correctly when the DWC3 PIPE
interface is running. This series prepares a Rockchip specific DWC3
glue driver to help out with these problems. To become useful more
patches are needed on the Rockchip USBDP PHY side, which are send
separately.

This was split from the USBDP cleanup series. It has no dependencies,
but is required for part 3 for the USBDP cleanup series (which will
be the final part).

Changes in v15:
 - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
 - Avoid #ifdef for CONFIG_PM in the new glue driver (Thinh Nguyen)
 - Do not add #if IS_ENABLED around the DT compatible blacklist in the
   generic driver, using the glue driver should be mandatory as the
   generic driver results in arbitrary system hangs. Thinh Nguyen suggested
   updating Kconfig for this, but did not clarify what that means.
   Current Kconfig works the same way as the other mandatory glue
   drivers.
 - Split series to simplify review

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (5):
      phy: core: add notifier infrastructure
      usb: dwc3: rockchip: introduce glue driver
      usb: dwc3: core: add post PHY registration hook for platform glue
      usb: dwc3: rockchip: support PHY reset notifications
      usb: dwc3: rockchip: fix USB-C reconnect in gadget mode

 drivers/phy/phy-core.c           |  65 ++++++++++
 drivers/usb/dwc3/Kconfig         |  11 ++
 drivers/usb/dwc3/Makefile        |   1 +
 drivers/usb/dwc3/core.c          |  17 ++-
 drivers/usb/dwc3/core.h          |   9 ++
 drivers/usb/dwc3/dwc3-rockchip.c | 254 +++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/trace.c         |   3 +
 include/linux/phy/phy.h          |  40 ++++++
 8 files changed, 399 insertions(+), 1 deletion(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


