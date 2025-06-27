Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E42BC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 01:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5XFQLvGMv9kDFTYtz6e9bjeFb7odw6E3EhLd0Z5xQA=; b=r38fhqNCQvnzhdAeWZwJKVWk+V
	yVnwv+cavEiWmc0mlocne8MOje/SaqY0y85lI6WieFVxXcGm6vsfFRSFB2Ru7RBr0HP9LlsTBrwI3
	2sQxhQZsq+L6sECaKgauENxUXxG+f9QEynPJH+Z8lr7mwIuWhy0ewSJxGXflKiUyG+SHejayZmCzD
	UAenLsa0PiqUXtAFph688yBySaAVtFp6bZcVeF0efAJI9PaMAqtIDKEnJRy/kBY06J0ghjlMOCa9T
	vtLsThyyCqx/fKxYBA/oUwRdK/TPX5Cd0Jw+wH936/OTyzueTuBd3NmCH6EEV5Lv1oFYXShYrmrOy
	iqDUZKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUyJS-0000000DK3q-0LNK;
	Fri, 27 Jun 2025 01:55:34 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUyGz-0000000DJqA-2gtr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 01:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750989179;
	bh=O5XFQLvGMv9kDFTYtz6e9bjeFb7odw6E3EhLd0Z5xQA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LIFew9Pnb2MSiK1ccfZ5i3NSd3zNvworwa5dRBa6r1MGEszTmWLFFBu0kNoTHOQhQ
	 SKd1t4BTH/6zAAsUNtA+JXnzgmR4C4W9lQ+sYcWpI9Q+v6K+jQKG4oBdL5Ijf9Yq4v
	 ri/R6bSB7EOg58uQDErUI4MOMeJHInSnqB+0Ps+uZbWNlkwMQ6awtu6mKzGGqLkECQ
	 T4A11Q4hOxPW2eFGJnRnF0duUWqbITF4C/H+JsdZ7huh0tUv4JwOqvlk8oWiVlOn1d
	 Py5nt7hy42IpoLmRJ8m5rD7LU7hvb/hTWGNeM5W3HJ7xOr6WOAex7IeoTgvKnitUrT
	 Ey6uNEAjklLaw==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A87186449F;
	Fri, 27 Jun 2025 09:52:57 +0800 (AWST)
Message-ID: <9efb52255ee55c6300f97c067d8cec606dab0574.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Jammy Huang <jammy_huang@aspeedtech.com>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Fri, 27 Jun 2025 11:22:56 +0930
In-Reply-To: <20250625155007.GA1489062-robh@kernel.org>
References: <20250625073417.2395037-1-jammy_huang@aspeedtech.com>
	 <20250625073417.2395037-2-jammy_huang@aspeedtech.com>
	 <20250625155007.GA1489062-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_185301_872175_38C104E7 
X-CRM114-Status: GOOD (  10.24  )
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

On Wed, 2025-06-25 at 10:50 -0500, Rob Herring wrote:
> On Wed, Jun 25, 2025 at 03:34:16PM +0800, Jammy Huang wrote:
> > Introduce the mailbox module for AST27XX series SoC, which is responsib=
le
> > for interchanging messages between asymmetric processors.
> >=20
> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>=20

*snip*

> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: aspeed,ast2700-mailbox
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 2
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Contains the base addresses and sizes o=
f the mailbox controller. 1st one
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is for TX control register; 2nd one is =
for RX control register.
>=20
> Instead, just:
>=20
> items:
> =C2=A0 - description: TX control register
> =C2=A0 - description: RX control register

Maybe also specify reg-names with "tx" and "rx"? That way we can use
devm_platform_ioremap_resource_byname() in the linux driver
implementation, which should look tidier.

Andrew

