Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4466EB7EA2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:Subject:To:From:Cc:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUWq5kpBIjsc0+kAM5GMY0X+W2LCngNN6LmjmMbSbKA=; b=j0vU5L8LBywX+bhqPOD7+1FPNg
	cfY2orc14oJUkrqAw/Oq2VNh0mInI7jnuAzOD0lAKPCuJkoRdEDZrYZFjlyOkIFG0g88fD+ZVCr4Z
	QgL8cOtLL+WkrQSM21HpnorBeez33enuBxgDBKKbss/pOTYg3HOA8gAOZwYk5e12eGGYWZwnJTNke
	3g/cTgL0E7cd1WoD3Svg3BAQNShFYlbAdY3MHtIzplqXxhBvm/SGwPvFgjzRdTySibhLQJeyJYtU6
	Mf3d0leY0AIEqltnkZN4c4BghhpPD3Emu5G/Sj5uEd4doD3qudQgAr62oHF52UOfk/hLdX3RtADBK
	vUSOrtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhHb-0000000GhPW-2pPu;
	Wed, 04 Mar 2026 08:08:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhHY-0000000GhLq-02Wa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:08:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AB282C40FBD;
	Wed,  4 Mar 2026 08:01:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98F0D5FF5C;
	Wed,  4 Mar 2026 08:01:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B9B810369414;
	Wed,  4 Mar 2026 09:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772611287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EUWq5kpBIjsc0+kAM5GMY0X+W2LCngNN6LmjmMbSbKA=;
	b=sEfJKaEN0ReR/PcKLCvhIin7UaqONdSGTccrky3vrUuXx1S+uI3hVV8kw1lhdbSmiSvb8n
	7eAZy5FGo8RTXiMTycVYB/O1IZ8HyFZ1fObyINHKAAWCZ75WNY3XpD2zS67JfzKUDbZByd
	oeoX/SbQUvv6tn36HHgjOecMSgQIovWqIQdQlhi0XhBVD6NAfnSOLP/qN123etXDHZjk9g
	wEAquxlveb/dWrboNrT0UrC+g2a1yKDbzDyqyhuG13xuPh3gH8+YSpMJckD8hJMEURWaZ2
	HfVM8VIjyEtyz2QdB5MyPEmPuEzk04gZVU0SFxBd5QqDEgue9bnuJmZB+o8DqA==
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 09:01:20 +0100
Message-Id: <DGTU9887GHPO.2FUQ3QITRG7F8@bootlin.com>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <shawnguo@kernel.org>,
 <laurent.pinchart+renesas@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Hugo
 Villeneuve" <hvilleneuve@dimonoff.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Hugo Villeneuve" <hugo@hugovil.com>, "Frank Li" <Frank.li@nxp.com>
Subject: Re: [PATCH 08/14] ARM: dts: imx6ul-var-som: factor out SD card
 support
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-9-hugo@hugovil.com>
 <aaX5E7-3xvkaVV-o@lizhi-Precision-Tower-5810>
 <20260302161545.f6b76209400e8fbe35cd51a0@hugovil.com>
In-Reply-To: <20260302161545.f6b76209400e8fbe35cd51a0@hugovil.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_000836_194893_44B31771 
X-CRM114-Status: GOOD (  21.61  )
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

Hi,

On Mon Mar 2, 2026 at 10:15 PM CET, Hugo Villeneuve wrote:
> Hi Frank,
>
> On Mon, 2 Mar 2026 15:54:43 -0500
> Frank Li <Frank.li@nxp.com> wrote:
>
>> On Mon, Mar 02, 2026 at 02:03:44PM -0500, Hugo Villeneuve wrote:
>> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>> >
>> > Move SD support to a separate include, since it cannot be used at the
>>=20
>> s/include/dtsi/
>
> Ok. I will also change it in all the other commit messages.
>
> =20
>> > same time as the Wifi/BT module.
>>=20
>> what's relation ship between wifi/bt? you just move sd related part to a
>> dtsi file.
>
> As stated in commit message, the SD card interface cannot be used if
> the Wifi/BT module is in use.
>
> Sd card is not mandatory, for example on our board we do not have it,
> so we need to have it disabled.

My two cents: if SDCard and WiFi/Bt support are the only mutually exclusive
features for this SoM, then how about the following organization:

Three SoM dtsi files:

imx6ul-var-som-common.dtsi

  imx6ul-var-som-wifi-bt.dtsi:
    #include "imx6ul-var-som-common.dtsi"

  imx6ul-var-som-sd.dtsi:
    #include "imx6ul-var-som-common.dtsi"

A common concerto dtsi file:

  imx6ul-var-som-concerto-common.dtsi

Separate concerto dts files:

  imx6ul-var-som-concerto-wifi-bt.dts:
    #include "imx6ul-var-som-wifi-bt.dtsi"
    #include "imx6ul-var-som-concerto-common.dtsi"

  imx6ul-var-som-concerto-sd.dts
    #include "imx6ul-var-som-sd.dtsi"
    #include "imx6ul-var-som-concerto-common.dtsi"

And possibly the following one to avoid breaking compatibility:

  imx6ul-var-som-concerto.dts
    #include "imx6ul-var-som-sd.dtsi"
    #include "imx6ul-var-som-concerto-common.dtsi"

In any case, the imx6ul-var-som-concerto-common.dtsi should be full-feature=
d
(and thus avoid the imx6ull-var-som-concerto-full.dts file from patch 09/14=
), if
that's possible?

But I don't know if this follows common practices, and if this is possible,=
 but
I think it's clearer as a user to know if the DTS I will use will support
WiFi/BT _or_ support SDCard by looking at its name.

Of course this is based on the assumption that those two features are the o=
nly
mutually exclusive ones.

What do you think?

Antonin

