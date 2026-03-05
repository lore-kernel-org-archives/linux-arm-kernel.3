Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE18F513E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 23:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zz/+Emy6IMaetwNp2pOawG0VVQl8Ib8Ys9eoGAutdI0=; b=JCXOj8v8dGFVf86c4YM+FL0b9L
	QVs7FRlx0HrqTS81BtiPoarszXdkQGplNHviHWXbqIQBZ28rRC/u6Ysia68Xrrg6R1UxbyrQVy967
	Qczu3BDGqP26CipgcnV2FjMTuH7yFmzZj0X02OvytQo4vG9Pnns4wumDctCxK7GXMD4PXzISDrtSE
	XO2x2cRGwJOcUKCKN3rv/VK3XRAjg/O7EsuGUWLR2+hhzpcuEQtwxECHv2l/+wZuazXGjJK4NfxXN
	BGXGYJQvnhZm0LFNO0DZWeXlRBfpR44SVX5zAcbcJ8TbXWL9GOTD1o/7wjPeYsz/d+iqTqZGAtjiZ
	jUHcCXjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIN5-00000002k9E-0a2J;
	Thu, 05 Mar 2026 23:44:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIN1-00000002k8n-3RkA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 23:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4596C600B0;
	Thu,  5 Mar 2026 23:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E00EC116C6;
	Thu,  5 Mar 2026 23:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772754283;
	bh=8H5/ixWTCBmB68S6OPOuZGKRBwpz/tdQ/2Nru84zMW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T0WoUXAXtMYs6dfzoGfCw6Xqglu4yklsx2eBEEA/38nBLLGCfJRTEXpjy7V6tMK9k
	 RrKkg7fhAWFWfwehR3EkD3nY27x6eG9Zm//jQjAc5kx8VEAcYeB+dEjD5A6aOwKh8H
	 WEBNYLqfM1jrwJGlpcBL+6IlOQaeCxlE3IwZ9Yo5+eTfzuZg3mfVvnn4G+2DwCM9ys
	 6S5hYyR5Rx95l5cNgUMzBnqyIU3XEsikD8UsG1P52PXFU8Ax1IEX8u86oAYa74domW
	 8DrDJK7ZJMkb6mfBB4WK2QLWHbP944ejGLFWImN300md3cGDYrLO7k/uioldlw842X
	 0OGb+U7yLH2DQ==
Date: Thu, 5 Mar 2026 17:44:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: convert fsl-imx25-tsadc.txt to
 yaml format
Message-ID: <177275427981.796382.9876886275408916713.robh@kernel.org>
References: <20260211-yaml_mfd-v1-0-05cb48bc6f09@nxp.com>
 <20260211-yaml_mfd-v1-2-05cb48bc6f09@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-yaml_mfd-v1-2-05cb48bc6f09@nxp.com>
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


On Wed, 11 Feb 2026 16:41:05 -0500, Frank Li wrote:
> Convert fsl-imx25-tsadc.txt to yaml format.
> 
> Addtional changes:
> - Add ranges.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mfd/fsl,imx25-tsadc.yaml   | 97 ++++++++++++++++++++++
>  .../devicetree/bindings/mfd/fsl-imx25-tsadc.txt    | 47 -----------
>  2 files changed, 97 insertions(+), 47 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


