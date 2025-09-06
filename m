Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45D5CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJISYZ9NEMqNgtPEeFx7VvEBRUrxQUx5HJSJjwIbpD8=; b=qRRYGEcu9Jwb3W6Nz4TmAufPlD
	mnSyc9N0KiqONtBEQe2FGJ1ko4mOMsqZERSp5iK6hXbU2HdYRIUB1NXMZZW/q+HLgnpwVW4nBSokz
	F5emfepeEmlDtc8PcgP7L6q3d1+xTyBvlR7eQbldlLSblEdNJHkKPSixYtF2S7r/eIqcqpSctFtzy
	LitOm9p1z64nqozpxxTNsHeEmWr9f/4S6FgPBvqi3Pe0mUU3DUvHPPP8sCWTxNXup0OX9Beqw2Uwr
	UtOlIkWk/9s9iXQ3QZtaLGyIA/LZmw87JDsfm7sSanBQJHQrmHFn8iVXpjeedfJGhLqL2F5nFrRrv
	pyrci+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uus1e-00000007lCr-3CO6;
	Sat, 06 Sep 2025 12:28:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uurvD-00000007kfB-1KuM;
	Sat, 06 Sep 2025 12:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jJISYZ9NEMqNgtPEeFx7VvEBRUrxQUx5HJSJjwIbpD8=; b=uAs8j8qBmeMmHKpU2fur/lfZTw
	5dLMqNxoV0/nLhdEyknYecWk6JBTU11HWm2PDAG22lfqo1jd6m7/frS5cK1tGutag+KLre0/8LsQL
	k91poOxdUHuXKKTH7DyMe/nh13MAv7fcq+g5FYg0z3Mn5vbRu+wJM3nqyNEQz7aezJJ3R09Q6cYem
	4a3Yu1v7gWGSnEgp1Y+SDnJZ5EVlwq9BHon7frWW46mnuZTwO5GWtEyq1TbXRzFVi1qJffdNNACx7
	CcWCnuy+OezLU4jzfIKUAst+x9eL19STiuIdY+QETs6AqtumRTgquV/exgUIY+9LKBoANidK67Px9
	rZINaC6w==;
Received: from i53875a53.versanet.de ([83.135.90.83] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uurv1-0005FU-Ag; Sat, 06 Sep 2025 14:21:23 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Diederik de Haas <didi.debian@cknow.org>,
 Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Make RK3588 GPU OPP table naming uniform
Date: Sat, 06 Sep 2025 14:21:21 +0200
Message-ID: <3169011.CbtlEUcBR6@diego>
In-Reply-To: <47cf50f2f497108a923815c12b1f8c9b@manjaro.org>
References: <355c16ab070688fc6285e0d4419eb54a3f699eee.1757152740.git.dsimic@manjaro.org>
 <DCLOTR9Y380M.22GZYL11XXZM2@cknow.org>
 <47cf50f2f497108a923815c12b1f8c9b@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_052135_381226_0BA404D2 
X-CRM114-Status: GOOD (  22.40  )
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

Am Samstag, 6. September 2025, 14:10:22 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Dragan Simic:
> Hello Diederik,
>=20
> On 2025-09-06 13:40, Diederik de Haas wrote:
> > On Sat Sep 6, 2025 at 12:01 PM CEST, Dragan Simic wrote:
> >> Unify the naming of the existing GPU OPP table nodes found in the=20
> >> RK3588
> >> and RK3588J SoC dtsi files with the other SoC's GPU OPP nodes,=20
> >> following
> >> the more "modern" node naming scheme.
> >=20
> > Like we discussed in private (without an agreement), I think it would=20
> > be
> > beneficial if the (gpu) opp naming would be made consistent across SoC
> > series as right now there are several different naming schemes applied.
> > They're all valid, but inconsistent. And if consistency is improved,
> > which I like, then let's go 'all the way'?
>=20
> As we discussed it already in private, I fully agree about performing
> the "opp-table-X =3D> opp-table-{clusterX,gpu}" naming cleanup=20
> consistently
> for all Rockchip SoCs, but I'm afraid it would be seen as an unnecessary
> "code churn" at this point, especially because my upcoming Rockchip SoC
> binning patch series is a good candidate for such a cleanup.
>=20
> On top of that, I'd be a bit weary about performing at least some of the
> testing associated with such a platform-wide cleanup, despite actually
> performing no functional changes and being a safe change.  On the other
> hand, "bundling" such a cleanup with the Rockchip SoC binning patches
> would get us detailed testing for free, so to speak.
>=20
> Of course, if the maintainers see this as a good opportunity to perform
> a platform-wide cleanup at this point, instead of seeing it as a "code
> churn", I'll still be happy to extend this small patch into a platform-
> wide naming cleanup of the "opp-table-X" nodes.  On the other hand, if
> this patch remains as-is, it may hit a good balance between resolving
> the currently present naming ambiguity and the amount of introduced
> changes.

Personally I'm always for the "we strive to get there eventually" thing.
If there is an established goal to reach, steps can be incremental :-) .

And also short and scope-limited patches are easier to review anyway.

Heiko




