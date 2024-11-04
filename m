Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C81D10C0D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDVtNnbxDmw6YStqTqKP24wVqhbZxt7t6zFnX4qQvwU=; b=uFaiWXqszRcSWIw34FpsIWrCbA
	huUC2Ctp7FyGAv4TeUtCYzLu3o0s1LGnK+OIk8nKgaD1ktVBl+0oQoGMI4ItWe5Kj9jwkYgV8OYvy
	UYknD9daXsgxsIzOL2532EDsL5uDNTBRzPj1wc4lyGBR34WAAnAUBhqzu9+HPioOEOHXVGhQQ+ZeA
	ajgnS8FN8qyGUvAXm1wBzQNF9cc1cKAablJkrtEC2HhiEaGSj5haLrz00LlPUajqOoQ6vJSKEhkRW
	UgyhzUQRvPWEm803Dyy7ShK/ME7k1x5VMaVyNMzKfFfRQypFPGeIKFq+KS6aEIBi4Mc2c+n92wi7h
	Kwte+DpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zHR-0000000EFxb-1sHl;
	Mon, 04 Nov 2024 15:46:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zF5-0000000EFGr-2etR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:43:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DD987A43081;
	Mon,  4 Nov 2024 15:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80928C4CECE;
	Mon,  4 Nov 2024 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730735025;
	bh=7Q2U9oss2EM4iM3PMEeL4JsDBihXmtIIsux04111JkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ic9jv7DmA9iiQEJ/OSVpnEdHDhlMOqfFU2nHWthRPkYDGX5yCQYB3iTbneJjq+Og5
	 rHEvIm0lzo/2tcuA0TQtO0arblv7UMeSIfL/FjM/X/ruKQ/9YgWV1p9lgTY2zn2bld
	 kbt+awZpSfPJ4NXKc6opPsuArC4xfQEi6uAPYLJPFb9eN5nZXtl+voH1rvYfqQ2MSs
	 0vQKjppQknbrmDpG2X/z+MgOfuyCF0ou63aFt9KKk9xkkhHjaduPvXuf6vh51SvrpH
	 vEMTKUFxn1smD8qPS+KkffHKfoGta2/aBhSgz7UnV3BnGF7hH+v1Q+TCkvmcN9iYQC
	 kdT1vOO0izLdg==
Date: Mon, 4 Nov 2024 09:43:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, linux-arm-kernel@lists.infradead.org,
	marex@denx.de, shawnguo@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
	a.fatoum@pengutronix.de, imx@lists.linux.dev, kernel@pengutronix.de,
	krzk+dt@kernel.org, andreas@kemnade.info
Subject: Re: [PATCH v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll
 fallbacks
Message-ID: <173073502322.211813.8204501104230548664.robh@kernel.org>
References: <20241101135406.47836-1-festevam@gmail.com>
 <20241101135406.47836-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101135406.47836-2-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_074347_769369_14B104A7 
X-CRM114-Status: GOOD (  12.29  )
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


On Fri, 01 Nov 2024 10:54:05 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> 
> This causes dt-schema warnings as the current binding only
> allow 'fsl,imx6sx-lcdif' as fallback.
> 
> ['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
> ['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> The imx6sx-lcdif programming model has more advanced features, such
> as overlay plane and the CRC32 support than the imx28-lcdif IP.
> 
> Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
> fsl,imx28-lcdif fallback:
> 
> compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
> 
> This helps keeping DT compatibility as well as using the more advanced
> lcdif features found on imx6sl and imx6sll.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v3:
> - None.
> 
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


