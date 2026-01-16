Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A89D47CD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnZ9m+nJXJvNQqVWt7GjJDTlHbY/LgTZZVWuF/PkIno=; b=yqcCQI5t9y0UwIbd/uCwsqpi6O
	bju6PeVJuI0agBHZWLwg5Oj0WbknPto93rZxHxku37ROUuaORL8p534uFboMU/0SlYwFB/CCEn1qk
	3VIBo9OtM7UL8cc6BeTkx+E3uYH1Yq2WFEuWaJltKG+r6bwamsAIxto15kGBtv7oOkEPN6+UDXhf3
	M1AUziywrfoc4ai2ui4v1kEGIa8E+KtctJ0lDra4i+JPV3DJTzQHdkzcHtXL4hkTnEZYOD6the/KZ
	sw3pfIBqJV929SW/onuKW3bZO90Te4yKa4hTH8WGRDadAuB8vMJvajLc1OX6Uus4qwsKGT5h1fcYi
	b1CKCQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghEV-0000000Dy5p-1Yco;
	Fri, 16 Jan 2026 10:39:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghES-0000000Dy5U-2YBF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:39:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBDFD1515;
	Fri, 16 Jan 2026 02:38:59 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 968FE3F694;
	Fri, 16 Jan 2026 02:39:05 -0800 (PST)
Date: Fri, 16 Jan 2026 10:39:03 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWoVR4oNdIHnksJQ@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_023908_735975_F05FB4FD 
X-CRM114-Status: GOOD (  54.91  )
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

On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
> Hello Sudeep,
> 
> Thanks for the feedback.
> 
> On 1/14/2026 1:01 PM, Sudeep Holla wrote:
> > On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > Hello Sudeep,
> > > 
> > > On 1/13/2026 4:29 AM, Sudeep Holla wrote:
> > > > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > > > 
> > > > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > > > > 
> > > > Instead of relying on a vendor-specific SoC driver, we should consider
> > > > disabling it and using the OS-agnostic SoC information interface provided by
> > > > the firmware.
> > > Would like to add some history here. Vendor interface existed [1] even
> > > before
> > > SMCCC SMC ID was introduced [2]. And there are several user space entities
> > > which
> > > uses the soc0 interface already.
> > True, but that's not the main point.
> 
> That is one of the point which needs to be considered in my honest opinion.
> Vendor driver existed from long time (v3.10 Kernels) in Android
> https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-dr/drivers/soc/qcom/socinfo.c
> and lot of user space entities in Android depends on soc0 which is not just
> limited
> Qualcomm user space, but also, 3rd party ones.
> 
> > > > The presence of this interface strongly suggests that the
> > > > firmware is designed to support multiple operating systems or software stacks
> > > > that already depend on it.
> > > That is correct. We started seeing the issue with user space when our
> > > firmware
> > > started implementing support for SMCCC SOC ID recently for non-Linux based
> > > product.
> > > As the firmware remain same across OSes, user space is broken on Linux.
> > What exactly do you mean by "firmware started implementing support for SMCCC
> > SOC ID recently for non-Linux based product" ? Does that really mean that
> > you can change the firmware for Linux based products ? I don't think so and
> > hence we are in this discussion.
> > 
> > 1. Either it exists in which case deal with it by disabling vendor driver
> >     and/or fixing the userspace.
> > 
> > or
> > 
> > 2. It doesn't exist which is not a problem.
> 
> Allow me to add some more details, so far, our firmware hasn't been
> supporting
> SMCCC SMC ID.  Due a requirement on non-Linux based product, firmware
> started
> to support the feature and same firmware is used even on Linux Android
> (android16-6.12)
> based product.
> 
> I would say, firmware started supporting the feature on our newer product
> instead
> of firmware being updated on any older products.
> 
> Now, as the user space remain same and is relying on soc0 interface already,
> user space is broken as SMCCC SOC ID enabled by default which gets compiled
> into Kernel and takes precedence over vendor driver which is a vendor module
> in case of Android.
> 

See below example of lscpu and HMP.

> > > > Aligning the Linux kernel with this
> > > > firmware-defined, OS-agnostic mechanism would reduce vendor-specific
> > > > dependencies and improve portability. Any gaps can be addressed by enhancing
> > > > userspace to correctly parse and consume this information.
> > > Agree. Updating entire use space would need time and we are looking to see
> > > if vendor specific interface can be given priority over the standard
> > > interface.
> > That statement simply doesn't make sense at all. Your product took all the
> > effort to implement standards and then you don't want to use it at all.
> > As per your claims it is not even broken(in terms of data from the sysfs
> > files), so I don't know what to say here, sorry ?
> 
> As mentioned above, the requirement was for a non-Linux based OS which
> impacted Linux Android baseline.

Read that again and think. If other products can cope and are made to cope
up with the new SOC_ID interface, why is Linux so special not to follow that
and fix the userspace to start using new interface. If just getting ID and not
name is the main issue here, consider moving to the updated spec or patch up
in the userspace.

> > > >    Given these
> > > > advantages, why would this approach not be the better long-term solution?
> > > As mentioned above, existing user space will be broken and fixing existing
> > > user space is going to take time. As the feature itself is "optional" from SMCCC
> > > specification, if we can't disable by default, we should at-least have a way
> > > to disable the feature by other means.
> > > 
> > The data given to the userspace from the kernel is not broken.
> 
> Yes, that's well understood.

Thanks and that dictates the direction of these discussions.

> > The userspace
> > tool seem to have made a wrong assumption and can't expect the kernel to
> > magically fix the issue here.
> > 
> > E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
> > made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.
> 
> Sorry, at risk of repeating the same thing again, the user space was using
> soc0 interface on Linux Android products for a long time base on vendor
> implementation. While I agree that, user space had some assumptions based
> on vendor implementation, if not disabling the SMCCC SOC ID by default, we
> should at-least have a way to disable it (via cmdline) based on vendor
> requirements.
> 

It was the case with lscpu too. We didn't disable HMP just because lscpu 
didn't understand or just read cpu0 data. It is exactly the case with
the userspace tool you are mentioning here. Kernel is not providing wrong
data.

From the ABI document in the kernel, it has been marked as socX since its
initial addition in 2012. So clearly userspace got it wrong and no one
realised it until now. There is no argument that data provided from the kernel
is wrong in these discussions. So I have nothing else to add unfortunately.

-- 
Regards,
Sudeep

