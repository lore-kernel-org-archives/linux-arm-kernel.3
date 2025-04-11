Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332C7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgT9ShcCxq0tempwGtPeB1rJCXy6sJgupH0V6GmMDsE=; b=3Dthhms5eIPtS1uXsbushXBswD
	gQ/Xj+1mTneq/A3/O19LfVlogvJnzTT2Yq/WxVx92pbN+Xki0o698EptRD/wmRGZabv/daLzfpj7M
	LZHz5ahy/Dk1kKrIw4Oyxk05l0KOVz9sHtkT8uV5XOy0o63+8z8QCgmFOLHXH/2FtQC5E/pB4S22F
	YNfFd65Vv1T6HaAoQFe/TQHTFNc8OMhDj/nemIS2tJ0tFX2orlm/MDXMjU8Gu48HTDZ1Nudt/BcY+
	nVrBlX8VCYOOfN8qS00hkbq9+K+n4t3Z4Vm7lqe+DxJTow9xK2zq3UiuyoqeRBNVuyUFSxRsgDdqy
	H7olGEVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AUT-0000000DA5C-1iMP;
	Fri, 11 Apr 2025 09:16:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ASd-0000000D9nQ-3RtU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:14:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 627F2106F;
	Fri, 11 Apr 2025 02:14:04 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DCDD3F6A8;
	Fri, 11 Apr 2025 02:14:01 -0700 (PDT)
Date: Fri, 11 Apr 2025 10:13:58 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH 6/6] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
Message-ID: <20250411101358.03b100ba@donnerap.manchester.arm.com>
In-Reply-To: <20250410165044.766460-7-iuncuim@gmail.com_quarantine>
References: <20250410165044.766460-1-iuncuim@gmail.com>
	<20250410165044.766460-7-iuncuim@gmail.com_quarantine>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_021407_908150_8730A927 
X-CRM114-Status: GOOD (  15.76  )
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

On Fri, 11 Apr 2025 00:50:44 +0800
iuncuim <iuncuim@gmail.com> wrote:

Hi Mikhail,

many thanks for sending!

This patch needs to come earlier in the series, before the .dts patches,
and I think ideally even before the driver patches.
The repo needs to be clean at any given commit, as it stands right now the
DT validation would fail if run on patch 5/6 only.

More below...

> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Add dt-bindings description of the thermal sensors in the A523 processor.
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> index 3e61689f6..70ac395ef 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> @@ -24,17 +24,21 @@ properties:
>        - allwinner,sun50i-h5-ths
>        - allwinner,sun50i-h6-ths
>        - allwinner,sun50i-h616-ths
> +      - allwinner,sun55i-a523-ths0
> +      - allwinner,sun55i-a523-ths1
>  
>    clocks:
>      minItems: 1
>      items:
>        - description: Bus Clock
> +      - description: GPADC Clock

The new clock needs to come last, to preserve the order for the existing
chips.

>        - description: Module Clock
>  
>    clock-names:
>      minItems: 1
>      items:
>        - const: bus
> +      - const: gpadc

Same here, of course.

And don't you need to adjust the number of clocks in the allOf: section
below, to require exactly three clocks for the A523?

Cheers,
Andre

>        - const: mod
>  
>    reg:
> @@ -107,6 +111,7 @@ allOf:
>              enum:
>                - allwinner,sun8i-h3-ths
>                - allwinner,sun20i-d1-ths
> +              - allwinner,sun55i-a523-ths0
>  
>      then:
>        properties:


