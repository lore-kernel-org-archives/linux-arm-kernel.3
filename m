Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D7CCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI8kR4Vsm264OZYzKPTA7zHRqZ4MLO4Aq50kaY8JXe0=; b=d7kSVocSj3kLVFU6M/LFzkvRJZ
	Xlzi4IKc0L44MBo6/cruqv4/UfoXyG22koOr1aTxKgyOIs4/5LkFZOOvBDH03XtRKjxN8GVWsxCGA
	7LaakW9KT0wqfMfk+tW87Fmqo2gpuQBse4GOcLRMV+0JcU3tLrX3+DCrJ4sDLWo9dlT2jzFeYJlQY
	TV5PNA4eKWI8Q7G+cO3VeCSd3DD0qwSWaOVJFHJlk+osSrMahX/EM4EWFQ25V+M+W3ZhdWFluqIch
	3+xaK4Kz1xNC5hBPzrHpsVOo0e1mgOPRvPZYVwRKrx7LOwEqdIPLvCG549ax7X+YJ9l495g+9UCAC
	TY5rd43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkd6-000000065KW-06dN;
	Wed, 03 Sep 2025 10:22:16 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjMr-00000005pgu-0dMK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 09:01:26 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 6151BA079A;
	Wed,  3 Sep 2025 11:01:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=xI8kR4Vsm264OZYzKPTA
	7zHRqZ4MLO4Aq50kaY8JXe0=; b=JVVbtdeQaUMRFpo8oLiVhxU2KVOGZNKGqec6
	reucawqe031zerfch0qTB/uxnc73NIhehHNTyrOPoocvzIKPNFjIzTCbHkzPAD73
	xeRrC6hoeHBawJBst9kgS6vFTWUmOdVBJuIKdx2iuClwaWtoeU6HHnAvT+oy1S9p
	iwubdydIXaRR6hVtWaBJAepotRXK02k3H8LyAdthSaIwy8wTqGvjyeBnqnJ/ty9S
	34rDLSgbCBHCs2p1gEHtyhnaLHKEYF4HaN7knCd0LQ+nYjw/1VsFZhleugPdUhNr
	TpUP+upCeI8eQI0835R/NaTFUNISyENHuv+vovgtB26qdPOAt7vUQEhwLTeBS9UB
	efgkNqA+DvjL6ymLu6PLkBI5JfesRa66inSU1R2tg5YefN1k+LQIQY3FNPOuLlwO
	4Tw2JhB2VsiSzqQZfKV6OmmHXVXgUg1mMR96FAu93tbCZKrQshft+Wiq7P+VY/vA
	P2Udb+T1aP1FgvLoErYOhpX4LsMq7BdaEgK0ZeyOBHywG5hOXtQLF/NE9XPJA9Go
	Efe5gkMMjCGD+K9LIh/d4EorwsyaUY036+ToGWb9tkosksVCVYW95qJcHbwVBejs
	ec8yBV4ClKrBeIRN6r5e8i4Ko8OgzHcbDoqtS4wVLTW0X8EiMhEdqQSJRy8YnUvW
	7qdS5sY=
Date: Wed, 3 Sep 2025 11:01:20 +0200
From: Buday Csaba <buday.csaba@prolan.hu>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
CC: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
Message-ID: <aLgD4Dx828nKXfkC@debianbuilder>
References: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
 <fa7e2cef-5242-4f3b-84ea-d77b959f6bdb@pengutronix.de>
 <c85a94ee-59e1-47d6-8200-813bb434caf2@prolan.hu>
 <1bf75411-4a51-4103-b314-a8a7253bafca@pengutronix.de>
 <aLf162kc8_VB163Z@debianbuilder>
 <e3966efb-9f81-4c01-86f3-c89864a89173@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3966efb-9f81-4c01-86f3-c89864a89173@pengutronix.de>
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1756890080;VERSION=7998;MC=2853248995;ID=1364479;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E637062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_020125_349057_39906F9C 
X-CRM114-Status: GOOD (  47.26  )
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

On Wed, Sep 03, 2025 at 10:43:46AM +0200, Ahmad Fatoum wrote:
> Hi,
> 
> On 9/3/25 10:01 AM, Buday Csaba wrote:
> > On Wed, Sep 03, 2025 at 09:50:08AM +0200, Ahmad Fatoum wrote:
> >>> [1] https://lore.kernel.org/lkml/20250709133222.48802-4-buday.csaba@prolan.hu/
> >>
> >> Is this mainline yet?
> >>
> > 
> > No, it is not. It was never the most beautiful piece of code, so I understand
> > that.
> > 
> > But if you could give us some guidance, that would help a lot.
> > 
> > Specifically:
> > 
> > 1)  If `phy-reset-gpios` is deprecated, than we should start treating it as
> >     such, and not rely on it in future releases. Perhaps we should also add a
> >     warning message, when it is found in the device tree.
> 
> Disagreed. Deprecated properties should be removed only about clarifying
> the impact of the removal on users. Replacing a deprecated property with
> an expectation that bootloader board code has deasserted reset is not
> acceptable IMO.

I was only trying to reason, that since `phy-reset-gpios` has been marked as 
deprecated in 5.3 (which was 6 years ago), perhaps a inserting a warning note
now would be appropriate.
But that is related to the driver, not the DT.
I completely agree with the rest.

> 
> > 2)  On the other hand, if it is here to stay for a long time, it should be
> >     fixed. Now the gpio is claimed during fec_reset_phy(), and never released.
> >     It can not be used by the driver later, like in fec_init(), because the
> >     gpio reference is only stored in a local variable of fec_reset_phy().
> >     Previous patches that would have stored the reference in the driver were
> >     rejected on the grounds that it is deprecated. But if it is not, then we
> >     can create a patch that would make it work properly.
> 
> Ye, this needs to be solved differently.
> 
> > 3)  Andrew pointed out, that resetting a PHY before probing it may cause
> >     regressions. That is certainly a valid concern, but for most of the 
> >     devices resetting it means starting from a known state, and should be the
> >     default. But we could create a device tree property, that controls this
> >     behaviour.
> 
> Marco had a more involved series to address this:
> https://lore.kernel.org/all/20230405-net-next-topic-net-phy-reset-v1-0-7e5329f08002@pengutronix.de/
> 
> But it went no where. I don't recall the details.
>

Interesting. So Andrew is not against resetting before probe, it just has to
be done properly. ;)
 
> I think the best you can do with existing bindings is to give your PHY a
> compatible that spells out vendor/device ID, e.g. ethernet-phy-id0141.0dd4.
> 
> Then Linux can probe the device even while it's in reset.
> 
> The downside is that it hardcodes a specific PHY ID, but this may be
> acceptable here.

Yes, for now that would be acceptable for us, with some loss of generality.

Regards,
Csaba

> 
> Cheers,
> Ahmad
> 
> > 
> > Regards,
> > Csaba
> > 
> >> Cheers,
> >> Ahmad
> >>
> >>>
> >>>>>
> >>>>> Co-developed-by: Csaba Buday <buday.csaba@prolan.hu>
> >>>>> Signed-off-by: Csaba Buday <buday.csaba@prolan.hu>lan8710 reset
> >>>>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> >>>>> ---
> >>>>>   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi | 8 +++++++-
> >>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> >>>>> index f053358bc9317f8447d65013a18670cb470106b2..0a5e90704ea481b0716d6ff6bc6d2110914d4f31 100644
> >>>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> >>>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> >>>>> @@ -246,7 +246,6 @@ &fec1 {
> >>>>>       pinctrl-names = "default";
> >>>>>       pinctrl-0 = <&pinctrl_enet1 &pinctrl_enet1_mdio &pinctrl_etnphy0_rst>;
> >>>>>       phy-mode = "rmii";
> >>>>> -    phy-reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
> >>>>>       phy-supply = <&reg_3v3_etn>;
> >>>>>       phy-handle = <&etnphy0>;
> >>>>>       status = "okay";
> >>>>> @@ -262,6 +261,13 @@ etnphy0: ethernet-phy@0 {
> >>>>>               pinctrl-0 = <&pinctrl_etnphy0_int>;
> >>>>>               interrupt-parent = <&gpio5>;
> >>>>>               interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> >>>>> +            /* Reset SHOULD be a PHY property */
> >>>>
> >>>> Comment belongs into commit message.
> >>>
> >>> Agreed.
> >>>
> >>>>> +            reset-names = "phy";
> >>>>> +            reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
> >>>>> +            reset-assert-us = <100>;
> >>>>> +            reset-deassert-us = <25000>;
> >>>>> +            /* Energy detect sometimes causes link failures */
> >>>>> +            smsc,disable-energy-detect;
> >>>>
> >>>> Unrelated change not described in the commit message.
> >>>
> >>> Oh, this has accidentally made it into here from our DT. Thanks for spotting it!
> >>>
> >>>> Cheers,
> >>>> Ahmad
> >>>>
> >>>>>               status = "okay";
> >>>>>           };
> >>>>>  
> >>>>> ---
> >>>>> base-commit: 0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
> >>>>> change-id: 20250815-b4-tx6ul-dt-phy-rst-7afc190a6907
> >>>>>
> >>>>> Best regards,
> >>>>
> >>>>
> >>>
> >>> Bence
> >>>
> >>>
> >>
> >>
> >> -- 
> >> Pengutronix e.K.                           |                             |
> >> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> >> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> >> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> >>
> > 
> > 
> 
> -- 
> Pengutronix e.K.                  |                             |
> Steuerwalder Str. 21              | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |
> 
> 


