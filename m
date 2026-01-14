Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7E1D3901B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 21:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUJqo+D52JTYmks1EMJPfQ8EoKyxRPkjasKP4dzKzCk=; b=gWgHDpI0slpY6V9e0By5/sJL1d
	3uHMVzgCTAkQEFfGjauZ9mO+dvgiRwV8eX+neb3itz+T78pbPWP3JDIlho+erV5byyzxQ3LGhh52s
	GyVrslNcyk7KA7rm+EMbYnAOs7+4HLlddZRqDIwztLafqSIfU3nuwFnlopRsoL2zx1Euc42PrIV/z
	46krCF47adSRQYacUsiHX81zk7lu2Kwhxqet6J11zHZC2tm6YakKl5PwvEfR28iNyBGJ2l9VtRw9A
	ExfXLawThYb3vwSppoqBuxZEavMWpAvicfelzbAOCOMYI73ockhxPhraUKKLb8MerLmpEw747Z2+k
	l75kwyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7zK-0000000AiDq-16Lr;
	Wed, 14 Jan 2026 21:01:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7zH-0000000AiCx-3RQV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 21:01:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08F741515;
	Wed, 14 Jan 2026 13:00:59 -0800 (PST)
Received: from bogus (unknown [10.57.49.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE4E53F59E;
	Wed, 14 Jan 2026 13:01:03 -0800 (PST)
Date: Wed, 14 Jan 2026 21:01:00 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWgEDAlglnGrzdR4@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_130107_974699_84402111 
X-CRM114-Status: GOOD (  30.41  )
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

On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
> Hello Sudeep,
> 
> On 1/13/2026 4:29 AM, Sudeep Holla wrote:
> > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > 
> > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > > 
> > Instead of relying on a vendor-specific SoC driver, we should consider
> > disabling it and using the OS-agnostic SoC information interface provided by
> > the firmware.
> Would like to add some history here. Vendor interface existed [1] even
> before
> SMCCC SMC ID was introduced [2]. And there are several user space entities
> which
> uses the soc0 interface already.

True, but that's not the main point.

> > The presence of this interface strongly suggests that the
> > firmware is designed to support multiple operating systems or software stacks
> > that already depend on it.
> That is correct. We started seeing the issue with user space when our
> firmware
> started implementing support for SMCCC SOC ID recently for non-Linux based
> product.
> As the firmware remain same across OSes, user space is broken on Linux.

What exactly do you mean by "firmware started implementing support for SMCCC
SOC ID recently for non-Linux based product" ? Does that really mean that
you can change the firmware for Linux based products ? I don't think so and
hence we are in this discussion.

1. Either it exists in which case deal with it by disabling vendor driver
   and/or fixing the userspace.

or

2. It doesn't exist which is not a problem.


> > Aligning the Linux kernel with this
> > firmware-defined, OS-agnostic mechanism would reduce vendor-specific
> > dependencies and improve portability. Any gaps can be addressed by enhancing
> > userspace to correctly parse and consume this information.
> Agree. Updating entire use space would need time and we are looking to see
> if vendor specific interface can be given priority over the standard
> interface.

That statement simply doesn't make sense at all. Your product took all the
effort to implement standards and then you don't want to use it at all.
As per your claims it is not even broken(in terms of data from the sysfs
files), so I don't know what to say here, sorry ?

> >   Given these
> > advantages, why would this approach not be the better long-term solution?
> As mentioned above, existing user space will be broken and fixing existing
> user space is going to take time. As the feature itself is "optional" from SMCCC
> specification, if we can't disable by default, we should at-least have a way
> to disable the feature by other means.
>

The data given to the userspace from the kernel is not broken. The userspace
tool seem to have made a wrong assumption and can't expect the kernel to
magically fix the issue here.

E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.

-- 
Regards,
Sudeep

