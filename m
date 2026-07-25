Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73C7C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoGEFV9W8VcfITu4HQVE0hQUFylWMzhgH6YtxdV5TFY=; b=MdKZ1MuS/x0IW0alvSa/EKmJhA
	2SP4poKHyXostExMIv3aJWsHkDOU1/Wai4ry7KIj5AY00JTOKR3rqc2GTrxEuvIEtLdSgkHqrX83l
	JwDj1cfOw1TQL4kdHLZMVyRdKDHj2W7Bu0UbPG6/1UFkkUjAlAL5a0BxfRrFbqIvXrkt1LlZ8ha+t
	bqSOw1u2jhqCKsXBR5/OHuWAdqMjSoqPrHjAswgs5QEROfV37yrzXS0atB8lcdKLKfrMdFmR8Wvvd
	je5N5U2Yrc5J5e+OoyvPe6/ual3H0Fsek5PTqeoqITTWV8fmJxkbNGWCTLUYRFj1Jypd32O4d4Vi4
	W0EhRZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wneI8-00000000U9k-2PSC;
	Sat, 25 Jul 2026 15:27:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wneI7-00000000U9e-0UBS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 15:27:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 282DE600DA;
	Sat, 25 Jul 2026 15:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23F61F000E9;
	Sat, 25 Jul 2026 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784993273;
	bh=DoGEFV9W8VcfITu4HQVE0hQUFylWMzhgH6YtxdV5TFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P+P0rPlq9J7moW6oZrKzpl0OkghAB/d/MPzcY7VwjuxKRY6QXyxEKv83oSiNcUiYI
	 hObpIvzZO8OWOqxJjhQPoOHCrAcaLok3GzuDJMHrwow0pYGjeujc3uXg5aaW+xVJBd
	 FkXXB94B7IIrxNUYH6BDeNW4xQ0GCwHo2vzV36wjP8V8XpP7dzNtZ8hIwtXvluTI1+
	 LpJ634Ud0gFeSrYZk8LXVOHLs2aolJI0dGbM2AbRpa1Cnc7bSr2MpoA2nHEoT7MDh/
	 KZoxpUxdfcg/vVInU9f3+yDtEeT/Eq39M5fgRmfFUox9rl6p52K/EA5jIdUaJW5tGY
	 mMNqT8KRk34Kg==
Date: Sat, 25 Jul 2026 17:27:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, Frank.li@nxp.com, r-sharma3@ti.com, 
	gehariprasath@ti.com
Subject: Re: [PATCH v7 14/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Message-ID: <20260725-massive-meteoric-guppy-70569b@quoll>
References: <20260724102115.2854-1-s-adivi@ti.com>
 <20260724102115.2854-15-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724102115.2854-15-s-adivi@ti.com>
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

On Fri, Jul 24, 2026 at 03:50:47PM +0530, Sai Sree Kartheek Adivi wrote:
> +      cell 2: ASEL value for the channel
> +
> +  interrupts:
> +    minItems: 78

Drop

> +    maxItems: 78
> +    description:
> +      Interrupts for DMA channels.
> +
> +  interrupt-names:
> +    minItems: 78

Drop

> +    maxItems: 78
> +    items:
> +      pattern: "^(t|r)flow([0-9]|1[0-3]|1[6-9]|2[0-9]|3[0-9]|4[0-7]|6[4-9]|7[0-9]|9[6-9]|10[0-9]|11[01])$"
> +    description:
> +      The name of the interrupt corresponding to the DMA flow.
> +      TX flows use the "tflow" prefix, RX flows use the "rflow" prefix.a

This could be tx-123, instead of tflow123 (and same for rx- instead of
rflow), feels more readable, but not really important.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


