Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FB4C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIR5BxajPGg1+XpWUbCH8gnRQ5Vd8usGx13E2PTIQ+I=; b=1K62HqyJoH3L8Zo+aYubfacHdT
	g2DyVvHhj50/mX/cMsFti0d9V7OgdCANVsQVhxeWQecDYa/vRU8YHCwqvQ9p3B1++5bC0n0ugjk12
	2zfiIpNmoW+OC0B2OuMQudqIDOEvn7wZtDNjQyLqU74zPK3eB/CZXmqf20qSWFK/UZ+q9mtcpjWQT
	1oFNkm9OQzneyJkKxbpwxSrZ5VGrFcTFDLrdQ7hFA8XImFW9IIvAvnPS7YgnNbhz3rBUEGDhrSLsi
	g6hiwLsWNyhtc9DGabz97ST2PAVrB2ZJZe0g/yEoM+yJTeMmSqfuWnO70NtsYJYu+sYX+IYIelUYt
	Z/jx0AuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFIAu-0000000GDjW-3I1S;
	Wed, 14 May 2025 19:53:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHqf-0000000GBPN-26V2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:33:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F38B44629;
	Wed, 14 May 2025 19:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB894C4CEE3;
	Wed, 14 May 2025 19:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747251181;
	bh=8V2EkmTjcMCH4OEHIKQotnrppd46LM8W6gcOF6PKQOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ilQ2sw9tgHXJjch9owrzHEnuV5XAgAJ6gK7QllLLbrQ71gZVF+fJbXMA/LyUNDadq
	 +ucU//BRSs8j93iF/N5zHJUxHNPC+pZI77WBHZ2FTUP/nNZNSY9VgtUjloQJG7xTSU
	 ljX/wXIOCrX21HMazCnhSvGA+/8JmyaeZjdymREOdAK/3S3bCSAl7U38Kw0/aJ7rFl
	 tfgTTgT9mRbzfKetJaKc9o15Bx841OCSPPKMClkYdR9SWlwVBkcJEdjuXuFxZe9q1P
	 6EhqQqPY67dgS+egod89GXvfQ4hUe1WQt3Ga3QBocOQjynz6uNrVsnia+ZjBmpGOuw
	 v9FwxIgsdYfEg==
Date: Wed, 14 May 2025 14:32:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: tegra: Document P3971-0089+P3834-0008
 Platform
Message-ID: <174725117885.2871934.9920497627228392092.robh@kernel.org>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507143802.1230919-4-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_123301_557538_43AA54F9 
X-CRM114-Status: UNSURE (   9.10  )
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


On Wed, 07 May 2025 16:37:57 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This is an engineering reference platform for the Tegra264 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


