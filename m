Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2C3C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 22:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+jqWN+9wkNBk9tBk19sZZxqR0nrFcq6bhCFBmDCswA=; b=bzNqPhoq1hV+TIEgPKVtaJGlek
	Y+RdAiJZf0L4Jz8KtcgwVQWjluQEU54OdgBeGNP7lt2+uU2zTqe1lU0XhT1iGa7yGOEpM6m9ZOEzj
	DSlyOp2Zo4yH+UPqAxHtP37PTICfg851KA5rm2go2HXhfdPaK3w8UcSEzTb2WM4ebVYMemrrwyxgL
	RaZ0Im8b+mNULRfmKWtFt2FPBrWOy/NSIn+xvjyxY8IGqTsAPUAA3u1eYV1ojtWYML2CHRBdY3t4F
	C2d+sg9i0woTl+XX4surYz5BC/gT3jmSgayjJigczbS8AInX5NnoeCxwIC/ezRD/L9fChBE5jGw12
	LpuzLzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmf2C-0000000Cse7-0Z36;
	Wed, 22 Jul 2026 22:03:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmf29-0000000Csdd-2Wpw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 22:03:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F13071595;
	Wed, 22 Jul 2026 15:03:15 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FCEB3F59E;
	Wed, 22 Jul 2026 15:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784757800; bh=TvkH+0aIc0tTfnfI29eAMPyUgUnwWVPMiXTscEFc5cA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XTm0JRa070xzyTfMFsuNcX9jqqculPqlDQMejuKiQb4wP6pN/nZdOfTCx6Ws+uT6t
	 syAD0yNAB2azqVHCLaPdPuJdt5iTrpJ2cpGoJJx7XU4ELMmtW6eLPsb+9uLR0/SaF7
	 xY9F/mth18z3GtXMLVA5pbojc4fOTc6Aynn0pCb8=
Date: Wed, 22 Jul 2026 23:59:25 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: a523: enable IR receiver
 on the X96Q Pro+
Message-ID: <20260722235925.42c3466b@ryzen.lan>
In-Reply-To: <20260722201717.2205609-4-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
	<20260722201717.2205609-4-utilityemal77@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_150321_690500_CD3C108B 
X-CRM114-Status: GOOD (  16.80  )
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

On Wed, 22 Jul 2026 16:17:17 -0400
Justin Suess <utilityemal77@gmail.com> wrote:

Hi,

> The X96Q Pro+ TV box has an IR receiver window on the front panel,
> wired to the SoC CIR input on PL11.
> 
> Enable the CIR receiver in the RTC power domain and mux its RX
> signal to PL11.
> 
> Tested on an X96 Pro+ with ir-keytable and nec keybindings with
> the remote that it came with in the box.
> 
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>

Confirmed with evtest and some random TV remote.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> index a96927fbdadd..1eaee20acaab 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> @@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
>  	};
>  };
>  
> +&r_ir {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&r_ir_rx_pin>;
> +	status = "okay";
> +};
> +
>  &r_pio {
>  /*
>   * Specifying the supply would create a circular dependency.


