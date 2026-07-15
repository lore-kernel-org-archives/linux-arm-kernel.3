Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2161AC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+6+H0npw2UjZHclxHO/x3Tf61uejqeU1dWQ47818Ho=; b=13meBOasEDl1x4vbmrhb/2uXRn
	AA5AsztjJcZRNwezK64t1Qn7nbZN+CglahyWJS5UfcL7c5Hk0zr/y4wt4/d61xBcy8tg7XdXjNiAb
	iGTHCtv00PWaKwhw9b/9vOe0W9uWUHt91Ma71AENzrBYeHuSdKZsgpBtwCJoJK6De14MM1b91Tsaf
	5wRDBuKK6a+/t6RrQlqKdIAlq/gsmPC/Bkq6CX6xJ8yLuIbjE1DsZx30ErQ8KnAFEIXOCB753B7vj
	haAIDfj9cPAsUObGa3jrTgaig7g79kitwKhSCLdX5a2K4AGn/2TTq9UXsJa/G/2p95BvpnnP3fS17
	faRPBiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5SS-0000000FoC7-2BMp;
	Wed, 15 Jul 2026 19:39:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5SP-0000000FoBP-3csI;
	Wed, 15 Jul 2026 19:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=j+6+H0npw2UjZHclxHO/x3Tf61uejqeU1dWQ47818Ho=; b=CGcQHJzn/z84paToQNvEkEm1xB
	UYrz08wsSopEY5sWUeO/VYpZRuVHC/WUY9pRsu3gWbhwW1dmwdgH1HWw+AkwKWzbpKzKgaZZ4Iwmv
	dTgY+mSo9HHUtMsV6itBqfCiBb76a+82fNCA4qWJNwCDEeXx7zHkB/TEXCceh9svmaeQGueJY8CsH
	FzGzCDpnBrSUouY3mLQ/u1dSyjlZrpt6wOvb7q32L+UWlP2/9We0NS5z0nf9f60GS42Przdv9sim7
	RketPXqv+Df4gaJJtP29tX1RfPEfU4apka4d+f9RlOMicQAGahOxayBgOnSlN4jLCd6PV6WWNK/pZ
	IaC8N1Bw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/4] dt-bindings: leds: Document "gpio" trigger
Date: Wed, 15 Jul 2026 21:39:43 +0200
Message-ID: <5188715.0VBMTVartN@phil>
In-Reply-To: <20260711192842.845048-2-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_123949_902031_D3243D13 
X-CRM114-Status: GOOD (  14.49  )
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

Hi Samuel,

Am Samstag, 11. Juli 2026, 21:28:25 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Samuel Holland:
> The "gpio" trigger is used to control LEDs by the level of a GPIO input
> referenced by the trigger-sources property. This is already documented
> in the trigger-sources property description and is used in at least one
> devicetree (am335x-regor.dtsi). Document it so validation of those and
> future DTs will pass.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

having Lee only in Cc in a longer patch series might make it difficult
to notice this change.

I guess this patch needs to be applied or at least "Acked-by" by them.


Heiko

> ---
>=20
>  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documen=
tation/devicetree/bindings/leds/common.yaml
> index f4e44b33f56d..e148b4277a6f 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -106,6 +106,8 @@ properties:
>            - bluetooth-power
>              # LED indicates camera flash state
>            - flash
> +            # LED indicates level of GPIO input referenced by trigger-so=
urces
> +          - gpio
>              # LED indicated keyboard capslock
>            - kbd-capslock
>              # LED indicates MTD memory activity
>=20





