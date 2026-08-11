Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5277C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOISgtHJcoVhgbuQw7i0w6TcTYQ6uT3lh6JpZDeNOrI=; b=AlfyMGlR1OzqmDQJ9eDsyJ3DRE
	jLQyc+vD++VsytbzDVzolCTETLASbmDcKX0LfyDmklInzwWF3SxiaBMomkPiegsNwD/GP+snyLJg6
	j/7ItNNv4dh7SXeL/F48fYyzaWJ8/mvEgw5DL/8w1JicY71cxAy4SL/r4kl6ZI3ZCbmyDMNi/phnd
	JML5VdZlT0EnXOP7jEXpe0wEGN5sOgBCQaSzSgOM/JArEPRP3a87HXvszCznSBcPxPbeJngarAAnl
	xw65jW32Iw35EXXTcsLfQIbraxejDXbZZLCigXHRCN4vlqjnuSpCKBN9Cszg++s0sgZEJwGrKsmXQ
	7VGQ6TKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmuy-0000000E8fM-04b2;
	Tue, 11 Aug 2026 13:53:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmux-0000000E8fG-0G9M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:53:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CEE3C4147C;
	Tue, 11 Aug 2026 13:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB351F000E9;
	Tue, 11 Aug 2026 13:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456402;
	bh=zOISgtHJcoVhgbuQw7i0w6TcTYQ6uT3lh6JpZDeNOrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X8WocTfHhpLtdAwDoaaQDw/vdNWROCYyO3plt/WqxSeP3Wo6K3OvPtwIsjIXu0ca2
	 QNvX3PqF2wNK+1PDfdhf4dGEtpNaiBB5fyglxRi1EJOIfrYSFfNGXvI3fNqFKlaD4q
	 roE2kLEz5AWLENwxlSVzftQXQ7wpXTxUIuLqXZN4m68iGh/JB2aDpBvoRc8f3mVFit
	 /wKatjrvVPjtTRTv8xXvwx0AgMW3rYRyPk+oLZnXCAkro15h3f3pviKeE60rDzBHXv
	 O+7aIFFUoKnHs3QnI/bqvQqQlRrsKCd8cHs5Su6oGkMVwgd4/Z2O4bdqKdPUWVf8TB
	 1f3JxiYEoGBUw==
Date: Tue, 11 Aug 2026 08:53:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: linux-pwm@vger.kernel.org, Hector Martin <marcan@marcan.st>,
	asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
	Radu Rendec <radu@rendec.net>, Sven Peter <sven@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Janne Grunau <j@jannau.net>,
	Linus Walleij <linusw@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neal Gompa <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-i2c@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 5/9] dt-bindings: pinctrl: apple,pinctrl: Add t8132
 compatible
Message-ID: <178645640149.2074555.4681413696186496761.robh@kernel.org>
References: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
 <20260801-apple-m4-initial-devicetrees-v2-5-5cb07cc275da@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-apple-m4-initial-devicetrees-v2-5-5cb07cc275da@cyberchaos.dev>
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


On Sat, 01 Aug 2026 23:40:35 +0200, Yureka Lilian wrote:
> The pin controller on the Apple silicon t8132 (M4) SoC is compatible
> with t8103. Add "apple,t8132-pinctrl" as SoC specific compatible under
> "apple,t8103-pinctrl".
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> 
> ---
> This should be pulled via the pinctrl subtree, since it depends on
> "dt-bindings: pinctrl: apple,pinctrl: Add t6030 and t6031 compatibles"[1]
> which has been applied in the pinctrl tree. Thanks!
> 
> Link: https://lore.kernel.org/all/20260709-apple-t603x-initial-devices-v1-7-55b305833123@jannau.net/ [1]
> ---
>  Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


