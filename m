Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D030E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 05:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ob6gfCfTJHcT1k8fkHYM0XMpgJYwAe0EV0uca1nDr9I=; b=V3BKskpZo1wrKa38Wy8oXU8uXw
	iYodwiCNLN73djblyeYVndkBAs4BxQpbFgPwNSAo3pawYX+wUbeREhiqe0Cm+cNE333IyeHniFbX9
	85TKADBFhu/D9Hj4plWg33Ud3EgUodbcpLPQJid18lMZVYoPxI4LGzgKjsg+1QcuGqWug2dtRavb8
	Bcfq9o1Ibefyoym3+Sgv98l0afEKn8rs+FxRGVUyhxkemCJMR2YSvL6Ns7XnwPJ0D6W2TUUz1PmNm
	22SnRmq1j/Gs0Aa6tx4QtR54+IGYbRs+EBsBUM8yK7+SfNOl6JbmLPnTY0P43cAaaUj/HawONYr4W
	CyQkKe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxvO-00000002k56-0w71;
	Fri, 13 Dec 2024 05:09:14 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxuK-00000002jzG-0KuY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 05:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1734066479;
	bh=Ob6gfCfTJHcT1k8fkHYM0XMpgJYwAe0EV0uca1nDr9I=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=C86JtZ1z9ScLdE1lNtMuIngcOj/VqRvKOHDmgo896hr3259jdBQvgCmOjjv884YfA
	 xAKjpd0m+DxSyccXXYzrkjQwe9L5cTwm+0F8hSoMyCQVtMV2I2e1mXWWbyawdizg/6
	 a7qJyp73jmuPa7/ow/rx0Eh+W3D5DGKqh4Y+X/fpeEuZxfmRmX424WCai3N8oudT2a
	 hW0hQAIxJiDgt+gv8OlIDTbIR3cqXI3k9m1qCPXHp3GCCWh4HsKYCzQbrrvN4yzbTW
	 B3B6qG1Zsc8BEaI1gAecV+2VIE66oIGPX3VP7YRviJXYiCkdVJWRRw3jZ1xmekqMCg
	 QuPaKtwScp9UA==
Received: from [192.168.68.112] (203-173-6-153.dyn.iinet.net.au [203.173.6.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9893B6E54C;
	Fri, 13 Dec 2024 13:07:53 +0800 (AWST)
Message-ID: <5d91b7a7169e6db27b2493213d0df2b77699a49e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/6] Introduce ASPEED AST27XX BMC SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Chen <kevin_chen@aspeedtech.com>, robh@kernel.org,
 krzk+dt@kernel.org,  conor+dt@kernel.org, joel@jms.id.au,
 tglx@linutronix.de, catalin.marinas@arm.com,  will@kernel.org,
 arnd@arndb.de, olof@lixom.net, quic_bjorande@quicinc.com, 
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
 konradybcio@kernel.org,  neil.armstrong@linaro.org,
 johan+linaro@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, soc@lists.linux.dev
Date: Fri, 13 Dec 2024 15:37:52 +1030
In-Reply-To: <20241212155237.848336-1-kevin_chen@aspeedtech.com>
References: <20241212155237.848336-1-kevin_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_210808_345909_04501054 
X-CRM114-Status: GOOD (  10.21  )
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

Hi Kevin,

On Thu, 2024-12-12 at 23:52 +0800, Kevin Chen wrote:
> ---
> v3:
> =C2=A0 - Split clk and reset driver to other commits, which are in series
> of
> =C2=A0=C2=A0=C2=A0 "Add support for AST2700 clk driver".
> =C2=A0 - For BMC console by UART12, add uart12 using ASPEED INTC
> architecture.
>=20
> aspeed,ast2700-intc.yaml
> =C2=A0 - Add minItems to 1 to fix the warning by "make dtbs_check W=3D1".
> =C2=A0 - Add intc1 into example.
>=20
> Kconfig.platforms
> =C2=A0 - Remove MACH_ASPEED_G7.
>=20
> Kevin Chen (6):
> =C2=A0 dt-bindings: interrupt-controller: Refine size/interrupt-cell
> usage.
> =C2=A0 dt-bindings: arm: aspeed: Add ASPEED AST27XX SoC
> =C2=A0 arm64: aspeed: Add support for ASPEED AST27XX BMC SoC
> =C2=A0 arm64: dts: aspeed: Add initial AST27XX device tree
> =C2=A0 arm64: dts: aspeed: Add initial AST2700 EVB device tree
> =C2=A0 arm64: defconfig: Add ASPEED AST2700 family support

Do you mind sending a v4, because I received a confusing arrangement of
patches:

[PATCH v3 1/6] dt-bindings: arm: aspeed: Add ASPEED AST27XX SoC
[PATCH v3 1/6] dt-bindings: interrupt-controller: Refine size/interrupt-cel=
l usage.
[PATCH v3 2/6] dt-bindings: arm: aspeed: Add ASPEED AST27XX SoC
[PATCH v3 2/6] dt-bindings: interrupt-controller: Fix the size-cells in ast=
2700-intc
...

Where the content of=20

   [PATCH v3 1/6] dt-bindings: arm: aspeed: Add ASPEED AST27XX SoC
  =20
and

   [PATCH v3 2/6] dt-bindings: arm: aspeed: Add ASPEED AST27XX SoC
  =20
Differs, as does the content of

   [PATCH v3 1/6] dt-bindings: interrupt-controller: Refine size/interrupt-=
cell usage.
  =20
and

   [PATCH v3 2/6] dt-bindings: interrupt-controller: Fix the size-cells in =
ast2700-intc

Despite sounding like they might have the same intent

Andrew

