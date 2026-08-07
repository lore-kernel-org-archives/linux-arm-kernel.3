Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15FBC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgQPRr6KO6f+5jgx8UafJjTGJrvaC3/Te3NzsCkfesU=; b=r0X1ru7riRipkCK8Nm1GbqDGIL
	9sxInyGB1nDKf+KTxfA8hfY+XNl/jckcmbx5fTwacHaB1tBJpMRzps+1h0AxN/RWWM14Lo5N5D6Ec
	PA/9JLdTQPuRO7KWKV+CRVD+E3xcDJ3yu/uCTEmkfFEZmmaAT3brdW7bsBNAM/xH/OjVs9LosJpSH
	4WW6NsHtXjC5b21Dq5nPR3Ihq8/fVPf3SCQ8c7Mj2GMnBOgI/Dyx1flZPPfiRL5JIkU3KQfrWRp2W
	hS+9HmKAf2bLMKHtbPvxODTb+RTN5P7fln3kBOS6O1RC8BCAD8vL/CyAICJGem1uJ7oDagiI+FPu8
	vUO3FfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEve-00000007E87-3een;
	Fri, 07 Aug 2026 07:23:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEve-00000007E7y-16QQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:23:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA9BA40810;
	Fri,  7 Aug 2026 07:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EB01F000E9;
	Fri,  7 Aug 2026 07:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786087419;
	bh=AgQPRr6KO6f+5jgx8UafJjTGJrvaC3/Te3NzsCkfesU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CLij02BSdOzAHBhHBATYyrVi9hkxsqlYz4VIYJ+tLIwDOusBpIeEQ6nsvCbMmewrW
	 HzOWWFbkb2ioc+QJoowwcc5Iy/emL5WdxemjWy7NTS9alinUOyAX1FV9XcGtj2+Fm4
	 uOkegAHxaeY8ov8h3m6b5FkotOYK7ZyLC3bY8umE587jIWR07AkjBrEmbXDhUDnkwF
	 phevrPP/W5uqtvfeumb61rtIwEX7Ln7z4IHP2tC4EpfiqEJLE4I664YL5lGDCcyCP+
	 OvX56TuEiitZwE6pduxT7YInlF2VB3wmC8MRxs/FyjKtUjTYq7zjp35U029Rjv6n6f
	 tU12iXfiDJFqw==
Date: Fri, 7 Aug 2026 09:23:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?R3LDqWdvaXJl?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	andrew@lunn.ch, jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, 
	ninad@linux.ibm.com, anirudhsriniv@gmail.com, tan.siewert@9elements.com, 
	linux-serial@vger.kernel.org, mfd@lists.linux.dev, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: serial: 8250: aspeed: add ast2600
 and aspeed,vuart-over-pci
Message-ID: <20260807-ginger-mushroom-of-reputation-bbb7c8@quoll>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <52d5bce1cf8ec3ff0b27e7313655cf7ffa2236b5.1785932211.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <52d5bce1cf8ec3ff0b27e7313655cf7ffa2236b5.1785932211.git.gregoire.layet@9elements.com>
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

On Wed, Aug 05, 2026 at 02:19:48PM +0200, Gr=C3=A9goire Layet wrote:
> The ASPEED AST2600 has 2 Virtual UARTs accessible over PCI.
> The ASPEED AST2600 can be used as a PCI device.
> 2 Virtual UART can be exposed to the host via this PCI device.
> These are 8250-compatible register sets and can be used to have UART
> communication between the PCI BMC and the host.
>=20
> This boolean can be set to specify if a VUART is used over PCI. A VUART
> over PCI needs a syscon phandle. The syscon gives a regmap to the SCU,
> which is used to set the enable bits of the PCI device.
> On the aspeed's chips, the clocks phandle already points at the SCU node.
> But deriving the regmap from the clock provider would misuse the clocks
> binding. An explicit syscon phandle states the dependency directly.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
>  .../devicetree/bindings/serial/8250.yaml      | 42 ++++++++++++++++++-
>  1 file changed, 40 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


