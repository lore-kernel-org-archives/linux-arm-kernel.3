Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C66FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SV1I/v/iKlHr4fJyFgei4IhQeXGMMlj7HID5DV29eSI=; b=iztx1a5tdigYOFAnjYrxkB/R88
	IE2wPfUYgaZuAnj2ich3U8z7JhpTXSxJ66gUTU74EmTO44TKinyM85C2sV2siXpoJS4KKpXNATFBv
	E6jsFjrVnWdW0Pye6EcaVf2mqVRrFu8UjlVNaGSPrFPu2DW3yRRkAWUIn27Qsd+Fa3IACmjJoxMBi
	UGiw/Fj1QD4Lq/If+ZNoxnGUgIxL/HOmpY8Pd7738ZUjPGDgQfoshbWrUkpyiXTWhe55sBHlFDCy1
	B5D7as1nBWffT+rG0b6FaL1kWwnD5mQFTglRFjFwJ94RoNmjuoSbY0FV1SKhkBm6jts35Son9Tk9K
	Xub6EEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KH9-00000007uCG-3zmC;
	Wed, 23 Sep 2026 10:32:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KH6-00000007uAZ-2c7i;
	Wed, 23 Sep 2026 10:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790159546;
	bh=MlU0I3ZU5CQhUEWmtUjU7hoUECBy7HNDtouJfvmnWUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G35gyO8T4XqhIR9m+aMzGaE5wPpF4m5NrBZhNhNlw3PHqY3zE4WuJ6smI+aZu/tzg
	 RGAPuSLy7FonLOg0XxEIVT9KIwoQ/Ds0h9NRx9tc2Osn84prWuQi68fn/bERSUlNst
	 0vLYo46nZyowmK/2Oi9fopr1WgEVpJLB1bBR/BLH1wt0O3LoUiH/HN+YEgWPu67YLL
	 1aghRxhNBEUV4/j0Woqoaft0o4GZd8oVdx6tPIBBCTZCfWW2DCzP6t7PmTk4Os9j6S
	 pkXM4GoQVM6MG8kQ7OP/5ON47WNtvb5McH8uV6kzlimQ281Q1G6VXc8/XyYMr9j2Y4
	 5j5A1jxQXAWSQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E006717E0104;
	Wed, 23 Sep 2026 12:32:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.4
Date: Wed, 23 Sep 2026 12:32:06 +0200
Message-ID: <20260923103222.25504-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
References: <20260923103222.25504-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_033228_806431_065D43F2 
X-CRM114-Status: UNSURE (   9.33  )
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts32-for-v7.4

for you to fetch changes up to 2e195497fc9fc0dd89cf95dab80a2d0486dab65b:

  ARM: dts: mediatek: Add basic support for Amazon ford board (2026-09-10 16:41:20 +0200)

----------------------------------------------------------------
MediaTek ARM32 DeviceTree updates

This adds support for the watchdog found in the MediaTek MT8127 SoC
and a new devicetree to enable basic boot on the Amazon Fire 7 2015
tablet using the MT8127 SoC.

----------------------------------------------------------------
Zakariya Hadrami (3):
      dt-bindings: arm: mediatek: Add MT8127 Amazon ford
      ARM: dts: mediatek: mt8127: Add watchdog support
      ARM: dts: mediatek: Add basic support for Amazon ford board

 Documentation/devicetree/bindings/arm/mediatek.yaml |  1 +
 arch/arm/boot/dts/mediatek/Makefile                 |  1 +
 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts   | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt8127.dtsi              |  7 +++++++
 4 files changed, 63 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts


