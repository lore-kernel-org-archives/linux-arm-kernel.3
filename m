Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB5AC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGGQ45FmNPaIc8zDqKyIfG5awCxfFODid41qpKVGHCc=; b=fiMes+1/+TiWqk30k5Fw9jNSZK
	SL7cOBY7F2S/OlVDEDvg1zhQZvQD+9QjG9wT6OTAN5t31fE9oh9YhOdneV/o5NeiTtHNq+n/QnRkp
	0Cacji7Y/UVaFfcImEDmT0F9O4gybZ6SaTve6MRl3RtXBJ4fKsuFV7rMDGi6kMywmZI2S7kRWJkpi
	39uZ3KI9dlSx6xP/a2fwWtq3Sh6Gc/HMIM/5cIE+QvHAsBdWanQgZUuj9VtMRyB2baMFOf1zijkNe
	tZEGAP3+P+6252/ngTPyc0NxU8DeSFyZvmM1eimdAPLoH6uEc2pnQltVbPSSeFeYDfSY/EFb7ZqP9
	wTF95y8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lic-00000009tEB-0OR9;
	Tue, 29 Apr 2025 14:13:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kk8-00000009kEL-456C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:11:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 238CB5C0647;
	Tue, 29 Apr 2025 13:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAEAC4CEE3;
	Tue, 29 Apr 2025 13:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745932283;
	bh=kI+xqmHWFmQhxfPWx0iSb39jTOlQwU0yc6GbWzn5/8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKmx5jv0xDYfTJqlVB04Dtj2rzyVkKoBrKMzQaKaXCw9xyfbnnPG5QdhfLfgzn3gs
	 ojz8YL5st/hhTteowfZQIcaFg2dawHr7q5aKR6BWoASjxYkKNMQhImiBYhCHnP/Raf
	 4msIvDiY2pxY3EA03LnlD0sTqokwGcMOFOWpX1wbGJD7Q+bV6bqLO7hjei1zxMEEDH
	 0edUdTKmWQ4cuXv2pmaHOb+J7b5bhPtTj3PyuSXQyXZc8iI5UXUg0u1mPIc1U94501
	 ROC565/mmLH7tTh0533JgYyMO7KFY9Q8XIT7wO3KkdWfaNwaulJMYROlEFPma3cBbX
	 UuczWNoUiJMaw==
Date: Tue, 29 Apr 2025 14:11:19 +0100
From: Will Deacon <will@kernel.org>
To: Xiquan Zhang <zhangxiquan@hisilicon.com>
Cc: catalin.marinas@arm.com, corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, maz@kernel.org
Subject: Re: [PATCH] Documentation (arm64):Advanced SIMD and floating point
 support condition
Message-ID: <20250429131116.GA25912@willie-the-truck>
References: <20250408031309.2095-1-zhangxiquan@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408031309.2095-1-zhangxiquan@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_061125_066843_A9DE228D 
X-CRM114-Status: GOOD (  17.65  )
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

On Tue, Apr 08, 2025 at 11:13:09AM +0800, Xiquan Zhang wrote:
> From: zhangyu <zhangyu550@huawei.com>
> 
> Because the kernel code cannot be started from el1
> according to the booting.rst.
> It is found that CPTR_EL2.FPEN is not configured.
> After the configuration, the problem is solved.
> 
> Signed-off-by: zhangyu <zhangyu550@huawei.com>
> Signed-off-by: zhangxiquan <zhangxiquan@hisilicon.com>
> ---
>  Documentation/arch/arm64/booting.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index dee7b6de864f..ccefc42b51bc 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -309,6 +309,7 @@ Before jumping into the kernel, the following conditions must be met:
>    - If EL2 is present and the kernel is entered at EL1:
> 
>      - CPTR_EL2.TFP (bit 10) must be initialised to 0b0.
> +    - CPTR_EL2.FPEN (bit 21:20) must be initialised to 0b11.

Sorry, but I don't quite understand this. CPTR_EL2 has a different format
depending on HCR_EL2.E2H and the FPEN field only exists when that bit is
set to 1. In that case, however, why would the kernel be entered at EL1?

Will

