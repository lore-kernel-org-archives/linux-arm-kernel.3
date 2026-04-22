Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B23F9B5F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvDzVjyERqO/2mnoaNmE3DhHkGdFG83VRowcx91DmpE=; b=2zYfrRHxWI6pDqv/n1ejAwdFLa
	zAFH7GyZGcuqaOEJP3KwMs4l53zKO7fR/4BIdojE1NBSeYFwTHTi+3017nPthM3zSZ5+BEUk5MfKE
	q+oyop8P60irx3zdCXcpYKsSEhStwEUZp2wxcL1ZexegzJoqAEoxKXai06wOtMoUY5PzIdz+tIhLO
	tK04Dyfgy+Fl/Z4sgBl7+xOpZ/i9pYPmcgbTEGPc2Zd/cN0x4rXkPs7X5vLjyEZk+yzdJXqWB/u9H
	pOFznv2aoEhdYR7W/OUV4+lYZz2zmiaY6p3RDPGjmP9ajmnxBl6XqLvx2yy2So5Rt8Rm/E/t9JA7B
	bW80h1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTe6-00000009p43-2nB9;
	Wed, 22 Apr 2026 09:13:22 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTe3-00000009p3e-45GV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 09:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1776849189;
	bh=NvDzVjyERqO/2mnoaNmE3DhHkGdFG83VRowcx91DmpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rG3naTaiNCqJwzxaN3ZazwsiosJPHU+8tq29ksM9VyghzIkErXgYLNvh9NGW553tS
	 rNfib7LgzKL4eJ1lc+rPdl0UVW/WIfis+UN24GLnrIUtaV8ovWLrMPHVnbp86qABCE
	 80gPqXm6w6gcnse1h2PZDOYb+8i7GT8vxI+llCVA=
Received: from localhost ([61.169.175.90])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 3478C04D; Wed, 22 Apr 2026 17:13:07 +0800
X-QQ-mid: xmsmtpt1776849187tfue4b4ka
Message-ID: <tencent_DA99B62735469A0CD219E9FC73E234A47309@qq.com>
X-QQ-XMAILINFO: NT2OMgh8In2+nYCaIOTawZv6IJQwWeGK62m+35J0rj/sa1nkowXbkgMqZsr0d8
	 /BjdMHQZOXQMlngH7fH7mx04zyols9XTvb3hxAKf1muunKmZwK5C18bXvj5fCHydT2RaCnuVpSU8
	 CEoPev0BZphm2rl3TNNQ4MDEN94kZwjq4PcLilxzRTNg1E2yj8OUxqebLbaYneE08KftnWnjaLjM
	 R3yC13IHEDshCuowhgonkvcr5eW8xc3QYRB8+z71Ypd7Tt/i7YZkdKjfHFahwomLVwtobGBugDUZ
	 295sd5ARD5nhyYOHtV2xOuchiQElJYzWEt1mFAaseuB608sLX+L/+tx6ByyxA/RMX0DM2BjWdhHS
	 bsb1zNOpSzD37NpmaAvKvCkMti0UnGGn8NK3Evb64SaSoY66vCi+4+fu8S7BHBFS2hq2z23TfhEw
	 A3izZHSCkCs2g5WFju8HCUcxIMa6bKxonwbryiIuw9hITl8qE00Dwid5mOun4NCMn6L5P1xyquwq
	 XejrZwcN17l+zaiZ94WoGv1DOcwMx6SVR1EjCxwmxtN/7b1JDHqzhlpNJ6DyA0rYXYw5QxiY3noA
	 ocY8F8P7o1TPObVmqGPLN61bkGNpNJtcsICweFk8oo9QfYU9DIAbkQQTAJSRAL9h3cr832YX1zeE
	 OT1oSF5Gu2XhvZ76JgqtGBSD5xI8XQQREk5s0ol7rSf62EXYGzVlNHQ8gWjoM9QZmiVWhmlfIrHj
	 Z8Eip8gmzRBUjnZ80RRSr41YHe7mdysbMOTiliypFCzGXFtIAjA5C3B0o3y6qeSgD0IWkYlNndTb
	 Cabya2wVon/rNaeTPVkCsiElBcA9zEs+G1RFkFE+n+3WOJe9TEqZhYYcy8Pyuv4862QCYh6qrC1v
	 YC6gAM0DGf9nXJS9kMJ3ec8qgOQWhHfgyan7d+hkbKbh0LXDBsNuWC7I2rl36rk5yDAE/Ikwo1uy
	 vToRpjRHKfhorzHjE89dKPjcHRmvRT2sA8aBuMWId7UQQopC1yiRcvtPE3EiTRESzsC8HY4EQUIc
	 ksXlIevCBO4J17ZJNHm5T4dAGvGsAMx+MCsWSJf89XkhMKTwbYwOb0EmA8f/xa4sVLKj0aOaLNxF
	 8F9oYL37Rq4wI7K+mJtOh1lCFjrT2lM5Y1k2AnkoJiN2jbFOk=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
Date: Wed, 22 Apr 2026 17:13:08 +0800
From: Leo Jiang <leo.jiang1224@foxmail.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Stop queue allocation retry at
 PAGE_SIZE
X-OQ-MSGID: <20260422091308.2j4cp7xwj5rlc67i@LAPTOP-LEO.localdomain>
References: <tencent_F6E384A40D990A279B460A0CDE1927FDF509@qq.com>
 <0fdf4b1f-90f2-4f69-9d2b-dc5f608e9c1c@arm.com>
 <aeeoEHHNKPo32H9R@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeeoEHHNKPo32H9R@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_021320_327015_2443EBB4 
X-CRM114-Status: GOOD (  25.12  )
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

On Tue, Apr 21, 2026 at 05:38:40PM +0100, Will Deacon wrote:

> On Tue, Apr 21, 2026 at 04:56:47PM +0100, Robin Murphy wrote:
> > On 18/04/2026 6:31 am, leo.jiang1224@foxmail.com wrote:
> > > From: LoserJL <leo.jiang1224@foxmail.com>
> > > 
> > > In arm_smmu_init_one_queue(), the loop reduces max_n_shift if
> > > dmam_alloc_coherent() fails. However, since dmam_alloc_coherent()
> > > allocates at least PAGE_SIZE, retrying with a smaller size after
> > > a PAGE_SIZE failure is logically redundant.
> > 
> > Says who? It's certainly not a guarantee offered by the DMA API itself, and
> > indeed some allocation paths can definitely still allocate less than a page
> > - e.g. anything which hits a per-device or global coherent pool.
> > 
> > > Moreover, if a sub-page retry were to succeed due to concurrent memory
> > > release, the hardware would be configured with a smaller queue depth
> > > despite a full page being allocated. This leads to inefficient memory
> > > usage and unnecessary hardware performance limitation.
> > > 
> > > Terminate the loop once qsz reaches PAGE_SIZE to ensure logical
> > > consistency and optimal hardware configuration.
> > 
> > That's really not an argument - even if an allocator does happen to
> > over-allocate for the requested size, that is hardly the caller's concern;
> > and as far as "optimal" queue sizes go in this case, those very much depend
> > on the number of CPUs issuing commands and volume of expected stall/PRI
> > events - in many cases PAGE_SIZE would already be far too small to really
> > work well.
> > 
> > Also note that if we _were_ to fail to allocate a PAGE_SIZE or smaller
> > queue, there would be very little chance of the subsequent allocation(s) for
> > the stream table succeeding, so realistically the driver is probably going
> > to end up failing to probe in such circumstances anyway.
> 
> That's all true, but tbf I think I just fscked up the comparison in
> d25f6ead162e ("iommu/arm-smmu-v3: Increase maximum size of queues") so
> I'm not against fixing that up even though the "rationale" given by
> Loser doesn't make a whole lot of sense.

Hi Will, Robin,

Thank you both for the detailed feedback.

Robin, you are absolutely correct. After a deeper look into the source code,
I see that allocations smaller than a page are indeed possible in certain
cases. My previous assumption about the DMA API's granularity was wrong,
and I appreciate the correction.

However, as Will noted that the current logic deviates from the original
intent, I have prepared a v2 to limit the queue allocation retry boundary
to PAGE_SIZE.

In v2, I have:
 - Updated my identity to Leo Jiang.
 - Removed the code comments as suggested.

I will send the v2 as a follow-up shortly.

Best regards,
Leo Jiang


