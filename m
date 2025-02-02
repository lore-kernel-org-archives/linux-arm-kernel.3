Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D246FC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUH3W0i9TUw3UIqprvF2Ju8lMKQU6MlpSQFAKIXtD0g=; b=OqLRdOjm6kK3deUmaf1/g0X6gs
	2Iz+sEbnlFDyeUdb/mxpk3mLHeH0ecVUHvdIK81JKSrdLrg5sWeOjFlYxv2IBW3vvbPFvLNJeJa/3
	jfxh/hrYhtW5Xp/lwoLPHaMKTvTeeTv5z1OMKlvrch70ny3I7rSaJ8y8oj5VizDEMUqrqI0m4yivC
	wDcV0lvNWCMvu5zHF6q8TMu5ck6aJeGU/Sl9VSwnc+oKD9Uk+utsDlMRCu1k/fq5OzyQvUeVD9nmN
	TnTE4L7IvynJiSPVA9St2QCT8KesWRKSSDcIf4SEJJtX4znkUaGwoAeGYTnAvmzZJdRoST47+86Hm
	taBMQkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teaWE-0000000Dq0U-0rrW;
	Sun, 02 Feb 2025 14:00:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teaUu-0000000Dpuz-4C0u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 13:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE2C0A40BC3;
	Sun,  2 Feb 2025 13:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A03C4CEE0;
	Sun,  2 Feb 2025 13:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738504731;
	bh=HsGsVQio4UuScW1+1uU6H+TanyCHNIVvBIuyo4NfgRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OTa14oOTIMLKU2Mx3rpLSUqQHthlbrXHynHGn8QG4XXjnEqTr80+oDxkA0zIeIkkx
	 19mGNqVoKBfAWFbaI/Zx1vko3qLLBBtxTAdJnLuNPD/7nifBu17rqV8bTw+dAINUFo
	 VNesmVx5k3kUDamR1RS3cuYlmL0rhcFGwRVxHs1qylk/4a4GYcegQJwYQ8BJ+3uX/q
	 xk/OkL6g7kZ9JcHD7zFCsQR6dG1My7lyny15sLnt2Oa3ib1FHKB8CDzKZX94HALzAg
	 Ykx9i2e7+6vmoJhXlAQnEu+ZXUsejcQwn092redIHgoeZQxE3bMP/+eoAGDpQnYElN
	 A1DfX/yyjsZNg==
Date: Sun, 2 Feb 2025 14:58:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] dt-bindings: ARM: at91: add Calao USB boards
Message-ID: <20250202-horned-singing-cormorant-afdc77@krzk-bin>
References: <20250131162713.33524-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250131162713.33524-2-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_055853_120577_11E5C863 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: Rob Herring <robh@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jan 31, 2025 at 05:27:13PM +0100, Wolfram Sang wrote:
> They have not been added so far. dtbs_check complains loudly.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> index 0ec29366e6c2..42469a054a60 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> @@ -23,6 +23,9 @@ properties:
>            - const: atmel,at91rm9200
>        - items:
>            - enum:
> +              - calao,usb-a9260
> +              - calao,usb-a9263
> +              - calao,usb-a9g20

I don't undertstand why calao,usb-a9g20 or existing olimex,sam9-l9260
can be fitted with any SoC.  If that's expected, mention in commit msg.
If not, then this needs to be fixed, not grew.


>                - olimex,sam9-l9260
>            - enum:
>                - atmel,at91sam9260
> @@ -35,6 +38,11 @@ properties:
>                - atmel,at91sam9xe
>                - atmel,at91sam9x60
>            - const: atmel,at91sam9

Line break.

> +      - items:
> +          - const: calao,usb-a9g20-lpw
> +          - const: calao,usb-a9g20
> +          - const: atmel,at91sam9g20
> +          - const: atmel,at91sam9

Best regards,
Krzysztof


