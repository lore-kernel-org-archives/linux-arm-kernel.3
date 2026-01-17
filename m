Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2AFCA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 21:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGEJhKginblSMaW61f7OSpBQosjDU3CD82tcxRKcUac=; b=vMiDi8RS6A7NN+dSw23/fdVJsl
	nzLsniYma57Tav8bPiE8uxOjlruRaDhUZCyhXubWyoU/UOD3WBVDeyXriglaOy0g2bU+pPfPVyVcb
	BsS/RkCxmS4/kuMGFrxQ3IR/Bpy4fBdgzTIW0H+X9sotGhuSvfnmRTd5BUMDckkrH0QIuw3T7aszK
	5qS7ID+LNw0HJSXNBdFqJjROkFqfn0Y8m7Rk51BN8+AY0D23gpV8RCWpS32hqjTa/7Ww6J9nKaRLa
	LQ97xT8h7NIyGMDJw0sPe/IAJ/tSWpOo/4TZJizScmWAkha0cLujWXQJcQs46MzCshsrdosacF/QD
	Cj+1o6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhE4z-0000000G1ZB-0Mzw;
	Sat, 17 Jan 2026 21:43:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhE4x-0000000G1YU-0lvq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 21:43:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C9B9419AE;
	Sat, 17 Jan 2026 21:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA2FC4CEF7;
	Sat, 17 Jan 2026 21:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768686209;
	bh=Yh7FjF2iO+Wbm4/uEu8pLMiCOy4rGG8q2nrbqLPs4NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=camHaPpe6TT3J5Iv9l1S2dRa+9X6A9nJAnFBzP98VlqBpDPqhSLermdyQcwgH4odx
	 J3yw16Cpc5LHMjhl1x3eAtsVCnxguhtroR9I1iZt09g2Kxl5WCKch/Snl8pOAC9sMF
	 3mhu1PM9LMlnktiKPQanyTkuZDrTlmIgVebneKcdZW02PmyqCZpNvgizBxJzf+WYJP
	 zaSneizfY0V9YbBfhljykAUX0XSWOYmjtcgAO6tGw0Rztbz7MDsRaP/ZbS3WZrCidr
	 RBbdVwyxQp+2ECyREVrqo19W1ckOZM1L6GvjxY8QnVr5yEqoQTVjwahV/TKTl18zjl
	 CxggS1MTE5OxQ==
Date: Sat, 17 Jan 2026 15:43:27 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <thal4kzpicjancpoop6ct4gjn67k7ypgfi33tzmfstuuj4dzch@smxhbkpqnocg>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_134331_272639_4FE8F3C3 
X-CRM114-Status: GOOD (  33.93  )
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

On Fri, Jan 16, 2026 at 03:53:57PM -0800, Trilok Soni wrote:
> On 1/16/2026 12:53 PM, Satya Durga Srinivasu Prabhala wrote:
> > Hello Sudeep,
> > 
> > Thanks for the discussion & feedback.
> > 
> > Wanted to check on below possibilities to disable the SMCCC SOC ID at the vendor end, can you help comment?
> > 1. Introduce cmdline option
> >    We are trying to pursue that in Android Kernel - https://android-review.googlesource.com/c/kernel/common/+/3912874
> > 2. Mark SMCCC SMC ID driver as tristate & module as suggested by Dmitry
> > 
> > If any of these other options are agreeable, will send separate patch.
> 
> You broke the replies by top-posting here. 
> 
> > 
> > On 1/16/2026 2:39 AM, Sudeep Holla wrote:
> >> On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
[..]
> >>>> The userspace
> >>>> tool seem to have made a wrong assumption and can't expect the kernel to
> >>>> magically fix the issue here.
> >>>>
> >>>> E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
> >>>> made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.
> >>> Sorry, at risk of repeating the same thing again, the user space was using
> >>> soc0 interface on Linux Android products for a long time base on vendor
> >>> implementation. While I agree that, user space had some assumptions based
> >>> on vendor implementation, if not disabling the SMCCC SOC ID by default, we
> >>> should at-least have a way to disable it (via cmdline) based on vendor
> >>> requirements.
> >>>
> >> It was the case with lscpu too. We didn't disable HMP just because lscpu
> >> didn't understand or just read cpu0 data. It is exactly the case with
> >> the userspace tool you are mentioning here. Kernel is not providing wrong
> >> data.
> >>
> >>  From the ABI document in the kernel, it has been marked as socX since its
> >> initial addition in 2012. So clearly userspace got it wrong and no one
> >> realised it until now. There is no argument that data provided from the kernel
> >> is wrong in these discussions. So I have nothing else to add unfortunately.
> >>
> 
> I believe that point(s) we have not touched upon are following:
> 
> There will be thousands of Android applications using the native interfaces
> in the playstore in various regions like US and China and so on, which relies
> on getting the SOC_ID to understand the product and enable / disable some features.
> 
> For example, benchmarks like GeekBench or Antutu may also be reading these
> interfaces.
> 
> There are apps. in certain regions which are still not updated from "32-bit"
> to 64-bit on Android yet as an example and there may be no way to reach out
> to those developers to fix but apps. are still used by many users.  
> 
> If we need to move all of these third-party applications to this new interface
> then we have to "break them" before we fix them. Do we want to have such approach?
> 
> We should not have enabled this feature as "default y" in the first place and should
> have kept it as "tristate" or kept it disabled in my opinion.
> 

Kconfig defaults are not a good way to solve such conflicts, there's
nothing saying that ACK wouldn't =y this in their config because it make
sense for a subset of devices.

I share your concerns about the impact to user space applications where
the authors interpreted the API in the same way as I did - there will be
1 soc instance per soc...

Regards,
Bjorn

> ---Trilok Soni
> 
> 

