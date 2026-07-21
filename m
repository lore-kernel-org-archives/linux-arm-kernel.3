Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0754AC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z++pE21nLJXJJg1BIOPJk+S2n/QJjhsEu8ZSVPIm7QU=; b=ScQCI78Ia2xRQxRk8jt4MRfJsU
	nQD/mQCn5LuzRYEzAJiNB5/01hfYUdxBWXC8V8xLuR5BLSg0uBWpWZmzKYcLSp6He2I3GZ6QunAJX
	O1xV2uYsdknyjo3P2htHOfK5uUQ/2JNlvdn0WdpgpeHQ5NT1OGxTMMFvCaiNfdP7iAP9zDz5SuLz+
	mLllcj+tQ1UIOLKA34KFMCS6d9ubob+VwrL7pGE5s1qwAsbwL6YPmxXVsGPpRCJaH9KAQcQ6iJ6np
	pWx4UOW/RSeag6kj+Pm6VjYd2VFfZn+HMAeJReBz7MgzRu79mICtK7iwqd2LiZVJzcSZr+wzhMr45
	qlq61oiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5bk-00000008lLp-0A8s;
	Tue, 21 Jul 2026 08:13:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5bi-00000008lL3-33yV;
	Tue, 21 Jul 2026 08:13:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F66060A95;
	Tue, 21 Jul 2026 08:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04611F000E9;
	Tue, 21 Jul 2026 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784621621;
	bh=z++pE21nLJXJJg1BIOPJk+S2n/QJjhsEu8ZSVPIm7QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tk4ddljRsI3lpF1DgL57KFZuV4kwZIn7ytSSPu0mjH1bcHJ49WNl6D5Qmxso3lMQB
	 hssk6K3t7jSSIboRGq5KNSnPLJVAWHnwtW7OfRQR7QwfmPcH0zRJqK3g+uHWetYFwQ
	 GNfArEOkYEr6Vx8JG7fl8RdUi4QUDrJ5kcM6HArbokaBzr1OMaOMIxLY/Vlq3seYyy
	 D/mVUanA9EQtGthgqcsf8I1so2I4qCGlc2TT9vkuBFsU4SSQPTlbpWXsB30I8xRZZb
	 MESngIpSoVSfx8U+vcau76QKjzbxXIbeIOGhx9HMmTFuKbjIewV3V4ss3EKs1uWJro
	 mwMko09/Y6y5g==
Date: Tue, 21 Jul 2026 10:13:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Rob Herring <robh@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: rockchip,gpio-bank: Add
 rockchip,grf property
Message-ID: <20260721-ambrosial-raccoon-of-glee-6219dd@quoll>
References: <20260714192535.2082729-1-sjg@chromium.org>
 <20260714132531.v2.1.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714132531.v2.1.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
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

On Tue, Jul 14, 2026 at 01:25:29PM -0600, Simon Glass wrote:
> Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
> IO control (IOC) register block rather than grouping the registers of
> all banks into a shared GRF region. Add an optional rockchip,grf
> property to the gpio-bank binding so that each bank node can reference
> the syscon for its own IOC block.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v2:
> - Add new patch for the per-bank IOC reference
> 
>  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index bdd83f42615c..774e9c7de606 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -44,6 +44,13 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node managing the IO control registers
> +      of this bank, on SoCs such as the RV1106 where each GPIO bank has
> +      its own IOC block.

I do not see usage of it in patchset linked in cover letter with DTS.

I have doubts that whil having one GRF region you have GPIO banks
pointing to different GRF regions.

It's possible if you would have multiple GRFs, but you do not. You have
one GRF, right?

Best regards,
Krzysztof


