Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBC5CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tn7CHjIH+1k2SDeXvJO8L54oXnvTAvyTElqOzEbIrww=; b=pagEuDrgxyj1OwMpeBQ3F7r1wd
	ss9qnJw9OVwqAkqbPQ3d47+YsRd2EY1Bx8F3UTojaL71Uq0nOSKd2yg7SgACeVAJunmSPR7IshIop
	k+YnC242a2wpJTehTv6h5xHv1mKQfkRpubMQcHsJTLNEXL1JRDxFZbzvgBr7lq4nNN9kY1bBam7/F
	bBnGuzWcDiFoHs3uPuowhB9T4IxCDE0dwk5GFGDQT6lUFVRu8eBr0L0OH7hJStNES8cznP2VTlUJb
	HK4g/dXY2sSZiys9dRspni6eD8TKFDqfFCyagNU3jW/vbSGrkd0ZNh1i3SRX+tUYj4LEmcFGiYyOV
	E0Lf3s3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZeo-0000000BADr-0ENb;
	Fri, 02 Oct 2026 09:34:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZen-0000000BADc-1JTT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:34:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE67360A82;
	Fri,  2 Oct 2026 09:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C9C1F000FF;
	Fri,  2 Oct 2026 09:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790933660;
	bh=tn7CHjIH+1k2SDeXvJO8L54oXnvTAvyTElqOzEbIrww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GChv5trbPWXmac1WVDsUKpEfwxsbWGChc/pylUfyr0NwBtdUVxVK3h50hdtBefj7H
	 HoL8yZRynoxcn0lJ8sfRYEoLANdujYIfydUvknoSL6ozr+dIaxqoHSKDVcHccO9Gkn
	 VRl7XibOYY1ZCGWhrC586RbpGiMwdOxTUPsYyi8mUeQmTKeIZNXmowhDh7Ihioxs/8
	 VO3ZKPD/ApwU1U0w6rcZS4j2vd6SA/PcCllGKOSx8+ZDLAkLcxn8tUR3MsQ5q1wU9Z
	 Vi6LzeiKvJmnUqldA5NGk5wgFQ6+Jv8JL4eLg1BNovXluj3+gM1XnCsuYzg1q3tuwx
	 7UGCoyBHVRXBg==
Date: Fri, 2 Oct 2026 11:34:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: add bindings for stm32 mdf
 filter
Message-ID: <20261002-observant-gleaming-koel-4dc04c@quoll>
References: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
 <20261001145702.2628429-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001145702.2628429-2-olivier.moysan@foss.st.com>
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

On Thu, Oct 01, 2026 at 04:56:45PM +0200, Olivier Moysan wrote:
> +  clock-output-names:
> +    description: |
> +      CCK0 and CCK1 are optional output clocks, which share the same clock frequency,
> +      but can be gated independently to save power.
> +    minItems: 1
> +    maxItems: 2
> +    oneOf:
> +      - items:
> +          - const: cck0
> +      - items:
> +          - const: cck1
> +      - items:
> +          - const: cck0
> +          - const: cck1

Use simpler notation:
minItems: 1
items:
  - enum
  - const

> +
> +  clock-frequency:
> +    description: |

Drop | when not needed.

> +      Common clock frequency (Hz) for CCK0 and CCK1 output clocks.
> +      The frequency must be a multiple of the "ker_ck" clock frequency.
> +    maximum: 25000000

So here is the clock-frequency. No, these are output clocks as written
above, so consumer sets it, not the provider. Or use existing assigned
properties. This is even mentioned on DTS101 slides, really...

Best regards,
Krzysztof


