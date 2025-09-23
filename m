Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73063CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKqFdA8GHYXfFUOGldnkZyW68C95ycj/6y4+MPEn6QE=; b=XVt+mchn/HolQ0n+Cggw2gw7HG
	9kVn4d3Ut1Phg+gGHOjqUEkKNrkOi23+xkg1vceM+xRbEOXw1W2V5JzLDBwbZEhciZyg4MyDKzgn1
	TbFeajboyuZZqEwB32z49XVmK+qVKgGXnDGezStEFba6qZKxNI9AJ7AMtn0C0MCs1hJ+6Z5ucBP9d
	yBHXcpfgHigfoQDZNwJnYZWFvaSHu4aRC/VVyBMm00xOBtwGTj6bx6xGrRqqXMuh/6oYHo/x0dtCa
	6EhFk9e3gQNYx09vkEAe5eEtrBn20OlNoacfkLEFvSAY7DxPgVDC6NsCaC2HNLa5v7mXcXbipdtvA
	uX5rzjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yPP-0000000Cog1-0EbU;
	Tue, 23 Sep 2025 08:29:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yPN-0000000Coeo-1ECK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 08:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E92D0438D0;
	Tue, 23 Sep 2025 08:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954B6C4CEF5;
	Tue, 23 Sep 2025 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758616196;
	bh=CKqFdA8GHYXfFUOGldnkZyW68C95ycj/6y4+MPEn6QE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6kdpA/8R69LG8IHWPX0RCknKW1LmJSlhB9gYPcB6Nm8mLNv8djI5Vf23hKcWY9UY
	 Q8rucrPzn/VXJb7lVBeGkarBlb/LdFqly7R1BXRnMYAhBCErj60ohHgZIbsFHq0Icw
	 PrBsSkQjboPTHoFPklVBneY/Px+oNwbpo2Z0TSfGVCTex0SowlHfoekWbm2oCIi9mR
	 Ur22S8z5ylr8l+YfHMnauz8bt4VnjQ4MoyhcRoZmLXdftDiLsoWsb4zh0nXnGKXGpJ
	 bLJrWdMn5sHwMvkouzEM9ZJCgyZJdzFUS3rd0CwGAQJD2a7mqFMVW5PmkyxAJPju+q
	 otGiBTH96Pcvw==
Date: Tue, 23 Sep 2025 09:29:52 +0100
From: Will Deacon <will@kernel.org>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <aNJagMeldVo6cML4@willie-the-truck>
References: <202509231223.gZsX6Eio-lkp@intel.com>
 <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_012957_347676_A5CB4305 
X-CRM114-Status: GOOD (  11.49  )
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

On Tue, Sep 23, 2025 at 12:55:01AM -0700, Ilkka Koskinen wrote:
> That's cleary a bug and I don't know how I missed it.

Don't worry, these things happen. As Dan pointed out, it's hard to catch
this in practice anyway (and the robot is doing its job for us).

> I can submit a new version or a separate patch to fix it in the morning.
> Which one do you prefer?

Please just send fixes on top of for-next/perf, as that is a
non-rebasing branch.

Will

