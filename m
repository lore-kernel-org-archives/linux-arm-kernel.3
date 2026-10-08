Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D967BCA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 20:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+LU+BOjw6joWkwdZzQGP7qJ8+C8nKCj6V+2fuOth18=; b=yUMH9eLBKUqJvvCj9Fsb+XRNne
	L8t/8Dxy91rEKNxyOM2T5v3zks17cmtyHTmYQGann1+oH1oz92fXaYfTBe6Yrz2eLdtOh38yTENMm
	WIo7dLHs30CJGj724H7gkGGMrhjtv6g5P1/Essn4BlUguxkyPPK0BGxDnJEdhpo+rUK+xvKtSjS9g
	NMcFdSiBaK21bUqglAg6EWAh5cznTXTeLbqU8HQv12xZXyXZtqQ2hE/fKmYf5QvgIN0Yzf50qdX9p
	+bdOGnrj5hdQuTIl5rNwH2QxmXS60LyUeulykRqc4oBPcKHhHWfetWYthF381AN1/wNcOjZ2KaGDt
	7PIpHSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuSt-00000004zu1-3Lj9;
	Thu, 08 Oct 2026 20:11:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuSt-00000004ztv-01QL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 20:11:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BEFF540936;
	Thu,  8 Oct 2026 20:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580B71F000FF;
	Thu,  8 Oct 2026 20:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791490302;
	bh=y+LU+BOjw6joWkwdZzQGP7qJ8+C8nKCj6V+2fuOth18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KeTtrcrXmy6M3X83s/POX9CQL0Qq2E5dCx5gJ+yf5ZEqN/XzjyjJGqfRmkv9DE+A7
	 n2shM8wlo6l4bIhsnvgykme6qI0WlpNNodant9s7JNRLICaFuj+GCKfSpZmM05gFwz
	 egPXHjKXG5iDcVuSUOzSbEZU+c6K7pAHZluRIQ3HA0pQRotDoRWlGhibcCGFzJIZBj
	 8jMyZWo2chnukWoggP6uyr5Z0fWK8IlMmiB91umqMJRnBgZyps89fU53W26+W7wVvr
	 4FHsCRAl4kvr4pKoMl91b7A0v8ujIGi9FgWFRsVCrMr08gWaEsKyZwR6IFws9aao6y
	 xGraP3PpUhznw==
Date: Thu, 8 Oct 2026 15:11:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: reset: Drop obsolete STM32(MP1) RCC bindings
Message-ID: <179149030098.984968.1748859910250860413.robh@kernel.org>
References: <20261002171412.2716314-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002171412.2716314-1-robh@kernel.org>
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


On Fri, 02 Oct 2026 12:14:10 -0500, Rob Herring (Arm) wrote:
> The STM32 RCC bindings are replaced with schemas already. Drop the
> obsolete .txt bindings.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/reset/st,stm32-rcc.txt    | 6 ------
>  Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt | 6 ------
>  2 files changed, 12 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
>  delete mode 100644 Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt
> 

Applied, thanks!


