Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C50BE6C611
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZsL3ESWMbWCh8ufrY9iIQ/+JVUnWGgaBWqrrz5gGE8=; b=uUuQGK5NOrgUTjnM6NkKavjJQZ
	SqsxV6b3bHHwh7v1QCw9iHPFuNYtE65x3ZFEwnaiW0OvUvGkzqcUMbxIVDguuXJ4HL3fPewf4a28k
	Vtw3w4fRTkfJSz4/5lYrjhq+/QBuG3Mpb+AcaoEYYuijlNtbXbwKligx55phv/JEfixIvMgYznhBo
	b38SbYxjCnB0HDYRyN6viJHPyHnLElSu+Wyq8IfKDSwig2b8wL0ccTv06taADy7H1VZ902OJd8jNS
	NSGwwf8qJIHjlb/8XtXifCHSXOriJHKiMH3EsTm5KtqCTV2ZO7QPaZ3H54xuyZk7JZVTlEix8QE6G
	7mMkaUJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINat-00000008Z3g-2jv2;
	Tue, 03 Dec 2024 07:45:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINZX-00000008YjI-3piJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 07:43:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 74F9B5C6206;
	Tue,  3 Dec 2024 07:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F77C4CECF;
	Tue,  3 Dec 2024 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733211830;
	bh=NLJFoTMl+PMuvhemePqgps/gm+iFwkpLmsMRB5c8y7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mtxX53S3rIBlOPBSOKc4Jeg7IRXlUMF5Dy6/OfQ4rO3AFFH118cM0oGCg1FiM+T2X
	 ylYZmqnpyCX4BTzqXN6K25MJJBBVnkw1wGxhzEmp6vLt7E6HsHyENLD+yPzzSvb3uR
	 zqQ6K2iVZqBLuoHGjs6zMQia6xOT64TVJu36WnWSEA8WgRuiWLRPu8WDbVKwLUTsoW
	 rdUMmEI3Ji5pN0JbelWrEbC7/WeV486yH80DyUNB7OY7jqDk0/PmbV2J15v5oWKJH4
	 o/+A5u5Z9fnufOSKgx0yf8Fo0spSGer7Krubk+kjabJp24szAgDfsbPGpkp2/0rmzF
	 fVERHW2RyUw1Q==
Date: Tue, 3 Dec 2024 08:43:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: soc: renesas: Document R8A779G3 White
 Hawk Single
Message-ID: <u7xrrqfnt5wbl5itftm4ibo63jbjcek2nzz33csmidkc4vynuq@ep2thd5dnkok>
References: <cover.1733156661.git.geert+renesas@glider.be>
 <1d2d2a6cbf31c817f574f6eed310a960e6175afe.1733156661.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1d2d2a6cbf31c817f574f6eed310a960e6175afe.1733156661.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_234351_994974_E8C36DF0 
X-CRM114-Status: GOOD (  10.42  )
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

On Mon, Dec 02, 2024 at 05:30:08PM +0100, Geert Uytterhoeven wrote:
> Document the compatible value for the Renesas R-Car V4H ES3.0
> (R8A779G3) SoC, as used on the Renesas White Hawk Single board.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/soc/renesas/renesas.yaml          | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


