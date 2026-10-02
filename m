Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73DCCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQxZFijEU5LHsqzlp6kC4YKHFl6QGIvDQevjxQ5kmyQ=; b=XsWcJC+gv8Go+DrjdJXwmPZBq2
	e9D/fdZaCXPTwUmvM/whMwG5JZsBE4dZtgIi3QOQh5bnWqWyTnrr9Oxpc1Q7+sd2cNlQR+b4lIxZb
	A2V1QWmSWGPBTG7hkkNh+/l08KaiNRblMV8xXQOTGfMpsksR6cfyyYaOe0oumshih53a7Q16+U1tS
	fruIzRKLBgjHWTG0U5WY+lclXyI3PzzZsDDQStmAOIaNzV/JrBLTvGiMghKGWYx2RCYIJzeDKpCrx
	WEopa61mxfapp0zhhobFgkljZed6UuihT8Dt1j/ff1cHyFPuHUHnVH/qcXeZX1jjeL6o5SLePgSak
	PAoXEHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZB5-0000000B3fe-1dO8;
	Fri, 02 Oct 2026 09:03:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZB4-0000000B3ey-1O08
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:03:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2A4441356;
	Fri,  2 Oct 2026 09:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEB21F000FF;
	Fri,  2 Oct 2026 09:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790931817;
	bh=yQxZFijEU5LHsqzlp6kC4YKHFl6QGIvDQevjxQ5kmyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PMhj128mwMLV5wxS5AIrCVz7sWVTvHfeMTUmtJNuQMrV/fEjwjC0ANphjgG8OAaNq
	 OSLjHK3uCMbVUpu0mYgpgErTjWVVLMe9WD7+Qrr5bkigcdQh4JqDmMxKeowUhRgbC0
	 b4p3M2Qu8uNS3IUEhscAJJbzwNepyc6xXKFYSRQNyWVYLpn2dojmo2Z2XD+A6996u7
	 //Au+sbQQ2UqZ4xnXAlvCyahXqXAyat9yvVYB6EKZSHsLZUErIHJK/BxjevvjRJnYQ
	 YpmjFn7W1D6cztpU0QScfgv7W6g2OZuTnXdZD6pGJ73e53km2ZfcjQ16G2dOJRVw0z
	 i78vsxykvbi7g==
Date: Fri, 2 Oct 2026 11:03:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: Add syscon property for
 multi-SCU SoCs
Message-ID: <20261002-succinct-voracious-orangutan-fdac5e@quoll>
References: <20261001-ast27xx-adc-upstream-v2-0-2f9c15cc0064@aspeedtech.com>
 <20261001-ast27xx-adc-upstream-v2-1-2f9c15cc0064@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001-ast27xx-adc-upstream-v2-1-2f9c15cc0064@aspeedtech.com>
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

On Thu, Oct 01, 2026 at 05:50:36PM +0800, Billy Tsai wrote:
> The ADC's reference-voltage trimming data lives in a System Control
> Unit (SCU) register. SoCs with a single SCU instance let the driver
> locate it without any additional information, but SoCs such as AST2700
> that expose more than one SCU node need an explicit phandle to
> disambiguate which one holds the trimming data.
> 
> Add an "aspeed,trim-syscon" phandle property, and require it for the
> AST2700 compatibles since they are the first multi-SCU SoCs supported
> by this driver.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Assisted-by: Claude:claude-sonnet-5

Your SoB is the last one.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


