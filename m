Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C47E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oRshFQmw;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ZZxz8X7m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TB6sn/UOQnuPOej6SF5d8mgi4GN0S1GI9A7uaPPzJd0=; b=oRshFQmwft3nFSRsEMAW6phsGZ
	R7ugnJ0RhOJelt0UalcodqRlYj4G/yq6/a1P+6LMlrudL/HIG8ES6YRbJiv0vpvDO7GXaatceGZLl
	fXrT+/dupWGXfmw88qcYZeX+6lke3dSejtgMqBvCrqoqUxuBvcS9rxyM+sKMGjjgDrQJvgpjNV2GD
	tXP5oMChFf/PUwID+lY4jGgk9NqpmS1L/Sa0I4eOvqZQfAX0oGh8gjhMyyx4IXc+9YFyNJACZCN6G
	/NmrWUDVeVpjLV/gFtpwJsvxO5c1pMF9eeuU6tliI0uLrXewoTv+o3+Tg76JYp45+210g8cMgSTD8
	tHbl4bxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ6x-00000002P9S-1XIV;
	Mon, 26 Oct 2026 11:43:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ6u-00000002P8z-3Z3i;
	Mon, 26 Oct 2026 11:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=TB6sn/UOQnuPOej6SF5d8mgi4GN0S1GI9A7uaPPzJd0=; b=ZZxz8X7mWMciMHa4hyHB52VP/p
	c7Z2OE3CazrXaOpP3QXj4JYBeDF9Aj3nBpgoTPFqI8La/mnJUfTTO2m3pJ3nUukBWjOR5WBwZyK9A
	8nTkwpWzyHViZVhL7klpnuNq5ioBiyugDndsBriPlzPOWUBbMGw8NGM6CxZzDllbhA79EPPFawVt1
	OU3M/+S4n1pNyIZFCe+uxV5Hu5UHkeRy0Gv5k6D6N8Vm2ihWdBV7Y+DTIIqbFZPQ51W23byZEhVuf
	cDwrSKNSCI3sTvc6g4C9QOdX4J72++KS7Lnt+NlJr4KpPwZckGP5qtHCG2ASkK9tSNVrLI9nG530q
	kRCdbvGg==;
From: Heiko Stuebner <heiko@sntech.de>
To: krzk@kernel.org, Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: HystericalDragons@proton.me, amadeus@jmu.edu.cn, conor+dt@kernel.org,
 devicetree@vger.kernel.org, hrushirajg23@gmail.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, liujianfeng1994@gmail.com,
 macromorgan@hotmail.com, michael.opdenacker@rootcommit.com, naoki@radxa.com,
 robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Mon, 26 Oct 2026 12:43:10 +0100
Message-ID: <5520293.6fTUFtlzNn@phil>
In-Reply-To: <20261026075915.203854-1-liujianfeng1994@gmail.com>
References: <20261026-luminous-traditional-gazelle-0e3bb3@quoll>
 <20261026075915.203854-1-liujianfeng1994@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_044328_906999_4395630A 
X-CRM114-Status: GOOD (  12.43  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Montag, 26. Oktober 2026, 08:59:14 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Jianfeng Liu:
> Hi Krzysztof,
>=20
> On 2026-10-26  7:08 UTC, Krzysztof Kozlowski wrote:
> >> The ArmSoM Sige7s is an RK3588S-based single-board computer which
> >> shares its hardware design with the CoolPi 4B.
> >
> >How different devices from different vendors can share design?
> >
> >
> >What is exactly is shared and how did you verify that?
>=20
> I confirmed this with ArmSoM. They purchased the original CoolPi 4B
> hardware design from CoolPi and confirmed that no hardware design
> modifications were made for the Sige7s.
>=20
> So the Sige7s uses the same hardware design as the CoolPi 4B, rather
> than being independently designed.

if it's the completely same board, just with a different print on
the board, why does it need an empty devicetree. When it's completely
unchanged, what's speaking against just re-using the original one?


Heiko



