Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB5EC9EC7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4S2ffhUScYe1oalT7XXK9u5A6GaoEljjZjRU+VMDxw=; b=RQczj2mg5ZvGwyc4vPtMdR/OsV
	PDquodxv55L1OGnddh/1+kRSXeYPKYvcVbt/JivRxig+JE1J43DeHrBLg+JNBSOQNkrtfGwczsEa1
	TRXQWKTnWv7yUyecQx873XWazmBJAetWO3MWxyAt8JNhlKdwGKtacUHOs5YUjNTrO5Xfcw1xFWspf
	1HypzpnXQMVSwS2Ngsm36MfArP3KH8JZvayU0NvjYuXJEW1QZhPhrcZ98Q9GwphfOCNWcScRrf3Qy
	A7IFBdANUEheuueSTK/nNug0S3/qb8ZgSVTpCBm9MTWAb+8w0+S/9BfdOJ5BZPds/oSHEyoRyItOq
	GLgkJimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGOG-00000005Gu3-3qfD;
	Mon, 12 Jan 2026 11:47:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGOG-00000005Gtx-0SQP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 474396001D;
	Mon, 12 Jan 2026 11:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7095AC16AAE;
	Mon, 12 Jan 2026 11:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768218439;
	bh=/4S2ffhUScYe1oalT7XXK9u5A6GaoEljjZjRU+VMDxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ov0GMxKtj6Y4+sxQolquMOuCwO7oaWxw44KyaJs4xFm75xPKzFOctgkFbOcUM/0JN
	 Ry/H7xWWRSJbf+RwNKiEMrJ8SF7IJla970kNNe9+urBUYj8p51knfh/j6dRJLly9y7
	 r6FZAIWHup8GEU+ReniBNQ7CLLTrnR91w7+gh1QaWUJTqGksssDvMsuEcOEVI1pY5x
	 sHZB4IibalOo0ok63dZjENzq0/FZ9ga+9ywzs2C9fiwOLdubLnScm8oNmua4jR/WlG
	 gRteS7LzQgfSWhQ3QngqReZcJsWBAF+KOh04pNXdCHdhTl31H8IDLjpsYiBKFl63PZ
	 HQ/oW/wAfA2EA==
Date: Mon, 12 Jan 2026 12:47:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Anirudh Srinivasan <anirudhsriniv@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Asus IPMI card
Message-ID: <20260112-whimsical-annoying-fulmar-25e4d9@quoll>
References: <20260111201040.162880-1-anirudhsriniv@gmail.com>
 <20260111201040.162880-2-anirudhsriniv@gmail.com>
 <45bdf2a6c0d33dd6ce0fd3cc279ef6edc509a540.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <45bdf2a6c0d33dd6ce0fd3cc279ef6edc509a540.camel@codeconstruct.com.au>
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

On Mon, Jan 12, 2026 at 12:01:27PM +1030, Andrew Jeffery wrote:
> On Sun, 2026-01-11 at 14:10 -0600, Anirudh Srinivasan wrote:
> > Document the new comptaibles for Asus IPMI card
> >=20
> > Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> > ---
> > =C2=A0Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b=
/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > index 9298c1a75dd1..b2d20341f8eb 100644
> > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > @@ -79,6 +79,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 - ampere,mtmitchell-bmc
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 - aspeed,ast2600-evb
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 - aspeed,ast2600-evb-a1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - asus,ipmi-card-bmc
>=20
> It's a bit bike-sheddy, however: the pattern tends to be
> ${vendor},${platform}-bmc, but as the platform can't be specified and
> the card's function is the BMC itself, I'd go with "asus,ipmi-
> expansion-card" (I couldn't immediately find a useful identifier other
> than the product name).

This should include some model name or at least soc. What if you have
IPMI card for ast2600 and later completely different for ast2700?

Best regards,
Krzysztof


