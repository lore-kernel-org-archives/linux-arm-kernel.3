Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA27EC1128
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 19:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zc+aNhB8Wg40DfgicWytbqK0Ak9DIPX0iC16IJdC52w=; b=s71EajPO1qHUF2
	t5151fVON3aNydyyQCwRk9AqfD/yhhrICxAjTPB44EkSb6QSxGy7cdparoGq/jFFwlwjzH5JIlCIn
	FSDA7J81lov7eReqkwLsOxCyOJwc+zCvXWTZ8RY3Uf42r5tunL1lzp5SvAJMnPvupahy4qvZizORA
	kFjZBbdBhE7DchRWdpGDEFuDMQDogym2rJ1VleAInrQlAKEFB0pDxFSvebqK1Q4F3edpuf3CcwkId
	qGiZE0ERoaZvmE1XL9Y0r5iU0rIgmf8NpNVl19aTHdLCJrSaZy3ytOx8x+M3lDfo71gc7q50z1Nsu
	gxfy6yXTCzlinQndbrgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubwx-00000000x7l-1GOL;
	Mon, 23 Feb 2026 19:50:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubwq-00000000x4r-3clU;
	Mon, 23 Feb 2026 19:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771876225;
	bh=pmlCVWrD6zzpD0XAFf/2KubQeFmeVtw7tfmAEuw6iFg=;
	h=From:Subject:Date:To:Cc:From;
	b=WfMA7Kz28LNuScL6IHmh7H7FGI4n1uLGMKXNPd+iip6YdUjhWU7+LFX4jIKiSX6s+
	 3HaEYwnpLY+goX/JGZTv0PKwZos8y0cUqjOUNyb7JBvPBDPtKQFxVCgOIhRSx0CPbH
	 N5MlL2J5r+2+MkMTmuNHZMLRJW6QnNaNbdjTX9duMMmvL3po10GGBMO/JraihBTbNu
	 1bu28GeXpPxDxGED5eXfEnurcHIR/km6fULpjuSu8UyNJrkuE5AAf6SFIxVCZ4QPgB
	 aT8jQy/v5aIj4fx+QhF4yB6AOOwvPp/DWvoxU0rLc+0KMBgqJEDw/uGEajYmtwEYCP
	 1WgIMFC8rMf8g==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D982117E03E5;
	Mon, 23 Feb 2026 20:50:24 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576/RK3588
Date: Mon, 23 Feb 2026 21:49:48 +0200
Message-Id: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZhS0kFceQ/DAtoRGpGaqWk0p
 He3cgGX7yX//Q0ii+cI52oD4eSjD2sBfajAzsM6MXpXGLTSpLRuMDm2KDxhEMeCcm9MS2itZku
 sDHcnKNun8M2/9+61Lzz7+Ary2W9S/bP/iqnGGg2priVDNLrmYsOyDGOQ4WjDA/qc8xehj4Jyv
 gAAAA==
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
X-CRM114-CacheID: sfid-20260223_115029_054608_F233BBB1 
X-CRM114-Status: UNSURE (   7.90  )
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

When building device trees for the RK3576 based boards, DTC shows the
following complaint:

  rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

The first patch updates 'reg-names' property in rockchip,vdec.yaml to
allow providing the register blocks in the expected address-based order
for RK3576 & RK3588 video decoder, while the following two patches
correct 'reg' and 'reg-names' accordingly for the impacted vdec DT nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Added patch for updating rockchip,vdec.yaml binding
- Added patch for updating RK3588 vdec nodes
- Link to v1: https://lore.kernel.org/r/20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com

---
Cristian Ciocaltea (3):
      media: dt-bindings: rockchip,vdec: Correct reg-names order for RK35{76,88}
      arm64: dts: rockchip: Fix vdec register blocks order on RK3576
      arm64: dts: rockchip: Fix vdec register blocks order on RK3588

 Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 13 ++++++-------
 arch/arm64/boot/dts/rockchip/rk3576.dtsi                   |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi              | 12 ++++++------
 3 files changed, 15 insertions(+), 16 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98


