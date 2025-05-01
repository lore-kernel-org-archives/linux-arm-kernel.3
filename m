Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5B3C3ABAD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aq135KQWpzNBlyp/plsJIqd7azKS3GZH+L2ojglW+eA=; b=AeJQ1vurzhFr6aU6npRmDgRbnJ
	pkDVmrTCgRWo0zD0Mufp8ujLLrqrISLcSkqjrvelvQHnyX1rrp8rEwXhtl2Ki6EeU0bOqTL3HBESU
	NSrm+lhL9NorRhSC568oTOxcNx6jK/84aHrp+gPivVlBpgZ2Qr0nJUJuHFtPZCABivoLkyVCRGQd9
	zTmoFUS6Y3mYLJbPwvIVKN63Tb1n2xUnf9piOnbTQnvvUGO6BY6fDomfqVubmpGGtd2DSKUUmT1tL
	LSNmrHdnT2RAP2Skl48IJtEkjBSBOowqv0OR+Jw9K7tVXFd0hINpX4cKpLIL+4auYwMSi3sANQ8es
	FTmnPZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAT4P-0000000Fg5G-1RnU;
	Thu, 01 May 2025 12:31:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASZ8-0000000FKdf-1MMZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:58:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76E8E4A3DE;
	Thu,  1 May 2025 11:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BFBC4CEE3;
	Thu,  1 May 2025 11:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746100737;
	bh=lumZpWP0OiXWgWPG1FqmM7YcJO8fszAqV2ndfUnzPdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXjj3YxK9S85YEhVJJKTb2B8BV+cKzezDlB8FsDcTEi9iX2+6c4rjR41jkMTADNc7
	 jH6KBv1ay/EZ/OyppF/OAixPWZSXqxmI/h1a1vr8gXlYR5huqwSHTQ3DvZSklg/5LQ
	 h3SHcamV2/opdbOJldoSCBVsDA9gTfhizE2R/XqxK7LVckYZSRkZTIqGoDoCMbw5eV
	 cs4sJjo5H3kyNGNRRpZp3SrfdBm9R9RBwBWyF4YzI8a1J+NfTTyS7N2vp0hM70IN0f
	 XVIxwBISDNquTEQBsdLzpphT2V7mzfZr+V9Vc8oYAuUhwy4Nq484EHIPoLs9lrU1tA
	 LEyZFJHtSv6Jg==
Date: Thu, 1 May 2025 12:58:53 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] samsung: drivers for v6.16
Message-ID: <20250501115853.GI1567507@google.com>
References: <20250501103541.13795-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250501103541.13795-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_045858_381631_39B0C589 
X-CRM114-Status: GOOD (  10.75  )
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

On Thu, 01 May 2025, Krzysztof Kozlowski wrote:

> Hi Lee,
> That's the stable tag for you to base MFD patches on top.
> 
> 
> Hi Arnd,
> Please pull it as regular drivers pull. Note this will be also shared with MFD
> tree.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.16

Pulled.  Thanks Krzysztof.

-- 
Lee Jones [李琼斯]

