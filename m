Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5041E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 08:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzsWufQ5CePndhoSrNxHb/WhGaG8ZtSj1O5R7kpktm0=; b=VLXLCi9bSGvsb8dqFuBb6+X79H
	dyePu7lc+PEHM75uLFuk9eyLbX0dsZKwIwOaRgu52OSTXKLNPyXjDNagemxa+Fsf4++/z1PVp8szr
	sa6cIPusvOEpgGqYRzXFZt2iid5Z+bWnYjGO8qSBwBZlGYDszHy+LP+eB1TkWqZFl8HvMiwXTJjPc
	nDS4Q3l21okivE3EFHVc/+e93iU9gmsE3Xe4jq3ye6BiF4oy2CeEU7awlNWz5Yhbi/yIhN8VrzwEs
	eN4TLUYcATF0LErsQK+zSnbckWU3jNzapgynDST3oh30aOzHovjxxGL0mGjyK+pQTfOdmxiHxwV6O
	s6rVRSsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTG8I-00000009twy-12Lr;
	Thu, 02 Jan 2025 08:00:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTG6x-00000009tje-23Vm;
	Thu, 02 Jan 2025 07:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 773DFA40100;
	Thu,  2 Jan 2025 07:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B16BC4CED0;
	Thu,  2 Jan 2025 07:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735804758;
	bh=Wtds6vwJjBF4P/XZvYFiH00JqcJXxnLQHetnGMvlTUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTMfkafwdqE5Xtg30VWOi0HKrhX2KrG/HBucVTsuWPOgi/HepUzTyW6wm19DAJKgs
	 KvzXYINs5yYtWlkd5lZmg+gUOoFKINYa+otZWQY2OG/qtfq+C42aojIzPOIQ2FAO9s
	 Gien8iO5D+rNiFYkai3gJi0Ox+ISHOPVFD+081P+ZTo+j4tgiv5rQfa2OCdUfxMmVP
	 5LeVe/BBXGr/l54RIoKXPYLKKdkEmPIn0hsvv/icOXIkqi3qWsE2628XStkprVP0Ot
	 AwmfDm2eLuACKbLKiE1xvclC2yaroUHinrtBR63qQGA1bv572DAlRRztj0/4RYUcQl
	 nAF9LHNEC4f+w==
Date: Thu, 2 Jan 2025 08:59:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, gnstark@salutedevices.com, jic23@kernel.org, lars@metafoo.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	christianshewitt@gmail.com
Subject: Re: [RFC PATCH v1 1/2] dt-bindings: iio: adc: amlogic,meson-saradc:
 Add GXLX SoC compatible
Message-ID: <akqtrf3yklgplxutne63fq4iz2cxw4gkzinjgxldjdabbsvusd@rfuofb3bcqmx>
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
 <20241231194207.2772750-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241231194207.2772750-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_235919_610133_AB321A3E 
X-CRM114-Status: GOOD (  10.24  )
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

On Tue, Dec 31, 2024 at 08:42:06PM +0100, Martin Blumenstingl wrote:
> Add a compatible string for the GXLX SoC. It's very similar to GXL but
> has three additional bits in MESON_SAR_ADC_REG12 for the three MPLL
> clocks.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml        | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


