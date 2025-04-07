Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501ECC36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcI46lTVSeHRR6PCsmQIdJkenRV/ajFn4WU+i3FnG5M=; b=Qvi8aQAVIBCMJKo/+0itFQGYtq
	Wy8otPqy58Hbdkj7BMLFmwELNBC/1wCtPvoWLjNoDHe9to3sXrLfMIEFjgePGI/CeB9tdqKhsNBJq
	j+CgIkknRfWLl32UjK2ZyyHfvZT6Z3KrsaRwbeFoS4phXJEX/a0uM8F5xW9XeCUgkEjozB47AYPpO
	Z8DsS/lQwLXJhQ68ESuCOozLt621I0bOR0xksN68DTPP0MX8KfuA3sl6NbmHVrPizP6Ia+owcfiLD
	4gEmIuTgVZlyz9BLOd/Yvc0iwvh5Zl6poYtmNLCMWnIFtXHj6vvw0ejzdbtynAzDeZmgkfG5lGmk1
	RyzwxK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYO-00000001ctp-3w7D;
	Mon, 07 Apr 2025 18:50:40 +0000
Received: from mail-qv1-f50.google.com ([209.85.219.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pcU-00000001GjC-3Y0p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:46:48 +0000
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so5300796d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044405; x=1744649205; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rcI46lTVSeHRR6PCsmQIdJkenRV/ajFn4WU+i3FnG5M=;
        b=ETvBQhQfz30y5G491GvFvFKyErANNGrLlemKwa1soeQwhD/JZvEkKzCjeKGlYimkV4
         jGPzXpa8mVV39LQplV/unbN5PyZMZ7SGxhSb8Nkyc4xRw/6CJW80wqfW+yWNg0HWFJ/z
         uhwolAKR394RxKyCY8etDPoJJGVxqKFfoeMeOWPQqU6OKXvqqaEi/yxZghSEu3rXJyk4
         1aqWsEz4mruKM59u4bCZ+oOlZGPfgTohXx29S636N72l9S2Mxos10HwvgbAppVUmS81X
         EnBXNscA63rfFHevu0dXp0tqEFU27Nza3rCH/0PevMzb5OydQ6Ln0GfLskB7lHPRmtkp
         mUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044405; x=1744649205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcI46lTVSeHRR6PCsmQIdJkenRV/ajFn4WU+i3FnG5M=;
        b=pUP9ah+WZtZrtYsDdVP21Ye0EhWlQgVmYzycjqnySztLFqfr72BO87HqXDkyNrSbNw
         bW7ZXdS/GqisIrra/++5B1aE55M8JpLac7CO0xtt4tG1BKpyhLcZoCu7EOj8fJMqkPOm
         gk7abpg4YqjUrtEKsoiXrEYAXiJ84ZVL2TO1vDXv/BLryZ1B5rd4zbYP49kwlFiak8gS
         hBgALnL3Iek7Kbg6/MRiqjhLnjv80etxC6EfjqlhIrThkH2RG32LFt1QmvarPWVcdwrf
         ZMzcNvj6BiklfyZ2n25bJWsOCKw1uLgBkETzAKlAva/SV6kqVA5/09nLD47TvIynOyWg
         ha7A==
X-Forwarded-Encrypted: i=1; AJvYcCW3tfPvYBjzoquaBSDHnoNs8CbL0fCtpt6MtZ1SUXerLrr9whAWZOYZLUZh9R71p5B5c1WXeWi7icdcDIhxNGpa@lists.infradead.org
X-Gm-Message-State: AOJu0YwH56vNLLdbs1mqHnazNsPEpqIvo+CPelhP0vT+VPPJ3VWPGYce
	Tqe4D6C4Mt+tIPkjy5FEvvHhkQejzRTO0shOAn6lX952rPg9yUJvb5JA0VYvUHA/ek3UHozU6cG
	9dj0n+Djv9L9ZzY5G1b/thnQy/Z0=
X-Gm-Gg: ASbGnctEOfFCxpPc+zewvLC1jIkhvb97SEHTExKM/04m+olonoDt9uAPR6Kv+NAJnjg
	KTo5ungVIXKXM56ig5jjVrm1sL5DY70+8wg6Tc42Riq2uZMnzZTOSDOn04CwAtdHBevvQJ1UP9p
	vm9L9m1yqpA/9jKvxhH3R+/3y0
X-Google-Smtp-Source: AGHT+IHn1NWvGQNUg+cTWq77arIBOMg99zSiThdNcGxwwVSUpNgoUD/iAcjqlZYjSbS/ACMXvRhNvnrbFKc+S9VTrwY=
X-Received: by 2002:a05:6214:1307:b0:6e2:3761:71b0 with SMTP id
 6a1803df08f44-6f0d24ed16bmr3696846d6.5.1744044405300; Mon, 07 Apr 2025
 09:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390> <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
In-Reply-To: <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 7 Apr 2025 18:46:34 +0200
X-Gm-Features: ATxdqUHTe6GO-vqbSM3EmiJ-FaS0XfNSqylpsewp4c0XXyMi1WCC05uIygoRAqs
Message-ID: <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, upstream@airoha.com, 
	Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Clark Wang <xiaoning.wang@nxp.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Conor Dooley <conor+dt@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Li Yang <leoyang.li@nxp.com>, 
	Madalin Bucur <madalin.bucur@nxp.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Michal Simek <michal.simek@amd.com>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Rob Herring <robh+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Robert Hancock <robert.hancock@calian.com>, 
	Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>, UNGLinuxDriver@microchip.com, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_094646_900544_E5453AEC 
X-CRM114-Status: GOOD (  30.10  )
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

Il giorno lun 7 apr 2025 alle ore 18:33 Sean Anderson
<sean.anderson@linux.dev> ha scritto:
>
> On 4/7/25 12:27, Kory Maincent wrote:
> > On Thu,  3 Apr 2025 14:18:54 -0400
> > Sean Anderson <sean.anderson@linux.dev> wrote:
> >
> >> This series adds support for creating PCSs as devices on a bus with a
> >> driver (patch 3). As initial users,
> >>
> >> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
> >> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
> >> - The Cadence MACB driver is converted to support external PCSs (namely
> >>   the Xilinx PCS) (patches 9-10).
> >>
> >> The last few patches add device links for pcs-handle to improve boot times,
> >> and add compatibles for all Lynx PCSs.
> >>
> >> Care has been taken to ensure backwards-compatibility. The main source
> >> of this is that many PCS devices lack compatibles and get detected as
> >> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
> >> the devicetree to add appropriate compatibles.
> >
> > I don't dive into your patch series and I don't know if you have heard about it
> > but Christian Marangi is currently working on fwnode for PCS:
> > https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
> >
> > Maybe you should sync with him!
>
> I saw that series and made some comments. He is CC'd on this one.
>
> I think this approach has two advantages:
>
> - It completely solves the problem of the PCS being unregistered while the netdev
>   (or whatever) is up
> - I have designed the interface to make it easy to convert existing
>   drivers that may not be able to use the "standard" probing process
>   (because they have to support other devicetree structures for
>   backwards-compatibility).
>

I notice this and it's my fault for taking too long to post v2 of the PCS patch.
There was also this idea of entering the wrapper hell but I scrapped that early
as I really feel it's a workaround to the current problem present for
PCS handling.

And the real problem IMHO is that currently PCS handling is fragile and with too
many assumptions. With Daniel we also discussed backwards-compatibility.
(mainly needed for mt7621 and mt7986 (for mediatek side those are the 2
that slipped in before it was correctly complained that things were
taking a bad path)

We feel v2 permits correct support of old implementations.
The ""legacy"" implementation pose the assumption that PCS is never removed
(unless the MAC driver is removed)
That fits v2 where a MAC has to initially provide a list of PCS to
phylink instance.
With this implementation, a MAC can manually parse whatever PCS node structure
is in place and fill the PCS.

As really the "late" removal/addition of a PCS can only be supported with fwnode
implementation as dedicated PCS driver will make use of that.

I honestly hope we can skip having to enter the wrapper hell.
Anyway I also see you made REALLY GOOD documentation. Would be ideal to
collaborate for that. Anyway it's up to net maintainers on what path to follow.

Just my 2 cent on the PCS topic.

