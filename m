Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3D3C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzTGCDZx7ZCiGjb4OHFTRlbx+7jKqxAcyMiJqmiykbU=; b=SWJb0xyeBJvoKMN/U0arsGXDrY
	d6nrLeqb4Il1/mrr6SN8ouMDWvYeZBFg9zLLW26IUc+xH7P7IhtHmlG1zXtvIW+nkQy/Y5FCIaYK8
	Kvhp0t/8RomIvqnruUq3sV2RcwBd61DgE7+RZ36v3Dk/7qenACuViBCq93mA/0ME3hB7Ylo0v13tg
	R1dy7A61HwWCo3I7fpnsY1mYa6iK6kTTXkVqLukU9KFhoVjVsGthnCFqWSz/bYhOkH02nyhzp8pRt
	7XsewFFlmvjeSE8yZRjaKmUZGqJ5oC2Ymz5GDeEZg2MCeppRs0xgIQVMa4UoedwHPY89wpRfOvGOT
	6ZfgzsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEvr-0000000FfQE-1SYC;
	Fri, 27 Jun 2025 19:40:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEZo-0000000FcHp-1lTs;
	Fri, 27 Jun 2025 19:17:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEEB44520D;
	Fri, 27 Jun 2025 19:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891C0C4CEE3;
	Fri, 27 Jun 2025 19:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751051851;
	bh=4tIY5Xv1aq93hm2eYGyz9mdC6DOUVIOyHjZ+4y79CfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrokVCE/iHGDnWfI2S2bpRHqVDTYWrOZjsS0Notwml4J1ce0uUyE0NYLMuxXrF4lL
	 Gv8LJBYbedx1LqCCpBGikDCZggPY3HiPXy/DFIDkU5pmH4TC3mD7if3RPMp98TUkPx
	 eOh6yRKMGs3LvXWwt/R7PUQpnz4M50xkqBZGg9wqFmfpn3psUG7Y4Oq3430IkwNbuJ
	 Ym9DWQ7ES8tkLTsb4ybKl/bsoDxb0/i1Ae8lFNy+RBRCDTqZij0bd3e7EPK30+atEl
	 QZhPzW6UwC0SH6Zj6DBR3tOnr1tIHtauojq/XTNg9+HePZ38UAfwwgREf4uO+E0Orp
	 1F1HqILr8Mhzg==
Date: Fri, 27 Jun 2025 14:17:30 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Diederik de Haas <didi.debian@cknow.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588
 variant
Message-ID: <20250627191730.GA4025458-robh@kernel.org>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-2-84eb3b2a736c@collabora.com>
 <DAOVBOKLXLS2.S9MXDD29X68J@cknow.org>
 <e9db11c2-b02d-4fd5-8927-7b5857089533@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9db11c2-b02d-4fd5-8927-7b5857089533@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_121732_500013_1143D382 
X-CRM114-Status: GOOD (  24.22  )
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

On Wed, Jun 18, 2025 at 09:45:32AM +0200, Michael Riesch wrote:
> Hi Diederik,
> 
> Thanks for your comments!
> 
> On 6/17/25 16:12, Diederik de Haas wrote:
> > Hi,
> > 
> > I'm (unfortunately) not seeing any @rock-chips.com recipients ...
> 
> Oops, I meant to include at least Kever, but forgot to do it. Will do in v2.
> 
> Cc: Kever
> 
> > 
> > On Tue Jun 17, 2025 at 10:54 AM CEST, Michael Riesch via B4 Relay wrote:
> >> From: Michael Riesch <michael.riesch@collabora.com>
> >>
> >> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
> >> Add the variant and allow for the additional reset.
> >>
> >> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >> ---
> >>  .../bindings/phy/rockchip-inno-csi-dphy.yaml       | 60 ++++++++++++++++++++--
> >>  1 file changed, 55 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> index 5ac994b3c0aa..6755738b13ee 100644
> >> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> >> @@ -21,6 +21,7 @@ properties:
> >>        - rockchip,rk3326-csi-dphy
> >>        - rockchip,rk3368-csi-dphy
> >>        - rockchip,rk3568-csi-dphy
> >> +      - rockchip,rk3588-csi-dphy
> >>  
> >>    reg:
> >>      maxItems: 1
> >> @@ -39,18 +40,49 @@ properties:
> >>      maxItems: 1
> >>  
> >>    resets:
> >> -    items:
> >> -      - description: exclusive PHY reset line
> >> +    minItems: 1
> >> +    maxItems: 2
> >>  
> >>    reset-names:
> >> -    items:
> >> -      - const: apb
> >> +    minItems: 1
> >> +    maxItems: 2
> >>  
> >>    rockchip,grf:
> >>      $ref: /schemas/types.yaml#/definitions/phandle
> >>      description:
> >>        Some additional phy settings are access through GRF regs.
> >>  
> >> +allOf:
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - rockchip,px30-csi-dphy
> >> +              - rockchip,rk1808-csi-dphy
> >> +              - rockchip,rk3326-csi-dphy
> >> +              - rockchip,rk3368-csi-dphy
> >> +              - rockchip,rk3568-csi-dphy
> >> +    then:
> >> +      properties:
> >> +        resets:
> >> +          items:
> >> +            - description: exclusive PHY reset line
> >> +
> >> +        reset-names:
> >> +          items:
> >> +            - const: apb
> >> +
> >> +      required:
> >> +        - reset-names
> >> +    else:
> >> +      properties:
> >> +        resets:
> >> +          minItems: 2
> >> +
> >> +        reset-names:
> >> +          minItems: 2

You have to define the names. Ideally, at the top level and then keep 
this part like this.

> >> +
> >>  required:
> >>    - compatible
> >>    - reg
> >> @@ -59,7 +91,6 @@ required:
> >>    - '#phy-cells'
> >>    - power-domains
> >>    - resets
> >> -  - reset-names
> >>    - rockchip,grf
> >>  
> >>  additionalProperties: false
> >> @@ -78,3 +109,22 @@ examples:
> >>          reset-names = "apb";
> >>          rockchip,grf = <&grf>;
> >>      };
> >> +  - |
> >> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> >> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> >> +
> >> +    soc {
> >> +        #address-cells = <2>;
> >> +        #size-cells = <2>;
> >> +
> >> +        csi_dphy0: phy@fedc0000 {
> >> +            compatible = "rockchip,rk3588-csi-dphy";
> >> +            reg = <0x0 0xfedc0000 0x0 0x8000>;
> >> +            clocks = <&cru PCLK_CSIPHY0>;
> >> +            clock-names = "pclk";
> >> +            #phy-cells = <0>;
> >> +            resets = <&cru SRST_CSIPHY0>, <&cru SRST_P_CSIPHY0>;
> >> +            rockchip,grf = <&csidphy0_grf>;
> >> +            status = "disabled";
> >> +        };
> >> +    };
> > 
> > ... which could hopefully tell us what the value is/should be for the
> > *required* 'power-domains' property, which is missing in this example.
> > IOW: the binding example is invalid according to its own binding.
> 
> Huh, indeed. Hm. Why didn't make dt_binding_check warn me about that?!

You disabled the node, what do you want us to check?

Rob

