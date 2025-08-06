Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB766C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 22:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiiOqrbkdt3NLMNGsRhhrNrl23fQHtWGUefYxHbpEUM=; b=tYnVkW86U5DXI2fVaRHGnhxKoP
	LaLhDkB4gw5tifB+6C0ZK5YawinV8ZSKDxD5AuO7Mdw2xKUNPWQ7vlYxcSaFZNN879/eulcDBbOiK
	j+AjtOEPuNcTHaIHyKg7GNujzP1BzTIlpGZ0lZh9mkcTk3zY78n+fOGZ7CDMPdPTlgNVM5ogrAYLV
	gHH5XQeVlXDAc+UiY1GaNY2Hx0O104qfq1Je1aZlIYkeOXCPmpb0Q/xwf2mL/nug3X52U5d/umCi0
	RP9N29pz5Tv67h1N7fP7YNDVKIRDjjCO+3YG3JpzM6ORVDWL096kOQPxXLWoMf1baHsDC4o+CXi7B
	whC/MLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujn0i-0000000Gm0Z-2K88;
	Wed, 06 Aug 2025 22:53:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmyC-0000000GlmQ-05YT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 22:50:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7342C5C647B;
	Wed,  6 Aug 2025 22:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FF1C4CEE7;
	Wed,  6 Aug 2025 22:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754520650;
	bh=0htdjNPNPdzGzjMhGpQX8V87ZFII00k24mLzTLTKnpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDacCk6snBl8QDqlAR9ane7golm9rrHSdETUfmWpFrP4VMfWrbuK2435QVlFLbQa+
	 l4s5psdijSZXtyk2zc5uNwJWOLTWwdS2FmkI0WRXpqiikzX7g+GjDFPRDiquUNHtMt
	 lpcdEg+e7yw64MJ40GvxikZ3PuDkZeKyrwnJKQy5ns51uAZmAZ8LNpcxsDlFSCeMCu
	 hj1X0QPCDkXqEVRYQ4olGhnBjid21fwbGeQEL+kD6sQiSxzESBXiPaTHaAQSZUnfMg
	 QGknng8YemxZ+KZF8WUlBQpIyHCl50UgwsUWjfyfYHrhRPtCTygmhHqLL8mChHZYIK
	 /JAP9C9EDpZ9g==
Date: Wed, 6 Aug 2025 17:50:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Spell out acronym
Message-ID: <175452064842.1957690.10043655787626564623.robh@kernel.org>
References: <20250806-aem-dt-bind-v1-1-d14676dfb027@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-aem-dt-bind-v1-1-d14676dfb027@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_155052_103113_7DC7D47C 
X-CRM114-Status: GOOD (  13.00  )
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


On Wed, 06 Aug 2025 01:03:08 +0200, Linus Walleij wrote:
> When I authored these bindings I had no idea what "AEM" stood
> for. Now I know: it means "Architecture Envelope Model".
> Detail this in the bindings.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Maybe this can be applied directly to the bindings tree, I don't
> changed this document much.
> ---
>  Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Applied, thanks!


