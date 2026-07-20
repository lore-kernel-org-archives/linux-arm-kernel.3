Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726FEC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a9LRxGwGHu7Bfp343r34r0exu/l22RtQgwhZHVkr/6A=; b=uBgS4oCWj9sKvKTiu2wvNMODVG
	Hcr0AEAOxO+FKXnkhFRUFtuTV3AZScwcBHlm5t93IJ8Rq6ha2Jqk12+rwU6kdtoJk5FUYweddbicF
	oXP8HlIL4cXR7YA0IJYkV/WK4aHbKc4nqB5O1CJxa91fQ6oIo2XDFBBWwpe4HhEfJJ50AsCXmtaRn
	iA6Qo9tXOftSBGSteUcZrcfaZFU4zQVhb6Bm2bhOoXA6uI+rP9ip/nzeKR0jlKR5+pRdFW/0agsYz
	nrBo22oXN0ZHPYlGBALKSHlbtDTU7ytuaQj3nvdnPdDjErCdRqhHKRe9c42RrCplZuMjpGhrsAxhz
	micNEDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpti-00000007BUG-12dP;
	Mon, 20 Jul 2026 15:27:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlptf-00000007BSL-1cdv;
	Mon, 20 Jul 2026 15:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=a9LRxGwGHu7Bfp343r34r0exu/l22RtQgwhZHVkr/6A=; b=D1rqGATd/xU7GExkLbm0mD6I5s
	xRQUGZ1+P0uRugQ7Wl805LNwjY0P4g/axAE/klC+zQpaEEKXtDB1CAoRl0YZr/8HiRi8m0myH7R4K
	QJAmTCl0H780KD7wc7Wq0VaddLEOQ2lJi4ltZK6BsciP/ao6tLck1Fg0h13gNPFrYg8/H7H8Q3TCZ
	5BXUSnR18l0BfCrZJV0AdwMwgKiaRDD5s8qY76bWsrFP/1Si5hriWtEjsgm+JQyZm+Nnrzje7jaKk
	5kqgFAAHGyBNW55724Bo3Ij32zj9Sp7Kuj7vEkumtqHeLdVYFneCGuRw0Oh6kckwKFp2MmCg0OFyC
	a40WhZYw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlptc-0000000GjSN-1G4R;
	Mon, 20 Jul 2026 15:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784561222;
	bh=35hr4J+NFCA7cxufBdyme31SBq+J2RcVLJka4TWE6y4=;
	h=From:To:Cc:Subject:Date:From;
	b=ofhvFz2t3jNVkEVqw7jhIzJT4Q9+WkzFu1MR4/aqsPr7uqn1siAcQk62xR7mOLy5T
	 wB1qbn2zMaF/0dZIZROnEHXgz18Xqe9ljrAufahL7Lmox3d1PriierAeCYBnb34PY5
	 7fbGXISlGnt50HKCigiYHwEvBcbPEkxuMUqLAg7IA92mkt6/1UxBohiF9eUaPon5Er
	 k6gdolc+LeGMbbJWljdh9xK9b733zwXmUhbikWM4d/c6Jd/V+fO6h+tbQx/xBFcNRd
	 O2OsdZ/hnOfvAhZFKY0mLNFeR8zpf/F6tZrWHQfK8xHpijp0ZmtpHlU0/oAcvDD2rV
	 8Jn3hMg1TrnOg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 42BF717E003B;
	Mon, 20 Jul 2026 17:27:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 0/2] PHY: Add MediaTek PCI-Express Gen4 S-PHY Driver
Date: Mon, 20 Jul 2026 17:26:52 +0200
Message-ID: <20260720152654.92216-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_162708_584762_B87BCEF6 
X-CRM114-Status: GOOD (  12.09  )
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

Changes in v3:
 - Allowed value 0 in calibration fields (as it's a legal value)
 - Fixed duplicated LN_TX_IMPSEL_{P,N}MOS writes
 - Allowed -ENOENT for nvmem_cell_read_u{8,16}() calls, as the
   calibration data is effectively optional
 - Removed two development stage leftover unused definitions
 - Moved num_lanes check in mtk_pcie_sphy_get_calibration_data()
   to reduce indent in probe function.

Changes in v2:
 - Added items/description to reg in binding
 - Added missing pm_runtime.h inclusion
 - Moved pm_runtime_enable call to before registering PHY
 - Fixed pmos/nmos variable size for 5 bits calibration values
 - Fixed calibration for single-lane PCIe, as in, the ln1 rswn
   calibration nvmem value is ignored in code if it's single
   lane and will not return an error; this is due to the fact
   that, effectively, single-lane may have a zero calibration
   in tx-ln1-rswn which is fine, as that'd be anyway unused
 - Changed calibration data errors to dev_err_probe and changed
   the "no calibration for ..." message to dev_info instead

This adds a driver for the PCI-Express Gen4 "S-PHY" found in the
Genio MT8894, Kompanio MT8196, Dimensity MT6991 SoCs (which are
all variants of the same chip).

This was successfully tested on MT8894 and MT8196.


AngeloGioacchino Del Regno (2):
  dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
  phy: mediatek: Add support for PCI-Express Gen4 S-PHY

 .../phy/mediatek,mt8196-pcie-sphy.yaml        |  93 +++
 drivers/phy/mediatek/Kconfig                  |   9 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-pcie-sphy.c      | 556 ++++++++++++++++++
 4 files changed, 659 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie-sphy.c

-- 
2.55.0


