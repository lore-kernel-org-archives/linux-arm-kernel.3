Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F181CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UF1g1L39b0T2WSsLrDGz3aAt7ouAKhUKqYELSYbPgY=; b=IohyHZGTblGJ0kQg0/yNrBPVaz
	wIrkPqPIVmvOuLK6KF7OUPRcrn5axBr3MeFgqrVFSqrWNTjSiS6KILSWnsqQ+m6Yn3YNUOmVBfDqL
	Cj+xtS7vhD3rALxFj6/dro6QRRu8V9xlRhU0A5h3STLRjG5uCk7MPzhkGGErE0+sATSpAPTkjbcJO
	J8YkTN0rDwosM71vazW1eaLX83ihpUSXAQo6f3pBKWcR+69H+D5ZXPHdEp7u5iPLVQBLO3RDAyuD9
	e717uO0s6ZRWxBu+MGvu8NnO0ol4mhyHKaioDCIhCLk+rttgIFygYU3Sie7G//ANs6UNciTaedgJ/
	FxuA59FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEdG-0000000AOU6-3fft;
	Mon, 12 Oct 2026 11:55:54 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEdD-0000000AOSp-3gkC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:55:53 +0000
Message-ID: <19b5306a-2783-408a-b649-5d9ad63eb9f9@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791806149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UF1g1L39b0T2WSsLrDGz3aAt7ouAKhUKqYELSYbPgY=;
	b=s+Z6LiEGyZRFaNqa7pb2KvrwYCgskAFK3nJCcAv44Q1kMo2O8OQN8OZlchAchsnoRo7bry
	J+Ri8bVkcGl1tgkYb5EJCeAXScypFlURD/t5/tIRCiH3wvoUxrzScV37RWRKbyggcEXbMD
	ocQwQBxhGe6IjXAzmNwlkN5vmfiscQE=
Date: Mon, 12 Oct 2026 13:55:48 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 07/10] dt-bindings: pinctrl: apple,pinctrl: Add t6041
 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hector Martin <marcan@marcan.st>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>,
 Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
 <20261010-apple-m4-pro-max-initial-devicetrees-v1-7-781fb3f2d9f6@cyberchaos.dev>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20261010-apple-m4-pro-max-initial-devicetrees-v1-7-781fb3f2d9f6@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_045552_080491_D460A566 
X-CRM114-Status: GOOD (  10.68  )
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

On 10/10/26 18:59, Yureka Lilian wrote:
> The pin controller on the Apple Silicon T604x (M4 Pro/Max) SoCs is
> compatible with t8103. Add "apple,t6041-pinctrl" as SoC specific
> compatible under "apple,t8103-pinctrl".
> ---
>   Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> index bc6d41b63b5d..faef287309f8 100644
> --- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> @@ -22,6 +22,7 @@ properties:
>                 - apple,t6020-pinctrl
>                 - apple,t6030-pinctrl
>                 - apple,t6031-pinctrl
> +              - apple,t6041-pinctrl
>                 - apple,t8122-pinctrl
>                 - apple,t8132-pinctrl
>             - const: apple,t8103-pinctrl

As Linus noted, the sign-off was missing. So here it is:

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>


