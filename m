Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDF0CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WNIymh5I65JBBGbBIllG1jh5S8T7CNa7Jh8Gca4JDg=; b=DPzQONGNxTLCJty5YG/fdXEnq2
	rL+ML2HMhJQ/zr9f6CRX9lB1mMh02UWTvbhHqXKYCmi7+NeCYrJ7nehcqIoyq4tUl7w0VB/w9+X1X
	7nDQXiJsGL1jYKR/Omk8xFhyAUuhNQog5kPVA0uIXmvYz6I2PuIAqCM2VwA2Ckpj2OOhnpgfqWJ2q
	Sn8nR1ndjwhBZeQTrLVbUXExll35b6C95RoEfHHNppfkvV2OHfurWZ77L96Y1Ak6+GVxm3h51c33q
	qF5YhscFUi4JEbJxHocf+5NqvXc62tJ220hlugkApFDjvKojyeXG6FjD63p5drROCADlhi5qs75RF
	kcFvB06Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLf4-00000006bko-31rF;
	Fri, 08 May 2026 13:54:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLf4-00000006bki-0cG9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B83A6024D;
	Fri,  8 May 2026 13:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DA2C2BCB8;
	Fri,  8 May 2026 13:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778248477;
	bh=srlY+7eHoA3ylnelbtfX75Z9BHySU4pqTIbELyZkBpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2uo1Untwl/EJOiBMHCTpgyPVJ255gJ+kCAZS3uGdIC2JBbTZNFlF2YLWsYE0gn35
	 OqAmp9flarz/4ruWvr/ggPoZ931zTuirKiePNjc0NAEtKVU8tjRg8WPLGgM9vhAt5I
	 P8+4E4AsDDn/HXcBuS/zicFr3BNuOCbT0xVb1Ml6RWaL+NN/b2k8YHU4KX8C2J30+B
	 epAh2e2AuPqA6Dz9sV67IXW1jN7ivmJQrEEN5EHtW3p4V1P6KG+pXaRjEwF1crQHZQ
	 cLGv+/R0Iuu58Cdow5xkgxTEDIT1/CZaiDJRl+w0KPhYYlFu4scZ98J8J3DCvvMHbe
	 hKHxmQCyM2a6Q==
Date: Fri, 8 May 2026 08:54:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Rembrandt <kernel@rembrandt.dev>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: arm: st,nomadik: Convert to DT schema
Message-ID: <177824847377.1216791.15448641946875128549.robh@kernel.org>
References: <20260507-dt-bindings-arm-st-nomadik-yaml-v2-1-8ab05d1cda96@rembrandt.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-dt-bindings-arm-st-nomadik-yaml-v2-1-8ab05d1cda96@rembrandt.dev>
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


On Thu, 07 May 2026 19:03:14 +0200, Andrew Rembrandt wrote:
> Convert the ST Nomadik boards binding from free-form text to DT schema.
> 
> The binding documents the Nomadik NHK15/USB-S8815 platform compatibles.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
> ---
> Changes since v1:
> - Replace 'oneOf'+'const' with 'enum'
> - Remove example node (per Conor Dooley's review - it had no corresponding node
>   in the relevant dts files)
> 
> Thanks to Conor Dooley, Rob Herring, & Linus Walleij for the reviews.
> ---
>  .../devicetree/bindings/arm/st,nomadik.yaml        | 23 +++++++++++++
>  .../devicetree/bindings/arm/ste-nomadik.txt        | 38 ----------------------
>  MAINTAINERS                                        |  2 +-
>  3 files changed, 24 insertions(+), 39 deletions(-)
> 

Applied, thanks!


