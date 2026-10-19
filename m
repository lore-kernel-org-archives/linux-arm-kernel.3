Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D737DCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p193/eXdAlpEtyVeP9Mx6DfUR9LJvk6PjfiJHNyehUs=; b=BiDz4rnCTx5C87RyPUuP4BNlnZ
	yxpN4hHvnoc2J/mnzsOh4faft5kugHkGYRZvVfF9enTuOfvOMUdW2u2GhYkYNrpBZg7HiWN5PU00l
	h9kamD5HyAynf9SjTD6pDufiCWWyCSTMv+pGXXIcRQ3pHczgw2KPHOjaVwU2qcDAi7uE/rL0K+ZQt
	S4O83ppf9gaRg7SC8OQpRyG9468g589ldHDewcbJFGOLkhHeO8VCOBmizBGGLGVV4WJSH/7HK69Ha
	lC8n61yFeAfWzAcy5hSO9i/AAGoRXot7QAgqOm12mre8RhCpBCofFseu73LnRndJc8LsvNCEmlW+J
	F12zIsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjRV-00000006yBW-1TNJ;
	Mon, 19 Oct 2026 09:14:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjRT-00000006yAo-2klG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:14:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2779940E43;
	Mon, 19 Oct 2026 09:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3641F000C5;
	Mon, 19 Oct 2026 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792401243;
	bh=p193/eXdAlpEtyVeP9Mx6DfUR9LJvk6PjfiJHNyehUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B36kJOtWjlEI2DFQu7ZOHAK8nVedVl3ufY729WsU7kCBUl5lWX6ao/0kN9ifxnwii
	 fMXtzCaXm4ugTlc5B+WeLqbgr/9t5D8hadTxTECh+h1aUX0jxM35XJ6iadjbxFaxuX
	 pbpUsOdC2m0DeThHEp7OYR3YBFOVHZ6TvzERNwf9XjEez1UTMXg+r7+D/tAbopHg+2
	 U6l20LwGnHAKpUiVgLc6YCXOJTf084FOQJgVcTKI+WBNaTOSEPUUZpkWR2unf+kXeZ
	 zQyvzSM4t0oFIXNJSg8QWKamAom9bL0L29NOsWYw00/pMT7+j7KmwMhLWNhAFngOBJ
	 eZtQ15hFk/AsQ==
Date: Mon, 19 Oct 2026 11:14:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iommu: apple,sart: Add apple,t6050-sart
 compatible
Message-ID: <20261019-terrific-attractive-goose-d375b1@quoll>
References: <20261018-apple-sartv4-v1-0-1eaa5d63f6a2@cyberchaos.dev>
 <20261018-apple-sartv4-v1-1-1eaa5d63f6a2@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261018-apple-sartv4-v1-1-1eaa5d63f6a2@cyberchaos.dev>
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

On Sun, Oct 18, 2026 at 06:38:10PM +0200, Yureka Lilian wrote:
> The SART4 is on Apple M5 Pro/Max (t6050) SoCs. It has 50% more entries
> than its SART3 predecessor and is otherwise the same.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/iommu/apple,sart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


