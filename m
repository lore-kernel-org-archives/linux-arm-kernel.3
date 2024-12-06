Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA2AE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 12:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arK97R0mMdEEb7J8wotOpVaXsUCZcVc3beWGSysfga4=; b=UZ8X937QhKm6RmyD6MyeDqaoSR
	FC4ggLRBYQhl0Wigf5By0yU8ybQVgarzaodiBAU3Smw2TlA9SM3kCPHR0pE6lQqaBpBCfoCFEywJe
	94N0B+o24D9V91cb9YdVOnFKRWL3KSONwrV+JFK+42u+kaySmicOli9+XvCY0227wiN8n9ctmnsP+
	TBgTWlem4wgzGQ/ySfe0gTF6vAUUe13fEO+b4i0nyJ4WcTIiWlUTHhCuaIEyLz8LvCgCOgmOx9a1j
	RkFrCCJrIY+presplB5o64F2weC9wKMnKS8lw+UKhft2ol4Rzyy9cjImvIcMEujQdkzvIQIYYDgXB
	RdmJWGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXvk-00000001f0V-2mym;
	Fri, 06 Dec 2024 12:59:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXuU-00000001ekh-1dEb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 12:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1ED855C6BA0;
	Fri,  6 Dec 2024 12:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052D8C4CED1;
	Fri,  6 Dec 2024 12:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733489897;
	bh=0DPWLJNoBPA4d09rGw4XVjzfqhYj+boN76XLzVvjlbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tj4s5uyy1JcclCOgqxp9Az+6LLzAJCl75naicwpGr8i2wnTtdKhL2gqEgmOzpKBHu
	 vti6B6o/uLenSxERTQysRWIbIuvWNoPu9G3K7ikGhjbUSo/h0BBEKk/sL3Xm/7lUWy
	 m/WhokIrwoADniFAUAcAVn1X1BW+oFI81c5WA9grBUCmWv0erLC+UQ7pKF3eaVvNQP
	 4V8ggRCkzB7h6VSLjrEV+CGbwmt8QN52VXtMdtDbMtf5TvmVTCr5iQDrgQGkxIlMYF
	 /5rmecuLgjkzpHsVduippuIk+8nwj8INX+3PLW5vLVvDD8m7j7WJPjRRVyn7KRceow
	 7MzB3nVq2JHoA==
Date: Fri, 6 Dec 2024 13:58:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 05/20] dt-bindings: clock: imx8m-anatop: define
 clocks/clock-names
Message-ID: <227zmz7rg4t6j5ylbe4ft7udheffalcqj4uxxrwutcfwuvcm2v@qbih67ilxigy>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
 <20241205111939.1796244-6-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205111939.1796244-6-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_045818_466193_176C24CC 
X-CRM114-Status: GOOD (  15.25  )
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

On Thu, Dec 05, 2024 at 12:17:40PM +0100, Dario Binacchi wrote:
> Define clocks and clock-names properties of the anatop device node.

This we see from the diff. Say something useful, instead of repeating
subject and patch contents.

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
>  .../bindings/clock/fsl,imx8m-anatop.yaml      | 53 ++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
> index bbd22e95b319..f439b0a94ce2 100644
> --- a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
> +++ b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
> @@ -30,22 +30,73 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3
> +
>    '#clock-cells':
>      const: 1
>  
>  required:
>    - compatible
>    - reg
> +  - clocks
> +  - clock-names

That's an ABI break and nothing in commit msg mentions it, nothing
explains impact or rationale behind.

>    - '#clock-cells'

Best regards,
Krzysztof


