Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99421CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 02:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brjNCibui1BunD75iFMB/zhDYfVCb5iddYtyuRU7tNg=; b=aL2cwNBuoKl/UoRjEIsqXU9TlM
	TJMGatS2JeCW7COmAbo9sb4mq0ud8IAMiBtfda9SBUrCMsPb9acqeWFvEfiz2ogPVi0GLbk6lcq+L
	DiPTc8OP9KzHJ8zYaWCvJlA2E3qCMPEHJ5A1UUfZiTzdiV6iDgbv+JjGPx392dG+b/wHePAkI5cjo
	+zITKf7g1OiG+YOvDzr7U7bY+4Wojlw8i0F17ucuwpG+eH/Hz1FxWs4r2CSdbtFHO1WepcntgtqJv
	JI9acaNJhpnq8lpEqKi4k0O24LKo/60r807SncjC/ua9zW7c8aSwKpq//7/3Jeumm8VXqBt9dLgT+
	ppObAmSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v341u-00000001AVv-397J;
	Mon, 29 Sep 2025 02:54:22 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v341n-00000001AT5-2bXb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 02:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1759114447;
	bh=brjNCibui1BunD75iFMB/zhDYfVCb5iddYtyuRU7tNg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KBaxehw5FTRBVnzcCNHJ3aAdKfn7YaIwpgMkzt/GIBNODs9itUtYsHSvrk8qN/Sf1
	 ymRxkd1wPN83MvkP0lVUV9pBS9gtIDR1oeksM8vAf+ZJ5/rXLFWCC7iwQhaS2hf1FF
	 Whhuy4kG77LxXwLheG8qLpvSG/QpBJWay9oeot/yR/VkiyaHCBESslUl+ZNWX1K+SS
	 7FvCOgaUXjt9yPSw9BbmgFKnAoIXsiz4EN+bivEoL/4PKpRbUWeT6PO1ce/DOZo5GW
	 i+gDePAUNVYdv9OObxIpt4lmuM6nKI7U0a5EpKw2wODRn2U6P7fRvktX+jHpHmEeQh
	 QfS8p0FuGUBCg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2413864782;
	Mon, 29 Sep 2025 10:54:04 +0800 (AWST)
Message-ID: <dfd8160f015b405623aa7a4b9e69eda2ad1c5df5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: yosemite5: Add Meta Yosemite5
 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
 Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, Leo
 Yang <Leo-Yang@quantatw.com>
Date: Mon, 29 Sep 2025 12:24:03 +0930
In-Reply-To: <20250924-yv5_add_dts-v2-2-39a4a8e3c9e6@gmail.com>
References: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
	 <20250924-yv5_add_dts-v2-2-39a4a8e3c9e6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_195415_858372_80619EC6 
X-CRM114-Status: GOOD (  13.39  )
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

On Wed, 2025-09-24 at 20:28 +0800, Kevin Tung wrote:
> Add device tree for the Meta (Facebook) Yosemite5 compute node,
> based on the AST2600 BMC.
>=20
> The Yosemite5 platform provides monitoring of voltages, power,
> temperatures, and other critical parameters across the motherboard,
> CXL board, E1.S expansion board, and NIC components. The BMC also
> logs relevant events and performs appropriate system actions in
> response to abnormal conditions.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> ---
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts=C2=A0=C2=A0 | 1068=
 ++++++++++++++++++++
> =C2=A01 file changed, 1068 insertions(+)

This misses adding the devicetree to the dtb target in
arch/arm/boot/dts/aspeed/Makefile. Consequently I don't expect this was
tested with `make DTBS_CHECK=3Dy ...`. Fixing the make target and
checking the DTB yields the following among the usual concerns:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: ethernet@1e6700=
00 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('ncsi-pack=
age' was unexpected)
        from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac10=
0.yaml#

Can you please address that? You may need to update or introduce a
binding document as part of doing so if it's not a matter of removing
the property from the devicetree.

Andrew

