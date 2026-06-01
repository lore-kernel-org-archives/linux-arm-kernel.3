Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689B6CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 23:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaxZFaXKrmIFYBt6dWwzrs7nCg1sSc/qtCvI5zGQOIk=; b=Noy92VxCdtIG/0IlQdWZ4Dl8dG
	cckrgufGQm9N+d5R0wtAC6PKT0BEFLtrpA+qYG9HjDLstbOESXdiqkrI6vsd/h7IlHrOHGgk2F81n
	cqVzwi5kDTxk0bWKHEoQgmKAJy2VoAfcQ6zNMXGvGjZMkHsKhdiGJAFejZQgmY36x+ToTBy6im+Lx
	japCBKXDpr3W/L0E6XXz5OqDWY5idOijrfkqHZs1qxYbEZUZfKIcycZisdIbRn7uvS4r8TVUfSCKe
	B9Gz9jOGWeWjWjHoWy5aoqUXunLXmFV9Pk4gbRSE7At+2D4ydoWpRwsT0+rkZfRzI5HeJVVsRwYts
	Uc2uMGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBor-0000000C2io-3lwX;
	Mon, 01 Jun 2026 23:13:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBoq-0000000C2ic-41hN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 23:13:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 051466001A;
	Mon,  1 Jun 2026 23:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FE71F00893;
	Mon,  1 Jun 2026 23:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780355595;
	bh=uaxZFaXKrmIFYBt6dWwzrs7nCg1sSc/qtCvI5zGQOIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CeXj1njDTZ9QYc9JvUDDE+waayylRN3SNsTJPudXFsXdbc/Jti6T0wDI0VunUE302
	 3N/iKGYu2roQtMTfTOrB4y/WJQJ70LBObOJ2uDsZUeZxN3SHD4xLMMCL+7V8+qmeKC
	 vYMIrjQTEmW5K1kaO9u7LIbpL00Bkn8hPH9agh56sc+tBLmp/tp199JHYQx51nvtz0
	 KzATeZA7dTXygwASJbTODS0a6H3Y36iIHNaSByWV0n/Gm/VCl+kjLJbBcMrzWdJgCa
	 Lm9D3W2mg+Xe5cbi9mVpzslKIvhdXAI2jRrBc5kRN9EF5E+dpMDfO2ebpmil7clTUN
	 xouYJrYkj7V4Q==
Date: Mon, 1 Jun 2026 18:13:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Conor Dooley <conor+dt@kernel.org>,
	Purism Kernel Team <kernel@puri.sm>, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robby Cai <robby.cai@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>
Subject: Re: [PATCH v2] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example
 endpoint label typo
Message-ID: <178035559437.165333.7105933627406631706.robh@kernel.org>
References: <20260519113824.91533-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519113824.91533-1-laurent.pinchart@ideasonboard.com>
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


On Tue, 19 May 2026 13:38:23 +0200, Laurent Pinchart wrote:
> From: Robby Cai <robby.cai@nxp.com>
> 
> The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out}
> endpoint labels, which is confusing for an i.MX8MQ binding. The labels
> could be removed as they are not functionally required in the example,
> but they have a documentation purpose that brings value to the reader.
> Rename them mipi_csi_{in,out} to avoid the confusion.
> 
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Drop imx8mpq_ prefix from label name
> - Update commit message
> - Drop Fixes: tag
> ---
>  .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


