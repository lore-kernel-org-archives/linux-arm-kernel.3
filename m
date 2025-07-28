Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366CEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 07:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47Fk9CIAGtNHco8wNLXEvPIj9J6CR5nOoXAaq7kp3PQ=; b=QquYyhUOGI3oKoX0sPUHpGHX+T
	g2kz1NJgrMZ8PhJeZX3nWThn0aDSR7Wr2OeMSCMgW2DH9tuYHD9btP9yRKrpbGP2/47GALwPfccVN
	321kOOkMTSSYnEgVqUF+ZlrOjhjnL2S0hh2D1ZDenkuAY9uX9HGYNnkes+oW1/EDGm3VdWLBk2bmj
	Rj0fEMam0XDjHHQw8bH88DqL8QcCHA49CvQnJuebDT1TYW+faKFQBq079IUhkIXH3jnJOJVzTSaFn
	nktX8SQ3L9cXmyDcFbYsKTgyAyr4jvgOrUQ8Xi+BX4/wsJxNvcZlX5hMyoH5u2yPHmChAsR5lEoIX
	2IIUdFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHut-0000000Doy6-0037;
	Mon, 28 Jul 2025 07:04:59 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHCV-0000000Dkeu-2Mhl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1753683547;
 bh=47Fk9CIAGtNHco8wNLXEvPIj9J6CR5nOoXAaq7kp3PQ=;
 b=HiyTw3a2wTGBmnL2OpWM2e50fm9a97jt60BarrpAqQDHMgZiAM3KBfYe07i7qbwhM0TE7W6qE
 9qV0oL3M/ZvdtLgww8v9KjsUKjMW2Ryt4XQDTGQSzWt4oYEELnB4x87/vFUA7iwJ1hQmB5NJT4n
 b/CU8NIjFd4X1KKYjp4EMZhyeuZIbzwXhDQMwB8mJsnEtjOqfgxHtQs43QrJ0s6BtWH56imlTew
 npL9gx4FdQS+WTKsQKyKhFBheWrVAP1Jn3doCU8/RbU9s/phiceXH/gw58tmxttXX0wa8mCS4Zx
 A+MsS1v5AmzRiybl3EDmpp0Jz163NAlXDeXjbUK1QoqA==
X-Forward-Email-ID: 68871646991cafe79f4c9fae
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.8
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <42188845-5206-4887-80b5-c79e8084f542@kwiboo.se>
Date: Mon, 28 Jul 2025 08:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] phy: rockchip: naneng-combphy: Add RK3528 support
To: Yao Zi <ziyao@disroot.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 Shresth Prasad <shresthprasad7@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Chukun Pan <amadeus@jmu.edu.cn>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Andy Yan <andy.yan@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20250624033733.50197-1-ziyao@disroot.org>
 <20250624033733.50197-6-ziyao@disroot.org>
 <eb7c9e40-3c17-488f-98a2-17b972f61e75@kwiboo.se> <aIHDSW0XO9BCfch3@pie.lan>
 <aIcFmhQqLuUlLZb_@pie>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <aIcFmhQqLuUlLZb_@pie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_231907_645127_BAC0B2E0 
X-CRM114-Status: GOOD (  41.56  )
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

Hi Yao Zi,

On 7/28/2025 7:07 AM, Yao Zi wrote:
> On Thu, Jul 24, 2025 at 05:23:55AM +0000, Yao Zi wrote:
>> On Wed, Jul 23, 2025 at 04:51:15PM +0200, Jonas Karlman wrote:
>>> Hi Yao Zi,
>>>
>>> On 6/24/2025 5:37 AM, Yao Zi wrote:
>>>> Rockchip RK3528 integrates one naneng-combphy that is able to operate in
>>>> PCIe and USB3 mode. The control logic is similar to previous variants of
>>>> naneng-combphy but the register layout is apperantly different from the
>>>> RK3568 one.
>>>>
>>>> Signed-off-by: Yao Zi <ziyao@disroot.org>
>>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>  .../rockchip/phy-rockchip-naneng-combphy.c    | 186 +++++++++++++++++-
>>>>  1 file changed, 185 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>>>> index 1d1c7723584b..bf00a85a113b 100644
>>>> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>>>> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> 
> ...
> 
>>>> @@ -398,6 +437,147 @@ static int rockchip_combphy_probe(struct platform_device *pdev)
>>>>  	return PTR_ERR_OR_ZERO(phy_provider);
>>>>  }
>>>>  
>>>> +static int rk3528_combphy_cfg(struct rockchip_combphy_priv *priv)
>>>> +{
>>>> +	const struct rockchip_combphy_grfcfg *cfg = priv->cfg->grfcfg;
>>>> +	unsigned long rate;
>>>> +	u32 val;
>>>> +
>>>> +	/* Set SSC downward spread spectrum */
>>>> +	val = FIELD_PREP(RK3528_PHYREG6_SSC_DIR, RK3528_PHYREG6_SSC_DOWNWARD);
>>>> +	rockchip_combphy_updatel(priv, RK3528_PHYREG6_SSC_DIR, val, RK3528_PHYREG6);
>>>> +
>>>> +	switch (priv->type) {
>>>> +	case PHY_TYPE_PCIE:
>>>> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con0_for_pcie, true);
>>>> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con1_for_pcie, true);
>>>> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con2_for_pcie, true);
>>>> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->con3_for_pcie, true);
>>>> +		break;
>>>> +	case PHY_TYPE_USB3:
>>>> +		/* Enable adaptive CTLE for USB3.0 Rx */
>>>> +		rockchip_combphy_updatel(priv, RK3528_PHYREG80_CTLE_EN, RK3528_PHYREG80_CTLE_EN,
>>>> +					 RK3528_PHYREG80);
>>>> +
>>>> +		/* Set slow slew rate control for PI */
>>>> +		val = FIELD_PREP(RK3528_PHYREG81_SLEW_RATE_CTRL,
>>>> +				 RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW);
>>>> +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_SLEW_RATE_CTRL, val,
>>>> +					 RK3528_PHYREG81);
>>>> +
>>>> +		/* Set CDR phase path with 2x gain */
>>>> +		rockchip_combphy_updatel(priv, RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X,
>>>> +					 RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X, RK3528_PHYREG81);
>>>> +
>>>> +		/* Set Rx squelch input filler bandwidth */
>>>> +		val = FIELD_PREP(RK3528_PHYREG83_RX_SQUELCH, RK3528_PHYREG83_RX_SQUELCH_VALUE);
>>>> +		rockchip_combphy_updatel(priv, RK3528_PHYREG83_RX_SQUELCH, val, RK3528_PHYREG83);
>>>> +
>>>> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txcomp_sel, false);
>>>> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_txelec_sel, false);
>>>> +		rockchip_combphy_param_write(priv->phy_grf, &cfg->usb_mode_set, true);
>>>
>>> I suggest we add something like following here:
>>>
>>> 		rockchip_combphy_param_write(priv->pipe_grf, &cfg->u3otg0_port_en, true);
>>>
>>> to ensure that U3 is enabled in case boot firmware disable the U3 port.
>>
>> Thanks for the hint, I'm willing to adapt it. Should we handle the case
>> that USB is enabled by firmware but PCIe is going to be used in kernel,
>> too? It's desirable to make fewer assumptions about the state set by
>> firmware.
>>
>> P.S., I'm assuming the register should be written as "disabled" value
>> whenever PCIe is used, and "enabled" whenever USB is used, as
>> the LSB of USB_GRF_USB3OTG0_CON1 is said to be "USB 3.0 SS Port Disable
>> control" according to RK3588's TRM, which doesn't look like something
>> compatible with PCIe mode when setting to 1'b0 (port enabled). Please
>> correct me if I'm wrong.
> 
> I've read through the manual and done some tests today, and it seems I
> misunderstood the purpose of USB3OTG0_CON1. This register has only
> something to do with USB3, but not PCIe. Writing either "disabled" or
> "enabled" value to it doesn't affect PCIe functionality. Thus for the
> naneng-combphy driver, it should be enough to only write the "enabled"
> value to u3otg0_port_en if USB-3 mode is used.
> 
> Anyway, thanks for your remind on this register :) Its reset value
> allows USB-3 to function thus I just forgot about it during clean-up.
> I'll send v5 soon.

Sorry for not getting back to you sooner, I fully agree with your
assessment here, the USB3OTG0_CON1 reg only affects USB and has nothing
to do with PCIe. Trying to adjust it when probing PCIe drivers could
open up for strange bahavior in case USB3 controller driver has already
been loaded or similar.

> 
> ...
> 
>>>> +static const struct rockchip_combphy_grfcfg rk3528_combphy_grfcfgs = {
>>>> +	/* pipe-phy-grf */
>>>> +	.pcie_mode_set		= { 0x0000, 5, 0, 0x00, 0x11 },
>>>> +	.usb_mode_set		= { 0x0000, 5, 0, 0x00, 0x04 },
>>>> +	.pipe_rxterm_set	= { 0x0000, 12, 12, 0x00, 0x01 },
>>>> +	.pipe_txelec_set	= { 0x0004, 1, 1, 0x00, 0x01 },
>>>> +	.pipe_txcomp_set	= { 0x0004, 4, 4, 0x00, 0x01 },
>>>> +	.pipe_clk_24m		= { 0x0004, 14, 13, 0x00, 0x00 },
>>>> +	.pipe_clk_100m		= { 0x0004, 14, 13, 0x00, 0x02 },
>>>> +	.pipe_rxterm_sel	= { 0x0008, 8, 8, 0x00, 0x01 },
>>>> +	.pipe_txelec_sel	= { 0x0008, 12, 12, 0x00, 0x01 },
>>>> +	.pipe_txcomp_sel	= { 0x0008, 15, 15, 0x00, 0x01 },
>>>> +	.pipe_clk_ext		= { 0x000c, 9, 8, 0x02, 0x01 },
>>>> +	.pipe_phy_status	= { 0x0034, 6, 6, 0x01, 0x00 },
>>>> +	.con0_for_pcie		= { 0x0000, 15, 0, 0x00, 0x110 },
>>>> +	.con1_for_pcie		= { 0x0004, 15, 0, 0x00, 0x00 },
>>>> +	.con2_for_pcie		= { 0x0008, 15, 0, 0x00, 0x101 },
>>>> +	.con3_for_pcie		= { 0x000c, 15, 0, 0x00, 0x0200 },
>>>
>>> And adding something like this:
>>>
>>> 	/* pipe-grf */
>>> 	.u3otg0_port_en		= { 0x0044, 15, 0, 0x0181, 0x1100 },
>>>
>>> Should be possible with ("phy: rockchip: naneng-combphy: Enable U3 OTG
>>> port for RK3568") [1].
>>>
>>> Most RK3528 boards I have come across this far seem to use PCIe instead
>>> of USB3, so having boot firmware disable U3 early (to help support USB
>>> gadget in boot firmware) and instead having this PHY driver re-enable U3
>>> when needed seem most logical to me.
> 
> Thank you for the U-Boot patch! While reading through, I saw commit
> "rockchip: rk3528: Disable USB3OTG U3 port early" states,

I will try to send out a small RK3528 U-Boot series including that patch
later today, with v6.16 just released I am hoping U-Boot shortly merges
the v6.16 DTs for its next release, v2025.10, to reduce the size of such
U-Boot series.

> 
>> Some board designs may not use the COMBPHY for USB3 purpose. For these
>> board to use USB OTG the input clock source must change to use UTMI
>> clk instead of PIPE clk.
> 
> Does this mean we should ideally add similar handling for USB3OTG in the
> kernel's usb2phy driver, too? Otherwise if the firmware doesn't handle
> clock stuff well, the kernel'll fail to operate in OTG mode, either.

Checking for use of a usb3-phy from the usb2phy driver feel like the
wrong place to do that, if anything possible from the DWC3 driver. But
that also feel a bit strange to me, and could possibly be complex.

What we know for sure is that when the combo phy, or usbdp phy for e.g.
rk3576 and rk3588, is used for usb3, we should be sure that we can
"enable" U3 in USB3OTGx_CON1 regs without affecting anything.

Based on my testing it only seem to be the utmi/pipe clk source bit that
has any effect on USB2 only function. So could possibly be something for
the clock tree to handle as an alternative approach.

To be able to use usb2 in U-Boot, and with the usbdp phy driver already
having support in both Linux and U-Boot to enable U3 port, doing an
early disable in U-Boot and later re-enable when we know for sure is
easy and make some sense to me ;-)

Regards,
Jonas

> 
>>>
>>> I will push an updated U-Boot rk3528 branch [2] where I include such
>>> early U3 port disable once source.denx.de is back online again.
>>>
>>> [1] https://lore.kernel.org/r/20250723072324.2246498-1-jonas@kwiboo.se
>>> [2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
>>>
>>> Regards,
>>> Jonas
> 
> Thanks,
> Yao Zi


