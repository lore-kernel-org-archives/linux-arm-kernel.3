Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ED2D132D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VRgHvhRBcsiarlO81XsRqHDaYbJX07q/lfMCHSL7Vw=; b=vyyUpbOilUxMZlxRK/EuhsFXl/
	ruvkCI/IGHVyFnyNJwo4/D+jmi9z4UqvXz5aM3Tmv2kNAz0iC4RMg3gfyRro5cwxtI7VJQloTq7nI
	YThLFpf8Yxkdy37JMT8zkjtY/ePnqB79foJL200geY2M0ef00wWx6fOfQwdV3YqRDYAKPkG4VxBOb
	AagnZPsuLBWjOkAqzVn23ebUHxviR2H76Nu5ljZw4IkaZC2pRp2eCN8iUi1tbqmTiYruXPKMwddT9
	yi3fozg5bjAZWZZWIl3JeJzHYORUsnNdHRF1DSQlPCMXpji2lcY5HK1zpSNshgZjJnrpAI4lgWdTr
	nv2fOang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yDn-0000000E4sM-1Ncw;
	Mon, 04 Nov 2024 14:38:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xjb-0000000DzNs-03Z3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 14:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=6VRgHvhRBcsiarlO81XsRqHDaYbJX07q/lfMCHSL7Vw=; b=cR
	jLhFr07FMo7N7ctDTbNF+ir8U7lbv8Gb099mzLhmfw9NZE61BKGCacgyO8LoWGeR4zCHUa6TZYYNw
	slezT1CEaDM3oMcdHt288NG/jbNqpRXra6CLMFVtbj46wnKwAYymL5wHkXL+LyheURO/DwXs0pDQ1
	+SoxkDhNAhnpJ2s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t7xjX-00C6ul-JE; Mon, 04 Nov 2024 15:07:07 +0100
Date: Mon, 4 Nov 2024 15:07:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rob Herring <robh@kernel.org>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: marvell: kirkwood: Fix at24 EEPROM node name
Message-ID: <9fe4cd4a-8f97-484e-94fe-b49b12f7b52c@lunn.ch>
References: <20240910215914.823546-1-robh@kernel.org>
 <CAL_JsqLLRSEaDv=Zm_LQH9cpgH2prh21+cmovgSR=pzQTuRtZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLLRSEaDv=Zm_LQH9cpgH2prh21+cmovgSR=pzQTuRtZQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_060711_069426_902B817C 
X-CRM114-Status: GOOD (  12.95  )
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

On Mon, Nov 04, 2024 at 07:24:50AM -0600, Rob Herring wrote:
> On Tue, Sep 10, 2024 at 4:59 PM Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Ping!
> 
> Are Marvell platforms still maintained?

Yes, but on a sporadic basis. Patches tend to get collected somewhere
around -rc5/-rc6. So i would expect a notification from Gregory
sometime this week.

	Andrew

