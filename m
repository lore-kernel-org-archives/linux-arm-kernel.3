Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C96C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtXqdy70EkkZKnIN2PilGJ/msd2mduEnYL8Gm7H6LOk=; b=ucfBQ1V22CtySD+2Ogjni/AR2z
	5bAgHC2UcOL69UesP/WeKrjATMI81/6H56OLq64SRTocUdrs1rik0MB7osLh9mXczlV5yxzMu7/v6
	cjSLH2wL5AMAtvRiIhmAHoTGZsra+1lfuGksz5SEh9m2KeBOd70s9WeCk1cX1BBEskdeo7CQUQhip
	e/wpbthgU9CRMNbWirq8DTWksc7LN4M+mKCSjw6lTY8FvDoanrzIS87AbhFzyGk7LIhmAht/BrKNw
	BQtMAAYQa5aLndoRfWBR1MpHVxgnuLnxNNqZrHTrJZ2untjDn/5On9jGCOSWRWQ6OSiupRStiV0ro
	+HEcUnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnlB-00000004iOL-0ZX6;
	Wed, 05 Feb 2025 22:20:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnex-00000004hbi-0ZK5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:14:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DDF8FA439DE;
	Wed,  5 Feb 2025 22:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546A2C4CED1;
	Wed,  5 Feb 2025 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738793653;
	bh=aFGIUdjDssfb7zv8oCBW+9A3XqhSBZ7Ws/3yXdqV4qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ccisrcf6pF6AGzbnBuURM8Dv+heEsWDX6RNMMBwPOCdU01pSaFz21peydVldIdVtA
	 FF/QfYkiw0Xt1Kp4bsHkYmp5ujsM7trdKzoNZbY87KveivGmDgzkpzURfsHfl0s5Nh
	 xGSmYxAwY9t2hluRbWdkLX4geDtzaHCQGDDTY6UwRDviwkGDgGohuUxSqGmMTnUGUD
	 aFeiuWX/p2XAEcMO8vzHewxhRh6TJm9V2IrpGTSysYjjKFn5pE1m6PmDAWllq+wxsd
	 mzc8BJJKLhExxDpNqGYg1HgBNpEki1ma/qnqH5yxsVQ71W45C/9PSi4l2jSmlsfAV1
	 HMzfb+57UH1+w==
Date: Wed, 5 Feb 2025 23:14:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] Introduce support for Exynos7870 I2C and HSI2C
Message-ID: <wiyifuogjo5rbqwohi46czhymsdj3zp5k4ex77uqommuiwlopm@27vjaksxlfhw>
References: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_141415_248931_63238217 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Hi Kaustabh,

On Tue, Feb 04, 2025 at 02:03:31AM +0530, Kaustabh Chakraborty wrote:
> Document devicetree bindings for I2C and HSI2C drivers for Exynos7870.
> 
> This patch series is a part of Exynos7870 upstreaming.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Kaustabh Chakraborty (2):
>       dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c compatible
>       dt-bindings: i2c: exynos5: add exynos7870-hsi2c compatible

merged to i2c/i2c-host.

Thanks,
Andi

