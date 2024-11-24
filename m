Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EDAE6688D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 11:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3BQnHmMzJvRzOGoxvKw6fbWVPHb009ceAjCw5kM6Qk=; b=mzzOo57xB7F6Ny+g/Xbpy1gO3p
	YKP75ONIs8Or42HRITIgCZsAZ5YD4TFOS8kOOSoMW9RWP69vaWlhDmslKhJlQRJb5GeEJKTDFm1Hj
	E3DJnIt76K6j2gW4CYcnK/+kH5beNIdyOK+PUhVBT9ADgWAZKb7WVLOuHKje9uZ0eCi0qxexHljuL
	V39FLszrEKuqmhpMzIsJSgoElb062ieu01U8rn+6MSqVm6ou9im61JB0ozKenyOSQjhZzN4CLSZEH
	4jEfdfXSupeIbGy+/HCE2YSio84bcBGoT3zclpmqZAeS+w3sB6jmgQRghSuJ/csnVmPrUxGW+sAk6
	eMoZPNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAzJ-00000005h9U-4ARI;
	Sun, 24 Nov 2024 11:41:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAyL-00000005h46-3ggc;
	Sun, 24 Nov 2024 11:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J3BQnHmMzJvRzOGoxvKw6fbWVPHb009ceAjCw5kM6Qk=; b=FcQwNb1Nxc86U2alMAKKQijXNV
	5BVPN2Tp0UqXl5qkKq7DIEA9jHHTZucMj98AqTokHXNRwUyIYA8rM24FF58r/vPu+ZYbRoW2jUbRl
	h7dyNgeBbYFl5ytnPtVTFb5TOMurDcszoejPbvXlSH3IDz/1rhecHcctN4oSqyJSxx1KQkiHYRabV
	R3lNBZcleSSsxMWX6EP2N66v1A0ZuQbbPNe5hE9Exqdhe/igS7mIls5fVDaWtfOL7AbPq3EuTaLm6
	cNM67DvtSyO7z0aytWmPPOYY1Euod7ueersLrJYo2CMRdXIK5kD/BhUcsfPqzXHFMMB78ZsAzpwYl
	vHoAjocQ==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tFAyF-00047c-Or; Sun, 24 Nov 2024 12:40:07 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quentin.schulz@cherry.de, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Add Rockchip MIPI CSI/DSI PHY schema
Date: Sun, 24 Nov 2024 12:40:06 +0100
Message-ID: <8454190.T7Z3S40VBb@diego>
In-Reply-To: <udad4qf3o7kt45nuz6gxsvsmprh4rnyfxfogopmih6ucznizih@7oj2jrnlfonz>
References: <20241113221018.62150-1-heiko@sntech.de>
 <20241113221018.62150-2-heiko@sntech.de>
 <udad4qf3o7kt45nuz6gxsvsmprh4rnyfxfogopmih6ucznizih@7oj2jrnlfonz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_034013_978970_55FADEFB 
X-CRM114-Status: GOOD (  30.75  )
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

Am Freitag, 22. November 2024, 19:49:20 CET schrieb Sebastian Reichel:
> Hi,
> 
> On Wed, Nov 13, 2024 at 11:10:17PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > 
> > Add dt-binding schema for the MIPI CSI/DSI PHY found on
> > Rockchip RK3588 SoCs.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >  .../phy/rockchip,rk3588-mipi-dcphy.yaml       | 82 +++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> > new file mode 100644
> > index 000000000000..5ee8d7246fa0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/rockchip,rk3588-mipi-dcphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip MIPI CSI/DSI PHY with Samsung IP block
> > +
> > +maintainers:
> > +  - Guochun Huang <hero.huang@rock-chips.com>
> > +  - Heiko Stuebner <heiko@sntech.de>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3576-mipi-dcphy
> > +      - rockchip,rk3588-mipi-dcphy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#phy-cells":
> > +    const: 0
> 
> I would expect an argument to select between D-PHY and C-PHY mode,
> so that the binding is ready for it even when the driver does not
> yet support it. E.g. something like
> 
>   '#phy-cells':
>     const: 1
>     description: |
>       Supported modes are:
>         - PHY_TYPE_DPHY
>         - PHY_TYPE_CPHY
>       See include/dt-bindings/phy/phy.h for constants.
> 
> This would match how it works for the naneng Combo PHY to switch
> between PCIe/SATA/USB3. Also Mediatek CSI DC-PHY handles it that
> way upstream (with just D-PHY being supported). I see that the
> driver stack you send upstream expects, that the PHY user (e.g.
> the DSI controller) instead manually calls phy_set_mode(phy, <mode>).
> To me it seems more sensible to just get this automaically from DT.

The mode-selection for the phy is definitly tied to the hardware-design.
Depending on how the board is designed, it'll always do either D-PHY
or C-PHY mode.

I guess it mostly just feels strange when so far the parameter was
used to identify say an individual clock from the clock controller.

But reading the Medietek discussion (up to [0]) it looks like that is
a nice way to do this, so I'll adapt things in the next version.


Heiko


[0] https://lore.kernel.org/all/20230608200552.GA3303349-robh@kernel.org/


> Otherwise the whole series LGTM.
> 
> Greetings,
> 
> -- Sebastian
> 
> > +  clocks:
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pclk
> > +      - const: ref
> > +
> > +  resets:
> > +    maxItems: 4
> > +
> > +  reset-names:
> > +    items:
> > +      - const: m_phy
> > +      - const: apb
> > +      - const: grf
> > +      - const: s_phy
> > +
> > +  rockchip,grf:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the syscon managing the 'mipi dcphy general register files'.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +  - "#phy-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> > +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> > +
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      phy@feda0000 {
> > +        compatible = "rockchip,rk3588-mipi-dcphy";
> > +        reg = <0x0 0xfeda0000 0x0 0x10000>;
> > +        clocks = <&cru PCLK_MIPI_DCPHY0>,
> > +                 <&cru CLK_USBDPPHY_MIPIDCPPHY_REF>;
> > +        clock-names = "pclk", "ref";
> > +        resets = <&cru SRST_M_MIPI_DCPHY0>,
> > +                 <&cru SRST_P_MIPI_DCPHY0>,
> > +                 <&cru SRST_P_MIPI_DCPHY0_GRF>,
> > +                 <&cru SRST_S_MIPI_DCPHY0>;
> > +        reset-names = "m_phy", "apb", "grf", "s_phy";
> > +        rockchip,grf = <&mipidcphy0_grf>;
> > +        #phy-cells = <0>;
> > +      };
> > +    };
> 





