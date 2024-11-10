Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400B7D5E399
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 03:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwPrzkdLlKgirMtUGn9oOtxfg4Pp97eFE5XX75PE9vw=; b=JkC24xjK4ArCYoJdQDZu16oOdJ
	5VM01aKf1yeCK588iMUyZrELUPjwwOR+5q/Z0COv39P8WuHPpdVNEMh97RKyqo/4qrDxjbDr6Nc0B
	wDZSWhosmZhlY8zk0qHO3P2/CxMC9vGJLJoQuxjHgQo1BftyhowqYIk8+dZ9wSR4ed83tyxdHEMHJ
	229UzoIzdyCANGSxSu1YRFGb4mMlwK8UFQd+uIIouvH7m/6CzW6rAUackwSfEbisemkYqwggzrdpN
	aQBxB6/yUtkxAAYBBr4SKx0mIPvDMBdFeqUzCyVZfz6hDUWO4Ou9DTNLU/9CbNcUSRvV6X0p1jgTf
	pkugngeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ylv-0000000EJX7-3Bio;
	Sun, 10 Nov 2024 03:37:55 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9yk8-0000000EJNt-06kI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 03:36:08 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731209759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwPrzkdLlKgirMtUGn9oOtxfg4Pp97eFE5XX75PE9vw=;
	b=CIikVB1aMlZptZeWsg7YoKPCio/ukwu/H1V95yR9NJciE3Nu8zIjjfQlyB7OEKPygW5P6E
	pQEnU9jXr0YNpZIwRdX4U61CQixlhjJl7Otfb5dpQeRrr+xb0Dr5vkretReyQ5/zvTD60T
	gg/Yz9QwAsm9slFkbqnyf3k7IFqCLn2jvbtlbRCUbXU8lu/6nnWLL8uuTc43ct/hrt9OBm
	lkyCsLlKpVB8rXs1iP9j+DxlJcwx/028/4eX9JUthEHl5aAadWFajjuXKCl9zleBKkiARB
	TxaRQ5MC1WEku4S7WBIQ9eR79+5qw3ITGpWm5OAHGAR1iXOtIhwDssn6x8E7oA==
Date: Sun, 10 Nov 2024 04:35:58 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: wens@csie.org
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ondrej Jirman
 <megi@xff.cz>, Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: pinephone: Add mount matrix to
 accelerometer
In-Reply-To: <6f2c860c442838bd9892d5861b82e73e@manjaro.org>
References: <129f0c754d071cca1db5d207d9d4a7bd9831dff7.1726773282.git.dsimic@manjaro.org>
 <bef0570137358c6c4a55f59e7a4977c4@manjaro.org>
 <CAGb2v66aody60h=Bpk49pxogq93FekmO48uThPET2RKxvx=OGw@mail.gmail.com>
 <cfc090cb87a8b926116d1a436694d17d@manjaro.org>
 <CAGb2v67fLPf-yKObuds3LC77gT_W_OmgSK5y2KotRC-Zn9aL7w@mail.gmail.com>
 <6f2c860c442838bd9892d5861b82e73e@manjaro.org>
Message-ID: <2c650672c86fd21d42503b218760384c@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_193604_391008_9CE99A75 
X-CRM114-Status: GOOD (  28.33  )
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

Hello Chen-Yu,

On 2024-11-06 07:31, Dragan Simic wrote:
> On 2024-11-06 03:19, Chen-Yu Tsai wrote:
>> On Sat, Oct 26, 2024 at 12:11 AM Dragan Simic <dsimic@manjaro.org> 
>> wrote:
>>> On 2024-10-25 16:47, Chen-Yu Tsai wrote:
>>> > On Wed, Oct 23, 2024 at 5:11 AM Dragan Simic <dsimic@manjaro.org>
>>> > wrote:
>>> >> On 2024-09-19 21:15, Dragan Simic wrote:
>>> >> > The way InvenSense MPU-6050 accelerometer is mounted on the user-facing
>>> >> > side
>>> >> > of the Pine64 PinePhone mainboard, which makes it rotated 90 degrees
>>> >> > counter-
>>> >> > clockwise, [1] requires the accelerometer's x- and y-axis to be
>>> >> > swapped, and
>>> >> > the direction of the accelerometer's y-axis to be inverted.
>>> >> >
>>> >> > Rectify this by adding a mount-matrix to the accelerometer definition
>>> >> > in the Pine64 PinePhone dtsi file.
>>> >> >
>>> >> > [1] https://files.pine64.org/doc/PinePhone/PinePhone%20mainboard%20bottom%20placement%20v1.1%2020191031.pdf
>>> >> >
>>> >> > Fixes: 91f480d40942 ("arm64: dts: allwinner: Add initial support for
>>> >> > Pine64 PinePhone")
>>> >> > Cc: stable@vger.kernel.org
>>> >> > Helped-by: Ondrej Jirman <megi@xff.cz>
>>> >> > Helped-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
>>> >> > Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>>> >>
>>> >> Just a brief reminder about this patch...  Please, let me know if some
>>> >> further work is needed for it to become accepted.
>>> >
>>> > There's no "Helped-by" tag, and checkpatch would complain. The closest
>>> > would be either Suggested-by or Co-developed-by, but with the latter
>>> > you would also need their Signed-off-by.
>>> 
>>> Thanks for your response.  You're totally right about checkpatch.pl
>>> not supporting Helped-by tags, but including neither Suggested-by
>>> nor Co-developed-by would fit very well in this case, because the
>>> associated level of credit falls right somewhere between what's
>>> indicated by these two tags.
>>> 
>>> > I can change it to Suggested-by if that's OK with you.
>>> 
>>> I've created and submitted a patch [*] that adds support for 
>>> Helped-by
>>> tags to checkpatch.pl.  Let's see what kind of feedback that patch
>>> will receive, and then we'll be able to move forward accordingly.
>> 
>> There doesn't seem to be any activity. Maybe also try adding it to the
>> 
>>     Documentation/process/submitting-patches.rst
>> 
>> document?
> 
> Good idea, thanks!  I've created and submitted the v2 [**] of my
> other patch, so it now also adds a description of the proposed
> Helped-by tag to Documentation/process/submitting-patches.rst.
> Let's see will that spark some interest.

Please, let's move forward by "downgrading" the Helped-by tags
in this patch to Suggested-by tags, as you already suggested, to
avoid possible delays with having this mount-matrix fix merged.

We'll see what will happen with the proposed acceptance of the
Helped-by tag, I haven't given up on that yet. :)

> [*] 
> https://lore.kernel.org/linux-kernel/0e1ef28710e3e49222c966f07958a9879fa4e903.1729871544.git.dsimic@manjaro.org/T/#u
> [**] 
> https://lore.kernel.org/linux-kernel/cover.1730874296.git.dsimic@manjaro.org/T/#u
> 
>>> >> > ---
>>> >> >
>>> >> > Notes:
>>> >> >     See also the linux-sunxi thread [2] that has led to this patch,
>>> >> > which
>>> >> >     provides a rather detailed analysis with additional details and
>>> >> > pictures.
>>> >> >     This patch effectively replaces the patch submitted in that thread.
>>> >> >
>>> >> >     [2]
>>> >> > https://lore.kernel.org/linux-sunxi/20240916204521.2033218-1-andrej.skvortzov@gmail.com/T/#u
>>> >> >
>>> >> >  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
>>> >> >  1 file changed, 3 insertions(+)
>>> >> >
>>> >> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
>>> >> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
>>> >> > index 6eab61a12cd8..b844759f52c0 100644
>>> >> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
>>> >> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
>>> >> > @@ -212,6 +212,9 @@ accelerometer@68 {
>>> >> >               interrupts = <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
>>> >> >               vdd-supply = <&reg_dldo1>;
>>> >> >               vddio-supply = <&reg_dldo1>;
>>> >> > +             mount-matrix = "0", "1", "0",
>>> >> > +                            "-1", "0", "0",
>>> >> > +                            "0", "0", "1";
>>> >> >       };
>>> >> >  };
>>> >>

