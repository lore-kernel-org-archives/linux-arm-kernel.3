Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849B4E6749D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 10:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLkGhrcde0ia+z3c2m2bW+HEJiHdQI9e8FzweLRZDcE=; b=fOIvxP9o+OB7nzvJRBiaDIR6QM
	PGIW6C0GMuGHPTAbzl0OLY3/81bSNZqKx4DsBW7ME3+IrzZEVu9nHg9aKEfad11NcGk74TH+wCcOx
	9IG2lBbFb+a8jqeldhS0BIedh2RkflGotnojulyHtUO3O9X8qUbjz2Mkrb8rn1lFtWZ2ynnrh87cx
	6r4DguzrAY9rmaTLOIaW3ixawaVhreDoOCp0BzPMZiY8t/+WHjC5Ag75ZW8Tpj/Q/D3CaF9MW8056
	ckHEW4+7eNLtjA+z3rbJmVqAbDF2cYUFX0LNgD1lKZiaAESEM6SMGBBQv1rfa8WbK3YyNzafiWpYg
	g9lfO4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Xty-0000000BHyN-0p53;
	Sun, 03 Nov 2024 10:32:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7XsA-0000000BHZr-2nb3;
	Sun, 03 Nov 2024 10:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A1925C3A6C;
	Sun,  3 Nov 2024 10:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818E9C4CECD;
	Sun,  3 Nov 2024 10:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730629817;
	bh=tscA56UlqwWIvbmdpnNpVS0E2UY2+aox3QClc4hpzWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYrG7dsU3f16urLDFyFN2knOnKYxoG1B1TjIc/+p9ULnvYt76lJEI9DZzVXMAeeIT
	 etg9bbtXsG7hw70bu+1s3DSbJ8Qlz9nNyhMMDoCayYTxGM0xFhFaQTVvaYAD7LXqV5
	 6ohatHZBtS/r8h10oPoxqa2gUr+n84t+ZmYR3HPfu1jCBDPfD6pt5Y/OTAa6hamsK0
	 1R6WcOsuvopVH0cxSzY/BjXkkuvQlKiMzm21EyyLPCG2ISAZGnKd1wimSASPqSKaW+
	 5bPdLCbbteiA+Xa32sPuVEQfkbuu6nlGjwV/FDa1nPGIH33LJosVQNhSWhhjeDfK95
	 ugbP6sr0A2L1A==
Date: Sun, 3 Nov 2024 11:30:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-actions@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: timer: actions,owl-timer: convert to YAML
Message-ID: <mfwotmnedq744aesguvjmroawarvkhpwalgm3wm5onsuffs245@iqorlvndja27>
References: <20241102221354.2856900-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241102221354.2856900-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_023018_824690_2305E340 
X-CRM114-Status: GOOD (  21.98  )
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

On Sun, Nov 03, 2024 at 12:13:04AM +0200, Ivaylo Ivanov wrote:
> Convert the Actions Semi Owl timer bindings to DT schema.
>=20
> Changes during conversion:
>  - Rename file to match compatible

I do not see any rename happening, anyway, this is not a change to the
binding, skip mentioning in changelog.

>  - Add a description
>  - Make "clocks" a required property, since the driver searches for it

Clocks were not in original binding, so you add clocks in the first
place.

>  - Correct the given example according to owl-s500.dtsi
>=20
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/timer/actions,owl-timer.txt      | 21 ------
>  .../bindings/timer/actions,owl-timer.yaml     | 71 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 72 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/actions,owl-t=
imer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/actions,owl-t=
imer.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/timer/actions,owl-timer.tx=
t b/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
> deleted file mode 100644
> index 977054f87..000000000
> --- a/Documentation/devicetree/bindings/timer/actions,owl-timer.txt
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Actions Semi Owl Timer
> -
> -Required properties:
> -- compatible      :  "actions,s500-timer" for S500
> -                     "actions,s700-timer" for S700
> -                     "actions,s900-timer" for S900
> -- reg             :  Offset and length of the register set for the devic=
e.
> -- interrupts      :  Should contain the interrupts.
> -- interrupt-names :  Valid names are: "2hz0", "2hz1",
> -                                      "timer0", "timer1", "timer2", "tim=
er3"
> -                     See ../resource-names.txt
> -
> -Example:
> -
> -		timer@b0168000 {
> -			compatible =3D "actions,s500-timer";
> -			reg =3D <0xb0168000 0x100>;
> -			interrupts =3D <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> -			             <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names =3D "timer0", "timer1";
> -		};
> diff --git a/Documentation/devicetree/bindings/timer/actions,owl-timer.ya=
ml b/Documentation/devicetree/bindings/timer/actions,owl-timer.yaml
> new file mode 100644
> index 000000000..ed50b4753
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/actions,owl-timer.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/actions,owl-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Actions Semi Owl timer
> +
> +maintainers:
> +  - Andreas F=C3=A4rber <afaerber@suse.de>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Actions Semi Owl SoCs provide 32bit and 2Hz timers.
> +  The 32bit timers support dynamic irq, as well as one-shot mode.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - actions,s500-timer
> +      - actions,s700-timer
> +      - actions,s900-timer
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 6
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 6
> +    items:
> +      enum:
> +        - 2hz0
> +        - 2hz1
> +        - timer0
> +        - timer1
> +        - timer2
> +        - timer3

timer1 is a required property. Above is fine but you need allOf:if:then:
block customizing/constraining it per variant.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - interrupts
> +  - interrupt-names
> +  - reg
> +
> +additionalProperties: false

Blank line

Best regards,
Krzysztof


