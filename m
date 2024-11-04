Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93055D132DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwUxPqFxY0PaGxvOEruDwl5ND0nzb9dvKiFbxQXwPog=; b=T9xZwSy//St5Ziw9lxW/mZCHzi
	yhlAiYcxRaNMbX0APQ6GMqRPmeUNaaroKXVK1/txD3nBiA4Jqf4X5uPTHsVzMQgDinzrbFMKt/bKK
	HrMrNSb8IYGaXy3aksz0IX92tXY/CG0rIvxgHV+UPapLoeg/oWi2is5BrMkh0mUFIDz9SuwCtYupq
	VwJ5/17wJN0e7nXKKVR7uAUrrYNuIv5T++fcpqgweqmh4FkeGSGfVsGWlr+L8flqEcPgxmosKWFS+
	dGUwUsd6YvEvVKaLtx+2NtDTQ71Y8ZkVRMYlnYOgpiBcynNO2baVL6BxCuiZIXZiwTpMEplq85BH+
	nGNv7cKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zFi-0000000EFRj-0AXu;
	Mon, 04 Nov 2024 15:44:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zE1-0000000EF4Q-0Wh4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:42:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B96915C1385;
	Mon,  4 Nov 2024 15:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12439C4CECE;
	Mon,  4 Nov 2024 15:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730734960;
	bh=ZcXj/+Ru/C7z54XGjpC8CnE2LPrcJkPTHoyWYQ9pIb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW1x9gp4OtQx8VqDjK0tsIaYR7endJuHczoLt6iYUv/95h4p332/L1+cC97vYrKXQ
	 //gW+kRhjoe4ilQlsU68+SUsm9MLO9sdMiTbGDsfdP19fHLKez8w3oBFI17P7A/J2h
	 1gadF1NH9mqoqADHr0S74m57GBUcqZiFTjUg7yJWPsLICz8Lq0th1uRT299z2RKeUc
	 eFRdG8AGYExK5odt4EvAxfU5BNby34fmFB1p02tWytWbBBjASlFPY/+nc6JjYHzV9N
	 452d+XtFt22hRTrRA+WKWWjTVBRBfS9fSij44NN5xbIu6dZq1ZMnz4HtEj+ft7MEaG
	 ipyUeA5N8pQOA==
Date: Mon, 4 Nov 2024 09:42:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, shawnguo@kernel.org, imx@lists.linux.dev,
	conor+dt@kernel.org, Fabio Estevam <festevam@denx.de>,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	krzk+dt@kernel.org, a.fatoum@pengutronix.de,
	dri-devel@lists.freedesktop.org, andreas@kemnade.info,
	marex@denx.de
Subject: Re: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif
 fallback
Message-ID: <173073495749.210192.9138587910771237679.robh@kernel.org>
References: <20241101135406.47836-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101135406.47836-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_074241_229285_EE505DAE 
X-CRM114-Status: GOOD (  11.22  )
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


On Fri, 01 Nov 2024 10:54:04 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> imx6sx.dtsi has the following lcdif entries:
> 
> compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This causes the following dt-schema warning:
> 
> ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
> 'fsl,imx6sx-lcdif' fallback.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v3:
> - Also update the example.
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


