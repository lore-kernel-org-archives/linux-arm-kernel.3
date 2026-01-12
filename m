Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ED9D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 01:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EZGAGj4mxKMc9TBwMP5s7SOY2mvUzQcYppNZKTDksI=; b=GRCdGGfuWKwmXYun2IrO8p4LZe
	M0qkAXSHcEHOprXOzlGITm91KLUsfPz694Aq6ImnXYyeNnlEcnmp9oDxrjRx6NjV+ZJnfsgdLe5Jr
	EHUSNTnCyO3m9o86wgfletqLElkkcGK/cnX0L5A0r96VKrDwrNti+a0kDNbHWaMF2dWrjqy3Cam+8
	pUIPSE+BdzwTaE48FL3CzJ5yr0Gi+ICzK8YarJtz+yvvbYstyha+eV2DCCIOLKy3UYQA5NekUkdUj
	p/wilwnTcuBs9dUOiW8uwMa2gddNZdCgoEKzSJuHPDITT8zMIjbTIhYNffwRA/L2cppoWKlUvebyp
	YqXjp1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf6mW-00000004dEB-1XJL;
	Mon, 12 Jan 2026 01:31:44 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf6mU-00000004dDp-0cft
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 01:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768181490;
	bh=2EZGAGj4mxKMc9TBwMP5s7SOY2mvUzQcYppNZKTDksI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XNb12peP0C2TGNPDv/KF3sxfwLnepAAdkGCXC8mcqIoPCGRDjpSEE1fvTrj3Kr0DT
	 pcQqPtHn5sOnUdZ6gYd6bcqsbU+X3/mlmw3d9IHj8yhZ1CfvcrieWYE7iQ6wKvyaXy
	 A3e4FTeGhvbo1TzULng5d0A7bPT0Xv4AwRDB9HSt5yG4Ty2nj3/DczaT1P09fWgQZo
	 1/rA06eq2IDFJcKkd9K+gzKZmFCXKuEtNBZM6Lkjpe9RwPNiQ7GvgqqDURqqx6n6wu
	 sJZKvG7BI2sky36rOcy+h9oga5nbq/Y9pyWJizLkIkG2CHUsdvBzbK8Kfbl4i85j1b
	 bCijTcvJCj/vQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 35AD6648B5;
	Mon, 12 Jan 2026 09:31:28 +0800 (AWST)
Message-ID: <45bdf2a6c0d33dd6ce0fd3cc279ef6edc509a540.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Asus IPMI card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 12 Jan 2026 12:01:27 +1030
In-Reply-To: <20260111201040.162880-2-anirudhsriniv@gmail.com>
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
	 <20260111201040.162880-2-anirudhsriniv@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_173142_411204_41307907 
X-CRM114-Status: GOOD (  11.45  )
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

On Sun, 2026-01-11 at 14:10 -0600, Anirudh Srinivasan wrote:
> Document the new comptaibles for Asus IPMI card
>=20
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> ---
> =C2=A0Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 9298c1a75dd1..b2d20341f8eb 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -79,6 +79,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - ampere,mtmitchell-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - aspeed,ast2600-evb
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - aspeed,ast2600-evb-a1
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - asus,ipmi-card-bmc

It's a bit bike-sheddy, however: the pattern tends to be
${vendor},${platform}-bmc, but as the platform can't be specified and
the card's function is the BMC itself, I'd go with "asus,ipmi-
expansion-card" (I couldn't immediately find a useful identifier other
than the product name).

Andrew

