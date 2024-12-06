Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E1AE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0TerEVFic95eacOApRRPT15pSBmvJF8I0X/jDjBLlc=; b=COYZMSiCfyMzvQONvciV8oc4oi
	Fmozz/f/IZ72/gmjvzS7xfzhM7ZGGmmyuPE39BFA+F/xojZw6AnXRVfDYwSDuLAKSjZbZfh/d+mxG
	RDmeVrOIoZoBbDTVD8heQh9vYFR7ydbzFNfgmu3q4/gz8hEq6hf/0jgqB1pttkrY5OZLb8qR8mIwJ
	1dh8ZYOrqcw8YZN64SRF8ExD8L534GDnFYCZFYixkh6EApmTzHXWKuBYblEK4mgdA6sdRiDDNVW9E
	DUzlC8DDIA47czUTwBAbI+KGHSVCKfyrCTK2Iy1I678EIaJWAnb9B4sFpgYSn9q46oIY1yAKP524z
	DEPwOfUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXy6-00000001fWJ-46Jn;
	Fri, 06 Dec 2024 13:02:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXx5-00000001fJV-0hqh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 13:01:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1DDE1A43E2A;
	Fri,  6 Dec 2024 12:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26976C4CED2;
	Fri,  6 Dec 2024 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733490057;
	bh=qnHw0NICoJNSFfda7z3Yzm4l1maJwc3jy/JgCMdgy7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ACTgGvbDzphR3QuOq24UQXXPfTPpm46grp44J+8aQipVfqAJ6imZQ06sZ2vaMbBtQ
	 CHZ0I8dqVbNhX+e9Beqw/pj11Oahrm+7H3Z5V7bYZ4n6HxKnihMEIqibp1BiSL5guU
	 nZDM0pJXGjqyapxcN8LD/sQJCGSIhcQHTOxezKp7/qaprBDYYqrEVVe6eCogabgPfB
	 CDko4TzWmjXiNqGGGIHx6GhM/ym7fVOasMQcN5pPsx3rvm2HADeog00iv9IJ2f8tDj
	 r8tJhysqGnZzegg2db2xLqltFLKx588ldAjcX5zNyXWaYmIeanOuJSiJuywynGmOEI
	 voHw4mlaV2zGA==
Date: Fri, 6 Dec 2024 14:00:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 11/20] dt-bindings: clock: imx8mn: add binding
 definitions for anatop
Message-ID: <jgkbsxwhttebjpul43wtt6simygkst7bnis47b5pkevica2th5@n7elmf4u5k3n>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
 <20241205111939.1796244-12-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205111939.1796244-12-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_050059_269579_EFCFDF17 
X-CRM114-Status: GOOD (  12.06  )
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

On Thu, Dec 05, 2024 at 12:17:46PM +0100, Dario Binacchi wrote:
> Add the bindings definitions for the anatop node. The patch is
> preparatory for future developments.

I don't understand last statement. How this can prepare? Either you add
bindings for clock provider or not.


> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - New
> 
>  include/dt-bindings/clock/imx8mn-clock.h | 67 ++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)

...

> +#define IMX8MN_ANATOP_CLK_CLKOUT1_SEL		57
> +#define IMX8MN_ANATOP_CLK_CLKOUT1_DIV		58
> +#define IMX8MN_ANATOP_CLK_CLKOUT1		59
> +#define IMX8MN_ANATOP_CLK_CLKOUT2_SEL		60
> +#define IMX8MN_ANATOP_CLK_CLKOUT2_DIV		61
> +#define IMX8MN_ANATOP_CLK_CLKOUT2		62
> +
> +#define IMX8MN_ANATOP_CLK_END			63

Drop

> +
>  #endif
> -- 
> 2.43.0
> 

