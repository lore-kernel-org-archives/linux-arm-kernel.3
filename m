Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE35CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdFQZgIxXvTJEIjz5KMcpTRDRk9Ea0ruC3RL5U1JbHI=; b=Xdo5zfhp51b2IjuUzcI8ZgWRUb
	u54Ffr6W1chxENFwJkupjOpotgGEVFL0oiWG0bG8/jBmcc5DCoNZZH41zm6A7UUygPb8hZdOFg6rO
	pRORIPztsfdR+8SLg4gFD5aPSjh2Ob1HTg195zuz6U0AIXwxM2Q36CEaXrr6z8BpZlJroooAoPSdU
	ENrvck58qOLfBjYNr7zLnXKKWpTkJoPQqpZKDG07KEN74Bu0glcxcNf/pLz9t6K25xzQrAPfyDBBa
	kO9EMnage/TaC+MUthIzW17Bwni9pKIYssAsmsl7l3UhLzcILT5kky7GfaNL/anZDkWhVd/IpZUBc
	3KG/97dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6If-0000000201A-2o5F;
	Wed, 13 May 2026 09:54:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6Id-0000000200c-1bjC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:54:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FAFB165C;
	Wed, 13 May 2026 02:54:37 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9AF83F85F;
	Wed, 13 May 2026 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778666082; bh=UWJRzOzDyTTy2s4vpUyoCVqhn90+eaQ6v3y9xCs3UKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCOgbjTwS8vi1BGeruL32b3lnoaIlpNYKhd29rq/t6HD9KV2el5KQB0SACjYlHeZW
	 lwOaKpIMZ8ZsF8WsNzBFhcvqskAUn7oQ/hSAZxECMMvxt8nsNpjPHPsW10mbwhI/Lf
	 d8gwjnSxfR7wuTBnsBdRYFGjiwZeYrY2nsnrw9tU=
Date: Wed, 13 May 2026 10:54:39 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: trbe: Hide enable_sink sysfs file
Message-ID: <20260513095439.GD34802@e132581.arm.com>
References: <20260507-james-cs-hide-trbe-enable-v1-1-b4e40439f44c@linaro.org>
 <20260513081551.GC34802@e132581.arm.com>
 <cfb27efd-4887-4d47-8b38-99fc2d7bcfac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfb27efd-4887-4d47-8b38-99fc2d7bcfac@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_025443_471678_F73F8500 
X-CRM114-Status: GOOD (  14.52  )
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

On Wed, May 13, 2026 at 10:33:40AM +0100, James Clark wrote:

[...]

> > > +static umode_t coresight_attr_is_visible(struct kobject *kobj,
> > > +					 struct attribute *attr, int n)
> > >   {
> > >   	struct device *dev = kobj_to_dev(kobj);
> > > +	struct coresight_device *csdev = to_coresight_device(dev);
> > >   	if (attr == &dev_attr_label.attr) {
> > >   		if (fwnode_property_present(dev_fwnode(dev), "label"))
> > >   			return attr->mode;
> > >   		else
> > >   			return 0;
> > > +	} else if (attr == &dev_attr_enable_sink.attr ||
> > > +		   attr == &dev_attr_enable_source.attr) {
> > > +		if (csdev->no_sysfs_mode)
> > > +			return 0;
> > > +		else
> > > +			return attr->mode;
> > 
> > I'd prefer no_sysfs_mode to work as a general flag rather than being
> > limited to sink/source devices only. Otherwise, LGTM.
> 
> Which other files would you hide though? These are the only two that I could
> think of.
> 
> I wouldn't hide all sysfs files for 'no_sysfs_mode' as there are read only
> things that aren't strictly related to sysfs mode.

In coresight-sysfs.c, there are two kinds of attributes: the label and
the sink/source enable knobs.

The label is already handled separately. So we can hide the rest
attributes when no_sysfs_mode is set?

Thanks,
Leo

