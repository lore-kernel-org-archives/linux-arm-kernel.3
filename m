Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979D2C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EzkB4bXG/rfB+wL51aJGaxOYPuz1tcoxIa6I3pdsgo=; b=gEZpzD3GyVA7bOOl0phIEN+iXO
	rW6KELbG89Jh/yS4Flz0FrZLKhsRofFayJZP9Wu/fxTzdAtEGzfZ2Esp6PYo6w8rd8HnJYWISLW2V
	dnvHrRW4qsbdOF6yKwJaE12EtHe+5YiosTTIL1SgeWO/e9ShVGB9uHfIGSgbyDAMitq1OpTshTWWx
	z4QB4bsw36VFNzqu+wYH7PzP/KtJjr+6GKDFiqvFPAZt7eu+59sop4Bcach+sDzyOQ40stsXUkhuQ
	OIRyp8n8ejeTRp9ugz8JMmn7XdHHDTUwizvswLX10dSL4Y/i9kmtFlBuxRLLf1M599KvNv5MwgLo7
	7QC7Vr4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYVU-00000000hzx-0uS5;
	Thu, 15 May 2025 13:20:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYOu-00000000gtN-2WQK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 13:13:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1BA1A4C89A;
	Thu, 15 May 2025 13:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79970C4CEE7;
	Thu, 15 May 2025 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747314807;
	bh=Y5x0Q5wwhg5x4WNJLlfJSj3Na3CIMpE00k8kQT2PRPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwdgySrBFpBknjowQX5Hoxv6LObSUmuFtYmiMRQUWj5s+X6Oy28kwmAvXM9dgeFUh
	 aMypFFt2AEPp2VpYL84MmhfFffQ/5mBFY4/cVxpYuBxhdiHpsZ0EcTn2DhcDowf1ub
	 qmUW/bBpIMjI2vN/rIBFu8dEt9FgLc5HUQwIBkumjALsrJLzuK4EeqFya30Fpn17c6
	 zLBIDd5DOyFcuLW5bNPAiNaGxfyDxX3X45eFzAQWxZtUtXk3YN8u1ZeJqeNKWv9LwL
	 9rPgr6PcheBYjnKRyQ71wIieMzBIChgrPx17FUGtbor72kdQ3ci2DtM5UZWXKSRH6n
	 sbolT6KimcIaQ==
Date: Thu, 15 May 2025 14:13:21 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <20250515131321.GG2936510@google.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
 <20250515092000.GF2936510@google.com>
 <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
 <8beeddcf-1dc7-4af8-b287-4c896852b258@gmail.com>
 <aCXQUu97HL_yrH89@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCXQUu97HL_yrH89@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_061328_702476_D0ACB4FE 
X-CRM114-Status: GOOD (  16.34  )
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

On Thu, 15 May 2025, Mark Brown wrote:

> On Thu, May 15, 2025 at 01:28:15PM +0200, Artur Weber wrote:
> > On 5/15/25 11:33, Mark Brown wrote:
> > > On Thu, May 15, 2025 at 10:20:00AM +0100, Lee Jones wrote:
> 
> > > > I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
> > > > in would be sub-optimal and would likely end up in a mess.
> 
> > > Well, then just going a head and applying them on a branch with a tag
> > > seems easier than delaying then.
> 
> > I can split the patchset into two parts (one for MFD, one for regulator)
> > if it helps.
> 
> There's still a dependency on the MFD bits whatever happens.

Right.  That won't help since you need to describe the deps.  Submitting
them as a set was the correct thing to do.

-- 
Lee Jones [李琼斯]

