Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2BFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKEsNOedviw9g/4cQlmclfv8VVYF3FHxpuZoJOIlKeg=; b=4Ypn4A5Q3ZgtgN4H2ZfsXWOmli
	G2WalzzJyRx8su/9N/zyJCImyqTxaO862Wz1rzIMVM0vut89PKhFEMfxhG3xEMk2Ine+Y/Q2tYkw6
	NNUrC/U37fE2BuFGaxyK+ZcjhnKUns8DbpTPBwMj2QZ8pzR7qNOQWL6w2eRi6etv/cjJDYWEN/p0J
	nommmR20PdARY4JGUq755QUDXLxoG/539r9fpYhons3xwI2okafXEUF1YvIypOw5d3qYI7O1QnntW
	AA4KKsJMcxFKZJ5zyrv0X+Vrfw9tI4267ytFaYsoaJIG9KR17gScqCwIJjhnOA+JV3yMCrjERE7Ja
	iJ2HpEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaZW-00000006WTR-0QpV;
	Fri, 03 Jul 2026 09:52:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaZV-00000006WT0-0hbh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 09:52:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79F1543C74;
	Fri,  3 Jul 2026 09:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E3F1F000E9;
	Fri,  3 Jul 2026 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072352;
	bh=GKEsNOedviw9g/4cQlmclfv8VVYF3FHxpuZoJOIlKeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xcv7NoB9dWDICdJH7Zmx1qdxndTSrCEdI5rFcOUWYAeyLCTvqi7Bh2XZLgBb7VAqs
	 loylffvgv5wbLH/csdbg/lZ2dLeOWGi1MnY/p6y6PEuboKaEifao0IaXfkpE36seh4
	 4l/CkYblQwGC6PyXsvXHVqn0rnYWIsgnbDQ0UZYwxKqP9CsQQMBs5bDG+WXMF6rVrx
	 S6hcecZD8fgXaBOy/ahwWrorBeYT8SwOA+svrqIwlUE01VSIqPwaDyPQWjZtIxw2Iz
	 qVEgZbXZ9WaN7UHXq+AeCOS1VJe9jCe/A05VA92F1b7uA5vF0NXNBzSytOzbjMm/yr
	 p+5knsIq9hJkA==
Date: Fri, 3 Jul 2026 11:52:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR-NVL BMC
Message-ID: <20260703-prodigious-coyote-of-culture-11ddcb@quoll>
References: <20260702165524.2168091-1-jackyhuang@nvidia.com>
 <20260702165524.2168091-2-jackyhuang@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702165524.2168091-2-jackyhuang@nvidia.com>
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

On Fri, Jul 03, 2026 at 01:55:23AM +0900, Jacky Huang wrote:
> Add NVIDIA's VR-NVL BMC board compatible.
> 
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


