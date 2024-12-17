Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BFFE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n81rSOhSE8gZaGFCJlpF306MYAYe385T28sxK0KgWdM=; b=YZL74Mj6DCKtouQnd4XcHpOWeJ
	wgn8PkWcGL5gOm97/UBZWEVnbvn30ikU6nw/HlzXHPDqI/aRY0rq9M9XhBa5Kes9mnBaqO8XC8DUj
	P40hCqf/KguoMk3vMaUiEhGFUxTsLUd5s9yrO3mirFd8f0wtg/TXcWTvklzajw3DcK47CLJLSULgo
	uaFr6Ta7HNqlDZCHBI+0I9K8hdflFuRsjiUAeuLOuKaRPDkIRKkgicUzmAv2/zYPJw5xRanujlzr4
	5mdiSPXnGqTCHo8EXkMZ8r/ozOAIk9uGde3Mc17+QitFHL8wICoB3b4qGIY8jh30m1ue+ENw9lbYF
	hMssl+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSDc-0000000Cbmb-0Sr4;
	Tue, 17 Dec 2024 07:42:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSCP-0000000CbW8-0if3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 07:40:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A1D75C6233;
	Tue, 17 Dec 2024 07:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8690DC4CED3;
	Tue, 17 Dec 2024 07:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734421256;
	bh=qh5Rv3ZXcyqgzSC7cezcMXk4bK1CN2n8Om3V6cn9Eqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzaWEVm17jBCCgA6EawOmJaL13vCmwwYoDM8LchPQZRPjXJsEdki1DPL0LaVTOKOL
	 33lDiZl1cKjx/bvh8FTAuDG3IeAeyGJRXBP3HQYavNdwioH3e3/WwbNSfAKqerMer9
	 4AIbhD7o5TdQu3Ks7hBxOILpteYBgK3bufnSVx+xpQtef8O3vn0tl7PrbGL01CsReQ
	 /myqOsnKL2oIsxlKamz1YdFgT0g7dh9naLeA0wssLMpuQqS/2PmbV/qY483BZTLk9/
	 V06T6WZPxiVtU6WwGQY4tNzpw+JY/0bt5UnEb5pwhiCBeSXYr+OwVimrckSE4YkyT4
	 S5eInycqMSSig==
Date: Tue, 17 Dec 2024 08:40:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: media: imx219: Describe sensor address
 using the reg property
Message-ID: <6djxfcuroxlth2th3tpuesauhdnowatzgnyhesewjfz32v6gbz@q2dj7jsxiqlw>
References: <20241217024206.1700170-1-david@ixit.cz>
 <20241217024206.1700170-2-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217024206.1700170-2-david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_234057_248013_3F9BFA02 
X-CRM114-Status: GOOD (  12.04  )
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

On Mon, Dec 16, 2024 at 09:41:51PM -0500, David Heidelberg wrote:
> Use the reg property instead of text in the description.
> Drop useless description of reg property.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml

You are using non-standard tools to generate patches. See checkpatch
warnings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


