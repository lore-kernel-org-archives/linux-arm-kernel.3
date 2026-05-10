Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD979CD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlWbWq/CGdgEefQ2eyqTtAgG75LTmYN7H/VZzkGg/+s=; b=jB0VBA2/up6H3OoU+vTMVaSFOp
	bfOQoZQuUw++85fbdPCmixFaXXbjlCr4bqE1bYRCHYHob67xbLliz7ZFZN0+sho2k6uzNNQl5ehbu
	xreJd2Vawq8op9KIJYeVLukS9VY/nJkj9/3oxI/X3IHlYsJB7TyJY9dp9f3FqqqLWQTdKN5Y8IG3Z
	FB7Pwz4u/25LqQc4rXy0MMoT3dRMYucL3SVtnFh6m6h/kF8wARdUKV0sShN0xW38qAfxr7bB+WwOB
	QQPE27KavmmwWCM/tSuoVy2qqcJr6pm/8thyL+GxoDm0LEAmeJRPtylg8RXoT1V7jgJxSGldgRjAv
	9f0br0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLyex-0000000ALcD-2e2N;
	Sun, 10 May 2026 07:33:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLyeu-0000000ALbQ-1OVT;
	Sun, 10 May 2026 07:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D734A44399;
	Sun, 10 May 2026 07:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE93C2BCB8;
	Sun, 10 May 2026 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778398382;
	bh=C5SWgmyd3p/JbXe/hJzJcoVgQTuM5eiVn5t8MpCXkAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeDmc2U313JxDmIy7pAMv8WvsQDMPnypLTpuLxlqXZbTJci7+8m5Tb6IunjOLRt1/
	 CSxjLqMyrCDEGVLanta3FLe77aH8DgZ0bjIWHm49SZoqX7C/moS3675Z2R5obt+QlX
	 PWGXnvAToiQ8ZT9mp7Vpt6WANglTtwI1AXdL882iSg2Rrgh1h2lsm4N12ZGjwhStil
	 w7Sa1jDGNJI/4jU3rOcnmxI2Ud50QyrZGcJBwvZ6OOTVPHz+aP5DIECN8SsXvBjFtq
	 u0r7SvzT3EONCMfCc3oOxeA2Dq/zhGx3191MfpFxsftfwBDx2EUDhbF5prmQP+AR8X
	 UswgkjZ+8riTA==
Date: Sun, 10 May 2026 13:02:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, devicetree@vger.kernel.org,
	William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v4 00/16] phy: rockchip: usbdp: Fixes, DP 1-lane support
 and cleanups
Message-ID: <agA0qhQakjlqvl2x@vaman>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <afd8xMS2hz208Lcl@vaman>
 <6960660.0VBMTVartN@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6960660.0VBMTVartN@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_003304_418437_4B82D72A 
X-CRM114-Status: GOOD (  26.65  )
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


Hi Heiko,

On 03-05-26, 21:12, Heiko Stuebner wrote:
> Hi Vinod,
> 
> Am Sonntag, 3. Mai 2026, 18:50:12 Mitteleuropäische Sommerzeit schrieb Vinod Koul:
> > Hi Sebastian,
> > 
> > On 28-04-26, 18:13, Sebastian Reichel wrote:
> > > This series overhauls the Rockchip USBDP driver; apart from a
> > > a bunch of cleanups and small improvements the main goal is to
> > > get the driver ready for proper USB-C DP AltMode support.
> > > 
> > > Once this series has landed, it unblocks enabling proper USB-C
> > > DP AltMode on the RK3588 and RK3576 platforms incl. runtime PM
> > > for the Synopsys DesignWare DisplayPort controller.
> > > 
> > > Apart from this series, further changes are required on the
> > > DRM side. There are no compile-time dependencies between the
> > > DRM side and the PHY side, but the PHY side must be applied
> > > to avoid SErrors once runtime PM is added to the DisplayPort
> > > controller driver. Thus it would be really good to land this
> > > series in the next merge window.
> > 
> > Looks like sasiko has flagged 8 high warning, can you please check them
> 
> (1) as mentioned in a different patch thread, review should be happening
> on the lists. Tools regularly dump old results, so anyone looking at the
> mailinglist thread might now be able to follow along with what happened
> in 2 months or so.
> 
> Also other robot tools can reply on the lists just fine.

It was not available in past, have enabled email reply as that is best
way for us. It should happen going forward

> (2) if 1. is so hugely impossible, please at least provide some reference
> to what you mean. Not everybody knows all the hype-tools-of-the-week and
> simply searching for that mysterious "sasiko" [0] did not provide any
> meaningful results for me, despite some amazon or youtube links for some
> non-kernel uses of that term ;-)

I am surprised that the hype of the week seems to missing for you or
Sebastian as Sashiko has been, IMO covered quite well. Instead of a random
web search I would have looked at lwn [1], [2].

> So a link should be present at least please.

Agree, I have sent to people who I thought might not be aware. I guess
better to not assume. In any case here are the comments, which maybe
valid or maybe not. As usual with tools we should use our discretion
https://sashiko.dev/#/patchset/20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22%40collabora.com

[1]: https://lwn.net/Articles/1063292/
[2]: https://lwn.net/Articles/1063303/

-- 
~Vinod

