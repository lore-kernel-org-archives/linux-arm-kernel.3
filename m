Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1854EC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoSnQBbtzGT4em187vuUWyzc6o09JzeyLkYsJZ+Z9kg=; b=3GzY9xupuhze9E0EMfLyv+YJ/8
	NtZaC5OYHia8KCMjNQAsW8xWhzvb58zTxg7OGwhKNfapNxNAYDeqKxUYIxSKQfz2dUieh76QMISXL
	Pcb3aF8obPkcbwMO3gI4McUjKKQBFmJ6XtHIRjTQWwY1bCQ1IMElYWzvFnXfNAKEl6lQYo22vtonM
	JXO2AH7tyUG48I1eBNO5axSxQD4CsqGm+HtMeEVDwMvCS05y2F3KIaVURo6OlaHfkF5ZQWZIPJ1ts
	csfWYUsRaZKXbjciF2ugQ1fJQzNh7UuoRGrHGTYcPHbuxmSzevvDFCvWfhPVTTvG//dUDHIwe0Vcu
	8sa36n2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdzx-00000001eSd-0VzY;
	Fri, 17 Jul 2026 08:32:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdzv-00000001eRX-3FxJ;
	Fri, 17 Jul 2026 08:32:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B61A60A61;
	Fri, 17 Jul 2026 08:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408571F000E9;
	Fri, 17 Jul 2026 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277162;
	bh=EoSnQBbtzGT4em187vuUWyzc6o09JzeyLkYsJZ+Z9kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cNPpMCAfq4lnDaUIbbn+a4XsST4epNsHJpyeeSwp2Un9vdTL1b5x9kNRrd5gr2g4I
	 EcT6Fg/IKuqzNnBWS9z3mgqnRgblvhRhgY8fzweQSUsocXikEdEyiV1a1IK3rsGKFe
	 T4sGiaWA7nBVEH0pQ6F8QaJ2F3QXfKrQhqTBkxGShzPck4vihPFPcTWzCL9dMFJ891
	 tnF7TcHD0kRMgm3Xwc6afFvt29WlrIEPnIEBuJdMXWdhrNRY0hEdxScKSHIve0VBC3
	 uEuMD+z8euHSb1PnpZDVHGuViIdmpLKykGcSNMnV5O2LTGJ32jdEMvLevFCQL/mmsy
	 mUJ4IV1FfE4zg==
Date: Fri, 17 Jul 2026 10:32:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>, 
	Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 5/8] dt-bindings: serial: cdns: add Axiado AX3005 UART
 variant
Message-ID: <20260717-stalwart-sandy-orca-6c5a8a@quoll>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-5-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-5-c429095143ec@axiado.com>
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

On Thu, Jul 16, 2026 at 08:51:12PM -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 UART controller. So far, no changes
> are known, so it can fall back to the cdns,uart-r1p12 compatible.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
>  Documentation/devicetree/bindings/serial/cdns,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


