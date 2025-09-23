Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A9FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 09:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRKb+GDYunbLhT08YRqR4IiauJHqZAltr/kHRhQjozU=; b=vmAh8g2ry974M/aqseszRFYuQo
	fQRLHcKOTGqf5xnI59ic2kpoGJPhV9dtlTo5jV7LaF17vVYwo70xAeKYIYDYaD6BN4JnxNy40w1C4
	pC5fZCtooenCPVDm5fF+a7XO+2CTW3OvAfSU5aad7+WSEwLyw+IVqz1w7vK63LO+UvoEjve7K5mPX
	CDzUS1LNNNjUTTHlK1759OK7+j9GGUqq7cqwUyX+cgvtQ2dPeJ/h36ennjG0A5Nt2Dmr/hmjsMKXA
	OH0sjs5UaqtqwZHb8t01iadzijNLxxOe2GiuIEfdDAXdQWfELgD+l4+Ro6+kV7uLEtYdw7/egFkKV
	3xi8dJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yzY-0000000CsuI-2fdp;
	Tue, 23 Sep 2025 09:07:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yzY-0000000Csth-040m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 09:07:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B9A96027F;
	Tue, 23 Sep 2025 09:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1382C4CEF5;
	Tue, 23 Sep 2025 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758618439;
	bh=dhXEPgsBK+GvW9IrpnbQ/Olpln40iiFo0p9WPqLhTGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gAJgVe3zzA14Z10X9t6nDnxyUAbX04WAM5naygnt3UAF6HSiiiLjhdr8lurR8vncD
	 z7X8tX38EYXvBTVjpTuhYGlqIt9mT6AW2bBhcXmFcUIbyZCnvSZe8Nn2F9R8yRERYK
	 nkFnobjcPiPQFgEd/0OfLAhl7XG+PwznugZIIni36fGlpRON++fsQ/kFiC+/eMUpRo
	 ucpwci7rXNdoYRdrIRzJbeHhZ9ByRIPKOxD5EpD2PGlyg7CqCMcaFKv8od/f7/Q+n3
	 q6hr01vJL1miVBWG/S8GqQj2agGY3HBNqYD8PbZUXp694JX2BRsLDfGL7exeLg75h4
	 jHPeTpW9XVGpg==
Date: Tue, 23 Sep 2025 10:07:14 +0100
From: Will Deacon <will@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <aNJjQkj70kCArFf1@willie-the-truck>
References: <202509231223.gZsX6Eio-lkp@intel.com>
 <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>
 <aNJZ6SqYvBfjZlrZ@stanley.mountain>
 <aNJbxj55fEgutUPn@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNJbxj55fEgutUPn@willie-the-truck>
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

On Tue, Sep 23, 2025 at 09:35:18AM +0100, Will Deacon wrote:
> On Tue, Sep 23, 2025 at 11:27:21AM +0300, Dan Carpenter wrote:
> > On Tue, Sep 23, 2025 at 12:55:01AM -0700, Ilkka Koskinen wrote:
> > > That's cleary a bug and I don't know how I missed it.
> > 
> > Because we disabled uninitialized variable warnings for GCC and because
> > everyone has CONFIG_INIT_STACK_ALL_ZERO set so it wouldn't show up in
> > testing either.
> 
> The more annoying thing is that I run smatch on my tree before pushing
> but somehow I didn't notice this. I'll run it again to see whether it
> detected it in the first place...

bah, there it is:

+drivers/perf/dwc_pcie_pmu.c:418 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'. [smatch]

so not sure why I missed this. Maybe I used the wrong .config (this
driver isn't enabled in defconfig).

Will

