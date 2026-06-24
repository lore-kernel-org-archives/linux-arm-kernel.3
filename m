Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1CFCDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQTOfWdw1qdEOgKqwNzVR7Pe01y3HaMQ9/zsv/ctqT4=; b=xTmCCsQx9KyFv9ZrZLFifNSD+t
	SqMBuEYVNL3f09g59Q6XUkInEXDmm9wsMgXQmwOg58p6JKyKyLI1UEaW0YsWwZ2pzFSzphzddxGko
	G4fwJ2TrkZA9APcTOU0U11jOs4E8RuJLutcta1TqMMdVj0PZ433UP2k/ndfbYn87VIbJlzZycupQ3
	5tUN8rLXqtGby4MuQOfynf6g9g/npYLrgnLwNmkYS/+S4KISqwLo/ajDixywRYSU6LMCtBN351MhB
	dsAo/WjtIwEY5xoxhJPWtDpxY2UQ3Ft+F8OcnDvV1qaacCzEVevANMedcfBznds/mJH4Up9lkl9+K
	6KjsJ+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNMz-00000007nnB-438p;
	Wed, 24 Jun 2026 13:10:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNMy-00000007nmz-14ZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:10:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C55660018;
	Wed, 24 Jun 2026 13:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA02C1F000E9;
	Wed, 24 Jun 2026 13:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782306619;
	bh=gQTOfWdw1qdEOgKqwNzVR7Pe01y3HaMQ9/zsv/ctqT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UJmZbtJFiDGZuKk+oxyxHxmOVjjwlf2PrzJBQ0W/VK8/shpCklgAx5ZSiowjXEDNP
	 lIMFdlglSHIJRenUx0LhvtJuMxW27HGieQKwwZcVkQ0gas6Ug2+RFVq685c6UIjqMd
	 m+CKpnotDFCJUZRdBS+ABSHFoJ136FK11xwJt0LiKy+2qS8v5Dx7/CvDWtCMbamktE
	 AHlAMOdMw9BzgIwZ9XGXhQtlt94KIye1QWJ0pxgoj7KQlgow/eBiPPDM5/hyPOeYI7
	 zA/8OmZczX+lw66yiKAZyPcQ8xA6Hde98vt5CtNRgwL/HDm+WPkkuG4xpXMiqi5v1o
	 YhX6/RZ9J94KQ==
Date: Wed, 24 Jun 2026 08:10:18 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Use ZT/ZTR trace
 clock in R-Mobile APE6 example
Message-ID: <20260624131018.GA4064376-robh@kernel.org>
References: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
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

On Sat, May 23, 2026 at 09:25:50PM +0200, Marek Vasut wrote:
> Since commit 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks:
> Document ZT/ZTR trace clock on R-Mobile APE6"), the APE6 clock node
> expects two additional "clock-output-names" entries, "zt" and "ztr".
> Update the example accordingly.
> 
> Fixes: 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied for rc1.

Rob

