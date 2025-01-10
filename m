Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9850BE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJxwM3WLpwpOdwtGqbX4sAm2IOUfoTLER9LnPrwAEXI=; b=exFs3MZj1JlT9dCQuYXNki68u2
	aKiCC/mUzmLikUZdkSioXuqpUDerIAPPPgHO/KxqKdkwgasyB9HmuvjSyTZfN2AIiqmFAUqE5pCu7
	prifrr/bwi71VMDGbawDYpxtgiIS3SmG49y+ZmNH2YW0klIBFbl3nMT46z/gwxd42FbODgy5/DvYM
	X+iYQce25igqLdUxgPPpEsSTO1WfUh9cOS5/soaIQzMCsVOZq1xU4XtqNC1/vlwIxn2tPHMdqYBUz
	bXSsGKveU26PPIP1KjVffFTO6RHCtHdl/fZylDKDviS8wJQASTBSOZcNhjBUJNQkAx6Cd+s7DNuvX
	b/k/IVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHcS-0000000GAZN-2BQX;
	Fri, 10 Jan 2025 16:12:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHDB-0000000G4Fb-3FwP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:46:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 88B37A4256C;
	Fri, 10 Jan 2025 15:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827ECC4CED6;
	Fri, 10 Jan 2025 15:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523972;
	bh=/8GMOElXMtMIbUyIggey7sDVja7GADbZTVd1RMjScU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLjryIoICBCAn4RWSOXPvWcJrcEziG7VuEmgqNLSTnzguoARMzsN5z4j3pH2Liah+
	 L3eea5ZhoLjrE7Jt/KeGQuUdbwP+xGF7Q+zIoAndLGfJfM3UhqL+BRil4GtuBVHjdz
	 NZieh7PDa9+c266ZiU0cJDhwdIzozt3GlmmG7rQVMNURbwTYUjnhZuBh+qi1djIVjK
	 M+HvBkvfj2RGjy9pVdtynM8Y+T8yclKi/xDjSTBsqxQ2Hhu2nMWfVuK1ETISpXcP55
	 6ETfoUAwwkDMqAxxRFesCEizq7CC5jLB0bLqGoI9gJ9lardbnq+Nk5ozzbbDfGLKl3
	 5ZKg08qvwh/QQ==
Date: Fri, 10 Jan 2025 09:46:11 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Correct indentation
 and style in DTS example
Message-ID: <173652396977.2926418.10522811816537772235.robh@kernel.org>
References: <20250107131108.246898-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107131108.246898-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_074613_879061_20A02AF1 
X-CRM114-Status: GOOD (  11.17  )
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


On Tue, 07 Jan 2025 14:11:08 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../aspeed,ast2400-vic.yaml                   | 10 +++----
>  .../brcm,bcm7120-l2-intc.yaml                 | 30 +++++++++----------
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 

Applied, thanks!


