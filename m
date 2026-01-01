Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632F8EED626
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZl9q8IfVaYwhs6CEpxhPWbOQ0ky7JjTOczSqbzoLB0=; b=odbUQWsPGxPEFkSZTEQgZfBSex
	5B+ZxunOwVjeZftTAC0smGkCrh5UeehGnSdhCDrLz/ThpwPagm95IVBISu6A0Ybt4CVmQnyuAZpWF
	p3DcJhixQ+mE1/9t9QPHo7UlszuLVe2Cp0AiGhISRR+3cOOAVGGLYUidBKd/F7ri9zYi/6OUe8J/P
	hG/VJJ37yPxB0rCy/ByvWfmE+V2yr+ffyi60K2+zl1KEKD3qSd9EFVZj8lmFglwzDO+dvvI9ieNFb
	+80Is1dnJX8ehDlXqpSXQee/JaJ0GbbJpumqd0wxDbKb6DF99u4hvdEdzBVmRUh2aNA8ES/UALyqB
	okk7ZNJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMp7-00000007PQk-2IQn;
	Thu, 01 Jan 2026 17:50:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMp4-00000007PQP-1u6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:50:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E9FF497;
	Thu,  1 Jan 2026 09:50:44 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F06E3F694;
	Thu,  1 Jan 2026 09:50:50 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: vincenzo.frascino@arm.com,
	liviu.dudau@arm.com,
	lpieralisi@kernel.org,
	Robin Murphy <robin.murphy@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: morello: Add CMN PMU
Date: Thu,  1 Jan 2026 17:50:46 +0000
Message-ID: <176728980558.117035.4501513697420279730.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cbeb3832ded539c8c4616d49d3133078a34f88ad.1748350539.git.robin.murphy@arm.com>
References: <cbeb3832ded539c8c4616d49d3133078a34f88ad.1748350539.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_095054_538965_B609FE17 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

On Tue, 27 May 2025 13:55:39 +0100, Robin Murphy wrote:
> Although CMN-Skeena is mildly modified for the Morello hardware
> architecture, it still identifies itself as CMN-600 r3p1. Since
> there are also no documented changes to its PMU functionality,
> we can make the PMU accessible via the standard CMN-600 binding.
> In general, PMU registers are non-functional on CMN Fast Models,
> so this is only meaningful for the real SDP hardware.
> 
> [...]

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[1/1] arm64: dts: morello: Add CMN PMU
      https://git.kernel.org/sudeep.holla/c/01a23e376e2a
--
Regards,
Sudeep


