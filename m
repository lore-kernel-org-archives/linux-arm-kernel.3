Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C65CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 05:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuA+9G1MgDGktxBk2o730ckdqkOi9cCLmcl8CANG0Mc=; b=RvS+Wsw494WYVpykgKiocg7wAc
	7koWjAuR2fsac07xRjj83jY7jTrJBqfOzNl0Ar4tiEVzxDZKS9DSjM9SDLgsumzaLlZLb/slCUTzM
	VhYPvb1Jzc368kwu7qiLvfc1008lXR6DQs5DyMCsS+EQmde4AfuEw3g2T5MIfUBAm5zdROWpj03CW
	DiThBxj+6hL4CU0RPsht6RmOd0PxnI4dap0l//QRQ6kgd+JtspGyZwhQLJLTjU0WbY1ZeHUbj/sKC
	rT7NEfqgRkP4qjSV63cBJASyyXk7w28IGRYiRAM6ONllQkiLN1p8H1t0D7NdKpuYBduKQnarDsGb5
	CbKGghlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwET-000000079OI-0HgF;
	Fri, 12 Sep 2025 05:22:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwER-000000079Lw-118s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 05:22:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3FF94C8EC44;
	Fri, 12 Sep 2025 05:21:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3417860638;
	Fri, 12 Sep 2025 05:21:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29188102F294F;
	Fri, 12 Sep 2025 07:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757654516; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BuA+9G1MgDGktxBk2o730ckdqkOi9cCLmcl8CANG0Mc=;
	b=rL3KrVZ8NuDQXLLncfAhWK3ahM9lQDtploEbdU4OCWpTlyHaUkcjnm0LXQBhki4fBxAeqe
	fQy1EjK00vZ5AXQnohIK1FY9I7IAfYtTj03buZxQ2RID4jv119R5S1YSbSZoR33nbTyZ3y
	i2dAwoNX5jUEN+h9RzuCMQ4GsKthJjLerWWQ37su6uAiCQ97k10tGqQT+NfqP52XowAcKZ
	avjX9eXJCtkg9YxXLl9pnYAzd/UI8KosnyN9x8nq1TqQeORxoiAC3fV8qTEX8a+3nMyP7v
	MujEX2skECJX1Czq79h9i5QwvGYXHrPjxQ9OevH8qkp8+YtLlBYG8oCJ258itA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: marvell: armada-cp11x: Add default ICU
 address cells
In-Reply-To: <20250822133329.312326-4-krzysztof.kozlowski@linaro.org>
References: <20250822133329.312326-3-krzysztof.kozlowski@linaro.org>
 <20250822133329.312326-4-krzysztof.kozlowski@linaro.org>
Date: Fri, 12 Sep 2025 07:21:54 +0200
Message-ID: <875xdop7nx.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_222159_477473_F6F3D35C 
X-CRM114-Status: GOOD (  13.30  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> Add missing address-cells 0 to the ICU interrupt node to silence W=3D1
> warning:
>
>   armada-cp11x.dtsi:547.3-47: Warning (interrupt_map): /cp0-bus/pcie@f260=
0000:interrupt-map:
>     Missing property '#address-cells' in node /cp0-bus/bus@f2000000/inter=
rupt-controller@1e0000/interrupt-controller@10, using 0 as fallback
>
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=3D0)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/b=
oot/dts/marvell/armada-cp11x.dtsi
> index a057e119492f..d9d409eac259 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> @@ -202,6 +202,7 @@ CP11X_LABEL(icu): interrupt-controller@1e0000 {
>  			CP11X_LABEL(icu_nsr): interrupt-controller@10 {
>  				compatible =3D "marvell,cp110-icu-nsr";
>  				reg =3D <0x10 0x20>;
> +				#address-cells =3D <0>;
>  				#interrupt-cells =3D <2>;
>  				interrupt-controller;
>  				msi-parent =3D <&gicp>;
> --=20
> 2.48.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

