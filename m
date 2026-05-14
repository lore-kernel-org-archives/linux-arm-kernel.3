Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CABCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 06:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rvs7i0m2mkFEM33dw5Pxs+v6bQPAjwc2DIz49z/H1v8=; b=t3YeKtGUOacMUUb5Dj+fEZ9bf0
	QSWFS3DqRJRwBC9rChbIdCmCZpYB/SJ8u12MrgH3xPIlfVclp6J66YxBVrr0CIlQ7akiBB1eYDVdu
	s/r1wrPht5P2bxjZgeSrUfZ00FvGmFnNDaFUVSOYSDgRK+QTmnqjEhbNO26KwpZbqJnXMAe9BHNhc
	YC0HN6sLI4fDti8yk0V4nqyEkARYLfoXUvgYCGuye1FLuM+uKYTMSeZxc8ObkSZPj8AGNxss2NR8h
	oiNlHuWXmsxsbhIFM516uF1PvJqVscQ5hLPoiVbeEt4/+Xaqz1fJDfkUN4R2JxqXpva8PbqbKNuK3
	wjbleRZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPnc-00000004jzq-26tj;
	Thu, 14 May 2026 06:44:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPnb-00000004jzg-1G3x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 06:43:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26574600AE;
	Thu, 14 May 2026 06:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEDEC2BCB7;
	Thu, 14 May 2026 06:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778741037;
	bh=z4iol9lK0tCBS7gF375F2wgexcgoZs/yOTdmOdhJrT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eqb8nqJRD4jn8FUHLZb1zwzarUwB4NXIhnDJ5PXTpnFHWgPdxLXzWOxNiqTvn1dxz
	 9rVAASvmP0A334BlZgTwN8EljEGAkxucD2GVY/BbOLLyFmrWHVhx/VHk+xv47u3q+y
	 1WiADo//KfcdSKqvkwyHzxAIC+WuaZ7btXRjGTr5l7G8FxrBmZiTnqLxfTOCUf3hag
	 6MUCNPcLLac1RM4IYOGp/0xShHU+vbukrN86N3yMcl+PQOFhn5Oma5+Zu8zXOUGlU5
	 BNqjnQKD4aaBKc+wMFZ+YwAYc4M01+/41ln8ozk2JMZ6fZiTg/6K9Fd2O81QLeLu9M
	 Q9B7DCbpfbadw==
Date: Thu, 14 May 2026 08:43:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v6 05/10] dt-bindings: arm: fsl: Add solidrun lx2160a
 twins board
Message-ID: <20260514-macho-white-tapir-4f8cf2@quoll>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
 <20260512-lx2160-pci-v6-5-d0ff72d3c983@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512-lx2160-pci-v6-5-d0ff72d3c983@solid-run.com>
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

On Tue, May 12, 2026 at 04:39:00PM +0200, Josua Mayer wrote:
> The SolidRun LX2160A Twins board supports two configurations, one with
> with a sinle CEX-7 module, and one with two (dual).
> 
> The dual configuration was not yet tested.

And how do see dual configuration? New compatible? For the same
hardware (the same because from SoC point of view it will be exactly
the same)?

You must post complete binding, otherwise this feels risky and when you
actually try running dual configuration you will see that existing
binding makes no sense.

Best regards,
Krzysztof


