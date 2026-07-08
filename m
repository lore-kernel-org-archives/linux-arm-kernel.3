Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DD6C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzvBEeJ5wdYXClPXLrmc2/W46aJenc8FFAfoLDxjZi4=; b=1GHAZkNI/7kskhJSf2jpCzD8KP
	r0E/LPU6P5LzAiXfcFB15jwAyKOe3J8KCVW/dAzn0KG/szkHlAeZBvHSlElmByHW6UX0/j/GCRNFa
	lc+xY4yCZl0QpY44XkQy5mZzd1VBtJveruzH+IzBGf5+bl8YKF2aytCGgDqsd+vxRGJFoPFOxn1NL
	2YXsQy13rAeLcZnXIgS/o43Zi5C1lVrjTqUUTV1xf5q0wDubYifIvTNUOUeWMGxN8KAFav0cMmCXW
	mHpnKMZIVHhjFgj9zl7MjxFD3fgvQvB4CBZqEeiPufsdAZzxMQNdMnNfVhVNzLocDjEIhR/Y77A+U
	Rv+gUpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaFU-00000000TsN-2wqV;
	Wed, 08 Jul 2026 21:56:08 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whaFS-00000000TpU-0CHR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 21:56:07 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gwX3R5DgLz8v4b;
	Wed, 08 Jul 2026 23:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzvBEeJ5wdYXClPXLrmc2/W46aJenc8FFAfoLDxjZi4=;
	b=wqwYngLVVmMeY2bpMaFiVTrMKc0ovlIcK8JL1hGtGzfUSV70WkKp/hXAbjWxZ6DkFeT/uE
	TIAJJo1tnFC2PRxiTS8pLkKE1WtkMJfxlUzq+ia1VCZlExZKdplL0hXNS8nMU7H48UJV/+
	HoRgnSl5sjTmb7NF2SvcKZIuriTMp1jLqyoFwcedzh9hQtoAiopJNYLTXOgmHHsFmkzl5z
	96QcIcFixt+GgFGyNaOZOm+3s5y1MvXjP3wUEVlOXluRQOyJQPOsXrZC1DFKPKUmvw5lja
	KZQIXaz6b5nXc1BuqrOlUgbsxKoOetg2J/QL1NhCGLa0D4y8YOECYVxmPBjU1w==
Message-ID: <59725f93-5269-4b0e-8633-48821219877f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783547762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzvBEeJ5wdYXClPXLrmc2/W46aJenc8FFAfoLDxjZi4=;
	b=sw8ZGUcl5e3xihbCg2aT+g6H4ko5yZcdtxzrqesfKSBURVIqY2cbMnr0FBZFggidxEcvdJ
	ZD8Mzyx+0bIiJJAbfzzGOwrQyfNfC+cXf1iOb+8Jywj5V3QOfZJDgQK/LI/7XqZMQmi/5X
	jIV2qZPAtS6ptTEls1CFj0bjOuKp2Eryyq27A9MKDCuE3f5OIntcrejoH21iyn/hFi4UMb
	aPIRlYzabNymh/vQeRfijsiwJ8cwhm4geK8NdZMEL1FaNi5uk75OwBc2mPklr3QBL+fM84
	Lx8tLm+rDlVsVGhyrAIrFq4DsK4P9EJ9NP28hA1+yHs/betaDEHzC9wgRSpuIA==
Date: Wed, 8 Jul 2026 15:07:30 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1783505142.git.geert+renesas@glider.be>
 <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ox9kdwr3htbuf418b9dpqo5cy4n7x8wj
X-MBO-RS-ID: 08bf7c3d4b9e58172e1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_145606_240262_6529C500 
X-CRM114-Status: UNSURE (   9.72  )
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

On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> Add device nodes for the Module Control (MDLC) blocks on the R-Car X5H
> (R8A78000) SoC.
> 
> Complete hardware desciption of all (H)SCIF serial ports, by linking
> them to an MDLC for power domains and resets.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

[...]

> +		mdlc_ddr7: system-controller@e8380000 {
> +			compatible = "renesas,r8a78000-mdlc";
> +			reg = <0 0xe8380000 0 0x1000>;
> +			#power-domain-cells = <2>;
> +			#reset-cells = <1>;
> +			bootph-all;
> +		};
> +
> +		mdlc_hscn: system-controller@c9c90000 {
> +			compatible = "renesas,r8a78000-mdlc";
> +			reg = <0 0xc9c90000 0 0x1000>;
> +			#power-domain-cells = <2>;
> +			#reset-cells = <1>;
> +			bootph-all;
> +		};
> +
> +		mdlc_rt: system-controller@19440000 {

Please keep the list sorted (0x19440000 should be before 0xc9c90000).

> +			compatible = "renesas,r8a78000-mdlc";
> +			reg = <0 0x19440000 0 0x1000>;
> +			#power-domain-cells = <2>;
> +			#reset-cells = <1>;
> +			bootph-all;
> +		};
With that fixed:

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you !

