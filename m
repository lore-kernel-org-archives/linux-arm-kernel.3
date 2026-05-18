Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C440DCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 21:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GuBuREUW8bGshk7vlvVa3KUDpp0m8U9lZrEZsyZhII=; b=ko0odT2gd7PGtHxiXkDKWJuXSq
	7AI4RV8OXF1d542WPfkh5cv8XaY6Ktki9Oofb3i645zuF0Yt1iTkwuAPcoSWjV/6/KEku5SaD9sFw
	3AX+8p7GBwt+w6tYc/Yn4yvOR8fCC/b6R1TBY53VQO2+tB9QzMgkbUxUtlKoQIoSemMcUyXXPwHyQ
	uxHEPj5U813D7bmLNaY9qd7o4oeBzC+R+QFCr3uD6wIdA6lvfFer7aZINk57lkSywlJA4jcCvVGpZ
	ySMSBKPxcwXSD2Oh6m/qMqrRrQ0L8tqMPlgTy0VFHK+iErF356pU3kxMb2dbPdxy4Z/+7B4fcE0rL
	Pt4bbMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5RS-0000000GzRl-1aZE;
	Mon, 18 May 2026 21:24:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5RP-0000000GzQb-1Nh6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 21:24:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FFA832AC;
	Mon, 18 May 2026 14:23:51 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BEC43F7B4;
	Mon, 18 May 2026 14:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779139436; bh=VjVI2thILGLJhZjpaCtPoUsNFut+vKbqFE4N09CJOwg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=liiQsR9433gMHCcfGqr9qM+NDyqgfPupw1scZQBPF76b1Dk43t7GIMJFZKgqFrCyB
	 +OyAEyj1jZjSvtT00p5z2xxnfT8Oz/2flrLYrWD2WZD3nMYBQ9rKVR08Fi3UYlnlwi
	 SZ3Y1F8wm5X59x8usIqoxufRxwVJe7vZrDBlaCA8=
Date: Mon, 18 May 2026 23:23:05 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
Message-ID: <20260518232305.3cef3f78@ryzen.lan>
In-Reply-To: <bc3b786313adee30cc00c65ea98ff5258a816abb.camel@gmail.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	<20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	<agr9m_tidBr6Cu2h@collins>
	<579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
	<agsezxcxjQlBmesm@collins>
	<bc3b786313adee30cc00c65ea98ff5258a816abb.camel@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_142359_517150_08BE45AC 
X-CRM114-Status: GOOD (  19.23  )
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

On Mon, 18 May 2026 16:40:11 +0200
Alexander Sverdlin <alexander.sverdlin@gmail.com> wrote:

Hi Alexander,

> On Mon, 2026-05-18 at 16:14 +0200, Paul Kocialkowski wrote:
> > I also have a U-Boot config ready for it, which I could send once the
> > device-trees are merged on the kernel side. I could send it to you if
> > you're interested.  
> 
> I do have one as well, I'm testing all open-source ;-) from ATF-upwards,
> just thought U-Boot would require ATF merged and kernel DT merged
> because of OF_UPSTREAM in U-Boot. But I'd be happy to sync when we get
> there.

There is no requirement for upstream TF-A support when adding U-Boot
support. All we need is *some* blob to feed to the U-Boot build system.
There is one dependency, though: the TF-A load address. Mostly that's
some quite obvious SRAM address, but in this case it turned out that
the SRAM on the A133 is probably too small, so it looks like we need to
move to DRAM. Not sure how we handle the transition, but at the moment
there is just one board supported, so it will be slightly painful for a
few weeks or months, I am afraid.

And yes, DTs need to be merged into Linus' tree to be considered, so
this series of yours is exactly the right thing to do. There are
regular syncs between the DT rebasing repo and U-Boot, but we can
manually cherry-pick patches once they have reached the mainline tree.
But feel free to send U-Boot patches once this series has been ACKed,
so the defconfig file can be reviewed and then queued, to wait for
the DT to appear in v7.2-rc1, for instance.

Cheers,
Andre

