Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E2DCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 05:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APu9S9jKtXjA5Jz8k+e3HEGpTkPAFSTLP7w4tQTscqc=; b=CUOmJJb6FYZkH3/Mmw4Fg78cMz
	t9XNgI7NvjK+reLGBsuWk/Hxdy5KoSlUrvKodhvJmrLbTw0f9Aal94Im4ZqwAf3wj1zAJvVvrE/Rs
	xB4fbRMcG2Lz46xuAX72NRBC1N/QXOHq+DKFHHu1xF3eKHFwFMTgaXHbXvG7hgbU9BfE7LHEtSq6J
	vb6ubhc/vHqJVba9LEKu9/Nrapj0mM01UH0Aovlj0uXlZHlV16kCzCJJJPST9qc5Hc1IHjKBKELcu
	G+5cOQIETZaehrelx/Bwl8+FB6iojqwkRL2pBXRIAdQbr+DEgAmKRCz1pC3yCVUwGprD1U1BOCwvO
	O9Tf58Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwE9-000000079Cc-38Ca;
	Fri, 12 Sep 2025 05:21:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwwE6-000000079Af-00d7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 05:21:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 92A43C8EC44;
	Fri, 12 Sep 2025 05:21:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7785E60638;
	Fri, 12 Sep 2025 05:21:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70BA2102F28D9;
	Fri, 12 Sep 2025 07:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757654489; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=APu9S9jKtXjA5Jz8k+e3HEGpTkPAFSTLP7w4tQTscqc=;
	b=n9AW/3mxopzj9nvZ+4u2+qjJ9ibJdvPGWWMbXsKoyHDrkziEg1UD0nVyN2Np26/pGuquyI
	q2M/vrGw9crj8dgoldDkmWU5mBP5M6lTKeLSKbMWzPDn9vjz4STmnXwX0Hie9i/i6lf21X
	Y2TsEJR9XmQ9gMtmC2XFsaSZ+1uv11jG19+LDd7EP14tUpPN6pIFZoXI9Tp3YAd9N5IoM0
	D918rSERM+Ge6CrNTs9aLIE1PYjL/0zkWTspmH7G5ufR4rhGaVtdl/jO82N1JHhnY/OXct
	a6/2ezBvbyJazpfaG/h+emBqis9wnrjJaC1zEbI9sH/P3k56rlTorVQeVksEoA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: marvell: armada-37xx: Add default PCI
 interrup controller address cells
In-Reply-To: <20250822133329.312326-3-krzysztof.kozlowski@linaro.org>
References: <20250822133329.312326-3-krzysztof.kozlowski@linaro.org>
Date: Fri, 12 Sep 2025 07:21:08 +0200
Message-ID: <878qikp7p7.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_222138_578894_1E65612B 
X-CRM114-Status: GOOD (  12.97  )
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

> Add missing address-cells 0 to the PCI interrupt node to silence W=3D1
> warning:
>
>   armada-37xx.dtsi:518.4-521.29: Warning (interrupt_map): /soc/pcie@d0070=
000:interrupt-map:
>     Missing property '#address-cells' in node /soc/pcie@d0070000/interrup=
t-controller, using 0 as fallback
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
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-37xx.dtsi
> index 75b0fdc3efb2..c612317043ea 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -524,6 +524,7 @@ pcie0: pcie@d0070000 {
>  			pcie_intc: interrupt-controller {
>  				interrupt-controller;
>  				#interrupt-cells =3D <1>;
> +				#address-cells =3D <0>;
>  			};
>  		};
>  	};
> --=20
> 2.48.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

