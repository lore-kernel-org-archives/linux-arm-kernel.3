Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E56C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAF82MDOU45GLZwBcvQpy4vEhq2qYOZ0dwG+SawXYQ4=; b=uy/4F8goWaWM0Hw5XAYHslSKN5
	hW5EabEO3Z+w3/CxbRWmcpCKf3/DeiEWPv1MWgHLuS1NJ1RukAjikdlk4p4l50Q82UXyl6uFzr4gG
	Bd94wxv1XE5RX+wm1Mt2U53xTTXD8flCxG5WchfYrInhoXGFWmBiVEh3VXSA3SJKcd4qWnV6lESjS
	0t3IJF50bQc0vTkfzjSlInjh7AwS+1NqkTAZBmaFETV6NHdQIMRhXoSULuEdNNbXA+n59mDj6gmv2
	qMvoFEruo2CwzkJ2NxK9gR5tJGk2nd3O9d2ZjAx04GRISZ7lQWgR4ZvrPFqmER9UHOlR00gnJP470
	BF8zrMmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKc1I-0000000Fhdo-3yX2;
	Thu, 29 May 2025 12:06:00 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbQa-0000000Fceo-0SD3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:28:06 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 6F8B5C405A4C;
	Thu, 29 May 2025 13:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 6F8B5C405A4C
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Rui Miguel Silva
 <rmfrfs@gmail.com>,  Martin Kepplinger <martink@posteo.de>,  Purism Kernel
 Team <kernel@puri.sm>,  Mauro Carvalho Chehab <mchehab@kernel.org>,  Shawn
 Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  linux-media@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
In-Reply-To: <jqjptsphbtdtziuucehxutseaz7j4kjiirz2hk77f3dznswvza@avbjjzu3jcam>
	(Jacopo Mondi's message of "Fri, 23 May 2025 13:33:24 +0200")
References: <m3h61u9jy2.fsf@t19.piap.pl>
	<20250509103733.GE28896@pendragon.ideasonboard.com>
	<m3o6vn8np5.fsf@t19.piap.pl>
	<iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
	<m31psg97dy.fsf@t19.piap.pl>
	<jqjptsphbtdtziuucehxutseaz7j4kjiirz2hk77f3dznswvza@avbjjzu3jcam>
Date: Thu, 29 May 2025 13:27:56 +0200
Message-ID: <m3o6vb64hv.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_042804_309927_5C02E2B3 
X-CRM114-Status: GOOD (  23.07  )
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

Hi Jacopo,

Jacopo Mondi <jacopo.mondi@ideasonboard.com> writes:

>> - 10 User Defined 8-bit Data Type 8 packets, line-sized, DT=3D0x37, call=
ed
>>   apparently "Vertical OB" by Sony datasheet
>
> These are optically black pixels and should probably be discarded by
> the gasket as well as embedded data ?

Yes, apparently.

>> I hope I got this right, this is straight from oscilloscope (only
>> checked IDs on IMX462, will confirm IMX290 later but it looks the same).
>> In 1280x1080p25 mode there are 4 (not 10) "vertical OB" packets, and 720
>> RGGB lines instead of 1080.
>
> Is this correct ? you ask for 1280x1080 and get back 720 lines ?

Well, no, I just checked both modes and these are the differences.
IOW, nothing unexpected. Wrong copy & paste or so.

>> IMX462 produces just a tiny 2-pixel dot in the left top corner, possibly
>> shifting some data to the right (I remember it did that, but I can't
>> observe it now - could be a kernel (driver) version change?).
>
> What are those two pixels ? Does the datasheet describes them ?

Nope, I guess it's a silicon bug. It corrupts 3 RAW-12 pixels, though
(32 bits > 2 * 12 bits).

>>    32EC0138h    2D8000h ISP Dewarp Control Register (ISP_DEWARP_CONTROL)
>>       ISP ID mode 0, ISP1: DT 0h (unknown), ISP2: DT 2Ch (RAW12) left-ju=
st mode
>
> But this other register has (again) one other filtering option and
> reading the value here it is set to filter RAW12 (mipi_isp2_data_type)
>
> Weirdly enough, I don't see this register being programmed in the
> mainline gasket driver...

I guess it's drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:

static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
                                struct media_pad *source)
{
...
        regmap_update_bits(rkisp1->gasket, ISP_DEWARP_CONTROL, mask, val);

Now this register doesn't filter data: if you set it with a different
value, the data still goes through. It's just processed differently.
For example, my sensor is 12-bit (in addition to 10-bit). If I set
ISP_DEWARP_CONTROL to 0xB68 (or 0x368) meaning RAW 14-bit, the image
only gets darker - ISP thinks it's getting 14-bit samples.

The only filtering (while using ISP) is, apparently, in the ISP
Configuration Register (MIPI_CSIS_ISPCONFIG_CH0) and subsequently in its
shadow counterpart. And it somehow may be enabled in CSIS Common Control
Register (MIPI_CSIS_CMN_CTRL). But if you don't enable it there, the
data is still filtered (e.g. wrong value in MIPI_CSIS_ISPCONFIG_CH0
prevents data flow). The filtering is only needed for preventing pixel
corruption (these 3 pixels).

So it means, for at least i.MX8MP, the DT filtering bit in
MIPI_CSIS_CMN_CTRL should always be enabled.

>> MIPI_CSI2:
>>    32E50004h      4705h CSIS Common Control Register (MIPI_CSIS_CMN_CTRL)
>
> Do you mean 0x14705 ? I'm asking because Shadow Crtl is BIT(16). Surprisi=
ngly
> BIT(14) is marked as reserved in the datasheet version I have

No, it's 0x4705 (usually).
With 0xFF05 (resulting from write with 0xfffffffd) it's still working
correctly (with DT filtering). Write 0xfffffbfd (=3D no DT filtering) and
the magic light pixels in the left top corner reappear. So it means the
INTERLEAVE_MODE bits (11 and 10) are probably two independent bits, with
bit 11 probably not used at all.


In my copy (i.MX 8M Plus Applications Processor Reference Manual, Rev.
1, 06/2021), CSIS Common Control Register (MIPI_CSIx_CSIS_COMMON_CTRL):
- bits 31-17, 15, 13, 12, 7-2 are zero and reserved (though bits 12 and
  2 are additionally marked "This read-only field is reserved and always
  has the value 0")
- bit 14 is reserved and shown as "1"
- bit 16 is "UPDATE_SHADOW", and it clears itself after a write (unless
  the pipeline locks up or something alike)
- bits 11 and 10 are "INTERLEAVE_MODE":
    Select Interleave mode
    ISP Configuration register of CH# is used for data interleave.
      00 CH0 only, no data interleave
      01 DT (Data type) only
      10 Reserved
      11 Reserved
- bits 9 and 8 are LANE_NUMBER, 0 to 3 means 1 to 4.
- bit 1 is SW_RESET
- bit 0 is CSI_EN

In fact, bit 2 does not "always have the value 0", it's set to 1. Both
bits 14 and 2 can be reset to 0, though (without apparent change in the
image).
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

