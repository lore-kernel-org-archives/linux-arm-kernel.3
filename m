Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703E1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjJI6Nb8GpIPhfwFN/Z+Zlbg1DelaSzRirHyXyDw+2w=; b=m8r78hAUV1r1eow9dkaUN/ya+4
	8tfRAdaFK66rctfVBFrZtPPIWn1oLwZQ9K5PA4BrSjY6BLmazmQcf0j9Ae82khfaREGhVDcvvvV8Y
	Me0x0dzOIdEkIBtwldXFeA+F+vNIsK1fMLRuq4pG4iuPdBIOgd55KEHiPu9T0m6Xn1uQh1AHGIzWW
	EUMcWmofPGm13N+mKmfrO/ENgRmmFgsl0jvLxCBPdra13GTysfaAwmpIe5JtybzvT+eVCfQQzs6Aq
	wJ2ViqV4ktSbYyNXQA1Y7tRnKtYZNKJ6hbiqMBLC1zq1Isf+J4VHuVmw2OqMuRwCM70KReGBTmdlb
	/EygeJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirR2-0000000EBqH-1K9q;
	Fri, 14 Feb 2025 08:52:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirNd-0000000EBEt-1uhN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:49:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77C345C4ACD;
	Fri, 14 Feb 2025 08:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9C2C4CEDF;
	Fri, 14 Feb 2025 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739522940;
	bh=WmV04MPnFaon6zaZ8p5gO3YrG+dbYIloJXb1/ltHrvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcKuSoQNuodvlie1cZdUqIFzaaz4Q+bElNQWC7V87q21/j9UNBbO7qdf36O2kDMGi
	 VlNzxWxCoConcVaj3v5pdyvA5QyV/g0a9qz6NiqJ1+xj9Afzv7rFWoGkxHDt7Z0TGm
	 gv+bfLlN32A6o/i724hWn1qWHp8OkA4eJfpkwQJF3qQ9p3MGdfZKYvKVfZgNjrQfE2
	 +q82AMksdN4ALr/a8EJk8i/JNXWKkDAW6W+0weh4ajDYQnQCH2jMJOX0MK++9ib6ne
	 IILl4Zaac8D8Pw/fqPN6KWGNSOQozr4v1lsqCvhu1uKH31z28IzDMdP/ALfFE/JTzR
	 wmAEGxSg2pK5Q==
Date: Fri, 14 Feb 2025 09:48:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wilson Ding <dingwei@marvell.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, salee@marvell.com, gakula@marvell.com
Subject: Re: [PATCH 4/4] [PATCH 4/4] arm64: dts: marvell: cp11x: Add reset
 controller node
Message-ID: <20250214-famous-rainbow-pig-d4bd3b@krzk-bin>
References: <20250214065833.530276-1-dingwei@marvell.com>
 <20250214065833.530276-6-dingwei@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214065833.530276-6-dingwei@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_004901_535245_4A412A67 
X-CRM114-Status: GOOD (  12.14  )
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

On Thu, Feb 13, 2025 at 10:58:33PM -0800, Wilson Ding wrote:
> The unit soft-reset configuration register is part of the system
> controller register.
> 
> Signed-off-by: Wilson Ding <dingwei@marvell.com>
> ---
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> index 161beec0b6b0..b82003df15e0 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> @@ -273,6 +273,12 @@ CP11X_LABEL(gpio2): gpio@140 {
>  					 <&CP11X_LABEL(clk) 1 17>;
>  				status = "disabled";
>  			};
> +
> +			CP11X_LABEL(soft_reset): soft-reset@268 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Usually: reset-controller

Best regards,
Krzysztof


