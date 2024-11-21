Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ACDD75BD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyOXdCRDBjs5e/z0/LvgVhMu8edj3REOZ9UjsKDmyPs=; b=MuRmm6nDNEXFxFAL00u1KP6nff
	AGZSrHFGe27GuXsN8TJp3ZXNQfA2ceryKPt5jOaBs+zexCJoxuCRFTPNKua3+D+5BOgD5wIDzqHRA
	7Qn3ukQ55UzmqwbPq7WILFSBb++r0cjj8CP1JzoSoMnbfLLSE1lEN/xRQxg/nTUxQ51IfNw8FvfGO
	jza7gdbbWxPYSH7MuDu5PdOBCWXPPnE6ujgoE8H/9AhaEN/Ze2ilD77OOgGye/4VGIUMmZzf36dzw
	n8qVdom8MNAsUqHLY+rDXpWHDBd0AF4w2ET5FG0TOglNVsZN5tWEC+MBcI6TYdOfzx2pPIiu6/ncE
	3ZCqjX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2Zn-0000000H6Bl-3KUF;
	Thu, 21 Nov 2024 08:30:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE2Yr-0000000H616-0m6S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 08:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E049A40266;
	Thu, 21 Nov 2024 08:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D175CC4CECC;
	Thu, 21 Nov 2024 08:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732177751;
	bh=jI8NHi8G+Wq7vsn+8sraQFg2O7HBgJMMZWRRb1whbGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PnAQzOn3eltLr61OwJdBkrNCp84VdxjhOaWdJj5jwupNmUAW+fgCxGdVYi1u+4Uf6
	 w8sOx+eYMqedJv3IH2gCsx+oFCmhqf83fEonTvFR2KABkkaoKyMrxZxVeB8SnarRls
	 lSjeeIR60e3P017SBClhSDCT0XlWz2jLT7UHgwvRcI6cqm0ElOcmI9uzssomnkPen+
	 7mxq4usUuT8tUvZxpbE8QmBanM4sSFdvgybqCsKqrVoBV/CJCcoObnZNo57iFedZsl
	 ZDFGRYk5DBdEXxT2OZlZn0eax+v1BITx3xy68frt9dmCSMGDmJWhA38aVqrm5mvxht
	 AqarzOygFaqvA==
Date: Thu, 21 Nov 2024 09:29:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@microchip.com>
Subject: Re: [PATCH v3] dt-bindings: net: can: atmel: Convert to json schema
Message-ID: <ahftyfnreh27z6jyvdf2wwhhp5rcbkydy6afnkct77ppqlko56@5cvw5bmzcjb6>
References: <20241120-can-v3-1-da5bb4f6128d@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120-can-v3-1-da5bb4f6128d@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_002913_288946_93FCC5D5 
X-CRM114-Status: GOOD (  17.77  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-can@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Nov 20, 2024 at 01:58:08PM +0530, Charan Pedumuru wrote:
> Convert old text based binding to json schema.
> Changes during conversion:
> - Add a fallback for `microchip,sam9x60-can` as it is compatible with the
>   CAN IP core on `atmel,at91sam9x5-can`.
> - Add the required properties `clock` and `clock-names`, which were
>   missing in the original binding.
> - Update examples and include appropriate file directives to resolve
>   errors identified by `dt_binding_check` and `dtbs_check`.

...

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/at91.h>
> +    can@f000c000 {
> +          compatible = "atmel,at91sam9263-can";

If there is going to be any resend - fix the indentation: Use 4 spaces
for example indentation.

No need to resend just for this.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


