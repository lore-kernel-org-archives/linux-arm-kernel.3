Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1BAE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 09:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1BHxsyMEYj67/yOR3u3I3sTzaCTWyFqqZmVuR+S2hc=; b=1bdnITIlp9OhYzwMAEiVPKjN4c
	svPDCmuGDwE5Y+3C91F6alSj0In3thmnjZOb8MJkS9U/2xl1a/CeibQPeoDh9+al5to1MvAe3Ki0/
	2Lx9kVt+1bI211NnuEjOmapb3pcRCbvf+8aW24tBMRYzlqGyp51P1N2+4EUr0oLifqipEscsTnsoI
	6ImKO0D7RvBCzjOStwuBWxmk7VJlXjcQe3wEAll5yclSFpvM5X2dN0q1yDMKJXS9GzPwgqQWldRTr
	lZ0oVzTYak1gcI9jXTartxTWPYIZAGWkBTPeF38x9CDgx5X9Et10zDk7cRpHsfloE2v+cDWtcLgPw
	Zq2ojKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWXvX-00000000XDq-2G2K;
	Sat, 11 Jan 2025 09:37:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWXuJ-00000000X7W-2ikG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 09:35:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5CDB3A401D3;
	Sat, 11 Jan 2025 09:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFB7C4CED2;
	Sat, 11 Jan 2025 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736588150;
	bh=b1v5az9Rhjck/8X+15gw7h4MM9uVSzGc2DvIDCHaoPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VoT8UlOqW/eF6WkeivwAzK7CEJSWobEBtU7lQ+uojeo0Z2P74DrATmYQCWCcWw3Sd
	 2uL1S2pZhBOTj1AlVj2S6jZixHaCRlJAy5y2uFldByYRPvg3MGsb4oOL0kg8pe68Uz
	 I9U8aFI8exnV1VohPv5WKaLtoo33kFFT74/HobjSMZWFCbyEtZh0sjdJ+2h6pubaE8
	 Y3sZgQFaPJU5a1AZYZ9kuEoTVTBqWKN/Mnia8GaOg+SzQaCYegvktDgJEaNtP7geZP
	 AUm9+vurZ213pryTKQsqR1rlGvlZ1mk7O8d9mdVfZvVcolDDnLWrIPNANmd31ZRpKf
	 IaHpXVsQPfKnw==
Date: Sat, 11 Jan 2025 10:35:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: st,stm32-rcc: support spread
 spectrum clocking
Message-ID: <qz74fbq57yhhqywhge3fiqcbduias2hib7rmpyieoylass4ei6@tee6nwzl4lto>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
 <20250109211908.1553072-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109211908.1553072-3-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_013551_761156_335DC806 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 09, 2025 at 10:18:29PM +0100, Dario Binacchi wrote:
> The addition of DT bindings for enabling and tuning spread spectrum
> clocking generation is available only for the main PLL of stm32f{4,7}
> platforms.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


