Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978E8CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SMKG09ykFsVqQzZfgacsbrGDCmXgaLtql3fEwgu9io=; b=0KKFV0U1zMcn/1qs1kn3aToL/N
	vHoi5TW5bqf8fSOZAx6gS8S1wPuEnrjzmRsgdCaDVLnxVfdWjq0YQ+kCiKKiM9ewDfjWI+cBXDF1d
	qIjrMGcUPebOpILkyQdRIeE/PiI7/TabkfP1Eg1K84jT2yNF6KkqbHcLd2R1caz/0RmG0VG/SZC+Q
	F1X9no74txos81wsSr9E+jxaYzewLpRF6KuJssIF6v9UYpN95VlzTlWs+y8WC5eukWOTHysbKakQr
	TKHHHqCIgNG/WxetJ+3bISlK+lZhCGapDbTK3HLn5aMJ34jSMjnEQ60NvHe1qZmk4nT4lg5aOSZ1W
	UaqxA7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDnB-0000000BZXP-2s32;
	Tue, 04 Nov 2025 09:57:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDn9-0000000BZXF-3qj0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 09:57:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 154A6600AC;
	Tue,  4 Nov 2025 09:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B08C4CEF7;
	Tue,  4 Nov 2025 09:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762250250;
	bh=7En2OG3X7ZP2LUb4t379Rh8l5nm4w5x2WVKDBZXU++c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxvUEd0/+QrkhLPYuBnQ/9h1tHeLa30JGm9ZsH19YCY3j/D5/jn/L7l/XEY3JVvtF
	 Z+DgQdggz5BBwcqp740WVIHMei09l8oiE1p2QhTiYydS2lQZRT3FsE2X9BqBn94k+H
	 HqaEZD9WbXUKCbpAhnFbe5HtIBPdmja9P9bg/znjqY3OzlVkKIWFi1ki6yLj6VnOe7
	 NwO+6fJYCl/wfdzvsp3Q06QtAOArsSNjyqP9s/WLt30+gFrqgPzJwj57suwQgvFfgq
	 elpcMz/GB9twDSJfYfhzAfdI2s0iXiNO7+xbjIFE+vsJnhVE/9DBs8SAsy1L+w+FE2
	 kmGj+fxz5zC9g==
Date: Tue, 4 Nov 2025 10:57:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI
 compatible string
Message-ID: <20251104-tricky-stallion-of-tenacity-a8e81b@kuoka>
References: <20251104-isi_imx95-v2-0-c05b7cb104cd@nxp.com>
 <20251104-isi_imx95-v2-1-c05b7cb104cd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104-isi_imx95-v2-1-c05b7cb104cd@nxp.com>
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

On Tue, Nov 04, 2025 at 11:21:05AM +0800, Guoniu Zhou wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-isi
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 8
> +        ports:
> +          properties:
> +            port@0:
> +              description: Pixel Link Slave 0
> +            port@1:
> +              description: Pixel Link Slave 1
> +            port@2:
> +              description: MIPI CSI-2 RX 0
> +            port@3:
> +              description: MIPI CSI-2 RX 1
> +          required:
> +            - port@2
> +            - port@3
> +    else:

Drop the else and instead add if:then: blocks per each variant where you
correctly constrain the interrupts.

Best regards,
Krzysztof


