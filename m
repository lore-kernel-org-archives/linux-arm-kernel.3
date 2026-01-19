Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F57D29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZl/3LBRGuygrsMUesz1uv7oRbCzQ9IRvv+zt7DRgeU=; b=H4nS6ldiZrvAYq8iutvNRt7yvn
	rFJHHSLyqIHomSnCZNIN97CcsdCjG+yOXsB+Yqtj2HsBufvX7bpVlRECir2DK//ObXyKLPoJc4a6w
	VPNcy480h297H8PYdvj4grj+LzH0jl0ZWvyDi3Z38D+90snasKQNfRBSlFDv60RzGTAQUKyuXAc5n
	IfHRDiYRWVgfhK1hsDSmMKMiGNsNVJ4s4nsX4mAbpRxeSs1vRo9qrfMyrbq9va55QJVqlIZ0dgIgR
	cScNGXNHb9+U4H3KRflWw8DBRTd8ojnyJZfP8ttzXv1UEyvza69nCpocqS+cFZMrPrMjxQafOdHHy
	9jNKyXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqda-00000002IZ1-2uKy;
	Mon, 19 Jan 2026 14:53:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqdY-00000002IYS-1qbR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:53:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C89AFFEC;
	Mon, 19 Jan 2026 06:53:40 -0800 (PST)
Received: from bogus (e124108.arm.com [10.1.32.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68D453F694;
	Mon, 19 Jan 2026 06:53:45 -0800 (PST)
Date: Mon, 19 Jan 2026 14:53:42 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aW5Fdjag_w7i0zWN@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_065348_572535_6B5E8E27 
X-CRM114-Status: GOOD (  44.41  )
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

On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > On Fri, Jan 16, 2026 at 03:53:57PM -0800, Trilok Soni wrote:
> > > 
> > > I believe that point(s) we have not touched upon are following:
> > > 
> > > There will be thousands of Android applications using the native interfaces
> > > in the playstore in various regions like US and China and so on, which relies
> > > on getting the SOC_ID to understand the product and enable / disable some features.
> > > 
> > > For example, benchmarks like GeekBench or Antutu may also be reading these
> > > interfaces.
> > > 
> > > There are apps. in certain regions which are still not updated from "32-bit"
> > > to 64-bit on Android yet as an example and there may be no way to reach out
> > > to those developers to fix but apps. are still used by many users.  
> > > 
> > 
> > Fair enough, but apps get updated on Android phones every day. So sorry if I
> > don’t consider this as something impossible. I do understand many apps are not
> > actively developed, yet that is no reason to say the wrong assumptions made by
> > these apps are correct.
> > 
> 
> It might be what you're saying is true, at least for the top-10
> applications in the app store. But that is not how we manage or maintain
> the userspace interface in the Linux kernel - we don't break userspace.
> 

Agreed, but I still think socX != soc0 and that is wrong assumption by the
application. Anyways, if more people think it is user-space break, I accept
it.

> > > If we need to move all of these third-party applications to this new interface
> > > then we have to "break them" before we fix them. Do we want to have such approach?
> > > 
> > 
> > Sorry, which new interface are you referring to?
> > Are we still talking about /sys/devices/socX/?
> > If so, are you suggesting that X=0 and X=1 represent two different interfaces?
> > If that’s the case, I honestly have no words.
> > 
> 
> Please do have words, because I really would like to understand what the
> expectation of userspace is in the even that there's both soc0 and soc1,
> regardless of which is which.
> 

OK if we are going there, can we blame the firmware for exposing this
information which is standard ? Sorry to repeat by firmware is exporting
that info in OS agnostic way and other OSes use that as the information as
it is standard way. Why can't we make Linux use or work with that information
as that removes all these vendor specific fragmentation created over years.
This point is orthogonal to user-space break.

> What does it even mean to have two different socs presented here? How
> would userspace know which one to refer to? Should it refer to both and
> guess which one makes more sense to it?
> 

Yes, the standard interface doesn't have much info though, so it could be
union of it if the applications prefer that way.

> 
> To me, when you decided to add a second caller to soc_device_register()
> you created a regression in the userspace interface. If nothing else
> it's a leaky abstraction.
> 

In that case, shouldn't soc_device_register() made to give error when an
attempt to call it more that one time then ? Also should be change the
ABI documents to refer it as soc0 and not socX ?

> > > We should not have enabled this feature as "default y" in the first place and should
> > > have kept it as "tristate" or kept it disabled in my opinion.
> > > 
> > 
> > Sorry, but how do you envision this working with a single defconfig? Please
> > consider the issues on platforms beyond the ones you’re focused on as well.
> > 
> 
> Glad that we're on the same page regarding both defconfig and
> our considerations.
> 

Thanks.

-- 
Regards,
Sudeep

