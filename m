Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE64CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 05:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUlzIoAIpF2ANfuh+C3+0kEIVc8igLQo2sjWHVE/E8Y=; b=A3dd6PGPyZudo0VYWnvUGCrbIB
	DoRuErQ6Gmzz+wB2bJanPK3YYkTMeEMJ7rjLCow4eC8Q8lraLFQ9acZvjFMJLcBNssxnx0Zq/de/M
	dKyCHOEhIL+sXd+ntAtEvK2IzmLPWaR1cOo5Ac7P6WLcB2AA5JODPUKLLX0yK5rur4hC8X4ysXt+5
	N0HaLsZpvdu2l5lgWmwRYJGY5Oxu+Kgc/WsF8QLfCGj1Qtr7OYRJR9rYecWvE7+zEdtumDfK0yjgc
	wnfxNgWXsvO8F77T9LrOUj6zRFdrrc221/MsqVX3FQ8Pe6zpzcHUsuZwekE2hsIo7WcVX8k9h/eJc
	F5Q4UP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyOC2-00000006oN4-3nwP;
	Tue, 16 Sep 2025 05:25:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyOC1-00000006oMy-41va
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 05:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 086D26013B;
	Tue, 16 Sep 2025 05:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 947A4C4CEEB;
	Tue, 16 Sep 2025 05:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758000328;
	bh=Y7J9TrgOWDes4BKgwTFAp8gBivmWW7J/BMbeFe59F5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N333PA7KMmSXPAkGJKQAle989CtD+H+QkfH6y1SZSdGFge1mQgr+ZY4rBf+iILfnH
	 XnE1tm8kDoHitzK997KCXaz+BECvL+H2dQIDdOAR7w/MYiGggAOmpKUqH+agQqY3de
	 0dkOIUm5aIzcHSTdq+VtynqfyhtPsfHn3+FRzOhwi0qzMgqUhRk2bHKMrEP5EjWq8L
	 NW4AR9HgynR8F7B9BnRFJTSGSZlYdiGGvI4QFn0ksqKNWu+DNHWKRECTKaouTBbLvI
	 hpljyzEUpXLW6v5DfJWK8aVdcI3VDeILkY0FQMJSBJnBgzJPY19ljdqywbCcX27KtO
	 VBO6LtN/BR5vQ==
Date: Mon, 15 Sep 2025 22:25:27 -0700
From: Drew Fustini <fustini@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org, arnd@arndb.de,
	conor@kernel.org
Subject: Re: [soc:thead/dt] BUILD SUCCESS
 dfa743da83ab7ba51ec5692d5939ba1bab4b78c1
Message-ID: <aMj0x2syykobzp78@x1>
References: <202509161343.kdcCh2Me-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509161343.kdcCh2Me-lkp@intel.com>
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

On Tue, Sep 16, 2025 at 01:10:57PM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git thead/dt
> branch HEAD: dfa743da83ab7ba51ec5692d5939ba1bab4b78c1  MAINTAINERS: Add RISC-V T-HEAD SoC patchwork
> 
> Unverified Warning (likely false positive, kindly check if interested):
> 
>     arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/gpu@ffef400000: failed to match any schema with compatible: ['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue']
>     arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: gpu@ffef400000 (thead,th1520-gpu): 'power-domain-names' is a required property
>     arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: gpu@ffef400000 (thead,th1520-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
>     arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/gpu@ffef400000: failed to match any schema with compatible: ['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue']
>     arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpu@ffef400000 (thead,th1520-gpu): 'power-domain-names' is a required property
>     arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpu@ffef400000 (thead,th1520-gpu): compatible: 'oneOf' conditional failed, one must be fixed:

The bindings come through drm and the new th1520 compatible is in next:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml?h=next-20250915

Thanks,
Drew

