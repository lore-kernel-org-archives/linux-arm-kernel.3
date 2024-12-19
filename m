Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD18AE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OTdKfYb+8Y1xBkIw41y6+CRjHy9ofMzg8ufmjsX8Qdo=; b=Qe8Iq4icXzCJT1
	bfaHfbnWe7ssFukiETJN8taRVS+Q9BZ221F6Gy4gGDw0ZcUrXGn+ISPf96iNBXfRiBTDzZGlhohDh
	tmQUrMn0Nt/37is9bhef1l/7J9t/EWzlXOWcxGF8V2WhFnsKQ6ALk3SqnkkKn8BMXVdVZ7OgyQvcI
	hrrzTK3UBXkVQIHiReAcwDKikyiyA8iiHT7OkHuO0BlBlxV8SKN2B8K4/RWUJciLEih4JUQ2djE27
	eZySQzvcwgb4UMgjDc9m9jgEV1coUSxX8+PhOI7eFenRhplJJMjki6HVVzoRYnVr80naha4/FDgv4
	jDRtjRde9S78jWDSWooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFou-00000001pp4-2JHX;
	Thu, 19 Dec 2024 12:40:00 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFk5-00000001od5-0fDa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:35:02 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1tOFk3-0007aQ-Ra; Thu, 19 Dec 2024 13:34:59 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH 0/2] Add FRAM to Protonic MECSBC device-tree
Date: Thu, 19 Dec 2024 13:34:55 +0100
Message-Id: <20241219-mb85rs128ty-mecsbc-v1-0-77a0e851ef19@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO8SZGcC/x3MPQqAMAxA4atIZgs22FK9ijjUmmoGf2hEFPHuF
 sdveO8BocQk0BYPJDpZeFszdFlAmP06keIxG7DCWmts1DI4k0SjO261UJAhKD9SRIvOGltDDvd
 Eka9/2vXv+wHSs7tXZAAAAA==
X-Change-ID: 20241129-mb85rs128ty-mecsbc-adef26286564
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jonas Rebmann <jre@pengutronix.de>, David Jander <david@protonic.nl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=+WMW2ebbowXkN4ZB/PC4ZRRm2U9UUnYeE75YZN5laFg=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkhPEfp0zPAS381zKVE6R4xY7y9uf/fqovjV+2LvDZek5
 ulNC3aZ1VHKwiDGwSArpsgSqyanIGTsf92s0i4WZg4rE8gQBi5OAZhIoTPD/4wrEo5C4iYL2vK8
 29bb5Ju8fbSWncnYY76o3rKISz/qdzD8T1adIJryYfW+Iq1IZr/AhhcCtf7uEc8DTirqbTn5fu4
 hPgA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_043501_230678_8E9C84C4 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
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

The MECSBC single board computer is equipped with a Fujitsu MB85RS128TY
FRAM. This series adapts the devicetree accordingly.

Tested on current mtd/next which contains the required driver and
bindings update:
- 5b68d4d2db29 ("dt-bindings: mtd: mchp48l640 add mb85rs128ty compatible")
- 02ba194feacb ("mtd: mchp48l640: add support for Fujitsu MB85RS128TY FRAM")

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
David Jander (2):
      arm64: dts: rockchip: MECSBC: Remove i2c2 node
      arm64: dts: rockchip: MECSBC: Add FRAM MB85RS128TY

 arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)
---
base-commit: 47f34eab58294d7bb2583f9519b4022e74d56437
change-id: 20241129-mb85rs128ty-mecsbc-adef26286564

Best regards,
-- 
Jonas Rebmann <jre@pengutronix.de>


