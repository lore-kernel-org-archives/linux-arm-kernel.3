Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B139C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 20:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v26kdZJuDullQdaeIF02DAn4bkJ0oZUrA6h5X1L9724=; b=AXKxltzgEB++FSVqa5vPfV7y1U
	fjgTPUmd8HFpapXdOMXY97Vefd69fTCwC5MLQB06VSbw2mbKtuj5AvHsadC6VqKoiAvVqZM49ux85
	8jEJhhEPAl4HowiW/7GZQMkeXHRaF67t8iOlB+wS6QgbMlHVIV7zymDzNaSiEXNsdSOPLIFLZeAhC
	Skjg9lAVWtfpSprk+PypAGt1T7ii7dX0cBjzZlnxERc9rmQVunHGN5VDoSDT2Ice+/Me/pQwJC0zN
	nQG/pGW4qU8CklnsmM3Nnd9bEE/SlSG6J4IKWmC3YRTOCpMA5STXSgIlgOX8PYcmnV/3doQDjxSBr
	xWZo57tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5shs-00000000EoT-1Jlm;
	Fri, 18 Apr 2025 20:53:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5se7-00000000DYD-3ZuQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 20:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=v26kdZJuDullQdaeIF02DAn4bkJ0oZUrA6h5X1L9724=; b=cJJTnzWbpGOGLdjntuuBlONbCO
	PObxKf6qSECUeqVv9ArshIVoxarXkz2EDiFQMRWINZOh3Jkbp3lzE9y+EbZm06SEp+FCtd+Qpbr/C
	O1IwwnSTyqRr7nBcCc2cbQSnF0Yf1d87e1ZuDO22/8GSrHtFWy0RuVCQtO6zAC20bdwA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u5sdr-009wIw-Ic; Fri, 18 Apr 2025 22:48:55 +0200
Date: Fri, 18 Apr 2025 22:48:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: ti: k3-am654-cpsw-nuss:
 update phy-mode in example
Message-ID: <2cf14499-6ce8-42e0-98bb-3669aa0ed1fe@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <4216050f7b33ce4e5ce54f32023ec6ce093bd83c.1744710099.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4216050f7b33ce4e5ce54f32023ec6ce093bd83c.1744710099.git.matthias.schiffer@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_134911_892081_2E1CCCB9 
X-CRM114-Status: GOOD (  16.28  )
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

On Tue, Apr 15, 2025 at 12:18:02PM +0200, Matthias Schiffer wrote:
> k3-am65-cpsw-nuss controllers have a fixed internal TX delay, so RXID
> mode is not actually possible and will result in a warning from the
> driver going forward.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> index b11894fbaec47..c8128b8ca74fb 100644
> --- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> @@ -282,7 +282,7 @@ examples:
>                      ti,syscon-efuse = <&mcu_conf 0x200>;
>                      phys = <&phy_gmii_sel 1>;
>  
> -                    phy-mode = "rgmii-rxid";
> +                    phy-mode = "rgmii-id";

It would be good to enforce the phy-modes which are valid, which i
think are:

        case PHY_INTERFACE_MODE_RGMII_ID:
        case PHY_INTERFACE_MODE_RGMII_TXID:
        case PHY_INTERFACE_MODE_RMII:
        case PHY_INTERFACE_MODE_QSGMII:
        case PHY_INTERFACE_MODE_SGMII:
        case PHY_INTERFACE_MODE_USXGMII:

Anyway, this can be a follow up patch, it should not block this
patchset.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

