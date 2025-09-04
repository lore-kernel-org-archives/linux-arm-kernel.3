Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41D5CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/vniSLTc1fn+7ylZUPx0SyxVm1+LfRGh6tklNGfDrXg=; b=RFoFTVzhr2tvFl
	omGKwV8tZfwuNXvfNOLoJHtK7uhOdw8qLtKpmSMd3rlldznyboMAnio5XWeaAXdjtSUPM/SATWdLr
	ZxZj8BKNzbMuYWsgyQAQWZrGNHwvDkkbQcYF7aExx2CaMjwZ0dEXh5pdgZutQCXOFGxjvG94Yq+y9
	Gh8JkxxAbq8NdeVsKJRUsCqWLCNbuGd2veXJPGzCKRt3Fbmr7VlLMz44/qQAbIVPcZEWejuDu+0Z7
	kO2hQyAejeLyivvc/di8V8EL0W6l0dR85Su/XTDypXmtYXnZYNnjxuNCEZKfxeHkRxevpBgeXDTa0
	eRaxlREbFwRj/yWfgypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGkB-0000000EKTQ-2BNU;
	Thu, 04 Sep 2025 20:39:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEey-0000000DYFG-3m0V;
	Thu, 04 Sep 2025 18:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757010370;
	bh=ue2HZsrzJ48NxpTsNI06KWQFI1W2kpk23BnWEwgmOz4=;
	h=From:Subject:Date:To:Cc:From;
	b=KPJKlM5yFrpBwNgauz48FGg4mkpglun08kHm53tHHhLcD5IhmPPOLXCJiPWWgE6DK
	 jTySAO1W2oL7BAEF4EwEGvUZJfzLFgTZj+7HBRphTO3XKjYUxurqd+GmI/YqtJkkb5
	 AOumdPydE2igzGRmIQbCK1wwlveHdqWo+9EAwvHG30XvYpsag0awo9bjhfkjonz+Hz
	 c8NvfqPIl41V6XD5F56jIWRs+LTOAvyz/htv4rsjWo+q0zFIzVEc+mSC3/IDURtk10
	 +VGEde3PCx71d1JcdTXDj1L1tR1Wl+tZ9Kve5KxXFPg7IF1dBNXIahVYHGetaBKKp7
	 5/LdPZJS5O60w==
Received: from jupiter.universe (dyndsl-091-248-191-002.ewe-ip-backbone.de [91.248.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9346C17E07FB;
	Thu,  4 Sep 2025 20:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3D4CE480044; Thu, 04 Sep 2025 20:26:10 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH RFC 0/2] arm64: dts: rockchip: add USB-C DP AltMode for
 ROCK 5B family
Date: Thu, 04 Sep 2025 20:26:01 +0200
Message-Id: <20250904-rock5b-dp-alt-mode-v1-0-23df726b31ce@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALnZuWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwMT3aL85GzTJN2UAt3EnBLd3PyUVN2U5LQ0I4NUC4MkgxQloMaCotS
 0zAqwodFKQW7OSrG1tQChbSTTaQAAAA==
X-Change-ID: 20250904-rock5b-dp-alt-mode-dcff20e80b0d
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Frank Wang <frank.wang@rock-chips.com>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>
Cc: Andy Yan <andyshrk@163.com>, 
 Maud Spierings <maud_spierings@hotmail.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1363;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ue2HZsrzJ48NxpTsNI06KWQFI1W2kpk23BnWEwgmOz4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGi52cLKcwSgQR0lM413kTDNqbzI2wLxmMTyu
 SSSzVYhPb9qGYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoudnCAAoJENju1/PI
 O/qaCC4P/14YdPKAJ87PxwrFQqDmQc2KpPGrS7UMcqZ/n0aURdjNKF6UVR/BmtP0sBtEmQG1YUg
 L5mES0CBAYF6Ruw/ZMrfy0Ac7AYcE0dn9HnlexyKVZG6sMLUa0sdK7r5X3+S7D310dfDUzZs7hW
 OAvIxjFmWEsLVcbTzNi2iiwvQrkPLSsHHpdzfMR6aQuzI80kwAWTHC3qbmnnd89W4WhEr2OyNuC
 ZDT76XrhV+z30mUJ186hcFB/cBgmyhhU710RcYa1HWLmnc+oen4JqFjz41NpFtwek40ryS1ClHM
 gNoTCnsALQxC1dNgWORUT8T8ZtEv1qce2d1xNPCm9EW6e7QfIswIe1PE/RWFfD6wW2jLwkTTlag
 nv0KgkLdUHWm9819r6nuKkShwpD2YjO7HrRYdGChIfsgwFzpEd3kRxzcuor8Av1VWOm14x1JXvP
 u0YOeKCZG7QMv4/ovJhrdzV9Fx+2hyePOgm6yJzKsuk4qeKTZLtdCPZQUwTFiSY8RqQ6jLgC7ZO
 bfy/7MtISegaQU+hYY5Sys7wmTbmmqUL0Fv44bj83oLeqoN+7BGy5IX2inmxjqdhaa4qN7jsHGV
 B/vSR+NVlor3DHZXrBr007kVoB/Am17HifsaGaRWY0vNd4TyH/nqRloPCsV3LeOy6fOQVL/i4M4
 aenlHftrfQWaCUsvK/F03OA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_112613_117330_BCCE7057 
X-CRM114-Status: GOOD (  12.31  )
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

People started to become impatient regarding USB-C DP AltMode support on
the RK3588 platform now that the DP controller support has been merged.

I'm sending this as RFC for now, because

1. I'm not sure if the binding change for rockchip-usbdp is considered
   an ABI break. As far as I can see the Linux drivers don't need any
   changes and combinations of kernel and DT should work. At some point
   the kernel might rely on the new binding for some features, though.

2. I've noticed USB-C DP AltMode only seems to work when the cable is
   plugged after the system has been booted. My guess is that there
   are some issues with the Rockchip USBDP PHY driver, but I didn't
   have the time to track this down properly.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (2):
      dt-bindings: phy: rockchip-usbdp: add improved ports scheme
      arm64: dts: rockchip: add USB-C DP AltMode for ROCK 5B family

 .../bindings/phy/phy-rockchip-usbdp.yaml           | 23 ++++++
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 83 +++++++++++++++++++---
 2 files changed, 95 insertions(+), 11 deletions(-)
---
base-commit: 6cc18e940db6731556843b7fa2924eb2efcef53f
change-id: 20250904-rock5b-dp-alt-mode-dcff20e80b0d

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


