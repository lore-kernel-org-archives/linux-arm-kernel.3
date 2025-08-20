Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DC6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPCTC9CXSTrenrcvtsQbRyR3qoBX4/LGSNG5AWGY/qE=; b=gbZzxBEa8AOvw9NFdMSsZEKeDF
	amfvG0Wc6KtuExwycIVMccIe0/44joN+b/SS2yjlVUQuqGM1fsuhX1/vkNkQdbHZRPdWm0QFcxakp
	k1inUU/GuaNRM9xln/VTDwBSkzVs4UEeLIiIMUMNPL60d8+OJ3KAReDtss1+5LkWnH77IvWT6CaJ2
	gqs45Y680mkw2SPd2g1K7L5uRDu7JxC+a/jlQ3b97hXW/D3Xzc7oJ6YBUERyPJpBy8ODODCtWGnPW
	2OCEjjTg/uTMAHX/1h9ttGMruVcpEJBeqHd4exjWCX9N64DMFt4fx59MgTbl9/mJ6becPyjv9fQ8w
	p8raB38g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosz4-0000000FI7E-3nYx;
	Thu, 21 Aug 2025 00:16:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoo9N-0000000EkD4-38xM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 19:07:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D42A5C3646;
	Wed, 20 Aug 2025 19:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2001C4CEE7;
	Wed, 20 Aug 2025 19:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755716828;
	bh=PLodxzCvgqaYbD8M4yslfd7XA3TXl3CKdavXZrRjThM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hD15oUwaW6gmjcX44pRkEjMfF/K6uiXmGaPRvOHub4nK3iodX7cBdkQoIEUk0S/N4
	 W8GZLUtInWU+x/PpwLwW46YK2vjZ04RTmWzOuB9/T9IGhp5U8D5CH4kJ6xZB4D3hvG
	 fEbYjVCgCM0qySVhbYNw1c/LcOjDgdg2GYNLq45O0zlZFcSovcK5QM7Oc4RYwQlbUu
	 biZ78Fsllhxqdw3/mQ99HGUFshxgbhmm8BNsv9b4DRmPNsqZfwIH07+Ln9PtpyRkSw
	 OqKwbEK0DxqkabkNGKX8ab/wzd4Tq+b9dNEi3bJ01z6z4gvHvPmRIU6xRDNaO0DqgF
	 KaMTYYnThKlaQ==
Date: Wed, 20 Aug 2025 14:07:08 -0500
From: Rob Herring <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: apple: Add t8112 j415 compatible
Message-ID: <20250820190708.GA538860-robh@kernel.org>
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
 <20250813-apple-dt-sync-6-17-v1-4-209f15d10aa0@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-apple-dt-sync-6-17-v1-4-209f15d10aa0@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_120709_829240_F167E96F 
X-CRM114-Status: GOOD (  14.00  )
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

On Wed, Aug 13, 2025 at 11:53:36AM +0200, Janne Grunau wrote:
> This adds the "apple,j415" (MacBook Air (15-inch, M2, 2023) to the
> apple,t8112 platform.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/arm/apple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
> index da60e9de1cfbd0151e973c3aafba6d0880fc21aa..3b90b5df60507b245de387de104a4e64f234139a 100644
> --- a/Documentation/devicetree/bindings/arm/apple.yaml
> +++ b/Documentation/devicetree/bindings/arm/apple.yaml
> @@ -93,6 +93,7 @@ description: |
>  
>    - MacBook Air (M2, 2022)
>    - MacBook Pro (13-inch, M2, 2022)
> +  - MacBook Pro (15-inch, M2, 2023)

s/Pro/Air/?

>    - Mac mini (M2, 2023)
>  
>    And devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
> @@ -279,6 +280,7 @@ properties:
>          items:
>            - enum:
>                - apple,j413 # MacBook Air (M2, 2022)
> +              - apple,j415 # MacBook Air (M2, 2023)
>                - apple,j473 # Mac mini (M2, 2023)
>                - apple,j493 # MacBook Pro (13-inch, M2, 2022)
>            - const: apple,t8112
> 
> -- 
> 2.50.1
> 

