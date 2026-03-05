Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B161F3D315
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VURAe1VBJ++jhd1qN9FU3U4sNtpuG6QDqgVP27ujLLQ=; b=lVfIGV0Dz6/o+r
	FxOFCbw3voW7Bwzhi+TOg9N4P5aCgZQi4PXJ8d/LcsodTdwhln6cEnmsxjhnQritbGhfHgvFybDdp
	jHkKV31JNrRa5PKUYkRyUPN7QGz8Q0MPtDMKSRcTeSQ3pEpP0V8dsNyg4TGQiHBYFuNxr9wvp4uJw
	ZMfShuG3QaOEZGNmyIU9tq6O15qR6BSw1Lu07hZlrdGrR790eNpcaRmF7sDdHIBIlMNauMWPn3i0h
	NQD7YUOUrbOZMmYv7T1IwVt1yOITzSvXKk1GX1FUyOtqBIhWx/fhotXha35CBVRE2lxsKqCqPy5rE
	qBBkbslFS/5minnXsnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBDt-00000002BH1-0T6B;
	Thu, 05 Mar 2026 16:06:49 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBDq-00000002BG7-0S1p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=VURAe1VBJ++jhd1qN9FU3U4sNtpuG6QDqgVP27ujLLQ=; b=HwXvKMDFPKFt/NwsiuXU2mlZnZ
	QWDSk6365MrHNW3TYaw+6EPMeJVIjcF/pnvE2e7iBVGgBLCaJCI0hcokrMxvLp5olfn9x84uGbMy+
	cuFWWWzl5J/mCqXEBx3DBK/EgStY7tVKBdr76PdWtiJahJi/3CGXl6UyeWmk+eyDXNEs=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:42578 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyBDD-0002QH-SQ; Thu, 05 Mar 2026 11:06:09 -0500
Date: Thu, 5 Mar 2026 11:06:06 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: "Antonin Godard" <antonin.godard@bootlin.com>
Cc: "Frank Li" <Frank.li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <shawnguo@kernel.org>,
 <laurent.pinchart+renesas@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>
Message-Id: <20260305110606.f24f17ee4f96d7d2b9b08c2d@hugovil.com>
In-Reply-To: <DGTU9887GHPO.2FUQ3QITRG7F8@bootlin.com>
References: <20260302190953.669325-1-hugo@hugovil.com>
	<20260302190953.669325-9-hugo@hugovil.com>
	<aaX5E7-3xvkaVV-o@lizhi-Precision-Tower-5810>
	<20260302161545.f6b76209400e8fbe35cd51a0@hugovil.com>
	<DGTU9887GHPO.2FUQ3QITRG7F8@bootlin.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: Re: [PATCH 08/14] ARM: dts: imx6ul-var-som: factor out SD card
 support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_080646_246543_7C90D8F8 
X-CRM114-Status: GOOD (  37.15  )
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

Hi Antonin,

On Wed, 04 Mar 2026 09:01:20 +0100
"Antonin Godard" <antonin.godard@bootlin.com> wrote:

> Hi,
> 
> On Mon Mar 2, 2026 at 10:15 PM CET, Hugo Villeneuve wrote:
> > Hi Frank,
> >
> > On Mon, 2 Mar 2026 15:54:43 -0500
> > Frank Li <Frank.li@nxp.com> wrote:
> >
> >> On Mon, Mar 02, 2026 at 02:03:44PM -0500, Hugo Villeneuve wrote:
> >> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >> >
> >> > Move SD support to a separate include, since it cannot be used at the
> >> 
> >> s/include/dtsi/
> >
> > Ok. I will also change it in all the other commit messages.
> >
> >  
> >> > same time as the Wifi/BT module.
> >> 
> >> what's relation ship between wifi/bt? you just move sd related part to a
> >> dtsi file.
> >
> > As stated in commit message, the SD card interface cannot be used if
> > the Wifi/BT module is in use.
> >
> > Sd card is not mandatory, for example on our board we do not have it,
> > so we need to have it disabled.
> 
> My two cents: if SDCard and WiFi/Bt support are the only mutually exclusive
> features for this SoM, then how about the following organization:

They maybe are not. There are other peculiarities, for example using the
touch panel configuration has some impacts on an oscillator used by the
Wifi/Bt module. The Varisctite documentation is not entirely clear or
evident about all these details.


> Three SoM dtsi files:

This is already the case (apart from the -bt suffix)?

> 
> imx6ul-var-som-common.dtsi
> 
>   imx6ul-var-som-wifi-bt.dtsi:
>     #include "imx6ul-var-som-common.dtsi"

No need to include it, as it is already included by
imx6ul-var-som-concerto.dts

> 
>   imx6ul-var-som-sd.dtsi:
>     #include "imx6ul-var-som-common.dtsi"

Same...

> 
> A common concerto dtsi file:
> 
>   imx6ul-var-som-concerto-common.dtsi
> 
> Separate concerto dts files:
> 
>   imx6ul-var-som-concerto-wifi-bt.dts:
>     #include "imx6ul-var-som-wifi-bt.dtsi"
>     #include "imx6ul-var-som-concerto-common.dtsi"
> 
>   imx6ul-var-som-concerto-sd.dts
>     #include "imx6ul-var-som-sd.dtsi"
>     #include "imx6ul-var-som-concerto-common.dtsi"
> 
> And possibly the following one to avoid breaking compatibility:
> 
>   imx6ul-var-som-concerto.dts
>     #include "imx6ul-var-som-sd.dtsi"
>     #include "imx6ul-var-som-concerto-common.dtsi"
> 
> In any case, the imx6ul-var-som-concerto-common.dtsi should be full-featured
> (and thus avoid the imx6ull-var-som-concerto-full.dts file from patch 09/14), if
> that's possible?

I am not convinced that it needs to be full-featured. For our custom
boards, we want to include only the relevant dtsis, because for example
we do not use sd, or enet1 or enet2, or audio. Having these options in
separate dtsi allows our custom boards to include/enable only the
required features.

The full dts is only there as a reference, and to make sure all dtsi
are included and therefore compiled-checked. In it I have enabled
enet1 and enet2, but some boards may use enet1, and not enet2, or
vice-versa, or some boards (like our custom boards) we are not using
either one.

> But I don't know if this follows common practices, and if this is possible, but
> I think it's clearer as a user to know if the DTS I will use will support
> WiFi/BT _or_ support SDCard by looking at its name.
> 
> Of course this is based on the assumption that those two features are the only
> mutually exclusive ones.
> 
> What do you think?

Yes, but there is an exponential number of different
combinations, and thus would require a lot of different DTS...

If you look at the Variscite git repos, you will see a lot of different
DTS to support only a subset of the possible combinations, and it
already looks like a mess to me :) I would like to keep things simple if
possible.

-- 
Hugo Villeneuve

