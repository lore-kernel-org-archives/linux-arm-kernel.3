Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E30606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hlSgKUQ/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FU8TCa39
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WH6ppsWJmNp7XsRvR8E8E9xrLV/H91K1v+S1jWsOr98=; b=hlSgKUQ/AlVuGd4vLfEX53SF2W
	tHnT6z2sZsII/krFfNjq0iS6ayNYs7nnHpes6Ie4fP/u3UE+2Z+8qsU/kvVk9bqUeClJd2zvFgnVd
	8VAG+RdkSoq8OVQEC14h/BOu2M8DvoGhIS3v/bKZMgHF8dlnDay1NDrukC7uQIh1SV5qhx27UyX4d
	UF2llJ/fsNP0cO3FyrpFdOjlN+G+Dp3OVYSErlPwvE5ZnI7myTlYFEfEbqQ6j32iPHpBOX+dQux/1
	oeV3NToujllXYY8t8AJ4Sx2UG5FWwqwwsX03uo9D458UtLtahFaHyhtNTyWaXDjZ4NrFnGeUjcnOL
	hFiAPnTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBam-0000000G2D9-2U1z;
	Fri, 23 Oct 2026 09:29:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBal-0000000G2Cr-0XKB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:29:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9F9A405A9;
	Fri, 23 Oct 2026 09:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A82B1F031E2;
	Fri, 23 Oct 2026 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747778;
	bh=WH6ppsWJmNp7XsRvR8E8E9xrLV/H91K1v+S1jWsOr98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FU8TCa39PytfbnkRY4DJctKSSCC37mFhtmkpTw/Q94ZEsGIoe0POJ9U45KcVMVCmA
	 X93457lPUGQNQhbMzjXZi9TtOhLLJEEnns5i04OVWAR5ItVlUMr8IBGUf1yh2/z22r
	 rKMGp6BOFV5sKqpCWzTup7fm3xngwwuN/4UF1FI0X99Fmm00H/fg5h4dOOIdUFlSCe
	 BOOaHM99eoXMiHFuQ54EgmIB2LRNPgrrOVrxbfDorOvOjn/6+4I8U3cJNbwOKsk9j8
	 xEKFYMbNIVB5SqBM/YLYBAj82ZRmlVeqGjGFk3hBn1s6sE4NT3nOhIZKltMUMaw0MN
	 yU9Jcki0kExtw==
Date: Fri, 23 Oct 2026 11:29:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Robert Chiras <robert.chiras@nxp.com>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: display: simple: Add
 waiken,101wx001-wct
Message-ID: <20261023-apricot-hawk-of-spirit-267aed@quoll>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
 <20261020-dxl_lcdif-v3-2-adc944659e14@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020-dxl_lcdif-v3-2-adc944659e14@nxp.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 04:12:52PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add WKS101WX001-WCT panel, which is an industrial-grade 10.1-inch IPS TFT
> LCD capacitive touch screen display module.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - Use Waiken Technology Limited in description
> - Use 10.1" at comments
> - Use waiken,101wx001-wct

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


