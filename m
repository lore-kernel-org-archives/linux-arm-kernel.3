Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFE1CA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5bMgzoAD9TX0Ya0OQIcLnyUsUBkoiE4qn++57CQU/w=; b=U2bUrjAERztDyNVEcm67HeJX5y
	K1y5CvvW5ilM8K1OaeOFskFZzSFl0MVd/At9VdZVSJYAnizd9NkxK25v/yqRSapUPjy+pdHefuK0n
	LFCNMcpNGQqCvl50neOO4i6vTCbBVYqvL7XVrxeT0ISNqZidBRrRkneouFRnwawfVAxnDIiSP2r9O
	nK/oG9YA0vnylUJ7U+YJMYLjNVBKmt8pz58U2ulrOoCFGQywEPKuLpeakASyckY1hQG/ZNFzJvmXj
	FfliZFa+Mj1vmSIEraNWmdTOINtpeHArkn9np7jCCeW0yhundoFYuaSDyH7EdfQrxIIhhxDo0Mfh/
	O3L6hvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDnW-00000006gqM-1CQZ;
	Fri, 09 Oct 2026 16:50:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDnU-00000006gq3-3VHI;
	Fri, 09 Oct 2026 16:50:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48D016053E;
	Fri,  9 Oct 2026 16:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA00E1F000FF;
	Fri,  9 Oct 2026 16:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791564616;
	bh=X5bMgzoAD9TX0Ya0OQIcLnyUsUBkoiE4qn++57CQU/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gWyDY+ezHCpkHnpiVa+qJfyQh44cMGLAEea9ajLx2EdZnqG8WGnwDgrNQ7fK5dGeC
	 giFTynWHnUkmmIctB0JvtkUcCdR7FFXh3CQwa9xCkKFARs1xDhGdtGZWd5domM8smQ
	 gdzJ7lbM07RnbBAmgV9z2mF/k1lMhz83yXlO3ZZfEenB3zmqJYXvSZNYG1mdaXB0hV
	 n4QawKNGnVK9Ypjce91gXG73wOELPv+q004DNN0axye/nqPWpOl3GkfhBpaZku1a5e
	 bqrMk6P9ek3E/Tiw/DzGwUo0MBtMVzaUA1dqKqiZrY1OEtCDWLrKeT9ej8V4lQqFgW
	 qGoBkJunp7ZCg==
Date: Fri, 9 Oct 2026 11:50:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Dumazet <edumazet@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paolo Abeni <pabeni@redhat.com>, David Wu <david.wu@rock-chips.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH net-next v11 4/6] dt-bindings: net: rockchip-dwmac:
 document pcs-handle
Message-ID: <179156461404.2718981.13574948615000926953.robh@kernel.org>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
 <20261008175225.3375274-5-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008175225.3375274-5-coiaprant@gmail.com>
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


On Fri, 09 Oct 2026 01:51:58 +0800, Coia Prant wrote:
> The Rockchip GMAC binding needs to describe the PCS reference used by
> the SGMII support added later in this series. The property will be
> parsed by rk_pcs_init(), and a missing phandle fails the probe. Add it
> and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
> only SoC in this binding that has SGMII support.
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  .../bindings/net/rockchip-dwmac.yaml          | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


