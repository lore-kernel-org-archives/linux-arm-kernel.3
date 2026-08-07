Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7623FC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rf2beZcl9yWU11eO4KDNx5gmas3zaF8gFschCgphPcY=; b=3QQXZge8PI2hs3AvDP6TXcEurB
	WSkxML3i/c6QkwwJE3dYnPw4RjKOiOyP5R65oik4MXGF9Smu+dNGAyHY3Dv9nsa+tP29ECsx4AD+o
	vCz8D0fwjFDM2j6+O88bD9T3EpbXcVFUFti6ienixy5lB5aqdqRd2vUvX1dHdWtmqlhRkMKWmphHK
	enU7dNJi3eZKlSC8Yi0H56adguTwf8iRhHMmNftIrdYXBEcEkkF5zcsE571zjEObxcdlpfLnpBbkK
	5ydrWS6szekCn5Cf7otxpu4emxKqY9eIwAmKhsz0aKnfr9080I2q4zF8xFcsSE/BxEHyawzrR18Eu
	S9P7N+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEzW-00000007F08-1oYe;
	Fri, 07 Aug 2026 07:27:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEzV-00000007Ezu-1M3D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:27:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0732E4033E;
	Fri,  7 Aug 2026 07:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3FA1F000E9;
	Fri,  7 Aug 2026 07:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786087660;
	bh=Rf2beZcl9yWU11eO4KDNx5gmas3zaF8gFschCgphPcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C6Lx5SM+iELUCrDDutx1/WR2hCoopoptyQGRytPS4EGOD3Vs2dVdC/6bxnq/CRTF+
	 2nzc9L9TsJDNSla37Mj8uKqdcmgdQEfwD8MHq3xYLyO4u00nSo9WedPHvz8HwRqBbJ
	 NI3GIpzgw/z/1Ohm7YNHDieP2C6r8oe2gsxMuZmde0oLJZE+ZrYkg4QWBrbP3YP8pR
	 q4hyA09bE2gTQLHirLZzkXXWt3TLwS+n1w/EXPGpWFf/dQY41KbcIaGCIiu0hfem4f
	 5fsYh3ulliShoOQfP0EJaPACOkkbrSL4LrUrs2mDJ+TvYVNqioUCGrf8rsBMY/Hh3H
	 UtworTQL4sBsQ==
Date: Fri, 7 Aug 2026 09:27:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: proximity: add Sharp GP2AP070S
 proximity sensor
Message-ID: <20260807-aggressive-exceptional-macaw-cfaabe@quoll>
References: <20260807-gp2ap070s-v4-0-74f6a67b6272@disroot.org>
 <20260807-gp2ap070s-v4-1-74f6a67b6272@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260807-gp2ap070s-v4-1-74f6a67b6272@disroot.org>
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

On Fri, Aug 07, 2026 at 01:18:41AM +0530, Kaustabh Chakraborty wrote:
> +  interrupts:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Voltage supply for the internal circuitry
> +
> +  vled-supply:
> +    description: Voltage supply for the IR LED
> +
> +  proximity-near-level: true

Same comment.

Best regards,
Krzysztof


