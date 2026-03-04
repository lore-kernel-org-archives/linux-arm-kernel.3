Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9398AEFCE49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 21:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o8U7o09aOl4G4kFH1yIQ4D6wIf7/Z/yTRBuFjXy96Q0=; b=LFceQ+YLcaIoQ+
	lQPgpHuoPq3EAXsLvnWfebNha02+WaT/XPDWa4KgH6n5oL80DztWDnUxLtwJeSD+z+X8RIY/qG8ht
	9xfVhaG0rZN5ZXVwh5pKmuGLXG86soElzkzbpLowv78LK//H/tgFauZB/g39HHM6hoYxrwFl4exc5
	nq5L6NFOPoZcbrmNfb8GoZnENINfbbfL1iulfAGkTucsXYHE+DBSQ4F8wq38lYiFwPJ8RxZNfhrJa
	lZZbwX+l0k0lMwZgAVtt3Upqgq1glIze37qY1YxokhmWhOXIkG2G2Swf00qPbsbhaNiOUkcuDJXS4
	fiv0SgnBe+RD76jymjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtLU-00000000U4c-2a0j;
	Wed, 04 Mar 2026 21:01:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtLR-00000000U39-0cP2;
	Wed, 04 Mar 2026 21:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772658082;
	bh=NHH8SBtZtWB7oWeNE/nBz0iDxmUAd/1nD1eoFs5xpMo=;
	h=From:Subject:Date:To:Cc:From;
	b=d7zhqCPR2H904v31dWDKFETKjTzLVAdJNlokaggb0/y86gvLCYDEiaT4eCDLeEk/z
	 hna1M7B16kbB8OUR8ba6md9Xrb3vF9WGaEorHd42S/onyJYp5BKyuw65WqP3Br9+VZ
	 tsSuPyDq4zBBixeX7k5710chLolNBrTp7HpwFbWAUR99siCjH9fMZXNm1nFwFGQUiE
	 t09ek7dodB76scI+XmTXkHGwfs4ZCoYEThw6yNPMys2sBxVEdlMNFoo6DR8evqJ7uG
	 aTTgZwP+7bkT/vJO5fpdphkqC90Uoj7QMaxUSZKetnVfzMsJ1Wl8N1z/+BxzzVTQN+
	 f1/FS29V2qM+w==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE5A017E0DC0;
	Wed,  4 Mar 2026 22:01:21 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v5 0/4] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576/RK3588
Date: Wed, 04 Mar 2026 23:00:39 +0200
Message-Id: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NwW7CMAzG8VdBOc9T4tRpu9PeA3FIHBeiMTKlU
 wRCffcFTgiB2PH/Sf75rGYpSWb1sTqrIjXNKR9a0NtK8c4ftgIptlao0WlECzUKQ5Et5BKlQPm
 y1DtgRmEnmmQcVLv9KTKl49Vdb1rv0vyby+n6pprL+kqsBgyQ02PvyLkQ7Sfn/d6HXPw75291U
 Sv+S0LQEP3UjR3GiTU+kuytRM8k2yTyKEFMMMYPj6TuVnLPpK5JYYg9Ru4JSd9Ly7L8ARiBtoq
 cAQAA
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
 linux-media@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_130125_344436_9798D456 
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

When building device trees for the RK3576 based boards, DTC shows the
following complaint:

  rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

The first two patches updates 'reg-names' property in rockchip,vdec
binding to make it mandatory for RK3576 & RK3588, since this is what the
driver expects, as well as to allow providing the register blocks
following the address-based order and, consequently, ensure the video
decoder unit address points to the primary register range.

The next two patches reorder 'reg' and 'reg-names' for the impacted
RK3576 & RK3588 vdec nodes.

While the binding changes introduce an ABI break, the expected impact on
potential users should be minimal, if any, since the old SoCs are
unaffected, while the video decoder support for these newer variants in
mainline driver and devicetrees hasn't been released yet, it just landed
in v7.0-rc1.  Therefore this series is intended to be part of upcoming
v7.0 kernel release.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v5:
- Addressed feedback from Krzysztof and Conor resulting in further
  updates to the commit descriptions, as well as marking reg-names
  required for RK35{76,88}, handled in a dedicated (prerequisite) patch
- Collected R-b and (re)added Fixes tags indicating patches should land
  as part of the upcoming v7.0 release
- Link to v4: https://lore.kernel.org/r/20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com

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
Cristian Ciocaltea (4):
      media: dt-bindings: rockchip,vdec: Mark reg-names required for RK35{76,88}
      media: dt-bindings: rockchip,vdec: Add alternative reg-names order for RK35{76,88}
      arm64: dts: rockchip: Fix vdec register blocks order on RK3576
      arm64: dts: rockchip: Update vdec register blocks order on RK3588

 .../devicetree/bindings/media/rockchip,vdec.yaml   | 22 ++++++++++++++--------
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 12 ++++++------
 3 files changed, 23 insertions(+), 17 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98


