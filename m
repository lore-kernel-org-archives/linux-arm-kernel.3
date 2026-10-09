Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10A5CA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTT8pod/dXSgBzj9OOaa5UJXITB7IAWcLcd9LSZGJk0=; b=F5QUiEm0KHcAicwP53m4ulBhHU
	jFZzfjVzCLD1Gg2HP+BuUQhOgCoHRz8tZgTlFagPF3oP+usfJbaNAWXbjrmuzAXLzmRQe14qXe2m5
	CFnHk8K5PFqQrA1IwoSKfiTixlCG+OueFwQ4kg+pQ0a4RqKcx5lEORdbJrcSLA9gk1RGJZX0kpZLi
	4R+PSs2otjsZchrIC30TjxbePXXeW70aXlcxjwbG+Szv28jtlWQVH71E0zqt0b+0YYemaqVztRdvh
	jb4L6dH4DMpbcaazgwneFgLLPqSggHZ49yYYL5EXXqWGeWFwwT4zrQBGohWCR3QAgN0M3X8elSKy4
	w2NL/l9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDn2-00000006ghw-0F5W;
	Fri, 09 Oct 2026 16:49:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDn1-00000006ghb-0w0c;
	Fri, 09 Oct 2026 16:49:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 466166053E;
	Fri,  9 Oct 2026 16:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C581F000FF;
	Fri,  9 Oct 2026 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791564586;
	bh=CTT8pod/dXSgBzj9OOaa5UJXITB7IAWcLcd9LSZGJk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WSX7FMUOCYVTX/ma95DRi6BuxZOdqwIprcFhIKZpgHCYwBIJEHdcMeFOFVMwlDt/A
	 CWVJ1TJ45tECI7M+iXIunGxrTb+HsIChi/MgZk5nR72uRQOu4BFs5+VVGT6Im62Wxi
	 enlLXKLlAUgqXlhJk8gIIGuOIexyVphQ5PSDIwtOZmQ/tTVBWHGSuNKESj3syoWguy
	 X5p80UaYONzYWLXb65Bmfr88jEXZKPFElnpCfbEqCi41EeZLAbVzwvDNDTPgi5tHUS
	 +SJSLtZ28KWDFNgdjiCrsKVRM58FPAmtExWyZuiHVCcEaocPzlcwFCXc59iXn9C3ZR
	 wIXx1fu1QaY9w==
Date: Fri, 9 Oct 2026 11:49:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"David S . Miller" <davem@davemloft.net>,
	Russell King <linux@armlinux.org.uk>,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	David Wu <david.wu@rock-chips.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net-next v11 2/6] dt-bindings: net: pcs: add
 rockchip,rk3568-xpcs support
Message-ID: <179156458455.2715944.16954075391439114318.robh@kernel.org>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
 <20261008175225.3375274-3-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008175225.3375274-3-coiaprant@gmail.com>
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


On Fri, 09 Oct 2026 01:51:56 +0800, Coia Prant wrote:
> Add device tree binding documentation for the Synopsys DesignWare
> XPCS integrated on the Rockchip RK3568 SoC.
> 
> The XPCS is accessed over the APB3 bus and internally connected to
> a Naneng Combo SerDes PHY.  It supports 1000BASE-X, SGMII, and
> QSGMII modes, with four MII ports.
> 
> The MII port used by the SGMII link is derived from the MAC it is
> routed to: GMAC0 uses port 0, GMAC1 uses port 1.  The port index is
> not an independent board-level configuration, so the binding does
> not describe the ports.  If a future SoC needs per-port configuration
> that cannot be derived, pcs-handle argument cells can be added then.
> 
> The CRU reset lines (SRST_XPCS*) are intentionally not described: no
> in-tree user requests them, and bring-up relies on the PD_PIPE power
> domain, the SerDes PHY and the in-IP soft reset. They can be added
> later as optional without breaking ABI.
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  .../net/pcs/rockchip,rk3568-xpcs.yaml         | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


