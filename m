Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30107CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 05:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsklUiDfmK9iaunr/gPFUp7u6fnB/rBKqPmk8gmUckE=; b=X3xuWX5q6kecfTtP7GZZK6UzXv
	eBztNzCfaqT3rOcbOqQm9Yt0b2eia3F6/P6tTXGYB5Nte/3xGARWcbQd4RNpe6BayOpTO1TLqXmec
	u/pExcHy88PnH7dcwEGDYVuC6oh7a5oBO1Jsr8Z+BGZJKh6/6FEDwU9E0hoTcOFa3canzJ2WcVMDQ
	SBZK7+YztU/CTqQgHNEa/FTC/ZdvCpTfqwHNcKjftGW9CUZYyWXcpd8Fo59aX3YSMyFN2Q6ejniJI
	8BpS0yUT/Fc01wgy8m4HGKm5nWFpUI9YQspX2qzYdvZ/sMUuD7KY+1sUZmFhlrtuKUuDzka68gdO1
	nrfhrCEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbtt6-00000005jZ4-3fiR;
	Tue, 23 Jun 2026 05:41:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbtt6-00000005jYy-1b8N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 05:41:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B64456001D;
	Tue, 23 Jun 2026 05:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F18A1F000E9;
	Tue, 23 Jun 2026 05:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782193291;
	bh=UsklUiDfmK9iaunr/gPFUp7u6fnB/rBKqPmk8gmUckE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAMeygWbsv7CpFdY5KyofiGjr0H8WL2rJO65QchDYVO5+FyXHcw+iy4knsory8B3t
	 fje9IlAFmpI7t+WMLUi8sUo4NGX92JBEKzqrWdp5MoeOlCJqcyTV9PF70Rwf4k+WOa
	 RT0aPtoVm18rOmK5Uq84dRse73WN2oclNQw6LKZeS/73jolM6j6GpxBmplojJCTQ2B
	 aHy+36as+uHS64EuZ1/BayQm83wyDkWypDUx06hdUiXLjc/QmAgwZCc8udt/WVsfaj
	 s6gxX8iMDhWi92XzGkYdVVITjBQ39X/M+WSxgPrufegEhPBykVwxDA181A96sKcNn8
	 AgbGW3kbT2Eiw==
Date: Tue, 23 Jun 2026 07:41:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v11 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Message-ID: <20260623-influential-space-inchworm-17a7ea@quoll>
References: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
 <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623-csi_formatter-v11-2-a792fe9c1502@oss.nxp.com>
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

On Tue, Jun 23, 2026 at 11:56:32AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The Camera CSR contains control registers for multiple CSI formatter IPs
> at different register offsets. Each formatter is an independent hardware
> block with its own clock input and media pipeline connection.
> 
> Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
> with 'reg' property specifying the formatter's register offset within the
> CSR address space.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v11:
> - Move properties to top-level and use if:then:else (Krzysztof/Frank)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


