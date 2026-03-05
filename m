Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656BCF513E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 23:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4kBpcfsoeaJi+f81n/Q/DnrcvYZV3O8eSYSXVcq1VY=; b=iSCg6oMxPNh0vS6J00giBMAooO
	FEm8qNyq2SYdrQADQnsOZJMj2OdF+67YL5orU5xTxsUH/RupJ8pGBCqA+afkCW+IDk5du+Yv3wcOs
	pX/BZSJ6uh3cEUbGbx4QyCj79ldgYH7toyKbN1OFbkJjSrGvSH2TfNx+67ARpU9Ion5NtqSFNbpDr
	5vjVmHq7I6I9t/nEn5gpYmeAjdhZzpIFUwU+fbvvVjOcqBLu6GKKM1OKIin3nyGnNRLD9WPX801pS
	Ag+Wh9hhF+KRiNwGz0HIL1RTcv4nrirt0dUiL6jv/GR4HCJberX8Z6kN0lVF8drwuY10cr/g7DZUn
	N4E4OTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyISh-00000002kUE-1SAa;
	Thu, 05 Mar 2026 23:50:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyISg-00000002kU4-1SXa;
	Thu, 05 Mar 2026 23:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0D6B600B0;
	Thu,  5 Mar 2026 23:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CEDC116C6;
	Thu,  5 Mar 2026 23:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772754631;
	bh=L74ljxlOMOHO7j1qIlwoOavzI+BtasTxWVEi3URKLLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gbUsSV5l/lchMJE4IC1QCrlxz+dPFqDFrRa4IGL6G6W6voGN9sRcy2CxJmNzAXtRD
	 TnM/h2ggoMXNcVq0Yzt6tPJCp94as9M3OxZJLZ6pc80r+mL4J3zyxpJ3B1isMUqozR
	 +dXkqpsPIg5UM3vxhkTeio0osF4sFmrPx4YsdcHV76WLGlYU96w3cD0CQ8x4r8mboI
	 eUAS5gy8lWskOkHtj1o1+BWUSQskB5en9s395aHML4CjbMxmrJ6zWBSiQgOZ3JUUt5
	 QZy/yRsfod5lMhaO5Fr5rarxNPkLJd2NKHmCO7kXvWUVNa0SC0e1fOYvDODbbi+SEW
	 e9cAiMiwmqtRA==
Date: Thu, 5 Mar 2026 17:50:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	Cheo Fusi <fusibrandon13@gmail.com>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v13 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <177275463009.803008.10030326759377016804.robh@kernel.org>
References: <20260221183609.95403-1-privatesub2@gmail.com>
 <20260221183609.95403-2-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221183609.95403-2-privatesub2@gmail.com>
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


On Sat, 21 Feb 2026 21:35:51 +0300, Aleksandr Shubin wrote:
> Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> controller which is different from the previous pwm-sun4i.
> 
> The D1 and T113 are identical in terms of peripherals,
> they differ only in the architecture of the CPU core, and
> even share the majority of their DT. Because of that,
> using the same compatible makes sense.
> The R329 is a different SoC though, and should have
> a different compatible string added, especially as there
> is a difference in the number of channels.
> 
> D1 and T113s SoCs have one PWM controller with 8 channels.
> R329 SoC has two PWM controllers in both power domains, one of
> them has 9 channels (CPUX one) and the other has 6 (CPUS one).
> 
> Add a device tree binding for them.
> 
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
> ---
>  .../bindings/pwm/allwinner,sun20i-d1-pwm.yaml | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


