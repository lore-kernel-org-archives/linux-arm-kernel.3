Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB072CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 12:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0uib9eMHl81tzc+EqAfrcIxoFi4MWrxxKPr85f9QCE=; b=UO6YLIhB2DcNWLP0Pc9GWN4X8o
	SmNenXw+Qg/G1ObLGeRfo+2BTZJHjIlsahrnbWSJmEP6+7iNs6NovJ4dzA9Ota8hh4iz6QcRPm0j1
	fTaQvl5peLut49E8FXDSR4lVDlX1Pm1Kvn3EYubocBjGdqyKS80YOP3CbHu7JuiSlFdWJi14EXkjq
	F4QLdOaAUSvz6l0IZ/3nKGbA18IzdoNZ9776rSFPQGmO36f1Np9/tS+MTqdhi6I15ij6nQwA7rnxw
	gccKBErYPhimFHDLm88NAdD1iTEA54+qZm+RV5J3+FFCrmumV8l10PEq92sD/H/owmVgJEYAc/frH
	9SAhvIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhX6-0000000GNlQ-3Pu3;
	Mon, 05 Oct 2026 12:11:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhX5-0000000GNlJ-2RZY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 12:11:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99B706022E;
	Mon,  5 Oct 2026 12:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059FB1F000FF;
	Mon,  5 Oct 2026 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791202262;
	bh=f0uib9eMHl81tzc+EqAfrcIxoFi4MWrxxKPr85f9QCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KlY3ULAwEo0SmWdc+EGl/5eTNPos2ssNKzNs4Vx9kPXwGMCvuYHiXqhTf935U3Siz
	 mMFPezPH1itjem0CcEus1PEX8iwup2+pTX0tcEqzh4Z1zPKSqFmwBcRjLcBL19EhuC
	 VjPk87y9hrjRt4uP/fOxm6SdkGXvIqYN09U/B/meU2XCAcXKmn+HDRdWUFaZTbCIeR
	 HXNisfDkfpQTDNz9pfMCV3ibrgv2oS2832pIh6xBcBjod6NB3UapzexWJiTrU4zzLK
	 P5VreISqLLUjb+HOm43OrCG2o9JpTqeZJdbO9ySjDB4sWzJn/F1oP3bU9F8m2zCLhf
	 HSBlWW7NLgDSg==
Date: Mon, 5 Oct 2026 05:10:55 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	Steffen Eiden <seiden@linux.ibm.com>, fuad.tabba@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [RFC PATCH] Documentation/process: Add a maintainer entry
 profile for KVM/arm64
Message-ID: <asOTzzNU7foTo9KA@kernel.org>
References: <20260924033536.3624334-1-matthias.goergens@gmail.com>
 <877bkb3zjq.wl-maz@kernel.org>
 <20260924083036.1744194-1-matthias.goergens@gmail.com>
 <875wzu4vuv.wl-maz@kernel.org>
 <20260925085621.562448-1-matthias.goergens@gmail.com>
 <87tsnb2dtq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tsnb2dtq.wl-maz@kernel.org>
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

On Sun, Sep 27, 2026 at 11:22:57AM +0100, Marc Zyngier wrote:
> This otherwise looks pretty good to me. Let's see what Oliver says,
> but I'm otherwise inclined to take something like this in 7.4.

I haven't had time to review this in detail but I'm not generally
opposed to better documentation. Post as a patch and I'll make an
effort to review.

Thanks,
Oliver

