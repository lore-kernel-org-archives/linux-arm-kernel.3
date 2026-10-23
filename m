Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA8D606A319
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 04:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uX8iKo9J;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ap4s7NlN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tZVpAtWdlXnl6TCMo3CWgTWfWWIdH1q4ozjaVaEEH/s=; b=uX8iKo9J0fYkGZtUHVq5sFFnsk
	fv+wxFrYDlkt4C5Iy6j+ellvhzXgvt7LXQxy4mepOw4uizT/WTi84IBHI5PhBQNiFZvRjRG6J1SLc
	YJMgzG/83ko2TDe6lKNxzfGzFidu0pZGHP+4rilASI04AH+2m7SseOLWnmIFxu88rj13J/Hpfwkri
	hpAASAZmR95u3gdWD7IvwLYJ2LK1A7FJWcN4SvjMqQaTJY3MBqQgLnOTpWap2GOkd8G6OIrz1yeKl
	uTuMGPGH/tjHMeS6CsVnQZheCIJWIQCETtuzE5ZySpKPYNE5QcnRgisc7TPLcKGZTZF9blXzIfbo9
	Stcov/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6id-0000000FU26-19pe;
	Fri, 23 Oct 2026 04:17:27 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6ia-0000000FU1Z-0eP9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 04:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1792729034;
	bh=tZVpAtWdlXnl6TCMo3CWgTWfWWIdH1q4ozjaVaEEH/s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ap4s7NlNiTcogMEaK1gbk3o45IVbbObCjTB8Zd3YlYLo2GqMiCYw+xvFAzDO7AzDg
	 w76/DIpHgm91TDrWzcca66EF5BL5uefA0aw4PNS9SoXB9QPgMVkkJVnQN4Fw1dLZUc
	 8LVB75coOiCtrgpZzg0+EUbRQNDNySyVGxtTekLSq8O8uVzzaeHWght4WyBWqdrxDH
	 uRlfXMcraH3oAxdD64NhnulQK+hp9bXDRmTl73+mJa8D6b8/CSFGztPWNFHINfd7Rr
	 aQ3qTWedOpXMdzhyZOeBOH/pvXZgnOVlUq0ecYvx3tkJpR7J9fJoZe/S+Prc/je9LK
	 qb87PlEq67/Cw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E1AA46A64B;
	Fri, 23 Oct 2026 12:17:12 +0800 (AWST)
Message-ID: <fb048449033e125df93c2925d6dccafbd4114685.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC
 platforms
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com
Date: Fri, 23 Oct 2026 14:47:11 +1030
In-Reply-To: <cover.1792613583.git.dawid.glazik@linux.intel.com>
References: <cover.1792613583.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_211724_412511_6BEBE0FA 
X-CRM114-Status: GOOD (  14.13  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Dawid,

On Wed, 2026-10-21 at 22:26 +0200, Dawid Glazik wrote:
> This series adds initial upstream support for the Intel AVCRP and JNCRP
> BMC platforms based on the ASPEED AST2600.
>=20
> The first patch adds the board compatibles to the ASPEED binding. The
> remaining two patches add the board DTS files and register them in the
> ASPEED DTB build list.
>=20
> Dawid Glazik (3):
> =C2=A0 dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
> =C2=A0 ARM: dts: aspeed: add Intel AVCRP BMC
> =C2=A0 ARM: dts: aspeed: add Intel JNCRP BMC
>=20
> =C2=A0.../bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0.../dts/aspeed/aspeed-bmc-intel-avcrp.dts=C2=A0=C2=A0=C2=A0=C2=A0 |=
 322 ++++++++++++++++++
> =C2=A0.../dts/aspeed/aspeed-bmc-intel-jncrp.dts=C2=A0=C2=A0=C2=A0=C2=A0 |=
 276 +++++++++++++++
> =C2=A04 files changed, 602 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.=
dts
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.=
dts
>=20
>=20
> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d

Can you please discuss why you based this series on v7.1-rc5? v7.3 has
been released, v7.1-rc5 is a long time ago.

In the future please base changes for the AST2600 on the latest -rc1,
or the aspeed/arm/dt branch of bmc/linux.git on git.kernel.org.

Rebasing allows you to remove 2/3rds of this prerequisite list.

> prerequisite-patch-id: 3af4bd880f896c97741b54ee18845b305a4bd061

This was already applied in 7.2

> prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222

Can you please rebase this patch to send it to Lee on its own. The
AST2600-based platforms currently generate a warning without it. I had
hoped Lee would apply it in the same cycle.

> prerequisite-patch-id: ac42a7a373fdc407f6377d0b1c74d728af50ba42

This was already applied in 7.2

Andrew

