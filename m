Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE921CFA446
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VL+dgfFJaJObXef1+NwBUjf2BvSPGC9sMwQo64LaXKc=; b=eAEyASh3j0TcNaftsqA172HMr8
	bUASEH5HZ1V0oWkXhUfo8elae7OFeXvcO7HaOgUdMOuhg53HvBvKlz08BSOq14ffsrBuNER8gV/Au
	SQDcLcJ+4G2RKO8KraxffWdkLdjxJzo1EgePR7NGYFEAvrAyx+Y0oXaIxyMaI248PzOjddDTYkWne
	EiICXaDlQIIIeU+M/tLNs+PJBlIpIdS0X9iYpV+Guo8ESerxrQEhhAJX7Obj7IglO4USMrBsSf40y
	D3+w+2BDu1sRVEAXzK61fZozjrg/lliBXNrKSvs4Y2CxWy4FPpFshmKMAc9LsbcCJnXGMEBJiSb9v
	UErjblgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBub-00000007PaD-23Hp;
	Thu, 20 Nov 2025 21:09:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBuY-00000007PYS-2ahv;
	Thu, 20 Nov 2025 21:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VL+dgfFJaJObXef1+NwBUjf2BvSPGC9sMwQo64LaXKc=; b=4JDKEuaY9gDbNRJ0y1i9Sc3Kmq
	P6GJ5tqKs8OYW+92B8fDosEbT4qnXx9EV/zKO6AaXTwWp9hPuNEWIWAOWc+BJd/Sfp36W8BLiCErQ
	4efNnXhltm1CHDBh01lmUA335Klso0Rz1uBSqHZY0Te6APQWyqPtWK3zFK4zEYDvFbjs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vMBuC-00Eg2Z-5n; Thu, 20 Nov 2025 22:09:28 +0100
Date: Thu, 20 Nov 2025 22:09:28 +0100
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
Subject: Re: [PATCH] ARM64: dts: mediatek: fix MT7531 reset polarity and
 reset sequence
Message-ID: <f8e9184a-2b29-461a-907b-9e17856b5d89@lunn.ch>
References: <20251120162225.13993-1-ptpt52@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120162225.13993-1-ptpt52@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_130950_660932_979E02F3 
X-CRM114-Status: GOOD (  13.69  )
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

On Fri, Nov 21, 2025 at 12:22:24AM +0800, Chen Minqiang wrote:
> The MT7531 reset pin is active-low, but multiple MediaTek boards describe
> the reset-gpios property without GPIO_ACTIVE_LOW or incorrectly mark it
> as active-high. With an active-low GPIO, gpiod_set_value(1) drives the
> line low (assert reset) and gpiod_set_value(0) drives it high (deassert).
> 
> Update all affected DTS files to explicitly use GPIO_ACTIVE_LOW so that
> the reset polarity matches the hardware design.
> 
> Additionally, adjust the mt7530 driver reset sequence to correctly assert
> reset by driving the GPIO low first, wait for the reset interval, and
> then deassert reset by driving the GPIO high.
> 
> Boards fixed:
>  - mt7622-bananapi-bpi-r64
>  - mt7622-rfb1
>  - mt7986a-bananapi-bpi-r3
>  - mt7986a-rfb
>  - mt7986b-rfb
> 
> This ensures the MT7531 receives a proper low-to-high active-low reset
> pulse and initializes reliably.

Please add a comment to the commit message about backwards/forwards
compatibility, how this is safe when booting an old DT blob on a new
kernel. Or a new DT blob on an old kernel. We don't expect regressions
in such cases, and it is good to indicate in the commit message you
have thought about this and don't expect problems.

    Andrew

---
pw-bot: cr

