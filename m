Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E908C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 00:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Uj4nfGZq5m7cD0qyg2Mz1aKH9prRuM0UoVhM5TzRwU=; b=L6Xt45x4e8F8eiFbWmEfD27eyu
	z/enZ3wubFcvrpwiaTeibXWGZZhzptYLFQwI5wbxw4NE+2CpohiyZaZinnaSAWSqF01y3wiknlKjV
	peuM3vrLTj0AKnZrgC4zNKgVPwSrufAgGiCIF6UOubL6w7NTnse51HqZxZ4j0osXrvuMLOs94jMW5
	xc2qB1PZ6wWoRW90VJDKuxnoNLP2TTEXp9Lx00OItod3TXzLqbgJkxXi6s8sjYsbzMNq4+LK1Syuq
	vDO4ockFsUoKy7cOPfNRixKbyhimkyIiPB3saeAOKPkjeMyPoY7K/uOFEQhPf2knX8f5F81dlzr6m
	bri8Bo8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUE2C-00000007BXp-2Opy;
	Wed, 25 Jun 2025 00:30:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDzk-00000007BJy-1aww
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 00:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750811285;
	bh=9Uj4nfGZq5m7cD0qyg2Mz1aKH9prRuM0UoVhM5TzRwU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e37NC5JgqCB3oXE3YtFABqL935nsxqzLUVyCNYc9KDFiin+d3m3mtW9mm8+7qSt6w
	 I6FsN0fa8AfAQugRXHBrFzYLHu4DDB7stdQVluFSBW+3GizWWMfbdtrLwZKuxrt7Mf
	 hTVAkUylLeqi/9sodDfzAxtzc+HoIOPZEUmuzNeArDxxfz+mpXKS5IYg0vZKPe1Zdr
	 jBdIsH+Dsl43VhBC166MJH+YLgO3a3KDjiQRijzUN8iKCwqc9P5Z+UWfNWRl6KmZds
	 LzSSrX4rkeOWr4biV8oBIH3jKeo1ZquGvCSwDJd6jk05YjuoRd+o012YC0a7Q10SL0
	 QviUFvs/cAyYw==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6D791640A1;
	Wed, 25 Jun 2025 08:28:04 +0800 (AWST)
Message-ID: <0ba565ac9444503be954161a8d79fa0476bd78a0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 25 Jun 2025 09:58:03 +0930
In-Reply-To: <20250623024456.2068370-2-jammy_huang@aspeedtech.com>
References: <20250623024456.2068370-1-jammy_huang@aspeedtech.com>
	 <20250623024456.2068370-2-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_172808_616108_006F9BB5 
X-CRM114-Status: GOOD (  15.25  )
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

On Mon, 2025-06-23 at 10:44 +0800, Jammy Huang wrote:
> Introduce the mailbox module for AST27XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0.../mailbox/aspeed,ast2700-mailbox.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 57 +++++++++++++++++++
> =C2=A01 file changed, 57 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed=
,ast2700-mailbox.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mai=
lbox.yaml b/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbo=
x.yaml
> new file mode 100644
> index 000000000000..9c5d7028e116
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.ya=
ml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/aspeed,ast2700-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2700 mailbox controller
> +
> +maintainers:
> +=C2=A0 - Jammy Huang <jammy_huang@aspeedtech.com>
> +
> +description:
> +=C2=A0 ASPEED AST2700 has multiple processors that need to communicate w=
ith each
> +=C2=A0 other. The mailbox controller provides a way for these processors=
 to send
> +=C2=A0 messages to each other. It is a hardware-based inter-processor co=
mmunication
> +=C2=A0 mechanism that allows processors to send and receive messages thr=
ough
> +=C2=A0 dedicated channels.
> +=C2=A0 The mailbox's tx/rx are independent, meaning that one processor c=
an send a
> +=C2=A0 message while another processor is receiving a message simultaneo=
usly.
> +=C2=A0 There are 4 channels available for both tx and rx operations. Eac=
h channel
> +=C2=A0 has a FIFO buffer that can hold messages of a fixed size (32 byte=
s in this
> +=C2=A0 case).
> +=C2=A0 The mailbox controller also supports interrupt generation, allowi=
ng
> +=C2=A0 processors to notify each other when a message is available or wh=
en an event
> +=C2=A0 occurs.
> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 const: aspeed,ast2700-mailbox
> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 interrupts:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 "#mbox-cells":
> +=C2=A0=C2=A0=C2=A0 const: 1
> +
> +required:
> +=C2=A0 - compatible
> +=C2=A0 - reg
> +=C2=A0 - interrupts
> +=C2=A0 - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +=C2=A0=C2=A0=C2=A0 mailbox@12c1c200 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "aspeed,ast270=
0-mailbox";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x12c1c200 0x200>;

I realise this is just an example, but with respect to the datasheet,
shouldn't this be sized as 0x100?

Otherwise,

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

