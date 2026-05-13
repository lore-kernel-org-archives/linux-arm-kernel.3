Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D17CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nm6CBH6VorxsnAaXaKNSJcT/qPbyzYhO79nSIrB19OM=; b=4q+J/W+aw01w15XfSRp3MjbM18
	r4Bjo79gBhYTZDcF4iDkTp3G4CfGLXU5djIIPsaC2AOOdUQ+JpEG7StNsd5Y+MYGfNUG4qBmQTI2p
	MY1KTRU85DXbo2QEsKIgEjcGxaSilxv4moVrnnIBTbyt3BhI7AZTY7Ptut4rdrwYSnmnwGjIQuJFI
	MtRIUim8nzqpVHzECggIds4cDJCfT2JM0MoM8PugkI9cuUWEKrG/uaXH9+zKnIzdn4uSXKvCzELKh
	Fxo5d+dYT98IroGm1s1cySrMs9iu+mEBSKOczqm6IDl436Fnu6j/+SOQ70PBaYfaMipTD+brNR0PS
	dO9AMG1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4l8-00000001hwq-3Kx3;
	Wed, 13 May 2026 08:16:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4l7-00000001hwd-2JdY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 08:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nm6CBH6VorxsnAaXaKNSJcT/qPbyzYhO79nSIrB19OM=; b=H9TvpoBJ1R+Lcr5C1RWUlHmDXW
	z3PhXBXR+oYqoGHi/BSEVcJWZdAx9dlW0gdpP31cALe7QO0x3CNRih075uvr8C8skOyJZ+Q2eW18+
	54TIKZBygftX9D8KbMhvYKbGojf9zTm24g4MixtyudO3BArCCkCPsO/jH3BkOYXBWX5HFGFCyNYz/
	taRD3VI5u5cDJwPtmZU9GaENSqttR0iDkR8nAqFRfe946m1NaMwb8BWs47CnWv8ywMkTVoW560CZw
	BylsdHP4UjfX2XKc3LvvJhZBXuchcNeSCsWd8m03V2BjquamIvZegBxnbuyvZuGT+5i2fdNYKMgVJ
	BJf8ysDA==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4l3-0000000BJBx-48hM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 08:16:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09E99165C;
	Wed, 13 May 2026 01:15:49 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC1623F7B4;
	Wed, 13 May 2026 01:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778660154; bh=FleCqJXLGbjsm3lXawHNhEeyQjwtpuikYn1w59j6nF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n+Yh0WiY5X5IzfXkNMxiXyoqs8ZFN7YpnDA7OnGnbx6Iz7vfzyolPzQoGYMi2564b
	 GlHo6HwGGlHfsNECvi/vI8YlmVcM9H5pbhyjRjsSxOjRwHRFK5q0RvNNpbtQ3h3+5/
	 BoSQovl+Val3gsm+lzNqHxJBlzLT/kVbIfNXFz68=
Date: Wed, 13 May 2026 09:15:51 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: trbe: Hide enable_sink sysfs file
Message-ID: <20260513081551.GC34802@e132581.arm.com>
References: <20260507-james-cs-hide-trbe-enable-v1-1-b4e40439f44c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-james-cs-hide-trbe-enable-v1-1-b4e40439f44c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_091558_186893_0361EA88 
X-CRM114-Status: GOOD (  11.54  )
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

On Thu, May 07, 2026 at 11:53:45AM +0100, James Clark wrote:

[...]

> +static umode_t coresight_attr_is_visible(struct kobject *kobj,
> +					 struct attribute *attr, int n)
>  {
>  	struct device *dev = kobj_to_dev(kobj);
> +	struct coresight_device *csdev = to_coresight_device(dev);
>  
>  	if (attr == &dev_attr_label.attr) {
>  		if (fwnode_property_present(dev_fwnode(dev), "label"))
>  			return attr->mode;
>  		else
>  			return 0;
> +	} else if (attr == &dev_attr_enable_sink.attr ||
> +		   attr == &dev_attr_enable_source.attr) {
> +		if (csdev->no_sysfs_mode)
> +			return 0;
> +		else
> +			return attr->mode;

I'd prefer no_sysfs_mode to work as a general flag rather than being
limited to sink/source devices only. Otherwise, LGTM.

Thanks,
Leo

