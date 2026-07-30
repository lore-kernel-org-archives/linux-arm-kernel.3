Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC0CC5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 20:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f2XvXlbbX6Elf6S/5lAoRNdRnwoLpgzds4gN/gbt0HI=; b=O8vC7NTu/hzh5+
	p9Nwj9ZPHG4yv2LHQE9h5idM8xieea4JSq8ZQlMddHoBw4t+/ozXulCj/h1wyxSP6UpVMSFNFtX+A
	NCBdnV+rFht9JBNHUmEY35WIMXBouhuqw9IIxz5XoJSzmtYa2CzoLOJoxJjVuD+fDIMA02+sujuRY
	bJxEZsIxwg2mt4xPnmGsPgf1ia7SS838kDicPyGvy8SGddDezUNigTTGMQHrEPHRrn5YMq3Jz/jP+
	gNI6RUWeL+eJ7IzS1gQhHiMKyBVtqM8KJkpLxYJaiDIejYqLZspgnOOg9ZZ0U6zx6Q7Id7243CRVE
	ZfczWVymg8wb5zyDUftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpX2B-0000000BIKt-2b6v;
	Thu, 30 Jul 2026 20:07:15 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpX29-0000000BIKL-0z7D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 20:07:15 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7662F847ED;
	Thu, 30 Jul 2026 22:07:11 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGyFMOuAgvrF; Thu, 30 Jul 2026 22:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785442030; bh=pbP1Mw0hqJriVsJNj78DV1NDIDK6RHyzUByOUzW4gcQ=;
	h=From:Subject:Date:To:Cc;
	b=JRNNL+Xzb5wzfm1TLJH7CzauBNoKJ9NuilMq8fqqBxRGgjnSUv7C/FIUHJx1+sBTF
	 7c6lrXTv8QK0r9ppZk0whl5UtDsbPNj3H6jOZUKTqD3hR8/5J7Rdsi/hokRVVIEPtt
	 lJ7FJg+hj+RKrg2cvqEVcPQeuwgRmQ+zLuwHQSZuftZDpSWSJu44PFyR7/qQ2Sdvzx
	 KNUacVYc2sMN1gx7TQjPhPgfQXqjLzj1QyN51p/j8Rh66U8+upxVAdAqcZwpe/yR2O
	 E9o1GwrRvtbHuTv8MQQEGkNvdOKDsLKBxZFoEDRxw93/tZQ1111t5hc0BVciiwWQ9H
	 A5dIZf/A+2jFg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/3] Add Sharp GP2AP070S Proximity Driver and enable it
 in Galaxy J6 (j6lte)
Date: Fri, 31 Jul 2026 01:36:59 +0530
Message-Id: <20260731-gp2ap070s-v3-0-d1f5cecf9fe7@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ7CIBAFf6XZs5gFrKgn/8N4oLBt8VAaqETT9
 N+FeqmJx0nezJshUnAU4VLNECi56PyQQe4qML0eOmLOZgaB4ohKSNaNQo+oMLJWEXKBZ4W6hrw
 fA7XutbZu9y/HZ/MgM5VAWfQuTj6817PEy+5fN3GGrDkZLfXBcLT2al0M3k97Hzoo5SQ2ruRbV
 2SXN7YlQmVr0r/usiwfH+Pf+PIAAAA=
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
X-CRM114-CacheID: sfid-20260730_130713_418718_99B6E8E8 
X-CRM114-Status: GOOD (  13.30  )
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
 drivers/iio/proximity/gp2ap070s.c                  | 505 +++++++++++++++++++++
 5 files changed, 630 insertions(+), 2 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-gp2ap070s-f7e0120970a5

Best regards,
--  
Kaustabh Chakraborty <kauschluss@disroot.org>


