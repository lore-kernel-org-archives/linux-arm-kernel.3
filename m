Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1C4D35153
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BukpDNLP0uKyCIGgr3CZqF8OQnjFDTRNm+biYwwMapw=; b=tz2i2Qibnc513dkDSsbRJOQgXi
	PvlVPJPI97xDYoYneh8xxfNoSyktmCbTze1164GYAub+rElXrAdUlDEQA1ppI1Fxeexk2UwwqGXWy
	R0HNgInvCduiHfkSR39soYbwBkAmDGQCCvHgqU4m5BOXeFTLyZ482rhHJe5U8Jk9vSys3NJkyoO/W
	rAr5pQ3NPikAQM93k22qS8YRN37rX3TiVLjVePrKQfByLLm4ussm5phz+hvVDsCvLS/yKDIP/3UPh
	r/6FL6+0RvSSKCApyps2l8ePsYLd/wMvyyDigtGd+1J1H4Dbyr0yeD08Fvr53h/ZKq0JrbnstWaaw
	zwnQbX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qD3-0000000EF4m-3FTa;
	Wed, 01 Apr 2026 07:41:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qD1-0000000EF3w-23fH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:41:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F9AA4057C;
	Wed,  1 Apr 2026 07:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC1FC4CEF7;
	Wed,  1 Apr 2026 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775029311;
	bh=2QALR86Ua7MoBi5F0W+OaAxgTNDklOvWHZhuy7YhXts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQBWpmqcjis29i5L2j99vizY5ydDRBX99V0HjEeQkzydDDIhvAX10ZsuKw5xMiBlA
	 2ETWv0uxjleyGgdxg+hwbPt+Qr1YKzKmCB+Nv4KqBQbwL01vCErYqYaERakqUbuM0D
	 rTjNPvnXP+q7vgxSIuARcqJ9AX1i6QJPs98Awhfvkdh5NKdNuPDVcMtJKfM2aoQvCI
	 ySGuZNVJNKrT+p2cxDvL4H0FEKIQQ1m5VQ0yckpTgiGhRARyVKaD0OYopx6yk3Smp6
	 1I4mNOilPVXByQ72Z23iMUZKTLOBYjMIujkbOGnjd38cbyc+jk41EdsNEiFE5gMeWO
	 wq80ELwUxCHZg==
Date: Wed, 1 Apr 2026 09:41:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Robby Cai <robby.cai@nxp.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, aisheng.dong@nxp.com
Subject: Re: [PATCH 1/2] dt-bindings: reset: imx8mq: Add _N suffix to
 IMX8MQ_RESET_MIPI_CSI*_RESET
Message-ID: <20260401-simple-dragonfly-of-will-fedc8c@quoll>
References: <20260331101331.1405588-1-robby.cai@nxp.com>
 <20260331101331.1405588-2-robby.cai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331101331.1405588-2-robby.cai@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_004151_547681_4C49862C 
X-CRM114-Status: GOOD (  16.82  )
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

On Tue, Mar 31, 2026 at 06:13:30PM +0800, Robby Cai wrote:
> The assert logic of the MIPI CSI reset signals is active-low on i.MX8MQ,
> but the existing names do not indicate this explicitly. To improve
> consistency and clarity, append the _N suffix to all
> IMX8MQ_RESET_MIPI_CSI*_RESET definitions. The deprecated
> IMX8MQ_RESET_MIPI_CSI*_RESET versions remain temporarily for DT ABI
> compatibility and will be removed at an appropriate time in the future.
> 
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> ---
>  include/dt-bindings/reset/imx8mq-reset.h | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/include/dt-bindings/reset/imx8mq-reset.h b/include/dt-bindings/reset/imx8mq-reset.h
> index 705870693ec2..83a155dbbd4a 100644
> --- a/include/dt-bindings/reset/imx8mq-reset.h
> +++ b/include/dt-bindings/reset/imx8mq-reset.h
> @@ -46,12 +46,18 @@
>  #define IMX8MQ_RESET_PCIEPHY2_PERST		35	/* i.MX8MM/i.MX8MN does NOT support */
>  #define IMX8MQ_RESET_PCIE2_CTRL_APPS_EN		36	/* i.MX8MM/i.MX8MN does NOT support */
>  #define IMX8MQ_RESET_PCIE2_CTRL_APPS_TURNOFF	37	/* i.MX8MM/i.MX8MN does NOT support */
> -#define IMX8MQ_RESET_MIPI_CSI1_CORE_RESET	38	/* i.MX8MM/i.MX8MN does NOT support */
> -#define IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET	39	/* i.MX8MM/i.MX8MN does NOT support */
> -#define IMX8MQ_RESET_MIPI_CSI1_ESC_RESET	40	/* i.MX8MM/i.MX8MN does NOT support */
> -#define IMX8MQ_RESET_MIPI_CSI2_CORE_RESET	41	/* i.MX8MM/i.MX8MN does NOT support */
> -#define IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET	42	/* i.MX8MM/i.MX8MN does NOT support */
> -#define IMX8MQ_RESET_MIPI_CSI2_ESC_RESET	43	/* i.MX8MM/i.MX8MN does NOT support */
> +#define IMX8MQ_RESET_MIPI_CSI1_CORE_RESET	38	/* Deprecated. Use *_RESET_N instead */
> +#define IMX8MQ_RESET_MIPI_CSI1_CORE_RESET_N	38	/* i.MX8MM/i.MX8MN does NOT support */

That's quite a churn for no need. The entire point of these values being
the binding is that it describes the ABI for SW and DTS, not your
hardware registers.

Whether signal is active low or high is kind of irrelevant. Linux uses
it exactly the same way.

Best regards,
Krzysztof


