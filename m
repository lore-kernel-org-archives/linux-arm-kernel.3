Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA0CE64003
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gik0rc4AUjH01aTkdd9GDQqrimGHwk2sVVZkVxe1iwM=; b=VdF3BXs6Kt3eZAJhOt8Diem8HB
	yg1nCt2dNMUr74bMMKg1Q+UGGgw18Nx2jU9TuFNjYyaUmICLRQjr6nl+Z80JZb+t8bo47ml4t++P/
	aR3oEzvBPGzvGj/fEf/k1V8Np3xMM9jVRoFSsVJLvh1aqfzeh70DjKyV+Gx68pwxEQr/tNY5qnpN5
	WeXOLMorUCJm0qyN7h216qhz8JnZhusmGeuSzMEL6/Nwxm5VIVLQEReqoSnEkZnEVayk1lxD7Cl5n
	Z3K42fKW+lMfJ8OFwWO+M2qf9wo0pPiloKtXZEaGoZtJ2n9RLpGV8enK6M3Bgztfjr0thep0ZuyJJ
	KklnCz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9IIl-0000000435f-0QQM;
	Sun, 05 Apr 2026 07:53:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9IIj-0000000435E-24FA;
	Sun, 05 Apr 2026 07:53:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80EB241968;
	Sun,  5 Apr 2026 07:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE19C116C6;
	Sun,  5 Apr 2026 07:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775375624;
	bh=mmT6pS2qy6cxZpqzi3T3vnIlGk445m471lTjYAty8AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fywhHBR2CBjI23v0w3up56C9cMDZNh/BxiClQFDTaz+8M0J92oOsIo8ehZx8FCrNy
	 GHISB9tq9laaOWb9XCIY1j+OWZPNo1ju2jRKd8KKGnfTcSfEKXN4TEDxgBjZThA04i
	 bAfTyF3G9UanDv/2nN20AA+gawgWl8gOx6KqZasuETWVmxzIJ/GEo+G3OG1P+yX502
	 0Tn4O/6dmTIXbPkGSaMIVXzovM+EJ+jbJLz2QFudu6d6TUJfPhyHrNO2ZeCrgTLlKh
	 R5h4gU2yfNV/AbACVYBHSYvk6wHK3rg9WJy7D06QASRN1nRGwUt9BJYiXjIuiLECwe
	 f5ob7221EliKA==
Date: Sun, 5 Apr 2026 09:53:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: rp1: Add PWM node
Message-ID: <20260405-tremendous-colorful-spoonbill-88debb@quoll>
References: <cover.1775223441.git.andrea.porta@suse.com>
 <ef79e974c6680202294a4cfde7cc791753bf1b3e.1775223441.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef79e974c6680202294a4cfde7cc791753bf1b3e.1775223441.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_005345_550332_3CD9F0ED 
X-CRM114-Status: UNSURE (   8.24  )
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

On Fri, Apr 03, 2026 at 04:31:56PM +0200, Andrea della Porta wrote:
> +
>  &rp1_usb0 {
>  	pinctrl-0 = <&usb_vbus_default_state>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> index 5a815c3797945..7e78501e62b0c 100644
> --- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> @@ -56,6 +56,16 @@ rp1_eth: ethernet@40100000 {
>  		#size-cells = <0>;
>  	};
>  
> +	rp1_pwm: pwm@4009c000 {

Don't break the order. Instead please read and follow DTS coding style.

Best regards,
Krzysztof


