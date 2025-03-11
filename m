Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41751C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 12:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOYbfZscHmavhA7intg3mKC5a2etFfDpLHORKbOBOnM=; b=yT/9MFP/4tHEOuvR2VGx7w1ODx
	F8d8T8Dli8NdqGLnEWLob32utK/L/PjHW2PiRIwlz03050+vhxUEwS+ERJEi0oXCMdAOHfHHkRluk
	5oc/9c1mH1B+RsE5nylQIfOJVu+pY0YfaJ2HPxoVtCoERaUsWyoEVL/vcleoQ/zD3yxDGe5sWVIt8
	tnKzQ4QV0mc/3iyoqAx3WcN04ZRvWQQiqbHD+DB/avb5AKcnvhFhMUp7zcfQKHBtIctw7w37ZYCVL
	6mK+WCjfD4s+POWfPqDDLTNKKH3jZL0Mk3uyWL75x3tF4M9BVaTvqemkd/Z+TrJFI9jiitGkKhaaT
	UbSpy/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryO2-00000005ZUn-3omL;
	Tue, 11 Mar 2025 12:07:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryMO-00000005Z7j-10Py
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 12:05:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tryM5-0008Nt-Gb; Tue, 11 Mar 2025 13:05:05 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tryM3-005B4L-13;
	Tue, 11 Mar 2025 13:05:03 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tryM3-007j7z-0d;
	Tue, 11 Mar 2025 13:05:03 +0100
Date: Tue, 11 Mar 2025 13:05:03 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <20250311120503.ryqg2thnj4mkgsjz@pengutronix.de>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
 <Z7jahtO3bxjkMfnc@lizhi-Precision-Tower-5810>
 <cd6a84cd-ff17-45df-becc-9bfc74522f73@gmail.com>
 <20250227-monumental-whale-of-security-b1c84e-mkl@pengutronix.de>
 <Z8CWsI/DKZtDBkzE@lizhi-Precision-Tower-5810>
 <20250228101952.g6tae3ni5xrhjk3y@pengutronix.de>
 <bfe3c719-f1c5-4ae5-9a40-45ad75cd5855@gmail.com>
 <20250307152236.3ayulbjqnu3vn7mf@pengutronix.de>
 <ec38d41d-f2ce-4a98-bb02-d1ae9beb0b3b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec38d41d-f2ce-4a98-bb02-d1ae9beb0b3b@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_050524_434478_D9819C05 
X-CRM114-Status: GOOD (  62.71  )
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

On 25-03-10, Laurentiu Mihalcea wrote:
> On 3/7/2025 5:22 PM, Marco Felsch wrote:
> > On 25-03-04, Laurentiu Mihalcea wrote:
> >> On 2/28/2025 12:19 PM, Marco Felsch wrote:
> >>> Hi,
> >>>
> >>> On 25-02-27, Frank Li wrote:
> >>>> On Thu, Feb 27, 2025 at 11:57:54AM +0100, Marc Kleine-Budde wrote:
> >>>>> On 25.02.2025 16:14:34, Mihalcea Laurentiu wrote:
> >>>>>> On 21.02.2025 21:56, Frank Li wrote:
> >>>>>>> On Fri, Feb 21, 2025 at 02:19:08PM -0500, Laurentiu Mihalcea wrote:
> >>>>>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>>>>>>>
> >>>>>>>> AIPS5 is actually AIPSTZ5 as it offers some security-related
> >>>>>>>> configurations. Since these configurations need to be applied before
> >>>>>>>> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
> >>>>>>>> be their parent instead of keeping AIPS5 and adding a child node for
> >>>>>>>> AIPSTZ5. Also, because of the security configurations, the address space
> >>>>>>>> of the bus has to be changed to that of the configuration registers.
> >>>>>>> The orginal 0x30c0_0000..0x31200000 include 0x30df0000, why not map only
> >>>>>>> config address part in your drivers.
> >>>>>>>
> >>>>>>> Frank
> >>>>>> Any concerns/anything wrong with current approach?
> >>>>>>
> >>>>>>
> >>>>>> I find it a bit awkward to have the whole bus address space
> >>>>>> in the DT given that we're only interested in using the access
> >>>>>> controller register space.
> >>>>>>
> >>>>>>
> >>>>>> I'm fine with the approach you suggested but I don't see a
> >>>>>> reason for using it?
> >>>>> Looking at the "AIPS5 Memory Map" (page 34/35 in i.MX 8M Plus
> >>>>> Applications Processor Reference Manual, Rev. 3, 08/2024), the
> >>>>> AIPS5_Configuration is part of the AIPS5 bus. IMHO the bus is something
> >>>>> different than the bus configuration. Why not model it as part of the
> >>>>> bus?
> >>>>>
> >>>>>>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> >>>>>>>> index e0d3b8cba221..a1d9b834d2da 100644
> >>>>>>>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> >>>>>>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> >>>>>>>> @@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
> >>>>>>>>  			};
> >>>>>>>>  		};
> >>>>>>>>
> >>>>>>>> -		aips5: bus@30c00000 {
> >>>>>>>> -			compatible = "fsl,aips-bus", "simple-bus";
> >>>>>>>> -			reg = <0x30c00000 0x400000>;
> >>>>>>>> +		aips5: bus@30df0000 {
> >>>>>                        ^^^^^^^^^^^^
> >>>>>>>> +			compatible = "fsl,imx8mp-aipstz", "simple-bus";
> >>>>>>>> +			reg = <0x30df0000 0x10000>;
> >>>>>>>> +			power-domains = <&pgc_audio>;
> >>>>>>>>  			#address-cells = <1>;
> >>>>>>>>  			#size-cells = <1>;
> >>>>>>>> +			#access-controller-cells = <0>;
> >>>>>>>>  			ranges;
> >>>>>>>>
> >>>>>>>>  			spba-bus@30c00000 {
> >>>>>                         ^^^^^^^^^^^^^^^^^
> >>>>>
> >>>>> This looks very strange: The aips5 bus starts at 0x30df0000 and has a
> >>>>> child bus starting at 0x30c00000?
> >>>> @30df0000 should match controller reg's address.
> >>>>
> >>>> subnode address 0x30c00000,  should be descript in "ranges", which 1:1 map.
> >>>>
> >>>> So it should be reasonable. another example:
> >>>> i2c@1000 {
> >>>>
> >>>> 	device@1c <- which use difference address space.
> >>>> }
> >>>>
> >>>> The similar case also happen at pcie.
> >>> I'm not really convinced that pcie and i2c are good examples here. I2C
> >>> does have an other addressing scheme by nature and the hotplug-able pcie
> >>> is dependeds on the pcie device memory map of course.
> >>>
> >>> Here we're talking about an access control IP core on a bus which is
> >>> static.
> >>>
> >>> But.. it looks like from DT abstraction it's fine because STM did
> >>> something similiar with their st,stm32mp25-rifsc or st,stm32-etzpc
> >>> albeit it does look strange and I don't know why we have to limit the
> >>> address space since it was already mapped but used by the fsl,aips-bus
> >>> driver.
> >>>
> >>> Regards,
> >>>   Marco
> >> The address space of the bridge was changed to that of the bridge's
> >> configuration space because I think it's very awkward from the
> >> software's point of view to have to hardcode the offset and size of
> >> the configuration space inside the driver. 
> > You mean the access-controller IP core. I could also arguee that it's
> > akward to put the bridge access-controller IP core into the middle of
> > the bridge address-space instead of placing it at the very beginning of
> > the bridge. But this doesn't help here :)
> >
> > I see what you mean but from DT abstraction POV it seems more reasonable
> > to keep it as it is and just adapt the compatible. The current driver
> > maps the whole address space too, so I don't see why we need to change
> > it if we change it to the aipstz driver. If you see the
> > access-controller IP core as part of the bus I don't see any problem and
> > would argue that the offset detail needs to be handled within the
> > driver.
> >
> >> I also looked at what STM did with "st,stm32-etzpc" so I thought this
> >> would be acceptable from the DT's POV.
> >>
> >> Regarding why I chose not to model the access controller part as a subnode of the
> >> bus:
> >>
> >>     1) The access controller is part of the bridge itself (not a separate module accessible
> >>     via the bridge like it's the case for its children) so I think the current approach
> >>     should also make sense if we take the hardware into consideration.
> > I don't like this approach if you see the controller as part of the
> > bridge because the offset could be handled within the bridge driver.
> > I also that the register offset needs to be supplied else we can't reuse
> > the driver and we don't want to adapt the driver for each SoC.
> >
> > What came into my mind is the following:
> >
> > 	spba-bus@30c00000 {
> > 		compatible = "nxp,imx8mp-aiptz-bus", "nxp,aiptz-bus";
> > 		reg = <0x30c00000 0x400000>, <0x30df0000 0x10000>;
> > 		reg-names = "bus", "aipstz";
> >
> > 		child-nodes {};
> > 		child-nodes {};
> > 		child-nodes {};
> > 	}
> >
> > This way we can abstract the access-controller register space and the
> > whole bus register space and a generic driver could be written just by
> > making use two reg fields.
> 
> by changing the compatible, we've also effectively changed the
> programming model.

You need to keep the backward compatible which means, a new kernel have
to boot an old dts (firmware), which is stil the case since the
"simple-bus" driver sill matches on the old dts files.

But this doesn't mean that a new dts (firmware) have to be compatible
with an old kernel.

> I don't really see why we need to stick to the old way of configuring
> the bus node (i.e: specify the whole address space of the bus as well)
> when all we really care about is the AC configuration region?

I see and as I said it's just my oppinion that we should abstract it
this way since upstream already accepted the approach you implemented
for the STM32 case.

If NXP would have placed the AC at the beginning of each AIPS bus you
wouldn't need to deal with this problem too since you would have the
base register already.

> anyhow, I'm not going to insist on this. I think the proposed approach
> will work just fine. If there's no other comments on this then I'll
> just switch to it in V3.

That would be nice but please wait for maintainers feedback e.g Shawn.

Regards,
  Marco

