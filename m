Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175D0C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMPd85NM5ohC/rt2jUe9J5vKrWwRxNIinpxfU3FnZeI=; b=1VcZBJbV8h3pO3dHdPgdHVagzU
	exGW8nvy40xyn8znaDIbv7pxvk+QKK/Zm3AojSDhZUsU1U1Wv0JaXjLvrkdbeBmBWVY+BnJKj2nwU
	4irlU17Jp+7GQD4LiQVwkIhku6eDnLE6fFVkRUn5jQsxdx/WBIxtfAiJleFaVsEYcCH41svHsoH+v
	1WjDUBkArl+MT070g5kJbAfbrwma/cl2qDxCeesFOnoYdQpS4gceFsHEqCqTZAqzWGZJwuDLCfwpO
	OEf3mnFd6VbwngR25H73tDpGAW3rJg9zj9xALS5MgID+jCFOTEQ6AYAbUjNgr1apwRCCr/XBqxStv
	jxcCnnng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhToW-00000000FqN-26fD;
	Sun, 18 Jan 2026 14:31:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhToS-00000000FpU-3QGP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 14:31:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A8E41517;
	Sun, 18 Jan 2026 06:31:21 -0800 (PST)
Received: from bogus (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A37B3F59E;
	Sun, 18 Jan 2026 06:31:25 -0800 (PST)
Date: Sun, 18 Jan 2026 14:31:23 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
Cc: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aWzuuwQi_nsHoj_5@bogus>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_063132_953575_0634DC25 
X-CRM114-Status: GOOD (  19.21  )
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

Fair enough, but apps get updated on Android phones every day. So sorry if I
don’t consider this as something impossible. I do understand many apps are not
actively developed, yet that is no reason to say the wrong assumptions made by
these apps are correct.

> If we need to move all of these third-party applications to this new interface
> then we have to "break them" before we fix them. Do we want to have such approach?
> 

Sorry, which new interface are you referring to?
Are we still talking about /sys/devices/socX/?
If so, are you suggesting that X=0 and X=1 represent two different interfaces?
If that’s the case, I honestly have no words.

> We should not have enabled this feature as "default y" in the first place and should
> have kept it as "tristate" or kept it disabled in my opinion.
> 

Sorry, but how do you envision this working with a single defconfig? Please
consider the issues on platforms beyond the ones you’re focused on as well.

-- 
Regards,
Sudeep

