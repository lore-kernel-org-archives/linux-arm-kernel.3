Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D26CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNNEOzlbJ+EpRHTDYCWfkhalXUCCgphJIuOM79MU4aM=; b=OfTkLtwHDBXyxE7LRUYlh3Jmx5
	0an/5/He0Czz1xi2XOskJBL0Ma8LrLK5baDcJ4Sos6St8otoE57chBqJyfollfpKT1xjIJh+noj73
	LooCaJ6y+nCqZF82rRLdcpT6fJoPOzVev5ZNhbmfEVZRIBwEPj5q+D5Ml3JWkfC33WSpymUHDV4W2
	XxjZw6qKjPvGZIO7yHe8yptTiJ2kYL966nXgUXLjySgW+s2r9Xk9GSdELwnFyT+/D+9MVJQSZ5j3T
	VPbWC8nxKl22Zxe0LTjUoGLyDQ70iJLRh+V1OMUGuTlUfeq0fvbU77YSEIKx8rIGNa8Jw1fdy67UX
	HvLbnxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAn2q-0000000CqYb-1r5X;
	Mon, 20 Oct 2025 10:23:16 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAn2n-0000000CqYA-386o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:23:15 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1760955788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNNEOzlbJ+EpRHTDYCWfkhalXUCCgphJIuOM79MU4aM=;
	b=fPxtP3eO4pIybGviOxSGTBl0MzU+7o4PDjmokTLpHHAGISxHzP3X1744e25ke7RiLL+005
	+92q7wEhleYQLj92B/f/Hv1drToatKE7qObN8+gxArTQsEtNRdOuRwtYYPeCnCl97MkN0a
	PrQw3mkZQ3osWueSrcBbh3wikCfWbztfJ17se1Qe/diZ1kAXhfmgh4MqIIURB8ixiggQ5s
	epnzhTpAgC8Nt8dxLs/9rs4do8CKdIYSwHaocGbxhwxpgY5dmMqWx9AbXMTQitoMbVFCgs
	4652qbHH4N68+P/4gWEUUNgzDyLcMm/FI/vH4GsFoJIL4ypQw+8KfmmQebKcfQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 12:23:05 +0200
Message-Id: <DDN2Q7RZKYZR.E49OGFZL7BIW@cknow-tech.com>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <quentin.schulz@cherry.de>,
 <andy.yan@rock-chips.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <cn.liweihao@gmail.com>
Subject: Re: [PATCH 0/9] Gernal RK3368 HDMI support and 2 outputs for
 RK3368-Lion
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Heiko Stuebner" <heiko@sntech.de>
References: <20251020082508.3636511-1-heiko@sntech.de>
In-Reply-To: <20251020082508.3636511-1-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_032314_009009_D5EDF66E 
X-CRM114-Status: GOOD (  16.93  )
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

Hi Heiko,

On Mon Oct 20, 2025 at 10:24 AM CEST, Heiko Stuebner wrote:
> This series adds the necessary bits for HDMI output on RK3368 and enables
> this on RK3368-Lion. At the same time, use the recently added DSI support
> to enable the generic Video-Demo-adapter as an overlay on Lion as well.

I noticed several 'spelling' issues in various patches, therefor
reporting it against the series:

- s/Gernal/General/ ? (series Subject)
- s/internal in the controller/internal to the controller/ (patch 1)

Incorrect/inconsistent casing (not sure about these though):
- s/phy/PHY/ (patch 2)
- s/soc/SoC/ (patch 3 + 7)
- s/hdmi/HDMI/ (patch 7)
- s/vop/VOP/ (patch 7)

- s/the newer one that/the newer ones that/ ? (correct if there is only
  1 newer) (patch 3)
- s/devicetree already is set up/devicetree is already set up/ (patch 3)
- s/definitly/definitely/ (patch 4 + 5)
- s/to no cause/to not cause/ (patch 4 + 5)
- s/power-domain property/power-domains property/ (patch 4 + 5)
- s/hirarchy/hierarchy/ (patch 6)
- s/is change at/is changed at/ (patch 6)

Sorry ;-P

Diederik

>
> The reason I'm shaving this Yak is that the recently added DSI support
> created DTC warnings about a single endpoint with an address.
>
> So it was either removing the @0 from the endpoint, or adding a second
> output option :-) .
>
>
> Heiko Stuebner (9):
>   dt-bindings: display: rockchip: dw-hdmi: Add compatible for RK3368
>     HDMI
>   drm/rockchip: hdmi: add RK3368 controller variant
>   soc: rockchip: grf: Add select correct PWM implementation on RK3368
>   arm64: dts: rockchip: Add power-domain to RK3368 DSI controller
>   arm64: dts: rockchip: Add power-domain to RK3368 VOP controller
>   arm64: dts: rockchip: Use phandle for i2c_lvds_blc on rk3368-lion
>     haikou
>   arm64: dts: rockchip: Add HDMI node to RK3368
>   arm64: dts: rockchip: Enable HDMI output on RK3368-Lion-Haikou
>   arm64: dts: rockchip: Add the Video-Demo overlay for Lion Haikou
>
>  .../display/rockchip/rockchip,dw-hdmi.yaml    |   1 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   5 +
>  .../rk3368-lion-haikou-video-demo.dtso        | 174 ++++++++++++++++++
>  .../boot/dts/rockchip/rk3368-lion-haikou.dts  |  36 +++-
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi      |  45 +++++
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  16 ++
>  drivers/soc/rockchip/grf.c                    |   1 +
>  7 files changed, 268 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-lion-haikou-video=
-demo.dtso


