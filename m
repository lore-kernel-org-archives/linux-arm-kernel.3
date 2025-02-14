Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58718C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7iaYEtJKis9tdayauLlgPb5kqMLDK0pB6uDa5Ebvj4=; b=gD5pMF9vOdFChOXumO5gP2z7TN
	mofFlJp2LC7AhzWTYvflKkHgSXSaQk9Rv007m0GiwQ/ecjAKMD/d5pV4ucT0bs3VDl7exmYX+W1mg
	pswFoW69hTWFew3K4XX2y7HF18+SWfULYrGHW63/9iB93vQ8cbKdxt97FHXlrWDpimwjt7GO1Lzlt
	8cpvkhq+QcxaRipVNyc16XjCw+0R+OMsLhfiecYhiF9io/np9LrSJc4TJMzWcyZi1zH7wciVDLufW
	wMW5SrPQpMFGN3zIzFxRqag6gF/8srzRHCJGbyPbDArX89aPqaO41PBUw+T5ZaYDCxbQEI5UfdOkF
	Ug+AtA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqws-0000000E6Bj-3GXi;
	Fri, 14 Feb 2025 08:21:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqsc-0000000E5AC-30gk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9778B5C5907;
	Fri, 14 Feb 2025 08:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2D3C4CED1;
	Fri, 14 Feb 2025 08:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739521017;
	bh=C9PejOUD39fGJmShIEpkP1R0NrPHjbzcGvp53tfao3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQdThSWLJu3SARHeoXBYF9uFjHeBCiMXiG7Mkil4l2gy094jGGg/5Ht0ijBt5wWDB
	 rfqImKEjWZ2KXjsPBhr7VR5dlPmwH9N83wqigJwAN5qttr47lFrPo48vnC8yjC6Rsl
	 cbBvrlwHD9YBKQawp9pVkQtP2QAiN+M8yAWA0fTdd36X+lH4yWd2pBRvCGw+zeijQ2
	 fSKq+0emyGXsmjFN0c9L2zGU/TWted7aEvTU7SA/CYwvWlIc7nnNQqGO7wv2iqoFMV
	 MHsryN3NfTuHFwL1Orrkvwmg7x43qZkpGo4qP4wEeqZGITteeM59kU5YmTFWJYQAas
	 7NhUuf2+743cw==
Date: Fri, 14 Feb 2025 09:16:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: andi.shyti@kernel.org, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] spi: dt-bindings: samsung: add
 samsung,exynos990-spi compatible
Message-ID: <20250214-adventurous-earwig-of-perspective-b5cd91@krzk-bin>
References: <20250214043343.263-1-wachiturroxd150@gmail.com>
 <20250214043343.263-2-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214043343.263-2-wachiturroxd150@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_001658_801072_4C139852 
X-CRM114-Status: GOOD (  15.72  )
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

On Fri, Feb 14, 2025 at 04:33:41AM +0000, Denzeel Oliva wrote:
> Add "samsung,exynos990-spi" dedicated compatible for the SPI controller
> on Exynos990 SoC. This ensures proper representation of the hardware
> in the device tree.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


