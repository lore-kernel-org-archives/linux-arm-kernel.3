Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3935FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMGjaq9jZqGYmhWII0atr4AzJ+z9cZtp5D2NOR3O7Kw=; b=YCp9vEO6C1CN+eCQQP2LbTIJH5
	HtUbPXIwGwQuJfs5vBGA5uqKHYv3eJc/2eOiymaq9bHx/6szl2J7zN0lMHuPOP5b9P0/iz3Nd77cv
	8NhHJw9pFvO5/dihFsIKw16/2GifGjbJ62BWvvyeSTJhJfROkGur5x8MwLUHcLA4X0YkkuUUqfse2
	YNpdImJwMgraEwT4ouaZqGnACIgPBm0N3w/mCnYdODBAKPWgu1TblFKA/cG2eeaeaqLBaKYh6CcTb
	M5kI8pEVmNNq2kpjJT6P54/xZXUpkgndjZmAhbKQcqGvSNRcUlwHMZA5IM8q0lRpAoXpf/ePFGph4
	lfX1QUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJCf-00000004mvl-0jD6;
	Thu, 02 Jul 2026 15:19:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJCc-00000004muS-2Mh8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:19:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1AA3359D;
	Thu,  2 Jul 2026 08:19:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9734D3F85F;
	Thu,  2 Jul 2026 08:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783005583; bh=7LQRtqPEi0UprWVsXRrjibYefSmOXkkL0SA/IYXRMXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U0rBu8OY33nBMMW0XMvMDf8xcfzxlbquTVoZGK9qIIXQzKeuLzyOrulpWq4HbBm+v
	 NOjmPuuGaWv6vY/2c20YRBjMgwUOgKbuombOqZoQMIOwqQ2hJTHjhXOcaAoNHvDRet
	 2gX44srtdQ9GN+KunXuDXgS61ZDzJ65wpdtlUp+k=
Date: Thu, 2 Jul 2026 16:19:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Document missing bitfields in
 cpu-feature-registers.rst
Message-ID: <akaBjGtESDv_x6Ds@arm.com>
References: <20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org>
 <20260522-arm64-cpu-ftr-regs-v1-2-19775b40faf0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-arm64-cpu-ftr-regs-v1-2-19775b40faf0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_081946_647229_B8419C06 
X-CRM114-Status: UNSURE (   8.98  )
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

On Fri, May 22, 2026 at 06:58:38PM +0100, Mark Brown wrote:
> --- a/Documentation/arch/arm64/cpu-feature-registers.rst
> +++ b/Documentation/arch/arm64/cpu-feature-registers.rst
> @@ -113,6 +113,30 @@ infrastructure:
>  4. List of registers with visible features
>  -------------------------------------------
>  
> +  ID_AA6FPFR0_EL1 - Floating Point feature ID register 0

That's missing a '4' in '64'.

> +  ID_AA6SMFR0_EL1 - SME feature ID register 0

Same here.

-- 
Catalin

