Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D797606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 23:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nsyIHMej;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MdM8LbOU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JvGUTxqAhp/FJcRRh1bkPIKoszluKPLjqotGVQjBjx8=; b=nsyIHMejw9zVAduxlrRAabkCzV
	FLYLbcdR6qbhpHwgU8y1IJBtwe1XHlqiP+DZHur2h2WG7GUC947t7eedR/dqLb7cqkr/AyakKBciX
	UlEHODjen0XvwKTXZzvwL5benqhTzXsXL40vCxe7X/6McRKw4fMqGAJ0iX8vE1/c9Q4nUr8YeA046
	cMKtrbqDL4a6LSKgsHDKCOKHasr9X1vBOW4F44DyBo1Xs9bu4hOs47O7GzZ+zYJgZiJpLz+VMU7fM
	i9TJgEIcIFVZXqOyJG7dKX8twFwKUccRNGrX/wD4Dx1ch+aIX+LkLSt7+IIiyT2+b99pTzWyeeQtz
	GkgP1YUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL7gE-00000001VG4-0eXN;
	Sun, 25 Oct 2026 23:31:10 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL7gB-00000001VFf-2jS6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 23:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1792971054;
	bh=JvGUTxqAhp/FJcRRh1bkPIKoszluKPLjqotGVQjBjx8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MdM8LbOUh425FSEk2CJG/RuZEdiEhPOUrKqYAspOLZrawv24QxPWJ9ioI6T3YT7KE
	 2YkCKKa5XkpvPz2db/e4woIqq9eW4SjKYJPSuMd5h3vKCtW+cq6MKLk8Uqx5VfDDAe
	 xkTROPg2vfMUU0VpHhS8E17EJZwSQgSqDNySd2Mg80NzNoy1rTy3vND/VIBBHgM1fr
	 GcLfHmGDWMyAjcGkTets7PZhsRd3enANbjx7oARxw38EKJBg/DKmO6/cx3Mbi7WcuZ
	 9EvNWdfxH2snn+igU9I1uAj6AvrMXlbO/XuLkGjhoViMwOM3ZX1dni4/YTD67Axz0j
	 AkXf9Bk2xp3Dg==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D24076B2E4;
	Mon, 26 Oct 2026 07:30:50 +0800 (AWST)
Message-ID: <53c6716e5cadedd82d7243dc75a5869c8879fd87.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC
 platforms
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	maciej.lawniczak@intel.com
Date: Mon, 26 Oct 2026 10:00:49 +1030
In-Reply-To: <9561c180-ff8d-489d-9ad1-8d9a7afb592c@linux.intel.com>
References: <cover.1792613583.git.dawid.glazik@linux.intel.com>
	 <fb048449033e125df93c2925d6dccafbd4114685.camel@codeconstruct.com.au>
	 <9561c180-ff8d-489d-9ad1-8d9a7afb592c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_163108_061845_D0B156D4 
X-CRM114-Status: GOOD (  19.85  )
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 2026-10-23 at 11:20 +0200, Dawid Glazik wrote:
> Hi Andrew,
>=20
> On 10/23/2026 6:17 AM, Andrew Jeffery wrote:
> > Hi Dawid,
> >=20
> > On Wed, 2026-10-21 at 22:26 +0200, Dawid Glazik wrote:
> > > This series adds initial upstream support for the Intel AVCRP and JNC=
RP
> > > BMC platforms based on the ASPEED AST2600.
> > >=20
> > > The first patch adds the board compatibles to the ASPEED binding. The
> > > remaining two patches add the board DTS files and register them in th=
e
> > > ASPEED DTB build list.
> > >=20
> > > Dawid Glazik (3):
> > > =C2=A0=C2=A0 dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boar=
ds
> > > =C2=A0=C2=A0 ARM: dts: aspeed: add Intel AVCRP BMC
> > > =C2=A0=C2=A0 ARM: dts: aspeed: add Intel JNCRP BMC
> > >=20
> > > =C2=A0=C2=A0.../bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > =C2=A0=C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > =C2=A0=C2=A0.../dts/aspeed/aspeed-bmc-intel-avcrp.dts=C2=A0=C2=A0=C2=
=A0=C2=A0 | 322 ++++++++++++++++++
> > > =C2=A0=C2=A0.../dts/aspeed/aspeed-bmc-intel-jncrp.dts=C2=A0=C2=A0=C2=
=A0=C2=A0 | 276 +++++++++++++++
> > > =C2=A0=C2=A04 files changed, 602 insertions(+)
> > > =C2=A0=C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-in=
tel-avcrp.dts
> > > =C2=A0=C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-in=
tel-jncrp.dts
> > >=20
> > >=20
> > > base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
> >=20
> > Can you please discuss why you based this series on v7.1-rc5? v7.3 has
> > been released, v7.1-rc5 is a long time ago.
> >=20
> > In the future please base changes for the AST2600 on the latest -rc1,
> > or the aspeed/arm/dt branch of bmc/linux.git on git.kernel.org.
> >=20
>=20
> That's my mistake. I'll rebase onto aspeed/arm/dt of bmc/linux.git and=
=20
> send v4. For future AST2600 changes I'll use that branch as the base.

Thanks.

> > > prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222
> >=20
> > Can you please rebase this patch to send it to Lee on its own. The
> > AST2600-based platforms currently generate a warning without it. I had
> > hoped Lee would apply it in the same cycle.
>=20
> Sure, I will reach out to him.

Thanks for this also :)

Andrew

