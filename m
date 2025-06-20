Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088CEC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wzTnhXXsOF89XOQ7pox9pfXFFYXP/Pd3K/KGnWwrE8=; b=lIg4QxYmUaGIejWk0kQxLPzCKW
	F3OFY6fBd2iTPzDfVEUiaiQa7UZjLyYlR+kYDVc7Hl59COIz7030OV3nrz73IxY+uoZnJ534DDFQ6
	RUVWQBzmJHKsIfRBYehByEGqvZFaXIfPxljHCUDylNTuOw9D5U/XZgizw4pn47l7ox4o2TMiV+otE
	ljsnpmLKukPfmybbitj/wUJv9PHPq0+qKrII8NFJ+p8mRwKuAnJOSpf5XbkX2NuTvmjhAK6ih+IHp
	uQQCOSu3sINb8GbhddccSQpxEGS1Y6t7P1j2NJMul2EF4ildWFYQm4bVbQp1mAJrfxduwLwAAIMwZ
	uL00Ow4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScFa-0000000FnTk-1dCk;
	Fri, 20 Jun 2025 13:57:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScCQ-0000000FmpZ-1sAC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Jun 2025 13:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7wzTnhXXsOF89XOQ7pox9pfXFFYXP/Pd3K/KGnWwrE8=; b=pvpi7OX56V3C/E1q70I40xmy7s
	EwmU4iCutmlErsF2F3R9joTIJmPNcJZaot9Ea+r2xy66mXd4qQ/W9zpoF0NKSYvqt5V6wrAmDbBmV
	AvEVeaaEAdxg6XQa0Sastu9R6Z1EAt2uYREWImbmyM4fGXuSqUkTKpHUtmkyAtSWMLz0kXCEGwgAw
	naeq7CGSJHqHY4ttWT4D8f+x41GYlH3AXigBzOrJa2MaGxYLUbR19NIXhrhW10rWrAjg0daEeikck
	/z1VGGS1o8akteGHjbEQQEcmzAfCKfKEtJcQNCSa0diRVCr6tv+1eWJoQNgPR1suc1RelEYfjENHv
	+6V8GsdQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScCN-00000004l3n-3tlx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:54:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6700516F2;
	Fri, 20 Jun 2025 06:54:07 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 342DF3F58B;
	Fri, 20 Jun 2025 06:54:25 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:54:22 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A
 board
Message-ID: <20250620145422.26fdd14a@donnerap.manchester.arm.com>
In-Reply-To: <20250619173007.3367034-2-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
	<20250619173007.3367034-2-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_145432_170245_4F9A841A 
X-CRM114-Status: GOOD (  13.99  )
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

On Fri, 20 Jun 2025 01:30:03 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi Chen-Yu,

thanks for sending those patches!

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The OrangePi 4A is a typical Raspberry Pi model B sized development
> board from Xunlong designed around an Allwinner T527 SoC.
> 
> Add its compatible name to the list of valid ones.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 7807ea613258..c41d0a0b89e6 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -996,6 +996,11 @@ properties:
>            - const: xunlong,orangepi-3
>            - const: allwinner,sun50i-h6
>  
> +      - description: Xunlong OrangePi 4A
> +        items:
> +          - const: xunlong,orangepi-4a
> +          - const: allwinner,sun55i-t527
> +
>        - description: Xunlong OrangePi Lite
>          items:
>            - const: xunlong,orangepi-lite


