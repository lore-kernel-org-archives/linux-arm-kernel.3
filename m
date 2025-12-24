Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF430E7491E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=og+Ux3x/arfwiOpRBPCbvWYwNi8map9YcJ7XOxJZxGA=; b=tZh+7ER+6gtp17SW/112T6w5kA
	EjJwPpAjqAukRYHi4TqaBJYb3PbAhF8XY5x4p4qNxRmCeVIhFEPn1sJx/OCVUdN9zJgUIK4zAO2jo
	quoUs6F/vUSO05JuXYkpr9qVet8tpwnPryvZTsrIf3ZVTTzx71T4eWDsrEvAjIEb15107Iid9aZ75
	wIblAhO1jaBJD6k3M3l3cYzWXBbxkTZedtEnmDsGx5nvN0QhSdwpJl7xDpayl8G7IWDqf8eGZDjxO
	jMbnlZjRQi++tFvK8nsdG0+v6bxr7AUWqwVcSpH3cvRKNXjQ5K7y6+JmnYQ8/2kfXhd47oXIumRin
	MVOcJDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYL2v-0000000Gcuq-48Ey;
	Wed, 24 Dec 2025 09:20:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYL2t-0000000GcuT-0pbE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 09:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=og+Ux3x/arfwiOpRBPCbvWYwNi8map9YcJ7XOxJZxGA=; b=hE
	Gjb/QWuTRrKy/elfnoXQGAxsz3lHe01RhnyEGCL+KU1uLVKaRaFFag3yNR9W0sVVyou0xDbsriE2v
	7mhfgvWZ38SIcDoM7OplqSjOx966l9U3iN1u4D6jAAWOrpmKQsjQlmD1vIpeziRbQIJmIf5+bhuhv
	Kn39wZdha559GFM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vYL2a-000OlF-00; Wed, 24 Dec 2025 10:20:20 +0100
Date: Wed, 24 Dec 2025 10:20:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
Message-ID: <32ff7ca8-9cb0-4889-adb0-a6dae735630b@lunn.ch>
References: <20251222-ventura2_initial_dts-v1-0-1f06166c78a3@gmail.com>
 <20251222-ventura2_initial_dts-v1-2-1f06166c78a3@gmail.com>
 <c069b452-df22-4afa-bf6a-c48949f40ebc@lunn.ch>
 <CAF7HswN_jEXOU_9K4LpLnbhvd+RD0qqELAHxMBbp=hGtMjS4kQ@mail.gmail.com>
 <35f3eba9-5ec4-4cba-8a64-fb521dc65b79@lunn.ch>
 <CAF7HswN0hhJQ-gmE59cKTuPyzrs1A3rM8Xw+Z8i3_AsHRiNcug@mail.gmail.com>
 <1e21f828-1b06-492d-bfcd-ab5721621e8a@lunn.ch>
 <CAF7HswP7Oejs42K=jG8bkNiBoDhXR2LbeHoppk0nnNon6_afwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF7HswP7Oejs42K=jG8bkNiBoDhXR2LbeHoppk0nnNon6_afwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_012039_239256_132BCB46 
X-CRM114-Status: GOOD (  27.25  )
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

On Wed, Dec 24, 2025 at 02:40:39PM +0800, Kyle Hsieh wrote:
> On Tue, Dec 23, 2025 at 6:35 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > > What make/model of switch is it? Is it unmanaged, or does it use SPI
> > > > or I2C for management?
> >
> > > The switch is connected via RMII to the MAC and is managed over MDIO.
> >
> > O.K. What make/model?
> >
> The device is a Marvell 88E6393X switch. In our design, the BMC connects

Which Linux does have a driver for.

> to the device via RMII with fixed link parameters to retrieve ethernet.
> > > On our board, MDIO is not wired directly to the processor; instead, we
> > > use a USB-to-MPSSE bridge (FT2232) to toggle the MDIO signals for
> > > switch management.
> >
> > I have to push back on you using a closed source user space driver,
> > given that i help maintain the Ethernet switch drivers...
> >
> > I know there have been attempts to get GPIO support added for FT2232,
> > but i don't think any got as far as mainline. That is probably the
> > only part you are missing. You can describe USB devices in DT. So you
> > should be able to describe such a GPIO controller. You can then
> > instantiate an virtual,mdio-gpio driver to give you an MDIO bus. And
> > then add nodes for the switch using DSA.

> Apologies for the confusion in my previous reply.
> The BMC connects to the peer via an RMII fixed-link.
> The link parameters are fixed at design time and there is no runtime
> MDIO-managed PHY or switch control from the BMC.

So you use the USB-MDIO to program the EEPROM? The switch boots using
the settings in the EEPROM? It is then an unmanaged hub? You are not
using UMSD in userspace? That code looks terrible.

So if you connect multiple of these unmanaged hubs together in a loop,
your network disappears in a broadcast storm? Yes, you can use these
switches in a dumb mode, but it has consequences. If you let Linux
manage it, you gain a lot of functionality, such as STP, to break
loops.

But you seem to be opposed to this. At least add in a comment
explaining the purpose of the fixed link. DT describes hardware, so
there is no harm in describing the hardware, even if it is a comment
and not real properties.

	Andrew

