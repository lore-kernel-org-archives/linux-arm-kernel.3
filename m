Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAB3CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdZLTCI+Yo35fJ2RRGRjjNNpS0Qcv7D95HtE6X6CoPI=; b=pIQG1mAe5Rqh3lM5v2lUyCCl7X
	Uv7AdlWNB8Zi3AD3JmSAbFeDgaWRhgmgZsqF2gDrCnRG0jwJ+ZtY+K0j0aNJsHNqBcgeFqZ+I1U8H
	WD9bEW5EbJj+SBQKpbh9j6cIAvSkLwTvywtka8EJn9i63U81RHWs4XfnpcsresS1JDsng017bfO0R
	QLwQznuolpXEjohkHJuKenlSYjc5S788AqXU8S19LJzVS1RM9H1zmJkhEATHd3Eb11+1t9HTZ1Jf7
	SkhUOEqy12ganMzTrTBmHbHEyJSN+5zeYDZryYLpVdTuSqK6QJmiSU5PiOhvk5AskSWBtq8g7/PW+
	RZucPGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDxf-0000000BaKZ-1MA9;
	Tue, 04 Nov 2025 10:08:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGDxc-0000000BaJl-1Vco
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 10:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C31B43B8C;
	Tue,  4 Nov 2025 10:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37DBC4CEF7;
	Tue,  4 Nov 2025 10:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762250899;
	bh=qO3WBVAPbxP4+oRxYAr9CsbFrExWM8O4nijZWjABxME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6lVN0C3JfLA+t8d+cw2jvUcx4IUtu2rer97kxIxwOGMSLifiMZaYjQTCecyvc0n3
	 P3cH8j4yB1SFDCHLuuABNfDtunGs6hi/F5VI+Afjbe5LajAtRHAHLsYkvz7WfLpQvF
	 nX2tMp2UuoS1ZMVQWe8xnywDIGLlkPjdd5W9q9wrBwuES3mLonzP4oXyWsacWa1DDS
	 MYnBWEhRe9nTQ8Bt/X3lFg4cOoXx3snKeiq6n6KgBXeaQ3cMl4Z6+wc5lACf/uF8Sr
	 Be3Xw4HON5okRjC2sFcic33cOiePOLkMGi91bPWw16VxNeGYTAfjxI7r5b9fboj1C6
	 qgl2Nc4iOAXQg==
Date: Tue, 4 Nov 2025 11:08:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add AST2700 ADC compatible
 strings
Message-ID: <20251104-enthusiastic-cinnamon-urchin-da480a@kuoka>
References: <20251103105217.1764355-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103105217.1764355-1-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_020820_420675_C8C60815 
X-CRM114-Status: GOOD (  11.22  )
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

On Mon, Nov 03, 2025 at 06:52:16PM +0800, Billy Tsai wrote:
> Add the compatible strings "aspeed,ast2700-adc0" and "aspeed,ast2700-adc1"
> to the binding for the Aspeed ADC. These new compatibles represent the
> ADC instances found on the AST2700 SoC, which are similar to the AST2600
> but have their trimming data located at different SCU offset.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml         | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


