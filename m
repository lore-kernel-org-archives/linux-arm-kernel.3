Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBF0CFA441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JweFYkJNQB23bxN82bE4p4nwcQiB2tl0i88PLv5Xafc=; b=w/kEeXdn5GZAqm4TgqHAipbbhW
	PB3zvIfjkPMO2QS3lv0qIBKRd1nJNLEyyNo7Y4M02OlR1JIZ+nJmpAWD2J1MZ+mPsUmeRsz8UvUAR
	EdnZlVPNcMrMIgEulhV0gVcJi8VixGdXXp0wqwLZFLG4GB+wrsVaXCX++EFuNjAevUpO3T9B3XkxZ
	esO/8Q7aYE1Jow6r/WcLxkyanYn06+TXp4vUAEBRKYzgo+20fo3B5OnFWZiY0XWRe8MjTMmg9SOPQ
	ph3Pn0puOZRMuiYU3HW4fANQpmZR4DZnchf4f4GD74GlZafS/b+4g80QQg8ypP/EaMzdvmMuzz+9B
	sy//7xNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCp9-00000007VbS-2Eta;
	Thu, 20 Nov 2025 22:08:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCp7-00000007Vaz-1KPC;
	Thu, 20 Nov 2025 22:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JweFYkJNQB23bxN82bE4p4nwcQiB2tl0i88PLv5Xafc=; b=pV7GjDVGPa2+tAaN5SGnganJ2R
	u7NjB8omqenDHOwR2uT4fKfS9qN3KAYA2zhKFV+z5GPY+/j8A0Oujwinp+BO7/VZ4T3BQjQeti4cG
	udYiBwxbkiJSc/AN3oxhIiHr/DYzNHOhzqpWOBWY6mubBz6khXjZkFHRYV3Cj0VcdYGw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vMCov-00EgJL-Q1; Thu, 20 Nov 2025 23:08:05 +0100
Date: Thu, 20 Nov 2025 23:08:05 +0100
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
Subject: Re: [PATCH v2 1/2] ARM64: dts: mediatek: fix MT7531 reset GPIO
 polarity on multiple boards
Message-ID: <52d3469e-104e-4950-802a-2b83cea8d726@lunn.ch>
References: <20251120213805.4135-1-ptpt52@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120213805.4135-1-ptpt52@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_140817_375849_73B9AFEB 
X-CRM114-Status: GOOD (  14.87  )
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

On Fri, Nov 21, 2025 at 05:38:04AM +0800, Chen Minqiang wrote:
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

Sometimes we need to live with issues like this, because of:

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
> Out-of-tree DTS users must update their DTS together with the kernel.

So the real question is, does this actually harm anything? Do we see
any real issues?

	Andrew

