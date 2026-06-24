Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC47CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dP2bxkYNQAeUz5jXWdGEqjkG4n1wBe44kDAAGlvauTI=; b=DOXiYm6tBPpYzDmsIgLxxmQprU
	U1I59uYAN9QMnFFrm3GhKuXnQIEuTxNFnMENYDTkkFjKS8VssIVKifNjyZ56l/9LX4BCh7Z7bO8a8
	hvlKMVkDToTHq1x+ZV0XwdWcqSdoh25DfF6kHWYET6fN+y9hFzpYupr9qCMxwAL9RPWNlEdDO2fbp
	hy8WBDumKeEmw78jR2l5IfILhfyJmpWOTdoeVO+EFCxKwSxMQlKgYF8PLm6wYjNTLXvyDmhtPqPV5
	/hq4Kll3TToh/eatwkzV8jk9ypthDjjjXuCI3yn8gWVAZmTTyByXfRdNpwKU5HDWDxJDhIeNYtTsF
	kTHRI3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHrt-00000007HrF-2qr4;
	Wed, 24 Jun 2026 07:17:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHrs-00000007Hqz-2KDy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 07:17:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8566460138;
	Wed, 24 Jun 2026 07:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B20D1F000E9;
	Wed, 24 Jun 2026 07:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782285470;
	bh=dP2bxkYNQAeUz5jXWdGEqjkG4n1wBe44kDAAGlvauTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LtuAD2asFoZDWxbMQVUtn9sTSbYKT59fb9iCV0goDWLpHd+yi/m7h/0gdHtW0eeDX
	 x4pZx/3/GwA9Q3xCVpNSB1QAEcqXvLK3JzACoc0Py0HZvjGupZq+7GRNGwsnGq3buW
	 hiyDbgF/jxMd0P9heVz3ZbV26O/y8VgN3KWIlyUSVpCXFTw7T0ML1vsUXWe7T799Is
	 T36sCSg0bsqR+d3e+2ipyN3NX+p1Mtx4P2HHEq3huzLy4KxoyXK5zYdWSz77P/nyK5
	 +hEFV3Ye5xpU3GzN0cLZkVIJS+3m6X+eYEO/9K1zgrcM8SdyVe5wsrVyYlCA6vlW2i
	 5a18kkJlgUqMQ==
Date: Wed, 24 Jun 2026 09:17:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?R3LDqWdvaXJl?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: serial: 8250: aspeed: add
 aspeed,vuart-over-pci bool prop
Message-ID: <20260624-original-vigorous-mayfly-dfceac@quoll>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <73b2bd81ce70814612e6d3cb689c3296de742aaf.1782224059.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <73b2bd81ce70814612e6d3cb689c3296de742aaf.1782224059.git.gregoire.layet@9elements.com>
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

On Tue, Jun 23, 2026 at 02:25:40PM +0000, Gr=C3=A9goire Layet wrote:
> The ASPEED AST2600 has 2 VUART accessible over PCI.

What does that mean? How UART can be accessible over PCI bus?


> This boolean can be set to specify if the VUART is used over PCI.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
>  .../devicetree/bindings/serial/8250.yaml          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index 3cbd0f532e15..b03797f4674d 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -26,6 +26,14 @@ allOf:
>            anyOf:
>              - const: aspeed,ast2500-vuart
>              - const: aspeed,ast2600-vuart
> +  - if:
> +      anyOf:
> +        - required:
> +            - aspeed,vuart-over-pci
> +    then:
> +      properties:
> +        compatible:
> +          const: aspeed,ast2600-vuart
>    - if:
>        properties:
>          compatible:
> @@ -312,6 +320,13 @@ properties:
>        polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
>        applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
> =20
> +  aspeed,vuart-over-pci:
> +    type: boolean
> +    default: false

There is no such syntax. Please do not introduce own style. Instead,
look at other files how this is done.

> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Enable the VUART over the BMC PCI device. Only applicable to
> +      aspeed,ast2600-vuart.

Best regards,
Krzysztof


