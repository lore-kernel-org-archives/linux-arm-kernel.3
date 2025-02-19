Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034ABC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ulyPKiSL+CUG4ztpZmrElHNOMcvwWPsUBhLf5iuuPE=; b=sdIAEF7KFdDikAlogBq/foRAtS
	nIpSbALr3aQeYo/xAqkFBCCLa/VuriFsoya4+TFCGWEj/qI6IS+0GF3SeTu3FX3zk4UoW5C0cVimK
	m7ih0XqbSQEAINW76HHqmCoGPiFwG0cMHrbtjgN01ki6Flim3V/pqEll+WUhr+Eq2+c6LHeRctKNi
	9RpzONstJys2sUSCcezaN2LQ2D2qTW44D789MiB5fkhYbAIdoREPoylFjkr5zUWlFAGWiZk+zBk9W
	O3EwpNELD1QmtGsfEuc7YUPuQ+Wz+TOvAp15+dFQw22t61SaDLgA8fU8GcIZy8FqxiJ4v4R9JrWr6
	RozT3SJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfON-0000000BV55-3WAk;
	Wed, 19 Feb 2025 08:25:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkf9l-0000000BQw2-2Z7d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5AD05C56ED;
	Wed, 19 Feb 2025 08:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D32C4CED1;
	Wed, 19 Feb 2025 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952608;
	bh=toKhTzJHk0yZd6I+pNwZHNw66R0PvxmZq/5VoXfHFKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wzq8gltgUcfJkGOZsx9ZxxcsxiQIfUb3Pi56Nqb2TKzzbUokHYAWNkXkb8iORu0cy
	 QMHnaTcKzNxMy9OjQJOHnjwK8MVKGk75fag479zNQSzFb6p/5mO8jO4WH2XRqO+tYS
	 g8TVWHZCdrtOfaHvqOjLMWKBryhSKfHiASOJmox46aoOQy7JbrUK7Pyc0/d/rFF4dA
	 GB8AtkmTe+yEy0Ump6xlWG2etlUxl8j7Qy3oDXH1U6AlBHafjofLPDsuACofwZY+mj
	 /rciYb9bP8L4qhje96aI1R07sHcm5WdVMUyay/je+sfhkjC+006PFO3acPs8yCSG+8
	 2M8p9VTcoGAaw==
Date: Wed, 19 Feb 2025 09:10:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: add clock definitions for
 exynos7870 CMU
Message-ID: <20250219-frigatebird-of-premium-philosophy-de6dab@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-1-0d1e415e9e3a@disroot.org>
 <20250219-naughty-spaniel-of-refinement-ab6fac@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-naughty-spaniel-of-refinement-ab6fac@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001009_707008_EB00CB4B 
X-CRM114-Status: GOOD (  13.13  )
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

On Wed, Feb 19, 2025 at 09:07:17AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Feb 19, 2025 at 12:20:28AM +0530, Kaustabh Chakraborty wrote:
> > Add unique identifiers for exynos7870 clocks for every bank. It adds all
> > clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
> > CMU_PERI.
> > 
> > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> > ---
> >  include/dt-bindings/clock/exynos7870.h | 324 +++++++++++++++++++++++++++++++++
> >  1 file changed, 324 insertions(+)
> 
> Again, you keep repeating some old patterns ignoring what was added
> recently. This must match compatible, so missing vendor prefix.
> 
> Also squash the patch with the binding itself so you will see the
> difference in names.

Let's unify everything to:

samsung,exynos7870-cmu.h

