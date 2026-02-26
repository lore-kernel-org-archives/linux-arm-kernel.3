Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3D1FC591F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pXIXYThE4KwiA/KClaBJIGKkZ5TDyILq+wya7l9s2jQ=; b=C3JFmOR9tmjg3Q
	PSgcgwtriwcrCxwzCa5IWfZ3Vf78Dw/q2LjYeYZNTn9D/OpZPn9hbamMg6ulKI2UjWj3I9m9dtfPM
	go1YXXXUo/g9xjakw8hoj2Bnm7XPMTM3SDbBT+vr7b73IxVhcbEe/Nhr0w9/M2XJ5OCaTy+UZzQfy
	i/IvXjTiHEq62DtjcgdVZnzJ8UGLcKEz/SN+SByTX1I+6rohoe4i2Z2jmjUo9KMKXrJ06+Q8KFGFQ
	Y7kID+DVvfWqtTobOHXOmz7mIxFudFeQ9mXPN6utZa/BQy3i1c3f+dijMB3SpY8SHQ7ykGU4wxf86
	2rYDAgmZt+8290TjnN+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYtd-00000005x3s-17Xm;
	Thu, 26 Feb 2026 10:47:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYta-00000005x1Q-0bmr;
	Thu, 26 Feb 2026 10:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772102819;
	bh=7evQl1U56Y+krUyCkNdBkF6YOqsOl19RT9juFbdoLd4=;
	h=From:Subject:Date:To:Cc:From;
	b=nK37pX3+Bu77wQctTzYR5DPioPJHbtf5abNjJBP0UmSpt20WOP03SST/Xr6prB9pG
	 fTwdFyMkZ/OZf2QeHHtCYYp0loVroydVoxW8l9nWPh86RM4AUPV/q9A4uItjpooAML
	 iTI6XU8laft8oUy1AOIy09RFjtBvsuSmeiRDLTpS30PKG8D7urpP/vjR9XIWkbCZrn
	 NXMpQ4CeIoolKAAKp+nTNbgmU20uzHC4cggz4J5E0bEdj+XpV1nM7QpP+M9gl7ezkz
	 ApsgjPwmRO2ymIMKZTbPgDF6t/gxaJbQP4XWXB6ueBNdRGoTiZKhx0mNQuG0iaKqgM
	 ySx0yw2gzVg1Q==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DC6F17E0029;
	Thu, 26 Feb 2026 11:46:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v4 0/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576/RK3588
Date: Thu, 26 Feb 2026 12:46:52 +0200
Message-Id: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQrCMBCF4atI1o4kkya1rryHuEiTqQa1kakER
 Xp3Y1ciii7/B/PNXQzEkQaxmt0FU45DTH2Jaj4Tfu/6HUEMpQVKtBJRQw7kgWkHiQMx8EGb2oL
 3SN6SNNQsRbk9M3XxOrmbbel9HC6Jb9ObrJ7rLzErUGCsbGprrG2DXvt0PLo2sVv4dBJPNeNfE
 oKE4LqqqTB0XuInSb9K5puki2QcUkuqVcot36VxHB9aQDjQUgEAAA==
X-Change-ID: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_024702_542925_C34FBC0F 
X-CRM114-Status: GOOD (  10.40  )
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

When building device trees for the RK3576 based boards, DTC shows the
following complaint:

  rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

The first patch updates 'reg-names' property in rockchip,vdec binding to
allow providing the register blocks following the address-based order
and, consequently, ensure the video decoder unit address points to the
first register range.

The next two patches reorder 'reg' and 'reg-names' for the impacted
RK3576 & RK3588 vdec nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v4:
- Removed the unnecessary one-entry item from the reg-names oneOf clause
- Minor adjustment of the commit descriptions as 'function' naming was
  not used in the context of the older SoCs
- Link to v3: https://lore.kernel.org/r/20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com

Changes in v3:
- Mark the current 'reg-names' listing in the binding as deprecated and
  introduce an alternative 'link,function,cache' one
- Drop the Fixes tags from all patches and updated commit descriptions
- Link to v2: https://lore.kernel.org/r/20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com

Changes in v2:
- Added patch for updating rockchip,vdec.yaml binding
- Added patch for updating RK3588 vdec nodes
- Link to v1: https://lore.kernel.org/r/20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com

---
Cristian Ciocaltea (3):
      media: dt-bindings: rockchip,vdec: Add alternative reg-names order for RK35{76,88}
      arm64: dts: rockchip: Fix vdec register blocks order on RK3576
      arm64: dts: rockchip: Update vdec register blocks order on RK3588

 .../devicetree/bindings/media/rockchip,vdec.yaml     | 20 ++++++++++++--------
 arch/arm64/boot/dts/rockchip/rk3576.dtsi             |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi        | 12 ++++++------
 3 files changed, 21 insertions(+), 17 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98


