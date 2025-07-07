Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D0BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSFBwZRF5fKpWkm4EIaVmpGIkE7mwsSJdwwm+9eiVeo=; b=0fTmCX9+TOAx3WrW9zlWUnXsAD
	w4o8WUIgjZRhCMVHwdb731RtPiCAgipf7M5N1V73UAY+iS+T9LALjdgo6/yHhbO2XQ2wls/pkJIlj
	gD1ZLoN5BVhbiph+dnNN7G28r/2aluIcgocP712cuoyzIS+DopdnG8+K6+zHOoHtHbYmYRaQ7Aw2g
	OJ2EerZtrEykHPe2uFiF68yGsUwB6S41hRQfDhVO2hfAuOylpZjXw38ZCbkCklXSicljL0YawIIvN
	o/z1cEciGW4HtZHUpV0TJP6D/17l8ASf3hS8clzBcuXpODjnQzvDiWrOFyGJESVrfjlxR5R08Zmai
	myeS/PdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfHy-00000001Xvg-0O6T;
	Mon, 07 Jul 2025 06:25:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYf9z-00000001WXz-0XEj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 06:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94B415C5904;
	Mon,  7 Jul 2025 06:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05F3C4CEE3;
	Mon,  7 Jul 2025 06:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751869022;
	bh=lhxzKPvMbvLCdIvBc3l1/2og+QLpTeNSU1qnRGsO/28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1CXJdEF4a9dZcgWl/ng2pagMHreJKakjs7JulyaC9OKRFjLhJlQTHKdFQ+dtZhvb
	 ubNvVWBvatb6Fz99PyHlhciLgozjrH+DjsUkNM21pMjkjFqIm88gNb5o9i0uQDGVFE
	 f5ZuRCnOgOe927KPZDm1ShrrvM/xTVJ2JN+Cis+FDA9VFzGIOWZmR5rj6FwtOfbW9Q
	 m0BBE5A5z4VPTQc6Pft28zjU7qy1sqyISET0lsM47ayIhSstowBWQZ8lQEjcG5RsU1
	 HnZpYYs2C2v148MY9FKiwe6CH9n2ckxLboYfDyNfGWKZvHoHycB+a4tmi0krOxgKpt
	 GhAlI3htgkS+w==
Date: Mon, 7 Jul 2025 08:16:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mo Elbadry <elbadrym@google.com>, Rom Lemarchand <romlem@google.com>, 
	William Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>, wthai@nvidia.com, 
	leohu@nvidia.com, dkodihalli@nvidia.com, spuranik@nvidia.com
Subject: Re: [PATCH v11 1/3] dt-bindings: clock: ast2700: modify soc0/1 clock
 define
Message-ID: <20250707-spectacular-platinum-hippo-9ab32e@krzk-bin>
References: <20250707011826.3719229-1-ryan_chen@aspeedtech.com>
 <20250707011826.3719229-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707011826.3719229-2-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_231703_201309_28A2B7F9 
X-CRM114-Status: UNSURE (   7.58  )
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

On Mon, Jul 07, 2025 at 09:18:24AM +0800, Ryan Chen wrote:
> -add SOC0_CLK_AHBMUX:
> add SOC0_CLK_AHBMUX for ahb clock source divide.
> mpll->
>       ahb_mux -> div_table -> clk_ahb
> hpll->
> 
> -new add clock:
>  SOC0_CLK_MPHYSRC: UFS MPHY clock source.
>  SOC0_CLK_U2PHY_REFCLKSRC: USB2.0 phy clock reference source.
>  SOC1_CLK_I3C: I3C clock source.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Acked-by:Krzysztof Kozlowski <krzysztof.kozloski@linaro.org>

Don't edit or fake the tags. You must paste it exactly how you received
it.

This needs fixes. I suggest using b4 in your workflow, so you will not
make such mistakes.

Best regards,
Krzysztof


