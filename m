Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE0EC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/UKbI4ubUDEStzF9NbwSE9vjEWe0ipM2pC4V8LoihE=; b=2s+DqccLjGBUaQbtXXg2hALarC
	W3FM/FwP66AxWv3SFwT+mZ4GWW8ngxsVU2aEdv4h9GIzlhLKi9+b7RUDxCYWScaCfbTHdv/OvFJBe
	Xcd9Ct9Z2qy7ecpjS+1GRu1dKcJxmVXdHI0pL/m5+uGSmyI9lCY+0vcfWxNCZGLul8W7gmGY3Larz
	mpc7S4ZoVh0U+tc6WDF05aNcBHgHKeJloMeJpCdCyWASy87dgAzVUO/RjppGxdOYnRZzGTpRWicxy
	/5R30QMSppAsyd/idOw8DIyUwW8jthR/8naQD2fJXFSFcpMJ3658GVUhrjshMw3bce7K/5arTZhTK
	UO75QYbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXWT-0000000EDdY-135C;
	Fri, 21 Mar 2025 08:14:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXSs-0000000ED3w-04jg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 08:10:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC416A4973A;
	Fri, 21 Mar 2025 08:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077CCC4CEE3;
	Fri, 21 Mar 2025 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742544648;
	bh=+rfm0VgNi58UlS6Mr9jdwghnEVpDGqTsgyDvBE7vOrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YF2mgQ8JjPnKzwus08IDSkCkivQKkXgZE6e+3yN1hLybBSFtVGiIWMlGQQcbZLzbv
	 ZQuUxLQ65euXlF7MdP7Q1iPsc8Ez0c8XdhHWdu73kj1Pkpd2PTYSIGlJnTu+8yVzo+
	 3NevVzi8mWz7j7XWEJ382MBTpt83nTTuPSEYAxEVusWz8i4cWoddYWOlmszThmjciU
	 QIvgV2tVJ0tx4YeZ85yMyIYWm/wUsrKlQ2fclkP+lVXZYsIE289NlSw33RUZGRJ1mX
	 Gg4qoMgIgmXF/4LHaZhPEMzRWtgV0XyCm4tM0O8GKDpX6uzDyy4wt5ts9pqkF6ZNOY
	 znmnTomGgFDDg==
Date: Fri, 21 Mar 2025 09:10:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: Re: [PATCH v4 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <20250321-liberal-muskox-of-reputation-edd6c0@krzk-bin>
References: <20250320-sets-bxs-4-64-patch-v1-v4-0-d987cf4ca439@imgtec.com>
 <20250320-sets-bxs-4-64-patch-v1-v4-2-d987cf4ca439@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250320-sets-bxs-4-64-patch-v1-v4-2-d987cf4ca439@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_011050_118613_65D0B850 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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

On Thu, Mar 20, 2025 at 11:32:12AM +0000, Matt Coster wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: img,img-bxs-4-64
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 2
> +        power-domain-names:
> +          minItems: 2
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:

Instead: enum

> +              - const: ti,am62-gpu
> +              - const: ti,j721s2-gpu

Best regards,
Krzysztof


