Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884FDC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEoA4nKIHkYl8kyH/j7j2J8sVAbOsoUJbcanFZ4ww1g=; b=jEdm/s1FKExyLSlTuQx8xHD5CV
	1HhbuFzz6zcGEVu/nQ1Nkz8Z8Lhq1TpvFy9wjvEHfEXxSJ1dbNJLwe8vb4HXVurqHrW3ibVyrm++n
	5TGRFsKJPRl/WijC5pVJxZU3hl0P2bmC3vD9r5KFZTudMkAKSD2j8JWvQClcmOwGzuhg4DCuufnhW
	a0ssEhcwCPL6WC/fGFj87LfYuA1lKQDWtgG3v/nr3bSvWKd82tFsLRvss3BSNJiPUkJx2s1u7YHbP
	5k4PldxcMpcZmsqdvIJEYNrjaf4cc1YNybBgzcPHSQ+JwACZVmi3fACVwndWXUxSUNwsg5TSrlMYI
	NhYeVyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLXc-00000008GlY-1Kbu;
	Fri, 07 Aug 2026 14:27:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLXb-00000008GlG-1607
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 14:27:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BFB404324E;
	Fri,  7 Aug 2026 14:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76D61F000E9;
	Fri,  7 Aug 2026 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786112838;
	bh=OEoA4nKIHkYl8kyH/j7j2J8sVAbOsoUJbcanFZ4ww1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e3We5B66gvdRLITPpjuxhjSm+DQl43QZ8+Y9B+mul5KiZEVoIpz/WQrZSx8q7hOtG
	 NpmGywzWnlhynkdPWxX9p6gG4/2FX20WypFZ81seu28mECeNh95orMHJbCuR4BFUz3
	 gpnWkC+HjgSkXIsWTe8KEs+z8SzuWUvZu7pOix6NLx+8I6lzmQ4qKuSice1GlO8e30
	 o75XGMY27nDCXLo0ZIgJgB9kvO/m8X+8mK2UUqvsaxHSvLkrx71ZV+8YGqP46bHCPx
	 wEIEqSLslCq8YLqhuDSnk6A8K3G7KULsClOLnk0lxfob4lJQ0SgzMSgDhr29PZitM1
	 2b9xcGKHGVJ3A==
Date: Fri, 7 Aug 2026 15:27:14 +0100
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH] perf: arm_pmuv3: Zero initialize hw_id branch stack field
Message-ID: <anXrQkKl7DXteMXp@willie-the-truck>
References: <20260807-james-brbe-init-hw-idx-v1-1-009d1843960a@linaro.org>
 <a985a304-b399-4e84-99e3-0c6200ae518a@arm.com>
 <66590828-a571-45eb-8e67-a55bebea1b97@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66590828-a571-45eb-8e67-a55bebea1b97@linaro.org>
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

On Fri, Aug 07, 2026 at 01:18:59PM +0100, James Clark wrote:
> 
> 
> On 07/08/2026 11:44, Anshuman Khandual wrote:
> > On 07/08/26 2:44 PM, James Clark wrote:
> > > PERF_SAMPLE_BRANCH_HW_INDEX is supported by BRBE so hw_id is passed to
> > > userspace, but it's never set by the BRBE driver. Zero initialize it as
> > > it should be according to the docs:
> > > 
> > >     * For the architectures whose raw branch records are
> > >     * already stored in age order, the hw_idx should be 0.
> > 
> > The in code documentation while defining perf_branch_stack.
> > Probably a good idea to specify the same above.
> > 
> >   * For the architectures whose raw branch records are
> >   * already stored in age order, the hw_idx should be 0.
> >   */
> > struct perf_branch_stack {
> > 	u64				nr;
> > 	u64				hw_idx;
> > 	struct perf_branch_entry	entries[];
> > };
> > 
> 
> I found it easily enough. I wouldn't want to put the same comment in two
> places and risk one of them going stale. And if I take it away from one
> place and move it to the struct then it's just missing from somewhere else
> instead. So I think I'd rather leave this one.

Yup, I've queued it as-is.

Cheers,

Will

