Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7A2CCF2CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 17:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KzFzxYaDpiw3v2cN1wsy4A4fK7ubLLV9aUEhhmv9Kg=; b=IvUmIMz54H3fUC/RPZWOkgO9OE
	2+or/nrHGKoqvrqg+j+x1q4rhhkUCsGXtdeoWYeicsEKTLGJP4nXTp1IKbwvSJxQy5hs636IAYffz
	HNl3/KkOe6iaWkDTLqgRYStYEPdLgYuAwEb8h7Q2KyBrUsQXHftWpfh+2EAwJDLkr61000JkGcpi8
	iriiPi5hflRHu65clcDnnqNWO3AcgmtQyX7Anw6gDGDPeZ+Lec97k5RXqr6WW3trEbmAcTeNWW75A
	xMWb5z9m9cfsdIFIpgxSoL/gYvWcJa0f3F26l4CXvwC/HDbNGJ1opA7UTdk040vLMWwrAHNQV1O74
	7DTGY/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI87a-00000004zPZ-0zWy;
	Sat, 17 Oct 2026 17:23:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI87T-00000004zNn-3qaI;
	Sat, 17 Oct 2026 17:22:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 62E5843C65;
	Sat, 17 Oct 2026 17:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13151F000C6;
	Sat, 17 Oct 2026 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792257775;
	bh=+KzFzxYaDpiw3v2cN1wsy4A4fK7ubLLV9aUEhhmv9Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nR8OzMr9ja/piPNdLePtX45279Zm/W8WgW597xg8U+B2nad5YzQnDYRVKbtdBQAn4
	 T8ddc5IcuhUwebCEHtCsQm30HyPt+m8W73nWWwCLAbU0JmNo24pyX5HE/v5d549VDn
	 FbPaa1mnmVpcszeQBq9qZhZnlJtZmI5HfwXSduugtiGULIT/j5qhK75TVMPFY0u7/b
	 QPC7dh0dAbwHaOXU8R63Som1r2qwDiC6g8h3aWeykTqZwZOM2dSdVLzVoFqODeUuK7
	 bsl0IM8mWb1tsA+xKtZBcrN8MJIvsBwKwOBbDld/dYWmu/b3UpSovI5P835GTyZvkd
	 CZ5GuRox3ufuw==
Date: Sat, 17 Oct 2026 19:22:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
Message-ID: <20261017-gainful-goldfish-of-climate-bef863@quoll>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-2-e63b49eabe2d@gmail.com>
 <20261016140115.GA1798470-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016140115.GA1798470-robh@kernel.org>
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

On Fri, Oct 16, 2026 at 09:01:15AM -0500, Rob Herring wrote:
> On Fri, Oct 16, 2026 at 04:56:36PM +0800, Jason Yang wrote:
> > The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
> > for DSI and a receiver for CSI-2, and two consumers can use them at the
> > same time. The single cell of this binding selects the mode and refers
> > to the transmitter, so the receiver cannot be described.
> > 
> > Allow a second cell that selects the transmitter or the receiver. With
> > D-PHY:
> > 
> > 	/* the MIPI DSI host, driving the transmitter */
> > 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_TX>;
> > 
> > 	/* the MIPI CSI-2 host, driving the receiver */
> > 	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_DIRECTION_RX>;
> > 
> > and with C-PHY:
> > 
> > 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_TX>;
> > 	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_DIRECTION_RX>;
> > 
> > The transmitter and the receiver cannot operate in different modes [1],
> > so the first cell must match in both consumers.
> > 
> > Two cells describe the receiver as well. A single cell keeps referring
> > to the transmitter, so existing device trees are unaffected.
> > 
> > [1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
> >     operate in the same PHY mode."
> 
> The problem here is this is an ABI break. An existing OS will not know 
> what to do with 2 cells. Perhaps adding flags to the upper bits of the 
> existing cell would work.

Existing OS should ignore surplus cell if the driver is coded properly.
Same as adding new properties or new front-compatible.  The question is
how the existing driver behaves?

Best regards,
Krzysztof


