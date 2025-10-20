Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60D0CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AT8kvrM/pmB47OHQy99Ebe3K0Er153ALtlnbPz3lC68=; b=02V9JZqFd8l4bF+L0chcR+YrJY
	wLTRZ6YVrVzkpS++wmNiEmgXDC+gGxtYxsx1jan3jOgD7xYX6I4phXwSKkNXrYpjXNGXbK8bl75fN
	d1hcndW9t5RQRGGCs3VUNXbtqw/0gocDFuyL+sZO+/3xoVagVr4z0s/HCb1msmG75Wm+f8d4w4ckp
	MjtHT9UzlbgcoATL7tPIy9Jo8T3LbVYcVVMCm6jekrRL1RIHPTVN2gvvWFmtB9Oj72puHI9J02Hn7
	x/r4eDcRtvmNVBNiHv+R3c3TnfUSwePIisatbNde/2w1H002audFQAkRGvs+ZsqIMgE8rbOfMMgbe
	7O3Z7MGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAr7e-0000000Dzer-3bO1;
	Mon, 20 Oct 2025 14:44:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAr7c-0000000Dzdq-0oyM;
	Mon, 20 Oct 2025 14:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=AT8kvrM/pmB47OHQy99Ebe3K0Er153ALtlnbPz3lC68=; b=MZzlvL561DhtDq2BnjgVNhw48X
	LdAaF8ZhQcfaQgm+NAamiJkMr1WoA4Bu+vWxwcgA8s87SSytjOE920W12HnSzH968gx/MuzEGhHbD
	cxjoHsx9T4BY87bsYn+dVVg21RLcSxSSZbHPwh/7s9VIQwrPjqWLzq1mshNxOI0TOHOscFvu+d8Sq
	F8u1vl5xdWcg4gPAi9uiykIAgMyOVqoUA+jxcMMYASFvKKrhHMPFL0BNMUBxYkBFH+mLSmYOfHq0q
	llao0jVA859vPzpB2Wgb3Sp+Zv9DYtQn369m9EtC0CggdZFfCJK2HoqdkAX5ODls1ZArzmC0j1iiq
	PKgScYYw==;
Received: from [212.111.240.218] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAr7W-0002MH-Fu; Mon, 20 Oct 2025 16:44:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexey Charkov <alchark@gmail.com>, Algea Cao <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
 Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: rockchip: Add device tree for the Orange Pi
 CM5 Base board
Date: Mon, 20 Oct 2025 16:44:21 +0200
Message-ID: <2328202.iZASKD2KPV@phil>
In-Reply-To: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_074428_232311_89B641A1 
X-CRM114-Status: GOOD (  21.42  )
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

Hi Laurent,

Am Montag, 6. Oktober 2025, 01:55:36 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Laurent Pinchart:
> Hello,
>=20
> This patch series adds a device tree for the Orange Pi CM5 Base board
> from Xunlong. This is a combination of a compute module and a carrier
> board, so the device tree is split in two files.
>=20
> The work is based on a combination of upstream device trees for other
> RK3588-based Orange Pi boards and the downstream device tree, all
> checked against the available schematics for the carrier board. The
> compute module schematics is unfortunately not available.
>=20
> The series starts with three patches that add a new tmds-enable-gpios
> property to the rk3588-dw-hdmi-qp DT binding (1/5) and update the driver
> accordingly (2/5 and 3/5). Those patches have been authored by Cristian
> Ciocaltea as part of a larger series, I have incorporated them here
> as-is.
>=20
> Patch 4/5 then add a new compatible for the board to arm/rockchip.yaml.
> The last patch (5/5) adds the device tree for the board.
>=20
> Patches 2/5 and 3/5 could be merged separately through the DRM tree,
> but patch 1/5 needs to be merged with the device tree in 5/5 to avoid
> introducing DT validation warnings. I'd appreciate advice from the DT
> maintainers regarding how to handle this, as I have been told before
> that DT bindings and DT sources can't be merged through the same tree.

I think we generally only care about binding warnings happening
in linux-next.

I.e. in most cases, the binding is merged with the driver and
the dts then into a separate tree - sort of ignoring the local
binding error, because everything will be fine once stuff comes
together in linux-next.


Speaking of bindings, does your board _need_ the frl-gpio to produce
any hdmi output? Like could we merge the board without the (optional)
gpio and then add it later, once the binding+driver have made it in?

Just me trying to grab the big chunks earlier in the cycle.


Thanks
Heiko



