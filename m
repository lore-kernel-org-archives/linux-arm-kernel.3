Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C139D3901B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 21:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=za0fpDkWlNRgAE2HAgbjpp1kpbvg5WT+0bRe4U+oU+o=; b=PpMuGSEwnyIvGPokwahY0/fxZ5
	OFWy4W3M91ndC8GZDm+/Nk8+hIK074EXhYcLHDxSHErpUncTFdk3eVyQifv4sohx+nhiKT2ZJ/fbX
	mGjLfi1na+fQ8xSTMsRgh5FmHFYVeVyJojRqZ/SAbAWFT+IpqSKnO25uUSjE+OKCme1BN5BHIGlm4
	yKb5PK9+q9/TotKdbwsU42UTXx3WwUE2Ld3IQzDQZdXB7TkF/palrbYrUeyHeR3MinT7iZiyjg4x1
	8Xfq3PJF46kahc2kR6QELxSFIYJhw6iTO3H68B9OV9XAfU7ij81XRY7pMotYtKFHOt65TIvoy1M7+
	wdypJMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg84J-0000000Aj3H-2WPb;
	Wed, 14 Jan 2026 21:06:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg84E-0000000Aj2k-3Hwn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 21:06:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B0951515;
	Wed, 14 Jan 2026 13:06:05 -0800 (PST)
Received: from bogus (unknown [10.57.49.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 172B23F59E;
	Wed, 14 Jan 2026 13:06:09 -0800 (PST)
Date: Wed, 14 Jan 2026 21:06:06 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWgFPuyVRNLPH3J0@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <d153103d-4b9a-4380-b5cf-1f07dcbcedb8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d153103d-4b9a-4380-b5cf-1f07dcbcedb8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_130615_238401_04C90C1E 
X-CRM114-Status: GOOD (  27.23  )
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

On Wed, Jan 14, 2026 at 06:12:29PM +0100, Neil Armstrong wrote:
> On 1/13/26 07:24, Satya Durga Srinivasu Prabhala wrote:
> > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > 
> > On platforms where a vendor SoC driver already exposes widely-consumed
> > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > 
> > Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> > prefer SMCCC over a vendor driver can explicitly enable it.
> > 
> > This avoids unexpected format changes and keeps the generic SoC sysfs
> > stable on systems that rely on vendor-specific identification.
> > 
> > [1]
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> > 
> > Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> > ---
> >   drivers/firmware/smccc/Kconfig | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> > index 15e7466179a6..f830d11ebdca 100644
> > --- a/drivers/firmware/smccc/Kconfig
> > +++ b/drivers/firmware/smccc/Kconfig
> > @@ -18,8 +18,11 @@ config HAVE_ARM_SMCCC_DISCOVERY
> >   config ARM_SMCCC_SOC_ID
> >   	bool "SoC bus device for the ARM SMCCC SOC_ID"
> >   	depends on HAVE_ARM_SMCCC_DISCOVERY
> > -	default y
> > +	default n
> >   	select SOC_BUS
> >   	help
> >   	  Include support for the SoC bus on the ARM SMCCC firmware based
> >   	  platforms providing some sysfs information about the SoC variant.
> > +	  Note: Several vendor platforms provide their own SoC information
> > +	  drivers under drivers/soc/*. To avoid conflicting sysfs attribute
> > +	  formats in /sys/devices/socX/*, this driver defaults to disabled.
> > 
> > ---
> > base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
> > change-id: 20260112-disable_smccc_soc_id-ed09ef4d777f
> > 
> > Best regards,
> 
> Disabling it by default impacts other platforms, the arm64 kernel is designed
> to be generic and run on any platform with defconfig and from the same build,
> please don't forget that.
> 
> If you want to ship an arm64 kernel tailored for Qualcomm platforms, you're
> allowed, and you're also allowed to disable ARM_SMCCC_SOC_ID.
> 

Exactly!

> The soc sysfs interface is designed to support multiple source of information,
> from vendor (like qcom socinfo) and smccc ID. And this is well documented,
> and pretty obvious...
> 

Indeed, otherwise soc_device_register() would have failed for more than one
calls to it if that was the design/intention.

-- 
Regards,
Sudeep

