Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B98DC9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 21:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vky6rd+xiEBZG6QPNLts4TIZBHJroyroImzu62FAg3g=; b=TzRptPCbilDaSmuXuUXIz3oR5E
	ZGJWd/3cWaZ1XuaayzJMgg4utFWbVZ6T65+k7beuXZT+yxe/gjR5ttPmOcmwXx7MEIKAtMo/NN5cv
	tyDlGI7Yl/uBg6nrOMff64NhOqxLV7XmEAXIQJ3KDLvpUIOBTj2nb6WLCJW93soV0+ZyESV/3FGeL
	3j/VSPqGFafLw7TVvAMQuEpWzVfzw1QoaCOWs8yeodXnNK9KxkjzaHkJ+AcCuMF18bo6VAd7APncD
	iEuE42UmH6dIDw7L6Wv9M21beSg6v0w2iGE0dBMa5CRZLwmAwajDHAFtNGa7pGDf5XbTBMmL3RTC5
	lS3h1VZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vha8m-000000010Kq-29f3;
	Sun, 18 Jan 2026 21:16:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vha8j-000000010KC-34xh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 21:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3AD143C31;
	Sun, 18 Jan 2026 21:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307A6C116D0;
	Sun, 18 Jan 2026 21:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768771012;
	bh=EtU+kqexD/KStxyNPxQa9UqtQF8DZTaoiII4pPCCBEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaohNuLM4zm1yDpQACKj8DLMv8bI9cRAkZKQPFp3MS3DHuRMORhutqAdvFKh4z0qy
	 a8ENExmWluK1ny/TxKVItRSD22nFESu1CYkDGIah7hLJzhQeYyvx0AxUI8ItG6fGY+
	 jwmHy3oufyM9ndiwuP5kpKZQbSB+hbo/HnRWyjDEecLKCexLylKEfA5paDpkRCbrrd
	 B+tg8imXaxnsdx9L4oFR2Tj3tYevHuqfSTYPNWyoNNZ8M239zYt67TpzbhDQHsWJxb
	 1miMHAQCMZJDwARPpCsjZ+nU6e1XlC0l3m7t/tsbARJkr8tfTW3dTUyvxmui8o7WUC
	 5NF0dI4J74P2g==
Date: Sun, 18 Jan 2026 15:16:50 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, 
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWzuuwQi_nsHoj_5@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_131653_820014_E7755934 
X-CRM114-Status: GOOD (  32.30  )
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

On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> On Fri, Jan 16, 2026 at 03:53:57PM -0800, Trilok Soni wrote:
> > 
> > I believe that point(s) we have not touched upon are following:
> > 
> > There will be thousands of Android applications using the native interfaces
> > in the playstore in various regions like US and China and so on, which relies
> > on getting the SOC_ID to understand the product and enable / disable some features.
> > 
> > For example, benchmarks like GeekBench or Antutu may also be reading these
> > interfaces.
> > 
> > There are apps. in certain regions which are still not updated from "32-bit"
> > to 64-bit on Android yet as an example and there may be no way to reach out
> > to those developers to fix but apps. are still used by many users.  
> > 
> 
> Fair enough, but apps get updated on Android phones every day. So sorry if I
> don’t consider this as something impossible. I do understand many apps are not
> actively developed, yet that is no reason to say the wrong assumptions made by
> these apps are correct.
> 

It might be what you're saying is true, at least for the top-10
applications in the app store. But that is not how we manage or maintain
the userspace interface in the Linux kernel - we don't break userspace.

> > If we need to move all of these third-party applications to this new interface
> > then we have to "break them" before we fix them. Do we want to have such approach?
> > 
> 
> Sorry, which new interface are you referring to?
> Are we still talking about /sys/devices/socX/?
> If so, are you suggesting that X=0 and X=1 represent two different interfaces?
> If that’s the case, I honestly have no words.
> 

Please do have words, because I really would like to understand what the
expectation of userspace is in the even that there's both soc0 and soc1,
regardless of which is which.

What does it even mean to have two different socs presented here? How
would userspace know which one to refer to? Should it refer to both and
guess which one makes more sense to it?


To me, when you decided to add a second caller to soc_device_register()
you created a regression in the userspace interface. If nothing else
it's a leaky abstraction.

> > We should not have enabled this feature as "default y" in the first place and should
> > have kept it as "tristate" or kept it disabled in my opinion.
> > 
> 
> Sorry, but how do you envision this working with a single defconfig? Please
> consider the issues on platforms beyond the ones you’re focused on as well.
> 

Glad that we're on the same page regarding both defconfig and
our considerations.

Regards,
Bjorn

> -- 
> Regards,
> Sudeep
> 

