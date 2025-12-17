Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978AED64091
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fnf3v0/RcfYCtgNgUQXFXgTzuA8E+WpohrFNjCsOkBA=; b=21dKB7CleTnXyGI3zRpPnfGcSr
	fx6g14F33FpD5TimRqVenYY/6JE9w9ydlAOs55nRBm2uBzPkRsTr5yR68fBeC7Bu5dfKik//20k2b
	SkSNcjeQy/HZwk66jwnKsBvYfb91DhCB8RgByIz+03LfHcD04I92PfJGGVZ4otpRvbpc61CjFe4VA
	7klBJ0RhASysLbx9kWUIQFO32o6hVn7kJfZXOAWb5cwner+kHObCLYXVjVGN2LyIzTdAxaf8uFRBp
	ysnbRRKt1ATLj70SoEMxIIxPSmXzklMOBgtJ39SU3gwePTf5HgqldYlydXir3fzcD+f6lnlhHB5mO
	yVuxWDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVn47-00000006Max-26pb;
	Wed, 17 Dec 2025 08:39:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVn46-00000006Maq-3KHa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:39:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD96F6018E;
	Wed, 17 Dec 2025 08:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1016CC4CEF5;
	Wed, 17 Dec 2025 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960761;
	bh=P1/AuVYmxD5Hc7VivtWTqrUgU3GCgwxZ6VxvvVURvEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RR3WUVhihr6Jgvo/DDzh/2DLXMO1r7qMT4yZ+O367/+F08RxAAMch2EUAeNgndaoM
	 xYYqXCYdIImjEBKdimX+YPl+anPqY9mXT2R8mURlyyEHPFVfB35AKDf/GAo7Cx0Um3
	 TRkEl74aCpA/YliDb24TDQl3CNhjhKLn21eqs5DK4Fkd+3AK5DQPSgG5EolNqHPLvT
	 tBaA5Gd3QVQXaV3+OgaN/KrcIGym/+PlwW2SaobWRpOK65bVdgWKAkVjCMJTUdRqqu
	 9E84GgEbenm3v/P6fdAEgNxXPL8KIkC+L8gOQwRwRO5P6CcTdrRCOTGe20Ch100e4t
	 bIKeQGko5V5Nw==
Date: Wed, 17 Dec 2025 09:39:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: st,stm32-i2c: add 'power-domains'
 property
Message-ID: <20251217-realistic-pug-of-glory-dd4fb1@quoll>
References: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
 <20251215-stm32-i2c-mp2x-dt-updates-v1-1-2738a05a7af8@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215-stm32-i2c-mp2x-dt-updates-v1-1-2738a05a7af8@foss.st.com>
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

On Mon, Dec 15, 2025 at 01:19:40PM +0100, Alain Volmat wrote:
> STM32 I2C may be in a power domain which is the case for the STM32MP2x
> based boards. Allow a single 'power-domains' entry for STM32 I2C.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


