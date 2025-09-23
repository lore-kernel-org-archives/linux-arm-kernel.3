Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D88DCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7E3C0GYNlj0hYhjD9/c2lHqaFNoZ8ozSgnfG4yKpPwA=; b=RBVmVrp6AoSPPM9XrLbEBnB9UI
	0qMNOjQLCBEeyXjOz5BVqzgRN1GQa4UoTLyHGLXaOlcqExx4Nl11Ru/EcDOhPUt1CgwYCzp2wReS6
	1cryHen9hYfppTPkGBo4tXArZwauCOOphc9haTaRpN2x80UoFUhAKXZvhQ2bvDv+SG2bKSI6Bxiyp
	f086q36n4LIOuidTcO4XbVF2kdpmfPkWOvQMUxF10gq6GFB/+UEutqzw+1XApNs895CEh1AV3vh6C
	X8SYtTMf4IrQs/zu0Lg35yG4NUu8V5SMPvPHHRwuhjGRDkrlx2NSGhmKmDxttAtWHrgCGpIqvd4fP
	0pUg94LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yUf-0000000CpJN-2i8b;
	Tue, 23 Sep 2025 08:35:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yUd-0000000CpJH-3hgi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 08:35:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17A8260203;
	Tue, 23 Sep 2025 08:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A21C4CEF5;
	Tue, 23 Sep 2025 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758616522;
	bh=+rRxUkZspQylYOU643PlOSIkzkgXe3gEa5Qgh0Ams44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHGYI3EwrOgfDnYsZPAngBO4cZRbkx31coOrmnbE/GCrRy1EpezDwwo4hz2F8r+4M
	 mfxCehwPJKRDFVZmUoB58RWgDNM/6D1Z7odutzxs3uBHCy1nT5uWrEQDIZ+NDdaLMa
	 ZbrfcPYysvXSdnMJpJewzOd+LAZXc8PPv2GUDJ/6qMuW7R/BF0eCYaonj66B4x6vj4
	 BrSrrKvN7X3K7PH6fcohh+wdBHLyuRO7vyl+MkG29isHid4fX/skSscxm9hplK+HgB
	 WZD/J2infr5N74WE5hXtEWrFY/AimcxV3M1kgmk9er7iwhXnTio5xVLsEtsxTScvwz
	 w2ikAQHpZVQdQ==
Date: Tue, 23 Sep 2025 09:35:18 +0100
From: Will Deacon <will@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:for-next/perf 5/28] drivers/perf/dwc_pcie_pmu.c:418
 dwc_pcie_pmu_validate_group() error: uninitialized symbol 'time_event'.
Message-ID: <aNJbxj55fEgutUPn@willie-the-truck>
References: <202509231223.gZsX6Eio-lkp@intel.com>
 <a2bb5fb1-f94e-cdea-6db5-86d78d2a53eb@os.amperecomputing.com>
 <aNJZ6SqYvBfjZlrZ@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNJZ6SqYvBfjZlrZ@stanley.mountain>
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

On Tue, Sep 23, 2025 at 11:27:21AM +0300, Dan Carpenter wrote:
> On Tue, Sep 23, 2025 at 12:55:01AM -0700, Ilkka Koskinen wrote:
> > That's cleary a bug and I don't know how I missed it.
> 
> Because we disabled uninitialized variable warnings for GCC and because
> everyone has CONFIG_INIT_STACK_ALL_ZERO set so it wouldn't show up in
> testing either.

The more annoying thing is that I run smatch on my tree before pushing
but somehow I didn't notice this. I'll run it again to see whether it
detected it in the first place...

Will

