Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA6BCA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRcYQiuliJ1CdaOaqf97NB/suFRAHUr80VIP8a+WeIU=; b=YLub0umnJoElZCE1z7z6gWitab
	W+Lao6KJZriD13RIf8byhU7u2tV34MB8EKxEktOEM0H+4atd/YN3xFmm+RY/2smJYYE7+DzxZerGg
	lEY6fd8Wnwr5cUg+JUOiD9bGoSyXRzcDHS1Bb3h8BCp8oIkN5JT2ev5fEz9XiCMCGAPHcHmdOhvF0
	Mw5rJ1RAfrka/LX26yS11RdKDdqEuIuS76iBMZJ9huDPL1d8GUDB1Tpzmm3ZzEPRCpXvsa/yN2y/I
	qm4EPLcJiOv6XzRX/bDYy5nkuqElKgHnlNAJ4IGLMAQYX56bAaquE1CcHfcpt2nSu9XeMQgP9LiY3
	gGzeYEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFagQ-00000008Jtt-13Gg;
	Sat, 10 Oct 2026 17:16:30 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFagK-00000008JtG-3Yqi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 17:16:28 +0000
Message-ID: <d3f9eb19-6d5f-4246-95e4-09e92e1d175f@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791652581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BRcYQiuliJ1CdaOaqf97NB/suFRAHUr80VIP8a+WeIU=;
	b=Zdm9Q81gtriKJ0svM57CLsbj6ZQNDg4vjqskmZUts3SkfiRPgJiny0m0XLKpTabLpR68zS
	7382gHybp6exR5/EyyLipW3IzRAC6LCfAJv0QE+EEeKXJDXwzzQevxNdpZ1c3vgQ7Ia1gC
	9g3+Rs5C/R1BN1Fq+7kfV3YnlbsN8+c=
Date: Sat, 10 Oct 2026 19:16:21 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 02/10] dt-bindings: interrupt-controller: apple,aic2: Add
 t6041 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hector Martin <marcan@marcan.st>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>,
 Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261010-apple-m4-pro-max-initial-devicetrees-v1-0-781fb3f2d9f6@cyberchaos.dev>
 <20261010-apple-m4-pro-max-initial-devicetrees-v1-2-781fb3f2d9f6@cyberchaos.dev>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20261010-apple-m4-pro-max-initial-devicetrees-v1-2-781fb3f2d9f6@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_101627_357852_F0A0876F 
X-CRM114-Status: GOOD (  13.27  )
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
> The Apple t604x (M4 Pro/Max) SoCs use an AIC3 as interrupt controller,
> same as the previous M3-M4 SoCs.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Apologies, the Acked-by and Reviewed-by were wrongly copy & pasted from 
a previous commit. This commit was NOT acked or reviewed by anyone. I 
had noticed this a few days before but somehow ended up sending out the 
wrong version :/

> ---
>   Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> index e3cadc5ad39d..fa9d89cb40b1 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> @@ -37,6 +37,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              # Do not add additional SoC to this list.
>                 - apple,t6000-aic
>                 - apple,t6020-aic
>                 - apple,t8112-aic
> @@ -45,6 +46,7 @@ properties:
>             - enum:
>                 - apple,t6030-aic3
>                 - apple,t6031-aic3
> +              - apple,t6041-aic3
>                 - apple,t8132-aic3
>                 - apple,t8140-aic3
>             - const: apple,t8122-aic3
> @@ -134,6 +136,7 @@ allOf:
>                 - apple,t6000-aic
>                 - apple,t6020-aic
>                 - apple,t6031-aic3
> +              - apple,t6050-aic3
>       then:
>         properties:
>           '#interrupt-cells':
>

