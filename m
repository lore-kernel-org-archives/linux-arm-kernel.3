Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B9DC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 07:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8wBrdWSV92hcb+OGpUJM58MhakZSJllcgFy8ZSCAG8=; b=NkjOX/OB1FHOqHRo/JkcVXy485
	WS5kvLvLR8VNcmD2UvPcFBV6uf7JnBWMxZ8NTYgcxbg8XxI2tHKh7ZGccCNA2BJiLzLSMafssrMY+
	f5tINwC1Q7MQfule1ASuRpQzE4yqo5BVOOSOjv6fckD3sj0tiJHG3EmqlBkhb1VNPVgWluq5Y6ibe
	+VaCyWrep/hAUCpoBCXCFVISd2SiK6WZdgRGCtRYftclizYNj8/8Ej2tAXoJgV3qDwEP0Ixyte4eG
	He9KlQMEEWSt9uaTEYoqn/AO4UIgOOHoV+BsNApNPj/WYI/TBWaXPLnmMKxbAckBkycZOKVmMwfJA
	qHIqr0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fka-0000000DzSh-3A3p;
	Wed, 02 Sep 2026 07:51:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fkY-0000000DzSC-2F82
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 07:51:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E2DEA6022C;
	Wed,  2 Sep 2026 07:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874C51F000E9;
	Wed,  2 Sep 2026 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335473;
	bh=K8wBrdWSV92hcb+OGpUJM58MhakZSJllcgFy8ZSCAG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mBSh9Qahbt+37XpHW+HjIn3G4Y8+fqIkLpBwcbylgUvrv0dRAWkinld9EP22jagSL
	 V4ZwlxQd1UHPzBG536m2wHB4/qjFNd4dCL4WvDdN5SsU484xb4ulC3nFRi6tKaLAc+
	 rm/F+uKnZU3u4jRfw2vz2rvpvLsxUw5rQ6ABejmBWitxSgnmHKQPuTM4HnlyUPj4QW
	 A7ji804fBQARmJy5SMytcQ6e51LteVAN6CpdlHKgVqdvs46uh2PesjxHfZtWMsflox
	 teC9dkSUE/Nw1uyAh9NHe5yxkI5Na5pGmb+wSWOMwYc0qtkgDpGH6zHajDPhvz4pby
	 menmGGcGq/s4g==
Date: Wed, 2 Sep 2026 08:51:10 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 1/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
Message-ID: <20260902-tireless-steadfast-mongoose-cccac7@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org>
 <20260824095121.00001b9c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824095121.00001b9c@oss.qualcomm.com>
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

On Mon, Aug 24, 2026 at 09:51:33AM -0700, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 12:32:56 +0100
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Add a call to device_set_node() in the SCMI probe helper to associate
> > generated SCMI platform device with the firmware node of its supplier
> > transport device.
> > 
> > This complements device_set_of_node_from_dev() and ensures that
> > firmware node information is propagated correctly for both Device Tree
> > and non-DT (e.g. ACPI) based systems.
> 
> Hi Sudeep,
> 

Hi Jonathan,

Thanks for all the reviews. I was away for a while and started to look at
addressing these now.

> When you say 'complement' I'd like to see a little more.  The guts
> of both calls includes setting dev->ofnode() adn the extra bit
> in device_set_of_node_from_dev() is about ensuring we drop existing
> node reference (there isn't one) and increment the reference for what
> is the parent of_node.
> 

Yes I agree. At the time, when I hacked this up, I was supposed to take
a look at it again which I never did.

> I may be wrong, but I think that is unnecessary and if I'm wrong I'd
> like to see more info here on why it is needed.
> 

No your concerns are valid. For reference-counted non-OF fwnodes like ACPI or
software node, platform_device_release() drops the fwnode reference,
but device_set_node() does not acquire one.

> Also, if this is commonly needed why doesn't device_set_node() include
> that dance?
> 

I think there are new helpers added recently in the tree, thinking of using
then. See below.

> Unless I fumbled the command, a grep suggests there are no instances
> in tree of these both being called near each other.
> 

I did that too before adding but somehow kept it for future investigation.


> Jonathan
> 
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > ---
> >  drivers/firmware/arm_scmi/common.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > index fe8c22cfb9f7..cc7d11c3c1f3 100644
> > --- a/drivers/firmware/arm_scmi/common.h
> > +++ b/drivers/firmware/arm_scmi/common.h
> > @@ -650,6 +650,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
> >  	}								       \
> >  									       \
> >  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
> > +	device_set_node(&spdev->dev, dev_fwnode(dev));			       \

How about something like this instead of above 2 lines:

if (is_of_node(dev_fwnode(dev)))
	platform_device_set_of_node_from_dev(spdev, dev);
else
	platform_device_set_fwnode(spdev, dev_fwnode(dev));

-- 
Regards,
Sudeep

