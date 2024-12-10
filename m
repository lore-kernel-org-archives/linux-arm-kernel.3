Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F081E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3f0beRdqXh0nXCuL/lGDwJuj3vZkwj3Vs0U/IcLyVM=; b=uk5Xsehu2dKdawBijVg8dd2uzE
	kXM2/Jf6YGaQ15sKdZqORIJvOrueLRBp8QMGpiPKlPtAvI4fYBGkb2dMrfiRC8Jl2hT7gvNF9rN+P
	iof41Mx/L7Kt8Bk435jNRlfBMqAuEMbLbWTGMjAFIKAnhrMS4NnYVgwlNaehWVR/c7N30NdqKdica
	tTTbMpRmVhpnOlD0+h8UnU75AolrliTdW2aq1N6Fk5CctXGsm0T8NxabGvgnIUHyOfem/Tk9i2dLj
	AZ45xrMMlLP22A+PqjKfzhEwLjDE5+VGWjsxR8+s4UYUUY44yT5D5tx32lPdP6Cp1q8G5owjIMjzn
	BbwgbigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2bt-0000000C0YP-0P0l;
	Tue, 10 Dec 2024 15:57:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2aq-0000000C0CX-1vO3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:56:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB32F5C0F91;
	Tue, 10 Dec 2024 15:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E08EC4CED6;
	Tue, 10 Dec 2024 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733846171;
	bh=HhaKkPOWT5t8vHReXiS0uw+iv66ryKvHxe3eQejeGhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYnf0lkmS2caHfW7c0KzqTuWpehCijP/2ZLpxOSHTHEYqm/JZhMCxKvROr3HrA9G1
	 O5AgjLUjvSm3P1Q9Wqu+jAgWKPbiGaZxOxdaHjAIB4vLgKnNRT/lWY59ZK8mKO4oke
	 TXZ9UIfD1wVCzuoVqcRwrz02qMsAtherzVCKZpsY9UHc0gk4/p80931LUCyxbTvxTB
	 AIMXvwSxi9Fi+BlEPzbg/CGjEatYT+Ev1Q7v+C107xo4YsthKH4Y+0l8DArI+39mK7
	 c1pD08WZmG8xk2MV1F97AUWI102nYXuCgUKqI2iJOOljLlvyAtGho8k3SWw3fWhq/Z
	 HpZpeTygf83kQ==
Date: Tue, 10 Dec 2024 15:56:04 +0000
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org,
	james.morse@arm.com
Subject: Re: [PATCH 0/6] arm64: errata: Add Qualcomm CPUs to the Spectre
 mitigation lists
Message-ID: <20241210155604.GA15918@willie-the-truck>
References: <20241209174430.2904353-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209174430.2904353-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_075612_589985_BE9E9C8A 
X-CRM114-Status: GOOD (  21.47  )
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

Hi Doug,

On Mon, Dec 09, 2024 at 09:43:10AM -0800, Douglas Anderson wrote:
> 
> Since Qualcomm CPUs are all derivatives of ARM cores they all have
> unique MIDR values. This means that the tables listing necessary
> Spectre mitigations need special entries for them. However, those
> entries are not present and that means that some Spectre mitigations
> are lacking for Qualcomm CPUs.
> 
> I've made an attempt at **GUESSING** what the right patches should be
> to enable mitigations for Qualcomm CPUs. This is mostly me searching
> the web to figure out what ARM cores various Qualcomm cores are based
> off of.
> 
> These patches get more and more sketchy as the series progresses and I
> have noted that the later patces DON'T EVEN COMPILE. I have included
> them to make it obvious that I think these cores are affected even if
> I don't have all the right information to mitigate them. Hopefully
> Qualcomm can come and fix this mess for me.
> 
> I'll note that I am certainly no expert on Spectre. Mostly I ended up
> here running `lscpu` on a device and noticing that it thought that it
> wasn't affected by Spectre v2 when I thought it was.

Whilst only Qualcomm can say definitively whether or not they are
affected (and what values of 'k' are required for the loop-based
workarounds), I can't help but wonder whether the current mitigation
code is structured the wrong way around in this case.

It looks to me like we don't have a way to identify a "vulnerable" CPU
for Spectre-BHB; either a CPU has some sort of mitigation or it's
unaffected. That means that there's very little incentive for vendors
to add their CPUs to one of the lists -- if they do nothing, userspace
is told that everything is golden and they don't pay the performance
hit of a workaround!

So I think we should consider turning this on its head and assume that
CPUs we don't know about are vulnerable, having a list of unaffected
cores that predate the introduction of CSV2.3 which can be queried by
is_spectre_bhb_affected(). We can do that without the assistance of the
CPU vendors.

Does that make sense, or did I miss something?

Will

