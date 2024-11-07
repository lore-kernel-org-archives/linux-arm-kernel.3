Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19978D3E787
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQVTQ0eSYkJEPL2FbWyR8PBuFEkD8PliC1Usy/cpxxI=; b=DLrVUtkwUXPNJoLJv4CeesCw8z
	P/MkI3jqGgQHtAaq9N4wteljCMSfikHwrK0EkvnvwfMsMnQds9dVN3RgfGQckwHPI+CjNLmhbFGel
	ioj2YGBcIr4sOhaan5MQy13QziMB+7cL/XqTWw/wZNG+MMFPf9b+rdv/EKTlldbosIkeSGBUFEJ2b
	ARQVd7nPrna1hMg26DR/GOwJovzFaK4kASPJcNN054C8+UFjwqVNvW2Q13cwolVmGAneU4eOqRYr0
	bXqAIFcxwuuylFExTG+3yLP1fiupZcx0+TCBa338MfDYzWlmv76M0/cibqwdhaGJzana6biEEUwpG
	PGyzth3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zlH-00000006TLA-25QP;
	Thu, 07 Nov 2024 10:29:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zjU-00000006Sw3-2Jwe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 10:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ED1A9A435BD;
	Thu,  7 Nov 2024 10:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA31EC4CECC;
	Thu,  7 Nov 2024 10:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730975239;
	bh=En01lEFzgOPGQXLGM59354SFtFYp8jJ+HyqefB6L7B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Depln833HUhQdWj9mbw7EYMsxsRGv2PNoy+lUZeWyuRLxx0wfT8A4KxsOh6/D0pjm
	 zmfZhbqIZgxZvnnFkc5xsx+gfu8+yLISkeWawf/I6ZOdgiiqI45TWBM6IrB70TcDJx
	 CIpo9I3A8xm/fEorK2F1kxHvCmBr33eSjqiN+5RvtiEmo2BmdTafi4svI/CV4IjWZS
	 kNTNomDUQZ8gsebRCoKCgC+j5RXvvQ5aWCjQ44Cs3ELTFBbFg5VvFoWiLZbBuARtuz
	 FsvFYSWyxDq5PKqDW/ono8JE818OcmG99A6wL+9xEZ+3DtsxmEX60tCRbgEi7oF/88
	 zlYolXFD+nOHA==
Date: Thu, 7 Nov 2024 11:27:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vabhav Sharma <vabhav.sharma@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, frank.li@nxp.com, 
	pankaj.gupta@nxp.com, daniel.baluta@nxp.com, silvano.dininno@nxp.com, V.Sethi@nxp.com, 
	meenakshi.aggarwal@nxp.com
Subject: Re: [PATCH v3 1/4] dt-bindings: firmware: imx: add nvmem phandle
Message-ID: <tot4nynjw7mjvb34jxkjdcdvumhxmkhrjucle3dgcqionbjaqr@mqeo3rcj2b4o>
References: <20241107-secvio-v3-0-ea27f1e9ced4@nxp.com>
 <20241107-secvio-v3-1-ea27f1e9ced4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107-secvio-v3-1-ea27f1e9ced4@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_022720_678688_564ABECE 
X-CRM114-Status: GOOD (  13.48  )
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

On Thu, Nov 07, 2024 at 06:42:39AM +0100, Vabhav Sharma wrote:
> nvmem phandle is required by secvio driver to
> read fuse.
> 
> Signed-off-by: Vabhav Sharma <vabhav.sharma@nxp.com>
> ---
>  Documentation/devicetree/bindings/firmware/fsl,scu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> index 557e524786c2..1cc86fed6c27 100644
> --- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> +++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> @@ -112,6 +112,9 @@ properties:
>            - const: rx2
>            - const: rx3
>            - const: gip3

Missing blank line

> +  nvmem:
> +    description:
> +      phandle of NVMEM driver provided by the SCU

driver? Please describe hardware, not driver. I think I gave you such
comment last time.

Best regards,
Krzysztof


