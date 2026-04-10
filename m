Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B35BE99069
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPTWF+bSuUauzYxg3Ith85NyjkeTXoDfED2bM+F3eT0=; b=Lqh5Gx/g/sOuL30stsvaG+sYr/
	QN9w2gnDUVx56niIWMFDXc9OiLvoM0zY0PlzV/JEkxcEr2gljXj9TXBaBgGR/HvLxChvGxVJah8Id
	Fb8HojOYPMEQ9SMQUQ0oVw2XPKQzqJbbzpNgyyde3Sfb657hwKVe44Vv01hIEtT6fttIzGF9NkJIW
	GOg9pLLI4U7Daec+Wp4zZbTHYeAYTA6/z5WLE/lfOg7jMag2nrHuqtzV5aO2GN4Lq7P+2jiI6sBnQ
	kJFPQPCz781amPbDJC5lNyDznHFsYFdPeyIfSi7b98uuibU7DGVR1H2uWFqadZ1uu/QG1mvxlGJWp
	ZkmUzVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8Za-0000000BxFp-1Iqu;
	Fri, 10 Apr 2026 09:54:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8ZZ-0000000BxFS-1Xkb;
	Fri, 10 Apr 2026 09:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IPTWF+bSuUauzYxg3Ith85NyjkeTXoDfED2bM+F3eT0=; b=aaS1RjNySfkU/tW1sP2QlUtVsV
	0Jdu+f6g1ZH08lY1YJl6NNdnUkhGMh3tHt0mrJH8yuAh94P1nTdtHzquMvMuYDj6ZPl56sLmmI79l
	IwAStYG6XqMl0U3utPzy+NIZ5W+62VLUv9mRqwhqQy8x3q9XjuQimmDmhsCdE2jpg6FB3UWlwLklW
	YZZ3jfPtVvnIXyyZovZ9vg8vgjte/bd1AWm036+nMFv9yVP4CY89uk7a5uAkR0aO7pQlFVBjGE/D/
	9ZDTrXzF4MEuTFrbM7/QBr1aiH/Qsj+r9SjwsTffXrOjYstvRJlxyjMJfT4pahfw/oE+5PkW0bG43
	pVTZIXgA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8ZW-0000000DEpC-2vYx;
	Fri, 10 Apr 2026 09:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IPTWF+bSuUauzYxg3Ith85NyjkeTXoDfED2bM+F3eT0=; b=C4+KnbWOwwsB2t+ayIHX+1/XfX
	UQsHLnNp57WpjpGYwFzRQ9KNMQfEJCVwizu7Nm685T43rZM8gnY+Wo2tzba8qtMGMXxWf8EiPeT1k
	dGiUi6gPsN5ij9G9VYQ8ayOSnWY6cIMgNRE5NAHufPhecvzMagSR0ypzpqFIRVeR6euPMkudx/vWT
	w8iSCde0LuXcacbEuzU5+uUueYO9GJx/ftOJuuIig+dEzlAYm+4xjj+nsxR1SiES6VpPMyTlpfeLn
	kgg6IWUk+AlKq3bjUbL7DWarkX+eE+sHBNkGUXuzzS9OkX2Ms/ReR0MrmenRhb0A1YczQm+aE7i16
	KIWavJKg==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 mturquette@baylibre.com
Subject: Re: [GIT PULL] Rockchip dts32 changes for 7.1 #2
Date: Fri, 10 Apr 2026 11:54:37 +0200
Message-ID: <1879424.3VsfAaAtOV@phil>
In-Reply-To: <13980380.dW097sEU6C@phil>
References: <13980380.dW097sEU6C@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_105442_794321_6CD26775 
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

Am Freitag, 3. April 2026, 15:39:31 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Heiko Stuebner:
> Hi soc maintainers,
>=20
> please find below a new ARM32 Rockchip SoC for 7.1 . This goes on top
> of the generic arm32 changes I just sent.
>=20
>=20
> I've split this off from the other ARM32 changes, because this contains
> a shared clock header, shared between the devicetree side and the clock-
> driver side.
>=20
> The clock pull-request is sent [0], but not merged yet - probably after
> easter I guess.
>=20
> And while in the past this has always come together in time for the
> merge-window, I wasn't sure if in the soc multi-maintainer context the
> handling changes. So depending on your preference this could also wait
> until after the clock-subsystem-side got merged.

clock maintainers seem to be on vacation since 2026-03-25, so I'm not
so sure merging the related clock driver will happen in time anymore,
hence this PR should probably be skipped for now.

Ill rebase the SoC changes onto 7.1-rc1 once the clock driver gets
merged.


Heiko



