Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6598CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 22:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DjzRkPglXkLnXbY7wN8PS3ogcu8ALsIIsvswqRjdFE=; b=FM8sVGclRN6JupMOjUAySbQ9nW
	bC7onZEiVfWbybJzH2rECEB4B22dmZFcEs1Vl5stXArC/vXyGlqKTOjgSkOJ+y1bDarJHDxDRJjCf
	Sy9YNDCXxFuqEesp3U6aksuNTyOMNJLiEbNucV+PC8bFad2g9E57XxSCVNOZ4NHks8llx4Og2yHaM
	DrFV81NHOxGbT5zv5w6+Ke+L7Yv/I5P7ihhiRvRBp5lC/2jEEtp8Bjpqm5EgQFngTsD2yzeQ8HoST
	QdB5yBCLFVm4HPmwgez1Qaj00/ssnRPNeAou32lb0h0rcv2nUC6K2zKN1PXWpJh6vFO4EVOen5ki3
	Xrrgak+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUQB-0000000FPlJ-0bbE;
	Sun, 04 Oct 2026 22:11:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDUQA-0000000FPl4-2Ibr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 22:11:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50115403D5;
	Sun,  4 Oct 2026 22:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3279B1F000FF;
	Sun,  4 Oct 2026 22:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791151862;
	bh=1DjzRkPglXkLnXbY7wN8PS3ogcu8ALsIIsvswqRjdFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HH8fiKGNTvOUka8cytqfjPz55KfUztVmkOh/aBQdRNW0yL1QMtNWxaacH+9MBB96p
	 RA3qPtQhJ0NHHOzurorpnZ3bBh+j+dLodHipyRX+7Qe2thTIm6VHS1yMwNLrE3GyDO
	 i/jZJOHljB1336OzqAaLUpUZ5sX3JvfPrL1bu7vTmmbi0g2Wx46TsVUrTS28V7onHb
	 4h5G5grnwy/7Haf42cPVCGpEPKxs4HFkVPRMWRTJIEFjQ+1WoL0LmMWehaMmAnTEMn
	 +U40ag21NPWOZXUrw4MLk2XVTBh2rCarZGqvuVLtBCjaK9GBOLzPqXGC8125ax68W4
	 1yPyJtjXpxx1Q==
Date: Sun, 4 Oct 2026 23:10:58 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mark.rutland@arm.com, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] perf: Add Arm Bus Monitor Unit driver
Message-ID: <asLO8rGQPYo3KhKB@willie-the-truck>
References: <c936505c43275f434bce924b7657e42bfb25579c.1789652832.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c936505c43275f434bce924b7657e42bfb25579c.1789652832.git.robin.murphy@arm.com>
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

On Thu, Sep 17, 2026 at 02:47:12PM +0100, Robin Murphy wrote:
> Arm's Bus Monitor Unit is a low-level performance analysis tool for
> matching and counting transactions at interconnect interfaces. Each
> BMU consists of a number of "interface monitoring units", with some
> global controls to synchronise them and so permit accurate calculation
> of cross-interface metrics. Each IMU contains, among other things, its
> own PMU largely based on the CoreSight PMU architecture, but with some
> functional incompatibilities due to the nature of how much per-event
> filtering needs to be crammed in to categorise AXI/CHI transactions at
> the protocol level. As such it gets an honorary home in arm_cspmu/ in
> order to share the common register definitions, but for simplicity does
> not try to bend the functional abstraction to fit.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> ---
> v3:
>  - Couple of inconsequential tweaks to shut Sashiko up about things
>    that would never actually happen anyway
>  - Drop unneeded DT patches that I can't be bothered to fix right now

Please can you take a look at the Sashiko comments on this one?

Will

