Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021A4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCTQSZbi7TzPZ2W3xpGXSyj5kRe3z+ahVIzN4CEwaKo=; b=qBDO8HhGcJFukEg6+yy22E6Ia6
	0HcKxLKWRzryStpdkj4b1Xu6c2WpzMjQt77/JabKGLQSCUwcW0vNSs2Nkz7JOstvqxp1LUl7gJzx/
	chfOuLVOpDNtNw8bwfoW4fNIAyZMKU7AwRMHgxT0+CJasrooWGJBYQ5xqRd1u4qTz0Qw6U5203xJz
	kBUZgAcTNzGMBf9Zaxgx5+NNCKUllae3lWyiUNZD1IzopSb8hL2oJ8dNBpzf/KztUTGkDw4TbIrL5
	bt51DBEAwKYbFUjJyOAZ1PWhMeNinmvLBTuEt1mLAr1yjGgLEyPIQEOpO61wqC1qKa9S5WYzbwQiG
	pa9gswcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXwk-00000001fEk-1KpB;
	Fri, 06 Dec 2024 13:00:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXvg-00000001ez8-0tU2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 12:59:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4BFB4A4389C;
	Fri,  6 Dec 2024 12:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534F9C4CED1;
	Fri,  6 Dec 2024 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733489970;
	bh=7kZlBs8/qsHwIl5r8qzSVYO7uA12w337ENyPIR3/4bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCHplatOiR9NWakpnvXfl+RRoMZvOPuIE5P8uck2x49RC4ewGLdfdBq2y87QbQb/4
	 RDHG9gGugqxZ8X5w2613ZkucytuRGKJuHSH9abWKvMnA/mGAFybB4jGlVx8p63T6lS
	 XP0EL4bFJ8fqjRFgSP9mJzivzFbAsdN75UHB0gpoKR/Khln575C+TfnCHsywBHlIbz
	 rN9laGmpKZ4Oqat0hilX+nteIIdnzYyWsau07GxEVmFstN2e9YK3yEYvO7kMRxp85K
	 MiWvMGv59ekSwNOu0HYzdkd3iqmzXPXaFbd/LgopPe8yHVzQb8R9aYlpMpc/ThColb
	 8RhF5PUQ/IEHw==
Date: Fri, 6 Dec 2024 13:59:27 +0100
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
Subject: Re: [PATCH v5 10/20] dt-bindings: clock: imx8mm: add binding
 definitions for anatop
Message-ID: <46awbd7wxh56l3wmgj43zhz7d75was6drkmlydcjqgefee35ll@73jw2xxtpwic>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
 <20241205111939.1796244-11-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205111939.1796244-11-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_045932_309205_AF937DE4 
X-CRM114-Status: GOOD (  13.11  )
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

On Thu, Dec 05, 2024 at 12:17:45PM +0100, Dario Binacchi wrote:
> Add the bindings definitions for the anatop node. The patch is
> preparatory for future developments.

This is never a separate patch but goes with the binding doc.

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
>  include/dt-bindings/clock/imx8mm-clock.h | 66 ++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)

...

> +#define IMX8MM_ANATOP_SYS_PLL2_1000M		56
> +#define IMX8MM_ANATOP_CLK_CLKOUT1_SEL		57
> +#define IMX8MM_ANATOP_CLK_CLKOUT1_DIV		58
> +#define IMX8MM_ANATOP_CLK_CLKOUT1		59
> +#define IMX8MM_ANATOP_CLK_CLKOUT2_SEL		60
> +#define IMX8MM_ANATOP_CLK_CLKOUT2_DIV		61
> +#define IMX8MM_ANATOP_CLK_CLKOUT2		62
> +
> +#define IMX8MM_ANATOP_CLK_END			63

Drop, not a binding really.

> +
>  #endif
> -- 
> 2.43.0
> 

