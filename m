Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBF6C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 11:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJiJLP7qVVt9XsGTGQLlmdv5bLjtAk8c9PFNG+VR9qk=; b=c3liOvTWsVa9tPYwobm7+wS6YJ
	epsegm88x55/WO6SuhgAjFYqJgL0LtTvZ1myPVW+457jb/w+dNmWvYKXEKFoWoeOlFgBSSK0f8vpd
	CERxFoJhulTWZdTEyu7d9ijggg6wwvy+GalZPGfh7xLCZQfIuRc0aYjD29shxZ+IlI4vAP4njcy0/
	5UtYBj76FKFiS6q76ZbEqvimhnmQ3qwtztyl44nihbRNsmgYt1wrF2L0G876h3idKa+LBeSPwBS4a
	cdCP4IEGFzXW7ZmBEEE1Zt8f2lwcLcmd5rR1OwE1RsyWzZ7qL4fVuC5rEm45BY5RyLY2oU/1Q9jAk
	gC9zRLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MHr-00000005sft-01Au;
	Mon, 28 Apr 2025 11:04:35 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MCT-00000005rsd-2X2w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 10:59:03 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 697D7240104
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 12:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1745837935; bh=wV5lKKjerP6M76XIjET1jKYjN4kukYAMpdGgE4SoDrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=ohhOoCRMh5jxAblDLchS6kbvAK1bCTAIdbLGxiBzWSuqN2K4bg8apcXHre4jtxiIv
	 cSG3j2WaI9COIK6ZEKpZgLQsuzMPJ6dFY+g75LKxeX7BWsU34hjBni7CNzrJKZPHXw
	 f7z1DKPItxkrviAXYpQPHx2/vcxvM3QnXqneOBxEr4j72f5iyBlL90ZcQ/5qzjN9dQ
	 D3ACksHyfw5OTeueM9/Z4Z0IFX3DytPG2NWcpGmCAP2pmExNOWTroBUh0dz+z+MCK8
	 8FbDsxAiig8RTGP2i/qi+ku5rHLqpI3BvAfh7Y5PBKdZEePjmjVbWhSHXAbd48Vqrm
	 wd0y5tJqgGBlQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZmL6M362Rz6v04;
	Mon, 28 Apr 2025 12:58:51 +0200 (CEST)
Date: Mon, 28 Apr 2025 10:58:51 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Chen-Yu Tsai <wens@csie.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: allwinner: orangepi-zero: Enable audio codec
Message-ID: <aA9fa4Ynt3Vq2Xsh@probook>
References: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
 <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com>
 <aA8tsao6hhW50k4e@probook>
 <CAGb2v67Trz_Dtp5_ME3MnfwBjtp=DwPN4aJ1vrtizgiUn08_3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v67Trz_Dtp5_ME3MnfwBjtp=DwPN4aJ1vrtizgiUn08_3w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_035901_931422_5555192B 
X-CRM114-Status: GOOD (  36.38  )
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

On Mon, Apr 28, 2025 at 04:37:31PM +0800, Chen-Yu Tsai wrote:
> On Mon, Apr 28, 2025 at 3:26 PM J. Neuschäfer <j.ne@posteo.net> wrote:
> >
> > On Sun, Apr 27, 2025 at 01:28:58PM +0800, Chen-Yu Tsai wrote:
> > > On Fri, Apr 18, 2025 at 7:32 AM J. Neuschäfer via B4 Relay
> > > <devnull+j.ne.posteo.net@kernel.org> wrote:
> > > >
> > > > From: "J. Neuschäfer" <j.ne@posteo.net>
> > > >
> > > > Line out playback and microphone capture work, after enabling the
> > > > corresponding ALSA controls. Tested with the Orange Pi Zero interface
> > > > board, which is a (mostly) passive adapter from the 13-pin header to
> > > > standard connectors (2x USB A, 1x Audio/Video output, 1x built-in
> > > > microphone).
> > > >
> > > >   https://orangepi.com/index.php?route=product/product&product_id=871
> > >
> > > What about the USB ports?
> >
> > Good point, I could test these. I have not mentioned them because they
> > are not related to audio.
> >
> > > In any case, we don't enable peripherals on "headers" by default. That's
> > > up to the end user. The description for the whole adapter board could be
> > > an overlay that users can then apply directly.
> >
> > For features such as pinmuxed UARTs (already present and disabled in the
> > dts), I fully agree, because they could as well be used as GPIO, and
> > that's for the user to decide.
> >
> > For the audio pins, there's nothing else one can do with them, as far as
> > I understand it. It is possible to use at the least the Line Out pins
> > with very minimal setup, e.g. just connecting the pins to headphones or
> > something else.
> 
> Sure, but you are also adding the routing information, which could be
> different if someone designs a different adapter board. One could
> include GPIOs and I2C from the 26-pin header, and make a headset
> adapter (mic on the TRRS instead of tv-out) with a headphone amp
> and headset detection IC.

Ah, that's a fair point that I didn't consider.

> It's easily overridable, and I suppose providing the basic use-case
> that one can directly use via the pins does have value. Instead of
> doing a lot of editing, the user can just toggle the status via
> the bootloader.

Sounds good!

> 
> > I'll clarify the following points in a comment in the next version:
> >
> >  - The audio signals are exposed on the 1x13 header described in
> >    https://linux-sunxi.org/Xunlong_Orange_Pi_Zero
> >
> >  - The pins can't be used for anything else according to section
> >    3.1. Pin Characteristics of the Allwinner H3 Datasheet.
> >
> > Although I would prefer to enable the audio pins by default (because
> > they are present on the Orange Pi Zero board), I would also be ok with
> > adding them as status = "disabled", as is the case with uart1 and uart2.
> > Please let me know your opinion.
> 
> I think it's better to have them disabled by default. We don't want to
> confuse users that don't have the adapter board, who might end up looking
> at their audio mixer and wondering where the line out is.

Fair enough, that makes sense.

> If they have the adapter, or they are explicitly using wires to hook up
> things, then they can toggle the status. If they have something else,
> then they load whatever overlay that matches their hardware.



Thank you for your review and explanations!

Best regards,
J. Neuschäfer

