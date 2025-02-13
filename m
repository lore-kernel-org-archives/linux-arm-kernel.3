Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B3FC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0Kn63cS+tQJJpYLzCQdCblWT0YZ8q8hNtwtbYwtGRE=; b=2u0X2a8yQ4zIhfEDg+VNe6Uu1b
	8IaYj8+ytZEpa/1ETQ6T+tpWxxgypdLFJpJyr+o23WK57PnSo3BUgpphtfXqh/rFHWY7FXrXnZ5Eu
	YYgZoeyyCTgwlq6F4IbIy2tueayTI243oTT8YkOxsgVobycMvnup+6itqqVdQ/k03yANZ5muChMND
	8ZanBref1HWHWtI3WIV4R6whDnN5uqqUY8/+7Vv1XcyQyUGL9qq5RoVssMKLfNcDYpW4maL/vSdOJ
	AF+0K60eiv9ma9h4CrGFvZ9j6cWSneFBN59A/rcN3AGoFZmJd5rg4SuDG1BUhkGHRSnLQAMgJGaHk
	M9iiohkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWml-0000000AinV-0Gme;
	Thu, 13 Feb 2025 10:49:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWe9-0000000AhYK-3dlV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 10:40:43 +0000
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58AC36AF;
	Thu, 13 Feb 2025 11:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739443160;
	bh=rKfJj/nOFTP3ITe5GatUlSP/bs0kOFPFXDa1/jdXj0Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=b0JIacVtrHBLExudGvxw2VW6F6/nRpG6Ko7zZRbOF5hzlown3X9l7YYBxDooS+kn0
	 EP23NnSl/XMjJvwO6j+1Jl5FF0X9GJATp9tVJ3PujlTWBzn4f4d+gflviRsAoBU0Ca
	 +rweftJoiunoNp8OZmz8bMPvRF65bN//JuR4eBUE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250212195656.69528-1-slavine@d3embedded.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
Subject: Re: [PATCH 0/4] media: i2c: Add driver for Sony IMX728
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav <vaishnav.a@ti.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ard Biesheuvel <ardb@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Biju Das <biju.das.jz@bp.renesas.com>, Bjorn Andersson <quic_bjorande@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Hans Verkuil <hverkuil@xs4all.nl>, Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>, Julien Massot <julien.massot@collabora.com>, Kory Maincent <kory.maincent@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
 , Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian LaVine <slavine@d3embedded.com>, Shawn Guo <shawnguo@kernel.org>, Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>, Thakkar Devarsh <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>, Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>
To: Sebastian LaVine <slavine@d3embedded.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 13 Feb 2025 10:40:35 +0000
Message-ID: <173944323591.1238111.8582110055649651187@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_024042_050077_A31CA5D7 
X-CRM114-Status: GOOD (  10.82  )
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

Hi Sebastian,

Quoting Sebastian LaVine (2025-02-12 19:56:52)
<snip>
>=20
> Total for device /dev/v4l-subdev4: 44, Succeeded: 44, Failed: 0, Warnings=
: 0
>=20
>=20
> This is a v3 of a series that was originally sent last summer[0].
>=20
> [0]: https://lore.kernel.org/r/linux-media/20240628-imx728-driver-v2-0-80=
efa6774286@d3engineering.com/

This version of the driver was authored by "Spencer Hill
<shill@d3engineering.com>" who seems to no longer be credited. Is this
intentional?

Does his original Signed-off-by: tag need to be kept at least ? Or
perhaps Co-Authored-by: ?

--
Kieran


>=20
> v2 -> v3:
> - Update maintainer
> - Update bindings example
> - Add devicetree overlays
> - The driver now supports SRGGB12_1X12, not SRGGB10_1X10
> - The driver now outputs at 3856x2176, not 2840x2160
> - Fixed exposure, again controls
> - Removed duplicate register writes (removed repeat HDR writes, etc)
> - Fixed imx728_wait_for_state use of the cci_* API
> - Re-added _imx728_set_routing (necessary for imx728_init_state)
>=20
> Sebastian LaVine (4):
>   media: dt-bindings: Add Sony IMX728
>   media: i2c: Add driver for Sony IMX728
>   arm64: dts: ti: k3-am62a7-sk: Add overlay for fusion 2 board
>   arm64: dts: ti: Add overlays for IMX728 RCM

