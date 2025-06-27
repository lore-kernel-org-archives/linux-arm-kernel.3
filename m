Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4BCC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXhFhQI+iaSZ0sHJkSQtYhbB0e7RvLP0R0qt3uhrJyw=; b=vo2hZEPdoDztEqpZelzyGsvviO
	3nbbdv5kX4x9d/crMy5eaxPdWCYUsiq9KDxDPKBG1RMDRtqakOU22ROU4bR84vbYvS28+hDqQjJtm
	S6UkaOkjrGMuEIyn78DflsWF43hbHN3/egI/Fmh7iYg/uGUVZ7VaM5hiB1c7e9Eta2Ekre5XDakN7
	U1oylYiVxTdFcJujAc0uLNBQnrdU0YURyMLmUaVXrI/Pm76JqwWNGynlGjPzDgHW8S5ysrCBliaYf
	cUyGeB98kPa9YQ1R86o3RKLiS4Me8f6cMbuyGlBiIWOlBzBoRBPkiCuuEiD5mpw+3qErFasEVRy1P
	+dfr2UKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGhn-0000000FrWb-3H0k;
	Fri, 27 Jun 2025 21:33:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGXE-0000000FqHI-3EuC;
	Fri, 27 Jun 2025 21:23:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13DF643FDD;
	Fri, 27 Jun 2025 21:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD704C4CEE3;
	Fri, 27 Jun 2025 21:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059379;
	bh=4kv5wxyDcd8ccxR2sHbhKnL/yZ6+0PwtOkGdcdzU23Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVbXRiBaKTezjZCqKRnYofdLdMXAHITbVsU4vgkWepM7Jz1xr2LC5z2GWcbxnAhOt
	 P5aP7fqWMcFrNSh1zXxe94Tb3YqnXUuJFPxEa+j0fXKf/l5ZT20A0PUfyVe4TPmPpo
	 vi44C3dTa4O3yf7RrjPYn+qZnIhKixfgX0UwsykhEfL95g+98OEGL59iYBpv+/EGxW
	 tSRtKuXhARnTZlvBUlio3k7wCsQICKsIt5Xcz/8rgoz6cu04skDq11LIHL69ERJeVK
	 kd97wIPH/Em6sO6QixfTDDHctWcOaXNbUAYpelxdp6DupvoSbUb1iW/hT3wl729PSV
	 WrYuCXuUm3L5w==
Date: Fri, 27 Jun 2025 16:22:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v2 04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT6572
Message-ID: <175105937841.166232.1267784883426829813.robh@kernel.org>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-4-f7f842196986@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-4-f7f842196986@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_142300_827757_7395E77C 
X-CRM114-Status: UNSURE (   9.62  )
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


On Thu, 26 Jun 2025 11:53:57 +0300, Max Shevchenko wrote:
> Add a compatible string for watchdog on the MT6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


