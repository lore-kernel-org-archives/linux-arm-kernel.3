Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C988C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeWO0HB8Nc96Fe+hQSZ34DEhR9+OsO4/hc8zsZ94PYk=; b=Fzgqz0aVBEn7iY+rB3eBC6l0/W
	tRtZXLwSom8+kwAaU0dOTrSpapHvRWUNNNMVn2BFe7reEhnYItp6Pat4Q8ktCokOPt1Q40/2z8ydQ
	aFY6ZkZCDz9G5KjauGp8jwP0agvQ2l/athcYeQAguHAb5cJGJehuzY6VcgmpyxbIuId4FiJNxgSsZ
	Aw6Pv7mthTteCPuJ+fcmkoCvC9c8IkUeXlwZW7Dl6SVKNzfB+4bcFkdvxcxSjhmL07RvhchUQLJcW
	KLkYg85V+/x90f+unpqyI8ucFJYtdxYHZOLudUSH1oLYbcyfHkIitzXqg2xdyD+/uiFBQbgwsUOhK
	6x2tlOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgjr-0000000FVLz-1mjg;
	Wed, 21 May 2025 10:31:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghH-0000000FSd6-2TTf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 10:29:16 +0000
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5AEA6B5;
	Wed, 21 May 2025 12:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747823333;
	bh=BsLfk4W6hGOyAxKG4j9DTDZxtWJhOXlWv1hSc+4+WMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NLlvw1/Y4ia1wdjBQBL+MvyXbkNjDVqVYL5E7KOxl3KbXr+r8v1HVN0ZvZjWxbs+m
	 MYwVMN7qZpxxjKgEgMWXBVL9dC8zm8T+uVnfOAOhuP2shHn/HTzMUhQx8ekUkwnHXz
	 IEJPsQoG8kjYBL367bcoLEBcz8KFa5pNsDJe6M/A=
Date: Wed, 21 May 2025 12:29:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i.MX8 ISI crossbar: simplify a couple of error messages
Message-ID: <20250521102908.GD12514@pendragon.ideasonboard.com>
References: <m3plgi9pwu.fsf@t19.piap.pl>
 <20250509091549.GD28896@pendragon.ideasonboard.com>
 <m3sekz8r7z.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3sekz8r7z.fsf@t19.piap.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_032915_766967_B0952108 
X-CRM114-Status: GOOD (  17.32  )
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

Hi Krzysztof,

On Tue, May 20, 2025 at 01:19:12PM +0200, Krzysztof Hałasa wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
> 
> > The goal was indeed to save memory.
> >
> >> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> >> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> >> @@ -352,9 +352,8 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
> >>                                                sink_streams);
> >>               if (ret) {
> >>                       dev_err(xbar->isi->dev,
> >> -                             "failed to %s streams 0x%llx on '%s':%u: %d\n",
> >> -                             "enable", sink_streams, remote_sd->name,
> >> -                             remote_pad, ret);
> >> +                             "failed to enable streams 0x%llx on '%s':%u: %d\n",
> >> +                             sink_streams, remote_sd->name, remote_pad, ret);
> >>                       mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> >>                       return ret;
> >>               }
> >> @@ -392,9 +391,8 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
> >>                                                 sink_streams);
> >>               if (ret)
> >>                       dev_err(xbar->isi->dev,
> >> -                             "failed to %s streams 0x%llx on '%s':%u: %d\n",
> >> -                             "disable", sink_streams, remote_sd->name,
> >> -                             remote_pad, ret);
> >> +                             "failed to disable streams 0x%llx on '%s':%u: %d\n",
> >> +                             sink_streams, remote_sd->name, remote_pad, ret);
> 
> It appears the current code saves (in my default build) 8 bytes of
> memory, at the cost of readability and inability to search with grep:
> 
> Current:
> Name          Size      File off
> .text         00000bf4  00000040
> .data         00000000  00000c34
> .rodata.str1.8 000001b8 00000c38
> __jump_table  00000030  00000df0
> .rodata       000001b8  00000e20
> 
> With patch:
> Name          Size      File off
> .text         00000bd4  00000040
> .data         00000000  00000c14
> .rodata.str1.8 000001e0 00000c18
> __jump_table  00000030  00000df8
> .rodata       000001b8  00000e28
> 
> Built as a module it doesn't even save that - the number of pages stays
> the same.
> 
> Just FYI.

Fair enough. I'll take the patch, with an update to the commit message:

media: nxp: imx8-isi: Simplify a couple of error messages

The error messages in the mxc_isi_crossbar_enable_streams() and 
mxc_isi_crossbar_disable_streams() functions are similar, with a single
word difference between them. The word is moved out of the format string
to a separate dev_err() argument to try and save memory through string 
de-duplication. The total savings are however small, as the .data size 
reduction is partly offset by a .text size increase, with a total saving
of 8 bytes in total on an ARM64 platforms. They also come at the cost of
making the error message difficult to grep, which outweights the gains.

Simplify the error messages to make them grep-able.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

