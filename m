Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF123E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 17:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pb4GBhKQiAPeI5WQISI+V799wMN7xGf8Ayu3es8NaR0=; b=qcvCbj6a4V+3iVZZzC/ZcE2rmc
	uJsG5bxhC27i0g1LNfHzhswFXuquLNy2XHg25JhEwA2XAld8xws+WckS7PTUrx0Mmes3MDOurQmGc
	cAuGdfEaJD1xSlVTgz1rq3yEMu5MvDOsSDyI5szy1aL+hwAZO5o3sg8a/jA+ze0yjcLS+Q+PewntL
	L+NA3148loHdXAB+9IEfyYVXzz2O10zbyDtN9shDMhhiRIn4AE46NYYxg5h70/828zz3YLqUSsRAk
	+ZLD5UT8kxkht+w6OcHNqjTY6loY3OlBw4yJCzXemfyTrucAT5F3KeHUvLJreiIaHwTTyM4sjPKBN
	hfGnKJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWITw-0000000GN7y-26p1;
	Fri, 10 Jan 2025 17:07:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWH8K-0000000G1Wj-1weR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 15:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Pb4GBhKQiAPeI5WQISI+V799wMN7xGf8Ayu3es8NaR0=; b=ltbbMziw5Jih2uuUkO3UwPe94+
	NOqTyDW8utfRm9uU2OALS4tGjru+uS6TQ4yoNFvKXcsZRUNS7QhOZTJE4127v9d5Y0/puXn47NG9V
	OSx96UbU3Q6Ps1R1N9zEJBlodqGSCcnstCxKHPEasopKikaxelMxtNKINHUUg9Z2z0qQlNooQQWOK
	PgId6p6FPy4UHf4E/pzEGRNW5vDuAhgwb/1pR0ISlE9m7FrxvROQka3IZw5bii3qQPsJ0s1KpQeYk
	/gvIpZ3L8uI3gSAzWTTn9Brl7QF+ps5rjdLXk/Qt7hEugj8cg2Zikc9SqSvt8nprLingqB7JqvPOw
	tyXtmYxg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWH8H-00000009pWE-1auZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:41:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 88D6BA4255A;
	Fri, 10 Jan 2025 15:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB2CC4CED6;
	Fri, 10 Jan 2025 15:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523665;
	bh=Fz1hdRpMSaNxgYitNuIdWW/Q+HmiuFoLhZClbSqU+5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=csOH5GaBLGUkXLKqbMmlyMLCK4kS4AsqClm5SXDSSpcYTDUl+H+BW3QLqllLG1+9v
	 OLo1qD2zhk7rZajbRe2JsURbMwozC+vTIE1OAhub5uB1RjgVhNLdFmLwCF4vDVV8nw
	 bkr4IxHePQQuHodzG20XM+hzgTXfy4FUka3w+4tGvP/o91CQkEaZhWfREz/G/bB+Vi
	 fyZ3XaXFIPo5CXaJLHor9MiEanT2tz4OBSpK2t5YrIGP9bbCHrRkoDkg6qmhAqAU+q
	 +KotOiCSZWSvh8wKgkTcTLwff4zmlyOXEtikAZH04E6jMpe2sOWBRPVx3QWZeyXQIn
	 ptpCQRdVEI7Mw==
Date: Fri, 10 Jan 2025 09:41:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: Correct indentation and style in
 DTS example
Message-ID: <173652366373.2919481.16688678408505042633.robh@kernel.org>
References: <20250107125836.225447-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107125836.225447-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_154109_706662_289DDDA5 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-gpio@vger.kernel.org, TY Chang <tychang@realtek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Krishna Potthuri <sai.krishna.potthuri@amd.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Tue, 07 Jan 2025 13:58:34 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../pinctrl/atmel,at91rm9200-pinctrl.yaml     | 64 +++++++++----------
>  .../pinctrl/realtek,rtd1315e-pinctrl.yaml     | 50 +++++++--------
>  .../pinctrl/realtek,rtd1319d-pinctrl.yaml     | 50 +++++++--------
>  .../pinctrl/realtek,rtd1619b-pinctrl.yaml     | 50 +++++++--------
>  .../bindings/pinctrl/xlnx,pinctrl-zynq.yaml   | 53 +++++++--------
>  5 files changed, 130 insertions(+), 137 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


