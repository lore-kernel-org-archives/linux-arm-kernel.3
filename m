Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2E2CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 09:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61RJs0R1+dMfFMecC0IVRraflX2zMgW6UKmCTkQSkJU=; b=AJhQLeaGJWFxaYlWpU/lSszvLa
	nVeYNYU6CbcjKdKuPBmFxsUwtIFlOoUSTdMDlMbS0ETzA7auYNUmCWpsCyGzjGK1iG+0cETmNoZJn
	fxwAVd748Ua+FtWvim7uKdwxiZEvV7c/sK8UmoiH0gJy0eErt8DWTd/RsZp2xjCHW1L6TRbEmRgSc
	220B48UCXMstRfbp7yJiJjQcYX7ZmSoQFD4PELqd7jU7+4FU1OfNqmPK2tp95rdbsxtqV6iwbr3i4
	Yfee87yd8EAqDerX4BUbncdVx+NGwYwaoLXsvlX9bTCgPti+Mj5ECRfAqbP8F3fPf6QQIRlKzEgLZ
	vyv1KrHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6xJ-00000005weV-03RL;
	Sun, 24 Aug 2025 09:24:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6uh-00000005wQX-01i8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 09:21:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBEFA40BE1;
	Sun, 24 Aug 2025 09:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA99C4CEEB;
	Sun, 24 Aug 2025 09:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756027273;
	bh=TePubqI9AcNR0qwMPahOp4rbJX0w3i3fs/cTg7AxDBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stF7yeXZ5mOGTtkj4CiErJFbaGQkPc6jD4ShIx/+320L7sJ+H9Z3hJUFPA8Sc/TGN
	 bIsal3EESgk6YXHGWDGTU8Jy+zONb2NYcE8exzsll9WFvkJuYB+IKGkly+k08dlIZs
	 7AFKxJ2spcI6mgUuo+TllH6K/847OR/WkpXvv5Rnb3KIZgPZ/HFLiPqiKdlREArlzM
	 NcwjGukxzx8o7mC1hffG+cF9sHwu+97j8lKO+Yum/MqOvjcBeLjgpSY2vJjYEZGDGf
	 5PJrptVmXakzz+3HboG8ntIaKWvWHM0BqrbzleAvHW/iZ9Jnh1A85s+iw+6j7xk9st
	 lRo+aDUnlN/3Q==
Date: Sun, 24 Aug 2025 11:21:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/13] dt-bindings: display: st: add two new
 compatibles to LTDC device
Message-ID: <20250824-stimulating-herring-of-romance-df21ea@kuoka>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
 <20250822-drm-misc-next-v5-1-9c825e28f733@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822-drm-misc-next-v5-1-9c825e28f733@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_022123_056957_809AA20A 
X-CRM114-Status: GOOD (  13.62  )
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

On Fri, Aug 22, 2025 at 04:34:10PM +0200, Raphael Gallais-Pou wrote:
> The new STMicroelectronics SoC features a display controller similar to
> the one used in previous SoCs.  Because there is additional registers,
> and different mandatory clocks it is incompatible with existing IPs.  On
> STM32MP251, the device only needs two clocks while on STM32MP255 it
> needs four.
> 
> Add the new names to the list of compatible string and handle each
> quirks accordingly.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 52 +++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


