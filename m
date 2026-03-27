Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA3F10ED659
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 12:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B/0qb79O5iv9lYNuTrr9X3DANy8P77ZGLecPPknDbM=; b=fVW/z6Tq7KJrS7tZam5zDCuXHR
	d1Oc8ZE8GDYCJKeZ18f+YRmcxKqPdULUdPW1j1joBtLsRR5ibSk2hVcoKcsuOvF9tdMsoA1jBpcNx
	b18dzJdaCBgTgelAXFB57acgGgR42lZ3D3vzK2ZC8sBHLH+/5ALaOoNd1n5N+5yotxKFibRRzhgmm
	qAZzr4K3NUCuhIB2C06bywq0neEmDI3bDSrkxqnIdWrLxeGR+VnF+SQVqkFXWKL50f/ISgoOSIwTR
	75Fde/YjqIedTknsyuFVo7NfwV4v4xDcorB/ZOcnaHXmCSU4Mr77/1BLwR9YqmhmygqEh50ntQmf5
	Bgqr4cIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65rU-00000007K5F-42KN;
	Fri, 27 Mar 2026 12:00:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65rT-00000007K59-28UY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 12:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B7266132F;
	Fri, 27 Mar 2026 12:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF40CC19423;
	Fri, 27 Mar 2026 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774612822;
	bh=Hgu8cRYk4SE3289kzFso0+E7966W6uLpPsOi8UON7d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rK1EzE/vxBy/JHy81zZVnf3hh5uMjBNOTIncXF9ngGwsUjxbirTRYTh3xBzsjxE/L
	 ZUedbn041wbp0MLFxEPR0Inaw9+NQroS0t8soQZH7cU0BP6/rirX9aJUxscOV0RlNF
	 ArjqsX02yx2AMa/zv6i64xzcdnAKUIy67PMyyDdxVbx1+7sq+1j1GSf26hVnpTPp4e
	 wJ5mY8Eg3OUdDhjPZIFMl53Y3tQtdzgKg+FzwOk8dBILjp7766QdP72TFtoizloHkG
	 XrnMc0igtf4YFkZrU86BVh6Hn5crpOKnaskJVLdXthrWCzIVxi27sLMuxuOmT1CPST
	 pfdhWs6KmXMaA==
Date: Fri, 27 Mar 2026 13:00:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	ALKML <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [GIT PULL] arm64: dts: juno/fvp: Updates for v7.1
Message-ID: <20260327-screeching-oxpecker-of-popularity-deac89@quoll>
References: <20260325160027.4115793-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325160027.4115793-1-sudeep.holla@kernel.org>
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

On Wed, Mar 25, 2026 at 04:00:21PM +0000, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-7.1
> 
> for you to fetch changes up to 87599f1843d3baa4083dc9dd01c95826b536de24:
> 
>   arm64: dts: arm/corstone1000: Add corstone-1000-a320 (2026-03-23 10:03:28 +0000)
> 
> ----------------------------------------------------------------
> Armv8 Juno/FVP/Vexpress updates for v7.1
> 
> 1. The primary addition is initial support for Zena CSS that includes:
>    a new binding compatibility, a shared `zena-css.dtsi` description, and
>    an FVP device tree.
> 
> 2. Extension of Corstone-1000 FVP platform support with binding updates
>    to add the new `arm,corstone1000-a320-fvp` platform, and the
>    `arm,corstone1000-ethos-u85` NPU integration.
> 
> Overall, this combines new platform enablement with some DTS layout
> cleanup for Arm reference FVP based systems.

Thanks, applied

Best regards,
Krzysztof


