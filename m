Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74349C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 19:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1h4OjIZuFRylghiUSJ61WRRPaolfYxZwgTgYYlB0hFY=; b=cktycKdyCM2vVM
	SN0Lt4XnvvCKP8XVJp5jcsjmoDa3rTIFAr+j2BeuJKWThxJpOBCjW4Bnqe4yeNrGUkuVZEOZ03GKV
	+yobtO0ck8g4m32HNTgFxkV6k304YM2oIVl3/yt03sMOYcdUKFRO4WoeF6QqqUi/qWNdSgmbCrdCi
	a5myixVQeIexEtFVeV42L6cfOJZg/fbEBqadtKt0pOe0JEAT4xQzvnvyWGriMtTE/JwOYNrJvUGkL
	LUtWZ0ZGehAFPNmIyKU1jlzfd375HY4O9xomGunZYY2imPLJAOcxTUxCScbMVJZBSZp4D4CBXjxmi
	epz3FtFE+CQU4PLXnKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws45R-00000006aFH-2XCh;
	Thu, 06 Aug 2026 19:49:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws45O-00000006aEX-25eo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 19:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1h4OjIZuFRylghiUSJ61WRRPaolfYxZwgTgYYlB0hFY=; b=lZ9YQjxeiaWaUjjVX6fxuA5EEu
	IltmYR0brGodCbOJ9SchxobOgY83NrNNkZFQhGN2Ji9U1+cZydkTmRnfnsL7xG45o5rnC5uENv3Ph
	nsfXr/tYSpYgwD5o1fEqMy73YkP0kLRWSchLrGm1ZZ58K8ooZMgZFxluX+K7KgEl9GrAQUmvssBwk
	39jHX2KBC00JbTrBCAQz6/YqS095hezbaFs1RrWGKrRARcDUjhrxmh2YQbcaWdQVNBvNsbVVh732W
	BaPOGc0//XH3+syc6AtMppUpPwT+HHjNMSvy6vyiS0mEXW/TqAk/IIxLoFwruh8aUL9Ket5o5fbNp
	vmbmg83Q==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1ws45L-0000000BnVY-0dd3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 19:49:01 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 62177424C0;
	Thu, 06 Aug 2026 21:48:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoRJ2Hp6m-Kq; Thu,  6 Aug 2026 21:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786045735; bh=raI20MrYlOu6bLFM+HE81jC5KZTY1Ni31SmKyPR9uWk=;
	h=From:Subject:Date:To:Cc;
	b=DcDvUe2M5V+ZrKuu9SETkKfZ/+xp4UH+QZhsw2cGbsqqKREIL4DNfcvSSksQUL2Zy
	 KJ9kVCgXawBBXKkSRGjswl24YKyUs3AAD5InSoOsn+/zKQPcRWuiFyHP4gF8eM+iwg
	 q0whXyEwkq5tww+Tzz1zyQXqpQejp7C9YTbwXUE019tOUvXnbBZ1yxQDTyYDuvOCbO
	 JL6R2DrfKa/jizTlhYwcn+L1PVWsLUiBSEYC0YMIOkvu7AJuJJtVxhzJO6zv2kv1aA
	 kl5z31eNF+UfJ0OrzJ/HJ5qJq6TpiJraVIPMajYczZm/pjtbNfqFPxvHf8KqHLiQZd
	 6//pw9IGPrsLQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v4 0/3] Add Sharp GP2AP070S Proximity Driver and enable it
 in Galaxy J6 (j6lte)
Date: Fri, 07 Aug 2026 01:18:40 +0530
Message-Id: <20260807-gp2ap070s-v4-0-74f6a67b6272@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ7CIBQFr9KwFvOBVqwr72FcUPi0uCgN1EbT9
 O5C3dSoy0nezJtJxOAwklMxk4CTi873CcpdQXSn+hapM4kJB34AyQVtB64GkBCplQiMQy1BVST
 th4DWPdbW5frmeG9uqMccyIvOxdGH53o2sbz71Z0YBdoctRKq1AyMORsXg/fj3oeW5PLEN65gW
 5cnlzXGIoI0FapvV/x1RXINs5VGbWuL8tNdluUFDkddWS4BAAA=
X-Change-ID: 20260723-gp2ap070s-f7e0120970a5
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_204859_373177_7AC2E188 
X-CRM114-Status: GOOD (  13.15  )
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

Sharp GP2AP070S is a promixity sensor (NOT an ambient light sensor) in
mobile devices. This sensor chip is found in mobile devices, including
(but perhaps not limited to) Samsung Galaxy J6 (codename: j6lte).

To the best of my knowledge, there's no public documentation available
for this device. [1] is a downstream kernel implementation, which has
been the single source for developing this driver. Some bits have also
been stolen from existing GP2AP* drivers available in iio/light.

The last patch in this series touches the device tree sources to add the
light sensor node in j6lte. This needs to be accepted into next only
when the former patches are in next.

[1] https://github.com/Exynos7870/android_kernel_samsung_universal7870/blob/lineage-16.0/drivers/sensors/gp2ap070s.c

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v4:
- Clarify non-mandatory vled-supply commit message (Krzysztof Kozlowski)
- Simplify driver probe return paths (David Lechner)
- Rephrase fsleep() usage to use unit macros (David Lechner)
- Use regmap_reinit_cache() instead of regcache_mark_dirty() (David Lechner)
- Use regmap_assign_bits() instead on branch on regmap_{set,clear}_bits()
  (David Lechner)
- Drop redundant explicit cast to u16 (David Lechner)
- Replace (1 << 16) with macrofied BIT(16) (David Lechner)
- Add max_register to regmap config (David Lechner)
- Add upper byte register for proximity distance volatile registers (Sashiko)
- Return 0 instead of IIO_VAL_INT in iio config write calls (Sashiko)
- Add REGCACHE_FLAT to regmap (Sashiko)
- Link to v3: https://patch.msgid.link/20260731-gp2ap070s-v3-0-d1f5cecf9fe7@disroot.org

Changes in v3:
- Revoke stale patches sent erroneously, v2 changelog applies
- Link to v2: https://patch.msgid.link/20260731-gp2ap070s-v2-0-1bdfee07d5ea@disroot.org

Changes in v2:
- Reshuffle and add missing header inclusions (Joshua Crofts)
- Add missing regulators in driver and dt-schema
  (Joshua Crofts, Jonathan Cameron)
- Rename and rearrange register addresses, masks and values (Jonathan Cameron)
- Use regmap_get_device() for carrying dev pointer (Jonathan Cameron)
- Use FIELD_GET() instead of !! (Jonathan Cameron)
- Drop unused i2c_set_clientdata() (Jonathan Cameron)
- Use fsleep() instead of usleep_range() (Jonathan Cameron)
- Check if proximity-near-level is available before reading its value
  (Jonathan Cameron)
- Drop redundant dev_err_probe() from devm_request_threaded_irq()
  (Joshua Crofts)
- Use mutex guards for guarding concurrent read/write calls (Sashiko)
- Add reset chip action on removal (Sashiko)
- Ensure input value in iio_write_event_value() is 16-bit (Sashiko)
- Use regmap_bulk_*() instead of regmap_raw_*() (Jonathan Cameron)
- Hint volatile registers for regmap (Jonathan Cameron)
- Link to v1: https://patch.msgid.link/20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org

---
Kaustabh Chakraborty (3):
      dt-bindings: iio: proximity: add Sharp GP2AP070S proximity sensor
      iio: proximity: add driver for Sharp GP2AP070S proximity sensor
      arm64: dts: exynos7870-j6lte: add Sharp GP2AP070S proximity sensor

 .../bindings/iio/proximity/sharp,gp2ap070s.yaml    |  60 +++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  55 ++-
 drivers/iio/proximity/Kconfig                      |  11 +
 drivers/iio/proximity/Makefile                     |   1 +
 drivers/iio/proximity/gp2ap070s.c                  | 491 +++++++++++++++++++++
 5 files changed, 616 insertions(+), 2 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-gp2ap070s-f7e0120970a5

Best regards,
--  
Kaustabh Chakraborty <kauschluss@disroot.org>


