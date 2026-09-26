Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357C3C98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 23:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caIUqaGpPXywvS7cvtf2gH2nhCT3Kfv2F5FSEPIGS8g=; b=JyMaYQzVkrSZEdnyzsy3puOXnp
	tLYvjhWp8d26J4AxS4xjG5Qrv8W6TX7SL74MZoDkwuZtHb0LlUR5BQ2ZCmhuDxutAJe70eJam46x1
	kEBAdUOgk+2snCLiEe1ecq5pmU2LLPRwMUEgfFe6ikEH2tvzuLGNErbwIQ/hxF/PJPfRu3eQGmY7n
	vQ0fj57F1w2ba8jN1U9TZAQK1UjO3fHmkQbcIGaJyW52ifZShHhLq14KflKzNLF4kasP62Mj/O32V
	zKRV8VXNBp2CiLN5XNoPNbMv7cLv8IpBins2Krsho3pGtU+1eBNhP6LezgtksL4SQEOvhFiKGluql
	iaehn86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAbjg-0000000Fqs2-0y7l;
	Sat, 26 Sep 2026 23:23:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAbjc-0000000Fqrb-3c4e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 23:23:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A50161570;
	Sat, 26 Sep 2026 16:23:04 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E6FA3F85F;
	Sat, 26 Sep 2026 16:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790464988; bh=/ozAqHwym+Z5sVGPOe9fFGYDt4IlByYRu+rnvAuNlPM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dJkw7B+drhz4rJmrg8FxuIGuMCPa2Noark29wKB/0VaxqeyGQ0lLtIJY0P5HypHpO
	 D4FZGkqHFE+UwEQsgMmKa4Lfl9O31oQZfXhJqjvdZ+Wmn814ZcMXP3fkzbCvnYVGzl
	 ed+pV6F5ym+NYX2TbnxyxNa2tP5NcJSmMsVNwfiw=
Date: Sun, 27 Sep 2026 01:18:15 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Per Larsson <per@palvencia.se>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Liu
 Changjie <liucj1228@outlook.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: a523: x96qpro+: enable
 Ethernet support
Message-ID: <20260927011815.66cc1769@ryzen.lan>
In-Reply-To: <20260901074827.39a649bc@rpi>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
	<20260803101452.2993721-7-andre.przywara@arm.com>
	<20260809134607.65d66069@rpi>
	<20260901074827.39a649bc@rpi>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_162312_947064_1FF01478 
X-CRM114-Status: GOOD (  13.44  )
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

On Tue, 1 Sep 2026 07:48:27 +0200
Per Larsson <per@palvencia.se> wrote:

Hi Per,

thanks for having a good look at this!

> On Sun, 9 Aug 2026 13:46:07 +0200
> Per Larsson <per@palvencia.se> wrote:
> 
> > On Mon,  3 Aug 2026 12:14:52 +0200
> > Andre Przywara <andre.przywara@arm.com> wrote:
> > 
> > > +		pinctrl-0 = <&ephy_25m_pin>;  
> > 
> > This should be &ephy1_25m_pin, right?

Argh, of course. This was from an earlier version, with just one pin,
and I used that DT version in U-Boot for testing, so didn't notice.
Fixed now, of course, thanks for spotting!
 
> With this typo (and the one in patch 4/6) fixed, this series gets a
> Tested-by: Per Larsson <per@palvencia.se>

Thanks, added that, v2 is on its way.

Cheers,
Andre.

> since it eliminates the need to use hackier methods to get the ethernet
> port to work on this box.
> 


