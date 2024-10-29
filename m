Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22179D13590
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 06:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72W6IoVgMVruuTPv6/OZnyKgvOOaXFJUUyjDMCZ9y/A=; b=rE0aRFMirI5dkEYRwYtqlf6wfM
	dJi8S/UQ6oRVTJhIxe0lN7X5LIBs9/3yZjmS55/XLW8nu8tv0yTXXsmK5e/XJ3C1hjvQMiR+pSQ3i
	puncaujenu/f0keMV7NL1/CjRkNPLwDS4WrHVmma1Yl2aSvfrW6G13OwCDZf2A6Xj46pH2Sa1J388
	HlJW4aA4nRPKRArMERaf4EZf9Tku4EqQa1BAHYYj4r4k/93OSZj3c/0uOXF1Tp1G3EnuIXGQ3dbgU
	iBabeEiNRn3T4oHCYv82j4NKioUbh2QH/uziJkXv/ieKCOksJfmCXIX3SSbZWpf4oLqtoY96NUF4/
	nwfdwFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gBz-0000000DQNa-0REa;
	Tue, 29 Oct 2024 06:59:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gAN-0000000DQ8z-0MX3;
	Tue, 29 Oct 2024 06:57:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA8DDA415FD;
	Tue, 29 Oct 2024 06:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E29BC4CECD;
	Tue, 29 Oct 2024 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730185041;
	bh=+Q/V6WXCYROq0Q1G3AsK/wbeGU4RqG8R0bxG0WnUNVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ti9VOJxPFctnUTwirh+ch80KIKFIDoNfh2n0AhSXnf6ixc0zkDDvoWm+kv/xwDOSt
	 VgNUyPQd+2sUJJy6CI7FGqpVU6FQa+4APolRk0lLqlt1Yl42PlpqwabdNb9yAZUKSv
	 VrJUBIaH5Kv0AqZPkkQez731q1605KNwT0+n5fP7aDOhCsjYInGC1YJkghzP4VB3ig
	 IZOSe9X9rqR9aAJAcVdhfjrhZz7a1v3+lW6bOttDpPhA1lfccbxzIqkeMYDUlUPWi9
	 2zB48+HoHB7vMho6R3ViOjt/IE65XK4Ej/SkDYGu/WReJLUKTDYHjOXAp7Iyk6EmR2
	 A0hrjklGdsG6g==
Date: Tue, 29 Oct 2024 07:57:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	mripard@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com, 
	alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v18 3/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501
Message-ID: <c664wq5wzzvivvkpedkicz6ku55epoa75oyycm3hohoms46yi5@myn542dqlpmu>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <e11ba0cf836d6f27935f58b7987e792026ab0233.1730172244.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e11ba0cf836d6f27935f58b7987e792026ab0233.1730172244.git.Sandor.yu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_235723_217917_F5CE25DE 
X-CRM114-Status: UNSURE (   6.64  )
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

On Tue, Oct 29, 2024 at 02:02:11PM +0800, Sandor Yu wrote:
> +  interrupts:
> +    items:
> +      - description: Hotplug cable plugin.
> +      - description: Hotplug cable plugout.
> +
> +  interrupt-names:
> +    items:
> +      - const: plug_in
> +      - const: plug_out
> +
> +  data-lanes:
> +    $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
> +    minItems: 4
> +    maxItems: 4
> +    description: Lane reordering for HDMI or DisplayPort interface.

Please look how existing bindings do it. data-lanes is a property of
port. Otherwise why would you like this to be applied to the input?

Best regards,
Krzysztof


