Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A16E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 01:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vD+BrY2ZV0XpDErkvdNsbcIrnvb92QoNAGdec+5eWM0=; b=CTo3SLQqKiA3tYik4L0QWWzaP5
	vJNoXITxrHXAmvtUHlWtiH0wMeyCdly/LP8MHuFYb9jg6Xw2QbGrNYwecc0a+qRu5XyxkeuuIeL56
	INXEjlC/3aeEwsvHtIPPVhxSus3Cg1WmCd2BsTl15wp/OkCuZwkT1vaQ2jEXMn11dpvuI5CrWrBTV
	4Cvwn/dKpczaWC+AZBSRXMFKEBP2e+7WWQu2I8nZM3VlrOOnArL4PNH3o+7b2HTKbiSgAVXI/A9p6
	6lB9+CqWdUtktlu6PwRoZEbpmSzJjcUBkKr+l04JDesUXsMHJgoujiihqM10Na7peXyhfkiRkIGIO
	UxHt6thg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUbjj-0000000Ha52-1HoG;
	Mon, 06 Jan 2025 01:16:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUbiW-0000000HZza-3QA1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 01:15:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F7FB1063;
	Sun,  5 Jan 2025 17:16:07 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8F333F66E;
	Sun,  5 Jan 2025 17:15:37 -0800 (PST)
Date: Mon, 6 Jan 2025 01:14:26 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Stefan Gloor <code@stefan-gloor.ch>
Cc: Chen-Yu Tsai <wens@csie.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: sunxi: Add MMC alias for consistent
 enumeration
Message-ID: <20250106011426.4767d6a6@minigeek.lan>
In-Reply-To: <d4cafa3f-d17c-4f80-bb30-98c28ede1077@stefan-gloor.ch>
References: <20241219105622.13691-2-code@stefan-gloor.ch>
	<CAGb2v67dBhL3-AhLeHg3xOgbNZ3qu0aj9+kA+MoOMRYfr_Z_zQ@mail.gmail.com>
	<20250101232836.76c7fd0e@minigeek.lan>
	<d4cafa3f-d17c-4f80-bb30-98c28ede1077@stefan-gloor.ch>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_171540_947498_8DE13E38 
X-CRM114-Status: GOOD (  32.84  )
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

On Sun, 5 Jan 2025 13:47:55 +0100
Stefan Gloor <code@stefan-gloor.ch> wrote:

Hi,

> Hi Chen-Yu and Andre, thank you for your input.
> 
> On 01.01.25 09:58, Chen-Yu Tsai wrote:
> 
> > IIRC we have chosen against adding explicit MMC aliases for the sunxi
> > platforms. Please try using UUID= or PARTUUID= for root partition
> > references.  
> 
> I see, no problem. Out of curiosity, what is the reason for this 
> decision? I couldn't find related discussions on the mailing list.

There were quite some discussions a while ago, I remember Maxime being
involved back then. But I am too lazy to dig those out now, maybe I
find some pointers later.

There are arguments for and against this, and it's not crystal clear.
Some platforms (Rockchip?) decided to allow them, but we said no.
One key argument was that the kernel never promised any kind of
consistent numbering, whether it's /dev/mmcblk0 or /dev/mmcblk1 is
entirely up to the kernel to decide. And we don't have this connection
for other devices, for instance USB disks. The plug and play nature of
those makes it obvious that we cannot guarantee this anyway, and I have
seen systems where a USB stick at boot became /dev/sda, and the first
SATA disk was enumerated as /dev/sdb.
Which means the reliance on numbering if ill-fated, and we need (and
have!) better and more sustainable methods anyway, so why not use them
everywhere? The mainline kernel tends to push against sketchy solutions
to very particular problems, because they often come back and bite us
later, and then nobody of the original people are around anymore to fix
them.

I see your point of "but it's such an easy solution", and there is an
argument that the hardware dictates some kind of ordering (SDC0 vs.
SDC3), but I don't think it outweighs the argument above, and lures
people into relying on things that the kernel doesn't want to promise.
 
> Personally, I like the UUID= or PARTUUID= method and I do have a working 
> Yocto setup that uses PARTUUID to find the rootfs. It integrates nicely 
> with the automatic disk/uuid creation and U-boot using extlinux.conf 
> [1]. I do however understand that this requires major changes to the 
> meta-sunxi layer and the maintainers don't like breaking a working 
> system with U-boot scripts. So I went with the easier way of adding 
> aliases. For future reference to anyone, this patch has now been added 
> downstream to meta-sunxi [2].

That's a shame, and I really wish Yocto people wouldn't just take
patches that have not been reviewed or even NAK'ed upstream. Those
meta layers becoming a pool of unreviewed or rejected patches is
really a bad side effect of Yocto making it easy to apply patches.

Another point: this is fixing the problem for just this particular
board. What about the other V3s boards, and in extension the other
Allwinner boards? I count 240 DTs for 32-bit boards alone in the repo,
so a more generic solutions sounds much more reasonable than applying
band-aid to one board.

Cheers,
Andre

> [1] https://github.com/linux-sunxi/meta-sunxi/pull/431
> 
> [2] https://github.com/linux-sunxi/meta-sunxi/pull/432
> 
> 
> On 02.01.25 00:28, Andre Przywara wrote:
> > Yes, and LABEL= would be another way.
> >
> > Alternatively you could use U-Boot's DT when booting the board. U-Boot
> > will add those aliases during build time (because it needs them for its
> > own purposes), and by using $fdtcontroladdr (instead of $fdt_addr_r,
> > on the bootz command line) you get this for free, and even save yourself
> > from loading some DT.
> > We sync the DTs regularly from the kernel to U-Boot now, and at the
> > moment they are identical between the kernel and U-Boot, so you don't
> > lose anything.  
> 
> Thanks Andre for the helpful tips. I'll remember this for future reference.
> 
> Best,
> 
> Stefan
> 
> 


