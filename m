Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE81AC55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0qIs3ynZHgkXTYTbvPP3qUgG0ysx0KqrNSlrPX/EX8=; b=kXTFFXSCIfcHfJzONrwfTKAEOQ
	kzy93pb5d6FNhp5ZT+pMNLh1zIn4N3/0M0hNygdMEtVfIxx+MK5t221rdhU9W88G6uwpnT0iRhijA
	uH6SlflWvEZdOrA20sAlLsHdjIqS/Aayxcf47kjLPGl1cwr9piOmo7QdcRPy2uLzJ2R6AkqUFgMks
	rqXZJPPyXQc5j91jdNYnZknmivUWM1ndiyAsWwB1OwV9d1fs9HaPt5vyMsLcfsbcfbcMxplQ7fTZ6
	sCSF7kUJG85cVRQ3//VJMsb81DcbKZl2tP3QrHrusLfAIZFw8sIuqUAG2v26f2dGehdGygkOoIf2k
	UYyQ+FgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQ6H-0000000AUqY-3Ige;
	Thu, 30 Jul 2026 12:43:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQ65-0000000AUoU-2XtN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:42:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C63B60A6C;
	Thu, 30 Jul 2026 12:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD35F1F000E9;
	Thu, 30 Jul 2026 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785415366;
	bh=w0qIs3ynZHgkXTYTbvPP3qUgG0ysx0KqrNSlrPX/EX8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=k55iXxW/57vq4N7SQpzmf7TxlWiDqiu6jL+I4xd5BgkznDjH5YKXqPabxXI86qHbU
	 3l0qGAPwnGS3ynu24kjqGaj3WRAKGkCVujl23HrcAh3cufaV0drXP7j65LGeeIbDQx
	 SkqIir1IzMQF0cgHaZgbgm2riM/d3Cidi5UC2dNfOdQDV6ZPhUeR4Hcg8DuVFmwHdc
	 KoaAHJAOeAbEMvHTAumgQDANvEFfcycUxNWMFdI3Cqt3/PeFuozDET6dbY2dLHBSWV
	 hsK2/tm4vNz7XQ0zAaoPPWxi8IGFXU5o5jDsABEUAQ5kuo+MhggSqE6Tm8iTQOZ/We
	 UvaIEpAQP+N0g==
Date: Thu, 30 Jul 2026 07:42:46 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, 
 devicetree@vger.kernel.org, soc@lists.linux.dev, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-clk@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-serial@vger.kernel.org
To: Long Zhao <longzhao@ambarella.com>
In-Reply-To: <20260730104330.81367-4-longzhao@ambarella.com>
References: <20260730104330.81367-1-longzhao@ambarella.com>
 <20260730104330.81367-4-longzhao@ambarella.com>
Message-Id: <178541536479.2601751.14563666222918731032.robh@kernel.org>
Subject: Re: [PATCH 03/10] dt-bindings: clock: add Ambarella CV75 RCT clock
 controller
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


On Thu, 30 Jul 2026 18:43:23 +0800, Long Zhao wrote:
> Add the CV75 RCT clock controller binding and clock ID header.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../bindings/clock/ambarella,cv75-rct.yaml    | 94 +++++++++++++++++++
>  .../dt-bindings/clock/ambarella,cv75-clock.h  | 17 ++++
>  2 files changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
>  create mode 100644 include/dt-bindings/clock/ambarella,cv75-clock.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/ambarella,cv75-rct.example.dtb: / (ambarella,cv75-evk): 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260730104330.81367-4-longzhao@ambarella.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


