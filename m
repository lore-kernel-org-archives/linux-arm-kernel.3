Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739CCD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 01:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHwQhTg+NJLJ1+sYXBy6n63aHK8fWvhoGfYfXbbgar8=; b=peIerOfQSQt0A3DZaTyAeFnyN4
	GyJtycR0l4qPfBWYnB9k7mkiTPVTGQ0SbtFPrg121mAlfevnXahFtVdcmb7vVhoVGlglx3EaIKcyu
	pojvjiJVZBpzBGVjdUwEbZyPKpj0XhyqqglgMjglIvvK5qgpS9KC+WZtKWGAZsEoPbP+4N2rPWUIy
	w/jj+PFBCPvwQxz8mBE61phypiyxAjsR8pa1n80mjEH0GXGSoUz8HR55y8VICC7rziqu9HSfnprE0
	EQmcJbj/61aITKiLLuezcXtUBxvvRnQgnVFQigafSsrpYJhATh2feHuMlL0cRHA7yvHKuL/tFm328
	cYi6GCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPVoM-00000001uuF-3smB;
	Sun, 30 Nov 2025 01:01:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPVoI-00000001utJ-0sBf;
	Sun, 30 Nov 2025 01:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zHwQhTg+NJLJ1+sYXBy6n63aHK8fWvhoGfYfXbbgar8=; b=oTtLbLlXpRq7v516IlJUaNTd/s
	VfZ6j+kCuEH1joUxulIPJ1FGlKFTyj9CT7KYCcepiyRtut0UwsuQXAFV8TssNHrdM202+bgM47o7/
	vEZddvydzVkp6rCqNsRGhNF3M2wQxWMD52hMisgqLzpPurpKR8rhg2r2sxwsU48PuCZo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vPVnt-00FR64-Oh; Sun, 30 Nov 2025 02:00:41 +0100
Date: Sun, 30 Nov 2025 02:00:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chen Minqiang <ptpt52@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ARM64: dts: mediatek: fix MT7531 reset GPIO
 polarity on multiple boards
Message-ID: <893308f9-18c0-4489-81be-e233d50d16da@lunn.ch>
References: <20251129234603.2544-1-ptpt52@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129234603.2544-1-ptpt52@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_170106_281823_D7655277 
X-CRM114-Status: GOOD (  16.63  )
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

On Sun, Nov 30, 2025 at 07:46:02AM +0800, Chen Minqiang wrote:
> The MT7531 reset pin is active-low, but several DTS files configured the
> reset-gpios property without GPIO_ACTIVE_LOW. This causes the reset GPIO
> to behave as active-high and prevents the switch from being properly reset.
> 
> Update all affected DTS files to correctly use GPIO_ACTIVE_LOW so that
> the reset polarity matches the hardware design.
> 
> Boards fixed:
>  - mt7622-bananapi-bpi-r64
>  - mt7622-rfb1
>  - mt7986a-bananapi-bpi-r3
>  - mt7986a-rfb
>  - mt7986b-rfb
> 
> Note: the previous DTS description used the wrong polarity but the
> driver also assumed the opposite polarity, resulting in a matched pair
> of bugs that worked together. Updating the DTS requires updating the
> driver at the same time; old kernels will not reset the switch correctly
> when used with this DTS.
> 
> Compatibility
> -------------
> 
> Correcting the polarity creates intentional incompatibility:
> 
>  * New kernel + old DTS:
>    The driver now expects active-low, but out-of-tree DTS still marks
>    active-high, causing the reset sequence to invert.
> 
>  * Old kernel + new DTS:
>    The old driver toggles reset assuming active-high, which now
>    conflicts with the corrected active-low DTS.
> 
> This was unavoidable because the original DTS was factually wrong.

So, the real question is, are the regressions you are going to cause
by breaking backwards compatibility worth it? 

What happens if we don't fix this? Does anything break if we leave it
as it is?

I personally think it be better to just document the issue in the
device tree binding.

	Andrew

