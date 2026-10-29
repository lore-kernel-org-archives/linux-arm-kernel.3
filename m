Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F0A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lOUyUnFs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzkRbN1A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZrDU5unb+/T4yF2u2+zJeMQA2Fa/YM0sDkOzIuNIOD8=; b=lOUyUnFsOy+bGQonBiTeL/zYKI
	pkZ2kId6OGurHzwYzThqd1J9DcuvhEjfyMrpxIIyVwiMb5QXLRp6Sd2zHhoQcTOWkUDBGaSz0cSIC
	16z6oqrzBot8WL0uiBoykoQzfQxUI9yVCHnsXP0ExmhP6Mf9HnBbeBNcDfSBo9sTQEvlprG86Yfis
	O6hMLjJQRlhHpQLW+JgtBRbq2nDwUssNE9EbMgqRKJjcsetY9iPTx8lvUdokZ++ifIqr7/ddIhDR6
	sI0Lw17arDqzwkliLbGRvV2cBOxmoJZBNU/1mxttEk7k5xlbO2IXlSJLTPFvjgipldTwygGq8HQ0q
	95VjLCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMnJ-00000008tVL-34Uy;
	Thu, 29 Oct 2026 09:51:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMnI-00000008tVA-2bob
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:51:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 81115600D1;
	Thu, 29 Oct 2026 09:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E2F1F01825;
	Thu, 29 Oct 2026 09:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793267495;
	bh=ZrDU5unb+/T4yF2u2+zJeMQA2Fa/YM0sDkOzIuNIOD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RzkRbN1AQOWsju/INxyeR8LepG3KPjEBLYl3lBkWKEx2Bj68VKmlGk9BCrLscuSw/
	 IXQyyN/JH/ysxLkEeJKrjl2b3M6Z5jbKI/4tRexgXL4sdjiydl4sy6G7Pf/TB24IEs
	 P+rCGFvW1hhELvxhX8T+eNzmW8EJmtzzp7HBzq8ZfQ4XEfsXxoV+UgDQnEci+qIb7q
	 mCRlBaUGKyCHIFIDk60BuuYk5kL9IMO8VFmsR1AdBoOHAeYBY+810O0KsCg6mo6zAO
	 gt/9T2+K9UEoUKfiqPaipA7YVCqNR+ct37oXxxpnaDAwPv14cnuIKkzKzlI5unzeT6
	 e7sWNVgI0Hbjg==
Date: Thu, 29 Oct 2026 10:51:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add NVIDIA MGX Vera C2 BMC
Message-ID: <20261029-camouflaged-enchanted-mushroom-d447ef@quoll>
References: <cover.1793243187.git.jackyhuang@nvidia.com>
 <ed348a94c9432eeea53f50448a61d93f99de7821.1793243187.git.jackyhuang@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ed348a94c9432eeea53f50448a61d93f99de7821.1793243187.git.jackyhuang@nvidia.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 01:58:07PM +0900, Jacky Huang wrote:
> Add the board compatible for the NVIDIA MGX Vera C2 BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


