Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7B0C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 10:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+ZiE4h7yZMaCfT3NriBdfy+2InEJT9er/Dkx2VKOws=; b=vfUKeQBQmnws8YzzcV6BSmL1fo
	r7hE0lVPuwHcq7x1guH0DGKae3JIlyVf4oKo3lBmE1qGgmXUyhfUmNnvlhejkP+hn6j1mN46Gm+gC
	jBe7dM19l/5kzCWGzdiMM1ZEoKifEhdywRa+OF2sxZ117ThpDwpADlsc7HinjoZddGwgG3MgsXm2+
	2VD75Ndu5c+Cpdru2C4/yZucpVED7lAwLmjRxjszdALXM7nRGSDvd6ZoSuxbm6AYi5w5xnhhAx0Ys
	fH5MREka5WD7Ynt0xuvif6qClAJowHCT6LcxngSHxez9W+D57huACh2Vm91N5EaDpjYHG7Ten9k7p
	Rk0qaWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9iZI-00000009Mko-1EV5;
	Tue, 29 Apr 2025 10:52:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9iVd-00000009MHu-24HV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 10:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q+ZiE4h7yZMaCfT3NriBdfy+2InEJT9er/Dkx2VKOws=; b=qLg6kqj0bFDKL+el/mnTGTj+5O
	AkqJyDAiyhgH6yZ81GGyWXnPaY47ArNNjYxCJR8uXywOqoRaPef4LniMDVebhv3oLmIZch+kIM/2u
	0ta6wIsSSQjUZ5J+/KKNjBfCwPimXTtfHrxrDd+64CAfoBvBIlB17ag98IPwk9faJzbf/DrzGPsb5
	W1DQZL4zrhvF+wpPOCpVHqDvIJT+oNxyXbgy8UEBzwf4O7D3o1BXBbp2xylpP0jowxMipLIEfqq0c
	9hHdhWVbkHQR/mE17wMFgS3IFCwqAkmStic0gmGy340f3FTASGoqWKkc3O6DMQIulenEEF2T9rt8X
	+gE9dwvQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9iVa-0000000DGmy-1trO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 10:48:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E4571515;
	Tue, 29 Apr 2025 03:48:04 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D45A3F66E;
	Tue, 29 Apr 2025 03:48:09 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:47:54 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aBCuSpToEklg340R@pluto>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
 <20250425125250.1847711-3-cristian.marussi@arm.com>
 <aA5BeONpC3CJE5-Z@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA5BeONpC3CJE5-Z@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_114814_820724_A3356620 
X-CRM114-Status: GOOD (  38.01  )
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

On Sun, Apr 27, 2025 at 04:38:48PM +0200, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 01:52:48PM +0100, Cristian Marussi wrote:
> > Add a common framework to describe SCMI quirks and associate them with a
> > specific platform or a specific set of SCMI firmware versions.
> > 
> > All the matching SCMI quirks will be enabled when the SCMI core stack
> > probes and after all the needed SCMI firmware versioning information was
> > retrieved using Base protocol.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > V1 -> V2
> > - compile quirk snippets even when SCMI Quirks are disabled
> > - added support for quirks matches on multiple compatibles
> >   (via NULl terminated compats strings)
> > - removed stale unneeded include
> > - added some more docs
> 
> > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > +{
> > +	struct scmi_revision_info *rev = &info->version;
> > +	const char *compatible = NULL;
> > +	struct device_node *root;
> > +
> > +	root = of_find_node_by_path("/");
> > +	if (root) {
> > +		of_property_read_string(root, "compatible", &compatible);
> > +		of_node_put(root);
> > +	}
> > +
> > +	dev_dbg(info->dev, "Looking for quirks matching: %s/%s/%s/0x%08X\n",
> > +		compatible, rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
> 
> You're now just looking up the most specific compatible string in order
> to include it in this dev_dbg(). Since you're now matching on all
> compatible strings, perhaps you can consider just dropping it.
> 

Yes indeed I was not sure to keep all of this machinery just to print
the machine compatible that is used to try to match against the
(possible) list of compats....on the other side seemed useful to know
exactly what you are trying to match against....but maybe we can simply
assume that the machine compatible is well-known....

> > +
> > +	/* Enable applicable quirks */
> > +	scmi_quirks_enable(info->dev, rev->vendor_id,
> > +			   rev->sub_vendor_id, rev->impl_ver);
> > +}
> 
> > +/**
> > + * DOC: Theory of operation
> > + *
> > + * A framework to define SCMI quirks and their activation conditions based on
> > + * existing static_keys Kernel facilities.
> 
> nit: kernel
>

Yep.
 
> > +/*
> > + * Define a quirk by name and provide the matching tokens where:
> > + *
> > + *  _qn: A string which will be used to build the quirk and the global
> > + *	 static_key names.
> > + *  _ven : SCMI Vendor ID string match, NULL means any.
> > + *  _sub : SCMI SubVendor ID string match, NULL means any.
> > + *  _impl : SCMI Implementation Version string match, NULL means any.
> > + *          This string can be used to express version ranges which will be
> > + *          interpreted as follows:
> > + *
> > + *			NULL		[0, 0xFFFFFFFF]
> > + *			"X"		[X, X]
> > + *			"X-"		[X, 0xFFFFFFFF]
> > + *			"-X"		[0, X]
> > + *			"X-Y"		[X, Y]
> > + *
> > + *          with X <= Y and <v> in [X, Y] meaning X <= <v> <= Y
> > + *
> > + *  ... : An optional variadic macros argument used to provide a coma-separated
> 
> comma
> 

...ah

> > + *	  list of compatible strings matches; when no variadic argument is
> > + *	  provided, ANY compatible will match this quirk.
> 
> > +void scmi_quirks_enable(struct device *dev, const char *vend,
> > +			const char *subv, const u32 impl)
> > +{
> > +	for (int i = 3; i >= 0; i--) {
> > +		struct scmi_quirk *quirk;
> > +		unsigned int hkey;
> > +
> > +		hkey = scmi_quirk_signature(i > 1 ? vend : NULL,
> > +					    i > 2 ? subv : NULL);
> > +
> > +		/*
> > +		 * Note that there could be multiple matches so we
> > +		 * will enable multiple quirk part of an hash collision
> 
> nit: "quirks that are part of a"?
> 

mmm...as a non-native and poor English speaker I am, though, reasonably
confident that a/an is chosen based on the vowel/consonant SOUND of the
next word NOT on the effective letter...am I wrong ?
(then we could digress about which is the sound of a[n] 'hash' :P ...)

> > +		 * domain...BUT we cannot assume that ALL quirks on the
> > +		 * same collision domain are a full match.
> > +		 */
> > +		hash_for_each_possible(scmi_quirks_ht, quirk, hash, hkey) {
> > +			if (quirk->enabled || quirk->hkey != hkey ||
> > +			    impl < quirk->start_range ||
> > +			    impl > quirk->end_range)
> > +				continue;
> > +
> > +			if (quirk->compats[0] &&
> > +			    !of_machine_compatible_match(quirk->compats))
> > +				continue;
> > +
> > +			dev_info(dev, "Enabling SCMI Quirk [%s]\n",
> > +				 quirk->name);
> > +
> > +			dev_dbg(dev,
> > +				"Quirk matched on: %s/%s/%s/[0x%08X-0x%08X]\n",
> > +				quirk->compats[0], quirk->vendor,
> 
> You can now match on more than one compats string, but I guess printing
> just the first one is fine.
> 

Yes, same as above dev_dbg...not sure if it was meaningful really to
dump all the list and overload the log with all such info...

> > +				quirk->sub_vendor_id,
> > +				quirk->start_range, quirk->end_range);
> > +
> > +			static_branch_enable(quirk->key);
> > +			quirk->enabled = true;
> > +		}
> > +	}
> > +}
> 
> This seems to work as intended and I've tried matching on machine and
> SoC compatible strings and/or vendor and protocol version:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 

Thanks for the review Johan.

Since you have tested the effective final quirk patch, may I ask you to
post straight away your final tested quirk patch on top of my next V3
(with your authorship of course..)...I will drop the [NOT FOR UPSTREAM]
example patch so that Sudeep can easily pick-up your patch.

Thanks,
Cristian

