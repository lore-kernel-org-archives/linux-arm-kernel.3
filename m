Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07424CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS3tEt0ZcmVbPx/5QD48l1DIJzlT1nMDifXpMkbDJ1Y=; b=zO+vtkxRaES5qs91KWlavb4gYn
	26GIoDsX66raDxdwC2vvN+qcSVn1nziy9mVtlCjZvkPdtlrIewb9jyNn9xg+KzRBLGnn/3Z67XQ+a
	x9rtaEvw8D8FDDpyVaSWxX7qWeEJslgcEPcrfKvloJIGlbbVxKu3nSw8/ce9bnD9/R0J+KqOSDngW
	4Qc3/pFmmddbps//lXnRb2xMTN3iRljGVmcua0oEo3dvz1wfiZcAWLoEK09+Bm6HmOShzFU7fLRUX
	R73UB+I8o554ja+Gqy7YH+8lpKRRIX1HBM1vUUC2BJsxRM5wtBqu0B1BjSvrQTd48kdbGAVkCbF/k
	ZB8rFveQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4oA-00000003DXB-2VHu;
	Wed, 27 May 2026 03:19:50 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4o7-00000003DWS-432O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779851985;
	bh=RS3tEt0ZcmVbPx/5QD48l1DIJzlT1nMDifXpMkbDJ1Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=APLx//61j60ZOooYHs9WVkywLOkinvyZktLXiy4xpewiu2D6IRWK3Wia4FMcaTNXB
	 VI+e3htamPSpVAx/jBzoDnDD7ieUDk1tN0OsmdNLt8jGlsrgO1DFmGDlleqCB6R/kU
	 rtsRe9aMpwVxvdo5ytugqpJQNv8fFvsOPcKn4o29dJqMTFKLZ1PEYuO19Tw3Nvs4wA
	 ZiyG7EUje5pUp690jx8IoJdcF162YOxL/2Ur3D+Ch9gQqPX/1jsaA9fJ3nUrqQgxnD
	 TvD55DvvahqpvmWl/Kw/ZQqnVLejllAn6Mg49Z6dTZm5jqLgQ+oJcUi7Le0dQoqZhR
	 rcnHZdEuTocpA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7588D6001B;
	Wed, 27 May 2026 11:19:45 +0800 (AWST)
Message-ID: <1a6ee5e082756931f1c15677ad3f5ba0fa5bbb6a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: sanmiguel: Add IOEXP interrupt
 pin settings
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai
	 <potin.lai@quantatw.com>
Date: Wed, 27 May 2026 12:49:45 +0930
In-Reply-To: <20260523-potin-update-sanmiguel-dts-20260522-v1-1-169f5fceb5f9@quantatw.com>
References: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
	 <20260523-potin-update-sanmiguel-dts-20260522-v1-1-169f5fceb5f9@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_201948_194714_D7532A89 
X-CRM114-Status: UNSURE (   6.49  )
X-CRM114-Notice: Please train this message.
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

Hi Potin,

On Sat, 2026-05-23 at 10:28 +0800, Potin Lai wrote:
> Kernel dmesg reports IRQ #44 being disabled due to unhandled
> interrupts from multiple PCA953x IO expanders:
>=20
> ```
> [ 447.047861] irq 44: nobody cared (try booting with the "irqpoll" option=
)
> [ 447.063124] handlers:
> [ 447.068176] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc31=
0>] pca953x_irq_handler
> [ 447.087268] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc31=
0>] pca953x_irq_handler
> [ 447.106344] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc31=
0>] pca953x_irq_handler
> [ 447.125421] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc31=
0>] pca953x_irq_handler
> [ 447.144513] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc31=
0>] pca953x_irq_handler
> [ 447.163587] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc31=
0>] pca953x_irq_handler
> [ 447.182663] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc31=
0>] pca953x_irq_handler
> [ 447.201756] [<2ab869ad>] irq_default_primary_handler threaded [<b8adc31=
0>] pca953x_irq_handler
> [ 447.220837] Disabling IRQ #44
> ```

I've applied this, but in the future can you please rather indent log
snippets rather than use markdown code-block fences?

Cheers,

Andrew

