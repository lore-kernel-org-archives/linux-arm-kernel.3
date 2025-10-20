Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DAFCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqunwMaYrmZoCU5ondxT5rUOVp1LVZFzvhEqbXHshro=; b=jyFWP8GxhIosihaFQWZKdAaVis
	hBPnULHmmssRTAQnAxrD/HleeikSfTd0YEGVlYQZvJE8mBt2/gBkb4erAK+n8Vujs7mfoNw39ldGF
	lJuxj2pp/UuhiRyX6sZm1RKu/GBBrAAcPJiwCQsvZdLm6LDd0ft3+Z0cjDe+R8tiiL9t5MsGjAkmk
	OowhHlTE7MR9oveCtqHBzSC80sVzKpTvXfgL3HJK9Q9vDqGLfL+ymm5rjOfTj4bBY+XiA6vUnkuKJ
	bqW6ulAgScWMYrR6Mw/iAm2WGdQpjcm0AwPVh45OWuE4/NGiQmH0wHZqKbsdEaW5bN0zs9eAGv80Q
	H2Kfejfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAs5q-0000000EByZ-3YzL;
	Mon, 20 Oct 2025 15:46:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAs5o-0000000EBx9-46AK;
	Mon, 20 Oct 2025 15:46:42 +0000
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A5C8782E;
	Mon, 20 Oct 2025 17:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760975093;
	bh=sNxXee+W1+T0QQqYoZjUQPLYVU/MxS9aOZB5QdQS9ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EUmFc3rrfBxKRn2+DXvEc1xUEtm8JTz1bNCs9ssWuUL1dWVnQywDAlGX2ql3aBA1U
	 SNSkDg/T6rRFd/A8NI4HjvZ6yjfafbIPjhU3J41NHmMcHDuVnBtaNXDvuVB74UxgQH
	 sNLxo2Fk+KZB6IHjDVZbRrKQX6I+Oo/yyGq7T8rA=
Date: Mon, 20 Oct 2025 18:46:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: rockchip: Add device tree for the
 Orange Pi CM5 Base board
Message-ID: <20251020154625.GB6159@pendragon.ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <2328202.iZASKD2KPV@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2328202.iZASKD2KPV@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_084641_145922_D8442FF9 
X-CRM114-Status: GOOD (  26.62  )
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

On Mon, Oct 20, 2025 at 04:44:21PM +0200, Heiko Stuebner wrote:
> Am Montag, 6. Oktober 2025, 01:55:36 Mitteleuropäische Sommerzeit schrieb Laurent Pinchart:
> > Hello,
> > 
> > This patch series adds a device tree for the Orange Pi CM5 Base board
> > from Xunlong. This is a combination of a compute module and a carrier
> > board, so the device tree is split in two files.
> > 
> > The work is based on a combination of upstream device trees for other
> > RK3588-based Orange Pi boards and the downstream device tree, all
> > checked against the available schematics for the carrier board. The
> > compute module schematics is unfortunately not available.
> > 
> > The series starts with three patches that add a new tmds-enable-gpios
> > property to the rk3588-dw-hdmi-qp DT binding (1/5) and update the driver
> > accordingly (2/5 and 3/5). Those patches have been authored by Cristian
> > Ciocaltea as part of a larger series, I have incorporated them here
> > as-is.
> > 
> > Patch 4/5 then add a new compatible for the board to arm/rockchip.yaml.
> > The last patch (5/5) adds the device tree for the board.
> > 
> > Patches 2/5 and 3/5 could be merged separately through the DRM tree,
> > but patch 1/5 needs to be merged with the device tree in 5/5 to avoid
> > introducing DT validation warnings. I'd appreciate advice from the DT
> > maintainers regarding how to handle this, as I have been told before
> > that DT bindings and DT sources can't be merged through the same tree.
> 
> I think we generally only care about binding warnings happening
> in linux-next.
> 
> I.e. in most cases, the binding is merged with the driver and
> the dts then into a separate tree - sort of ignoring the local
> binding error, because everything will be fine once stuff comes
> together in linux-next.

Assuming they get merged together in linux-next. If there's a delay,
linux-next will exhibit warnings for some time. I don't know what the
rule is regarding that.

> Speaking of bindings, does your board _need_ the frl-gpio to produce
> any hdmi output? Like could we merge the board without the (optional)
> gpio and then add it later, once the binding+driver have made it in?

With a suitable pull-up I think so. I can submit a v3 with that.

> Just me trying to grab the big chunks earlier in the cycle.

-- 
Regards,

Laurent Pinchart

