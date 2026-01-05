Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C65CC2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svd1RKUF/R0VAtyMC/e2B/qiziOJr5vaDEWbycKJUTg=; b=GrZHVu8eg4Why7VzR/UeCoY28/
	vRjtK7oLIPzfXERRCU0D4CM9pIRZYzTNdvdnDrZwtKB1HieGCWAgOGSFNRNa4I1yo8sWjdnJEjXSR
	noWrXaEzdn/ApmDaBxn1qwq9YFlcD8pA+iiwfAQ7Rk5TttDP9Fi52Qe5vmxmyFEy6KLu5zsvGFtwU
	6teaab7K3JcVbOUWzehdxEN6MYKFh4oLK6km4uDchWeAylW7MOiU/1WcFL2cI+D92F0TvFns+uiSf
	sEKrtDOBKUULjvUIYCmYIexeST9FSvf7EVVVBLmL5RCGibP28hWoQDMSSaH5Hozj+Gas5ukZiW09c
	CyzIFh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfpx-0000000AyRF-2UGu;
	Mon, 05 Jan 2026 08:21:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfpw-0000000AyR8-1lhp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 08:21:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A5206000A;
	Mon,  5 Jan 2026 08:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D598C116D0;
	Mon,  5 Jan 2026 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767601271;
	bh=kQa1JNevuS+WPQwMFKC10iMoFprepPCs6UnztP+Yvm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VSJLZexM6M27vNabMDwaDO1NI+4+jaFTCFv1S1ArgSojVwRubHSepKOec7c3E1QLE
	 V3W5euo9MAEUKY/EZXB2QDRIBCOAyZYBpgZhVg3p9TL9RcXoAzx270lVGCO28cOCwz
	 MMsf0wnPv4P53gZAKmSncBJs8xvU6CO3rLmiqRG/kI3PUN8ttNGCy8VtfVm4qFfIeF
	 RoXXf23TuexE2Ttso1YexVK6IOLn4JGG4fxGdzi0S7KsoxLpmkJ/CmLs+Woqsas5p1
	 5ZhW0i93eICmzzjOqwK4H/LaZTQm4+YmfwA/V9sozZwXGInl3wxrW3a0Xmss4ShJrL
	 OMl5xX9eMSItA==
Date: Mon, 5 Jan 2026 09:21:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-cix-kernel-upstream@cixtech.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: cix: add OrangePi 6 Plus board
Message-ID: <20260105-excellent-uakari-of-joy-f0dfa4@quoll>
References: <20260104075400.1673101-1-gary.yang@cixtech.com>
 <20260104075400.1673101-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260104075400.1673101-2-gary.yang@cixtech.com>
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

On Sun, Jan 04, 2026 at 03:53:59PM +0800, Gary Yang wrote:
> OrangePi 6 Plus adopts CIX CD8180/CD8160 SoC, built-in 12-core 64-bit
> processor + NPU processor,integrated graphics processor, equipped with
> 16GB/32GB/64GB LPDDR5, and provides two M.2 KEY-M interfaces 2280 for NVMe
> SSD,as well as SPI FLASH and TF slots to meet the needs of fast read/write
> and high-capacity storage
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  Documentation/devicetree/bindings/arm/cix.yaml | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cix.yaml b/Documentation/devicetree/bindings/arm/cix.yaml
> index 114dab4bc4d2..9e132e609b7b 100644
> --- a/Documentation/devicetree/bindings/arm/cix.yaml
> +++ b/Documentation/devicetree/bindings/arm/cix.yaml
> @@ -16,9 +16,16 @@ properties:
>    compatible:
>      oneOf:
>  
> -      - description: Radxa Orion O6
> +      - description: Radxa Orion O6 board
>          items:
> -          - const: radxa,orion-o6
> +          - enum:
> +              - radxa,orion-o6
> +          - const: cix,sky1
> +
> +      - description: Xunlong orangepi 6 plus board
> +        items:
> +          - enum:
> +              - xunlong,orangepi-6-plus

Previous patch was correct, not this one.

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

Read last sentence and linked documentation. Where did you explain
ignoring/dropping my tag?

Best regards,
Krzysztof


