Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E63D4920E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 05:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPR84UHCUvaOEvWy/NGk03Dr1sgtX6rUbFD2LbTCjgE=; b=bfWH9YS0hlFgHcUjB1kC2Ghxc8
	dWcEKgQvax19LBIsVOeMlkzo1f9dpXDPrV5hbs1Zt69yLFJu5oK+w+4yIdVGuWfbxAEAIwM3nH9HG
	MoC+0AiRHmQxR9M2MBjFmjg2gh8CsUo835eN/p4Z+837/9+tEyKObYzhDxgHmtzikJoavtK8wiZL4
	AxcKeiM/QGlfIymzY3uYHsQuhe6LrrbJC2cu9kJIdNwgfOLSFiYM+6CXcQUo8tEPjQIoWMdh9u6C5
	bxK37LTaiQm+wJzgLVX2rvBNH425pLfj37yg3PJy3Q462Ru6XHvdke8F2iPL1tPBjkaK4uvo8t0FH
	D4fvcvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHCo-0000000BSsx-3lT0;
	Tue, 19 Nov 2024 05:55:18 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHBt-0000000BSmT-0dG1;
	Tue, 19 Nov 2024 05:54:22 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e3686088c3so3790446a91.0;
        Mon, 18 Nov 2024 21:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731995660; x=1732600460; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sPR84UHCUvaOEvWy/NGk03Dr1sgtX6rUbFD2LbTCjgE=;
        b=U+ny4ManuGPgjDYtsf5SMknS4+cf7CSj7JLZLJ5mmH0Ta1yY3/oPT8YaR9bcSs0euD
         4lZWlcgd8/AVd3Edo+uAfDnZHZI8SiuZzYfUNRb6sFrhiWKiNEnn7pumhxXgTECQABEI
         aKDoB3OWoolOHoslyHlbIxktK9N6OdT3WW05mNNFg1WdHQz/WkuMSfjwonreAL5jUxQ8
         UX1zo44DJ8cMEUAQT/6b5xsF2HGwKu76d1iVGeqBHswfUbQCz+9PsAijCy20SG2eEIa9
         cSylUmA9Vsd6I7y8XVKXd7FIxa/BQnx8yGyo6ih5Hfke+T5oR2wGJKhBwkjoR8VB6m2k
         HRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731995660; x=1732600460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPR84UHCUvaOEvWy/NGk03Dr1sgtX6rUbFD2LbTCjgE=;
        b=vfO+M32gmyfkWnFbXNIffEDYunDttYLBFjGVVdqbpPtrXTI8gyN0UD+iG0vFPzndER
         Y7VSFy8MQgVcZWjQNKMxD8HN9CCgHkxzOcZYk6fZSOsmS8RUkTXpPTKvQdZ3KExVWHu2
         wtJff076aOlXxU9oNxTMoEOxJGparYrLt3XQycIaVfv12Th+X67R1cXLLlaNUypHhiRU
         7TKr8cq3mlyIw53Oh4wteSWi7zRVed/pKy8l1aQnob+JkNDHWT7KKj29+KN4MSfxMRTE
         9obZPaaYaP2dyBCY+VPKG3Sk9LqzYkqa3CCO9ZMTRbBC9blkl6iHJvzNk3qmyV+Lyez2
         OKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhugi435E/ZpHDFr66p3NX0stv3fvxMLiMunrZeMWznktRDaLp3jslCdY4scHaRqJakzFJ5EXxCPcUyNHC9Y9g@lists.infradead.org, AJvYcCVwfESa75eqXaxcfHPxQ7yZ0KnqHaHmYcyI0T3u2gT//eOFPlOrzRNORbcDT/rjhzWYUZ4AVq3D+5dqqwNIzaM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqkE3rXwNO9LbTvLPGORGrKLTvhg8bIP5HY/KhbC1TdNfHC44r
	J6BiDqvpIgD+iR3yGlKXxUDhy5IQiH1/FOAilZMOzVs1r5RIlnkS
X-Google-Smtp-Source: AGHT+IGnv4VCMQafOLUTrIv29G+Q/+Mep91ihQQ7OEyN58NPfepR4RjFIymBqCb5CgP8lUvQpWrV2A==
X-Received: by 2002:a17:90b:3b90:b0:2ea:4578:46c6 with SMTP id 98e67ed59e1d1-2ea457877d6mr12280134a91.30.1731995659578;
        Mon, 18 Nov 2024 21:54:19 -0800 (PST)
Received: from HOME-PC ([223.185.133.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea81b0e2fasm2581653a91.52.2024.11.18.21.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 21:54:19 -0800 (PST)
Date: Tue, 19 Nov 2024 11:24:15 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: dafna@fastmail.com, laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 media-next] media: rkisp1: Fix unused value issue
Message-ID: <ZzwoB4jt9LyTm0x7@HOME-PC>
References: <20241118093721.55982-1-dheeraj.linuxdev@gmail.com>
 <3obha26vg2agtmrxjft325ifiwyaftqchgpdgmm7aok7vt7e5c@jfknj6opiudo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3obha26vg2agtmrxjft325ifiwyaftqchgpdgmm7aok7vt7e5c@jfknj6opiudo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_215421_188038_B92EF485 
X-CRM114-Status: GOOD (  27.83  )
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

On Mon, Nov 18, 2024 at 11:18:34AM +0100, Jacopo Mondi wrote:
> Hi Dheeraj
> 
> On Mon, Nov 18, 2024 at 03:07:21PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> > This commit fixes an unused value issue detected by Coverity (CID
> > 1519008). If ret is set to an error value in the switch statement, it is
> > not handled before being overwritten later.
> >
> > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> 
> Indeed there's something fishy here, however the issue is not very
> much about ret being overritten but rather the error condition
> 
> 	fwnode_graph_for_each_endpoint(fwnode, ep) {
> 		switch (reg) {
> 		case 0:
>         HERE   ---->   (!rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
> 				ret = -EINVAL;
> 				break;
> 			}
> 
> 			break;
> 
> 		case 1:
> 			vep.bus_type = V4L2_MBUS_UNKNOWN;
> 			break;
> 		}
>         }
> 
> breaks the inner switch and not the for loop.
> 
> I would
> 1) Slight reword the commit message to make it about missing an error
> condition
> 2) Add a Fixes tag
>    Fixes: 7d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver optional")
>    so that this is collected in the stable trees
> 
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index dd114ab77800..9ad5026ab10a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> >  			break;
> >  		}
> >
> > +		if (ret)
> > +			break;
> > +
> 
> The change is correct
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>   j
> 
> >  		/* Parse the endpoint and validate the bus type. */
> >  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  		if (ret) {
> > --
> > 2.34.1
> >
> >
Hi Jacopo,

Thank you for your feedback. I agree with your suggestion and will update 
the commit message to describe the missing error condition.

-Dheeraj


