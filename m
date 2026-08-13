Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC750C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OPXs53O0k/9aDgHV+FEk26wxFCfAnqX1iyxncKf+Jo=; b=KnImzrFWAeRr2vE82lny+BqqsW
	RWNeTCblCIyaxBSBckK0MMmTm1Y6AUxH97NjdmHLZ8m+7h1QD0i7+ncIPQEJGVn4YEjBE9G9qOg1F
	teb9vSgVwmeMjgA7X37nwui+7xsZoH5dKSvZ6VEls8eiej996uyHuEecQTX5Q1QI2OwtjAqx2oc78
	wOPjf/kT6YWgZcNnpWYOCmFwMCgVK1DuUrZxuX0sfM0SO8imr0CCFDkSuY/X2gxwedx6MMsAaoCTy
	vQxFEdxKFpx5HosIBx4VOMf7i15uEv6ON7dMAxMKMLndyYf6VKC9EzsOwPgbW1b/iSHSBeHTusfR9
	axjq7wSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQzu-00000000BgB-3CSq;
	Thu, 13 Aug 2026 08:41:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQzt-00000000BfW-17yA;
	Thu, 13 Aug 2026 08:41:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F016600AF;
	Thu, 13 Aug 2026 08:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A9D1F000E9;
	Thu, 13 Aug 2026 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786610468;
	bh=/OPXs53O0k/9aDgHV+FEk26wxFCfAnqX1iyxncKf+Jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ccmUWQF+jvDc5hTzrD6MUln8C/4SyQR+2qveqCoZtuEV3nmwKUva8wsrVS6dB6wBj
	 o0bu4LLzoV3jhvsANW/1bi9kRwW6Scd7Am8IDruuz5yBZqYu0CWQ0ONkDclNTh3b10
	 E52MYX3ej6VY4wzXM9GsRnW+15NkfFXfQbn2/RAddC/kiX8N4MraHUbtFZlGLkze7v
	 T7wIUNMXL14eA7x2nDEnSORhdmJkzEBcQTd3Yk++/gaVBmavBO+M0kWgnVhklgYVpc
	 iPP8201PWHTcXFw8z4DvPVoDSVUjtvy8Bt4MCZ8NqGg3BRZ+1XvWC4EHnh+KchHZUz
	 J18zNc0AFU8zw==
Date: Thu, 13 Aug 2026 09:41:02 +0100
From: Will Deacon <will@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
Message-ID: <an2DHgfQsQ6TOF44@willie-the-truck>
References: <20260812002728.2283079-1-irogers@google.com>
 <20260812052417.2361040-1-irogers@google.com>
 <anwuYYxLFbtDmmHx@willie-the-truck>
 <CAP-5=fW9bH_yd2VF+X1jnem91+dOHPjP53uNQ8x69xFmjLbt4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fW9bH_yd2VF+X1jnem91+dOHPjP53uNQ8x69xFmjLbt4g@mail.gmail.com>
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

On Wed, Aug 12, 2026 at 06:38:24AM -0700, Ian Rogers wrote:
> On Wed, Aug 12, 2026 at 1:27 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Aug 11, 2026 at 10:24:15PM -0700, Ian Rogers wrote:
> > > This patch series adds an uncore Performance Monitoring Unit (PMU) driver
> > > for Broadcom AXI system and VideoCore VPU performance monitors found on
> > > Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 through 5).
> >
> > Why are you sending four versions of this patch series, at -rc7, each in
> > reply to the previous one? Nobody is going to review that.
> 
> See the cover letter for changes. They address the sashiko reviews,
> you may not see these reviews as they are only sent to me and
> linux-perf-users, which is somewhat customary in the sashiko setup.

Have you considered running Sashiko locally given that you work at Google?

> I don't see any relevance in rc7, I'm just mailing out a new driver
> now that I have the opportunity to look at it. Whether and when it
> gets pulled upstream is up to a maintainer.

Right, as the maintainer for drivers/perf/ and I'm just asking you to
slow down a bit. I don't need 10 versions of a patch series in two days
when I'm focussed almost entirely on the upcoming merge window, which
this is too late for. You should read
Documentation/process/submitting-patches.rst which states:

  | Wait for a minimum of one week before resubmitting

> The changes are sent in reply to each other because the entire series
> is visible in one mailbox (b4 mbox), which I find easier to work with
> and provides me better context. Others use semcode to do something
> similar, but I've not explored that.

Unfortunately, this tends to confuse b4 when applying the patches and
makes it really hard to manage on the maintainers' side. I think this
is also documented in Documentation/process/submitting-patches.rst so
please do what everybody else does.

> Let me know if I should drop you from the cc, I placed you there as
> Mark and you were the only suggested reviewers from
> scripts/get_maintainer.pl but I don't want to spam uninterested
> people.

It depends if you want the patches merged...

For now, I'm ctrl+d'ing the thread.

Will

