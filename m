Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9AAC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 21:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gG+K+EvdGySBaqP3c+lFA0pUt8fKLg2/x4AVyg5jhrc=; b=DDS7oruxYJVEKrM8SawIWm8oaj
	6kIdFLlYfAVRB505tC5xclruKK4S3ip0gUOY1Oaoj4U012d6LjqWybfRTT05arDG15Z5qE3r0tJTH
	Uy/TwRNyZTjnT8Gi9NcHbzDtHDQy3hHkhV6xHCkfUsWu2M1PcI6nFrzbD2yakKLSRnTuQhybzoQDn
	vayl4eVFdRN6qVxrRZOsSCIo+iZDGNRwQPIBkvveRutM46H/c52iOHUZloM2WQuICaTg2XamERWX0
	ulhxRnORORWgP4FzgiBPN6ZSZSNsginril/Ng2NCA/GNid7Pogc1auEgH9XbfokpIugvuN5+1o1Pm
	8h2xylSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug9Kl-0000000DHKn-42YG;
	Sun, 27 Jul 2025 21:55:07 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug9IE-0000000DH8Z-2h6l
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 21:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1753653150;
 bh=gG+K+EvdGySBaqP3c+lFA0pUt8fKLg2/x4AVyg5jhrc=;
 b=VGmY9bjSXz+z8FoAhSCQBrKJ4iN4FLAst1KsF0F071Xs9v/0O4DM47GPb+gVBgQ0gdrihyxqr
 M4HaBC2+1FxfjTgFWgunAn4Y4ThC786JpTbE9yO4gtnA8lIFkwLDaml+3dZ3kqiRhMAagfo4Cha
 z4ChAe8zUFXP3pCk3L1LWubHAVYG1QoWn/bjU/Ej2Q/MjsnVc2W+RgHFmiI03FZJfx1b2HymIMm
 z08yK5O9agUscRHNXHx+/H33BZGfwNEarlOwhdSp/mqZhqUWm2+uVbRfoniXyuhi/9kSWcbXBsr
 /22P7JAmL8cDnQBXfn8lU0CRNQxrVUD5VuEUdD4TOjYA==
X-Forward-Email-ID: 68869f8dc509b9ee169d35e6
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <badef015-22ff-4232-a4d0-80d2034113ca@kwiboo.se>
Date: Sun, 27 Jul 2025 23:52:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: dsa: realtek: Add support for use of an
 optional mdio node
To: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250727180305.381483-1-jonas@kwiboo.se>
 <20250727180305.381483-3-jonas@kwiboo.se>
 <2504b605-24e7-4573-bec0-78f55688a482@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <2504b605-24e7-4573-bec0-78f55688a482@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_145230_719949_4C3FCCFE 
X-CRM114-Status: GOOD (  20.69  )
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

Hi Andrew,

On 7/27/2025 9:09 PM, Andrew Lunn wrote:
> On Sun, Jul 27, 2025 at 06:02:59PM +0000, Jonas Karlman wrote:
>> The dt-bindings schema for Realtek switches for unmanaged switches
>> contains a restriction on use of a mdio child OF node for MDIO-connected
>> switches, i.e.:
>>
>>   if:
>>     required:
>>       - reg
>>   then:
>>     not:
>>       required:
>>         - mdio
>>     properties:
>>       mdio: false
>>
>> However, the driver currently requires the existence of a mdio child OF
>> node to successfully probe and properly function.
>>
>> Relax the requirement of a mdio child OF node and assign the dsa_switch
>> user_mii_bus to allow a MDIO-connected switch to probe and function
>> when a mdio child OF node is missing.
>  
> I could be getting this wrong.... Maybe Linus knows more.
> 
> It could be the switch does not have its own separate MDIO bus just
> for its internal PHYs. They just appear on the parent mdio bus. So
> you represent this with:
> 
> &mdio0 {
> 	reset-delay-us = <25000>;
> 	reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> 	reset-post-delay-us = <100000>;
> 
> 	phy0: ethernet-phy@0 {
> 		reg = <0>;
> 	};
> 
> 	phy1: ethernet-phy@1 {
> 		reg = <0>;
> 	};
> 
> 
>         ethernet-switch@1d {
>                compatible = "realtek,rtl8365mb";
>                reg = <0x1d>;
>                pinctrl-names = "default";
>                pinctrl-0 = <&rtl8367rb_eint>;
> 
>                ethernet-ports {
>                        #address-cells = <1>;
>                        #size-cells = <0>;
> 
>                        ethernet-port@0 {
>                                reg = <0>;
>                                label = "wan";
> 			       phy-handle = <phy0>;
>                        };
> 
>                        ethernet-port@1 {
>                                reg = <1>;
>                                label = "lan1";
> 			       phy-handle = <phy1>;
>                        };
> 
> If this is correct, you should not need any driver or DT binding
> changes.

Something like above does not seem to work, I get following:

  mdio_bus stmmac-0: MDIO device at address 0 is missing.
  mdio_bus stmmac-0: MDIO device at address 1 is missing.
  mdio_bus stmmac-0: MDIO device at address 2 is missing.
  mdio_bus stmmac-0: MDIO device at address 3 is missing.

  rtl8365mb-mdio stmmac-0:1d: found an RTL8367RB-VB switch
  rtl8365mb-mdio stmmac-0:1d: configuring for fixed/rgmii link mode
  rtl8365mb-mdio stmmac-0:1d wan (uninitialized): failed to connect to PHY: -ENODEV
  rtl8365mb-mdio stmmac-0:1d: Link is Up - 1Gbps/Full - flow control off
  rtl8365mb-mdio stmmac-0:1d wan (uninitialized): error -19 setting up PHY for tree 0, switch 0, port 0
  rtl8365mb-mdio stmmac-0:1d lan1 (uninitialized): failed to connect to PHY: -ENODEV
  rtl8365mb-mdio stmmac-0:1d lan1 (uninitialized): error -19 setting up PHY for tree 0, switch 0, port 1
  rtl8365mb-mdio stmmac-0:1d lan2 (uninitialized): failed to connect to PHY: -ENODEV
  rtl8365mb-mdio stmmac-0:1d lan2 (uninitialized): error -19 setting up PHY for tree 0, switch 0, port 2
  rtl8365mb-mdio stmmac-0:1d lan3 (uninitialized): failed to connect to PHY: -ENODEV
  rtl8365mb-mdio stmmac-0:1d lan3 (uninitialized): error -19 setting up PHY for tree 0, switch 0, port 3

And without an explicit 'mdio' child node the driver currently fails to
load and the switch is never registered:

  rtl8365mb-mdio stmmac-0:1d: found an RTL8367RB-VB switch
  rtl8365mb-mdio stmmac-0:1d: no MDIO bus node
  rtl8365mb-mdio stmmac-0:1d: could not set up MDIO bus
  rtl8365mb-mdio stmmac-0:1d: error -ENODEV: unable to register switch

With a 'mdio' child node 'make CHECK_DTBS=y' report something like:

  rockchip/rk3528-radxa-e24c.dtb: ethernet-switch@1d (realtek,rtl8365mb): mdio: False schema does not allow { [snip] }
        from schema $id: http://devicetree.org/schemas/net/dsa/realtek.yaml#

So something should probably be changed, the driver, dt-bindings or
possible both.

With this patch the last example in net/dsa/realtek.yaml can be made to
work. The example the ethernet-switch node in next patch is based on,
and something that closely matches how mediatek,mt7530 is described.

Please let me know if you want me to drop this and instead try to update
the dt-bindings and use a more verbose ethernet-switch node.

Regards,
Jonas

> 
> 	Andrew


