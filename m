Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0D3C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 02:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FikZ2tqBYmNhAVY3oqnGQ7MPas/t5KOAWI/+eYy3y0E=; b=iFBz1U1GovtxuiHIQLRfBsZD+3
	OJYtQLHKldqYVlbH7eX991bhe0I6qVxgjcRuGm2hpKvxq8HexiuuGNHfxVimv/k64Ya3o3CmACv6a
	Jv/KHP0xNalAeYuVpU/ictSQhWsmVq4yHKtb6lSz7EDitxyi4FOWYwH/GVn7nZ8Nzb0PvzsMbTlAH
	int0mlcAzFqGTm3Mmugwrjn3MpQ5HUXnxrR6OCLJhfoZEUu+dKeq5OfBhyr2Jsu8oDccrcr+pekVy
	ZDgjT4EsZARhGcAdvZeQCZERnN6eYWT2GIb0roGtMWTpRn0mODZe+LTSeia+LgneUtOJqhgwYlGV1
	SCguz0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmm2-0000000714K-1dHl;
	Wed, 02 Jul 2025 02:00:34 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmjg-000000070ys-34ej
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 01:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751421487;
	bh=FikZ2tqBYmNhAVY3oqnGQ7MPas/t5KOAWI/+eYy3y0E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RpUJV7H0lb+POZjhJ1kNG1d86TBEbT0WT3hS1RHABYv6qvUJcNimMrg6UT36VPNCp
	 SOp+JGCpScyM624y4BTceBkyJdAUax+0wlMICosNn6JLx/rKpHwWS3MWJXZSE0l11P
	 1nma8oCwyQeDEUA1Pk1gbpiafqiGjxNpI7RIwg//x7YanAPfxtLSerYits2FrnVgBr
	 y2CJI7bsEGTcufux5WVfAon5DO2FPLtH/pEiK4CaCYXLDJZgGik35RzWZDLd5rhYan
	 POscMV+LONrOd5z6wPCHU84aQjkSQXbplUf96UJLHKJakOE/KvRD+yg0oZY5R1M18F
	 maj175ErQGpWA==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 93B8D6443C;
	Wed,  2 Jul 2025 09:58:06 +0800 (AWST)
Message-ID: <8b035557ad025d31ab347349ebf9b91ff668498a.camel@codeconstruct.com.au>
Subject: Re: Add bmc/linux for-next to linux-next
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,  openbmc@lists.ozlabs.org
Date: Wed, 02 Jul 2025 11:28:06 +0930
In-Reply-To: <20250702114941.5bfe1e5a@canb.auug.org.au>
References: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
	 <20250702114941.5bfe1e5a@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_185808_958607_479002BB 
X-CRM114-Status: GOOD (  12.67  )
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

Hi Stephen,

On Wed, 2025-07-02 at 11:49 +1000, Stephen Rothwell wrote:
> Hi Andrew,
>=20
> On Wed, 02 Jul 2025 11:01:54 +0930 Andrew Jeffery <andrew@codeconstruct.c=
om.au> wrote:
> >=20
> > Could you add the following to linux-next?
> >=20
> > =C2=A0=C2=A0 Repo: https://git.kernel.org/pub/scm/linux/kernel/git/bmc/=
linux.git
> > =C2=A0=C2=A0 Branch: for-next
> >=20
> > This aligns with the recent patch to MAINTAINERS for the ASPEED tree:
> >=20
> > https://lore.kernel.org/all/20250702-bmc-tree-update-v1-1-c270cd8af0ab@=
codeconstruct.com.au/
>=20
> So, does this replace the aspeed tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git branch
> for-next)?=C2=A0 Or sit along side it?

It can replace joel/bmc.git, however, it should be fine to sit along-
side until Joel confirms removal of his tree with you. I've been doing
the BMC SoC patch wrangling recently, and he hasn't been updating his
tree with the branches I put together until I poke him about it. In
this case I'll just hassling him to update his tree, which should
remove any opportunity for conflicts or the like.

>=20
> Either way, who should be the contact(s) for this tree?
>=20

Both myself and Joel.

Cheers,

Andrew

