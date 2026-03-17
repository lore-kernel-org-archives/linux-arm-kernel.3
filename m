Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5DFF3381F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmR20+HOUCm1UbnC886tHfKXPT4oDC9ABYMrrw1uIq8=; b=Rx7uxAee3EyRuQ0KAkelmI6xpB
	1U59teZgm5lzty4F3vEEUecYZKPjTkxKQFm8pjCfcXiQDwkR4xqZ11yqe0JJtABO5s9900A0EZy6j
	Z/voHhwU+vQPtD76tDUw3LzZNmhiTSS4iGH0kZQhwz7bD4z8voqAD66afwl7przq4PJiQ8b6CL64G
	hzmloLv9TxZ/Hqe6n0+KU7f8a+5lSABQ3tKoXZzptZRUei5HJnJDTnW+Tp1FVIf2vNX9tOKoG+bTb
	qE232dZaHmbCSWu+2FMM74scKk1EjVy7oBH2NRz4FgrzSsTcM2TkecmG1WsmvvRQ1kQDPqBCRVQjj
	lQfErxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QQ2-00000005oAx-114j;
	Tue, 17 Mar 2026 09:08:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QPy-00000005o8W-1KiJ;
	Tue, 17 Mar 2026 09:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RmR20+HOUCm1UbnC886tHfKXPT4oDC9ABYMrrw1uIq8=; b=BPlZNlmf8H+uMknFzE+4Zff0JT
	Y8N3+8qOYbsakjtr/tiiTCLhNzOmODl6A2NYgXv8fBWBnSvfeQQ7SxU2dxLeVYcfFlUSiXl5hZ4tK
	J/e5sd4mZ/SPZ70TInHUSjMOfh4/i75M5PooA47ni4mw1OCOErIsCM+dceJvGjEBGlA36SYEjYaPa
	ohP7sNXfpayYHXBM4ydFCVnBBUfTxlwq5d5OHu+G+Of5WfKUZHmMBJVlp7VaYcHGyD73/ftzv66hK
	nU7mgrGF5l6d5192A7rJw0/BQo+WqaO+0MsrD7y8C4CsEW/vYQU4ZhFrdtXGyGkQRpr/9I2pA2bZG
	merpDMig==;
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.1 #1
Date: Tue, 17 Mar 2026 10:08:48 +0100
Message-ID: <2031768.PYKUYFuaPT@phil>
In-Reply-To: <20260317-impetuous-attentive-penguin-43a503@quoll>
References: <13966995.uLZWGnKmhe@phil>
 <20260317-impetuous-attentive-penguin-43a503@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_020850_363701_510C1D4A 
X-CRM114-Status: GOOD (  15.61  )
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

Am Dienstag, 17. M=C3=A4rz 2026, 09:48:30 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Krzysztof Kozlowski:
> On Sat, Mar 14, 2026 at 07:45:34PM +0100, Heiko Stuebner wrote:
> > Hi soc maintainers,
> >=20
> > please find below Rockchip DT changes for the merge-window for 7.1 .
> >=20
> > So far only arm64 changes :-)
> >=20
> >=20
> > Please pull.
> > Thanks
> > Heiko
> >=20
> >=20
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5=
f27f:
> >=20
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.=
git tags/v7.1-rockchip-dts64-1
>=20
> Next analysis reports:
>=20
> Days in linux-next:
> ----------------------------------------
>  1 | + (1)
>  2 |
>  3 |
>  4 | + (1)
>=20
> Please keep changes in next for at least few releases, in case of
> development pulls. Allow community to actually test your code before you
> send it to upstream maintainer. We are early in the cycle, so there is
> no need to rush changes which were almost not in next.

okay, will adapt to the faster pacing of PRs getting looked at.

In the past I was trying to make Arnd's life easier (not sure if that
helped or not) with the PR available, so that he could get to them when
he had time.


Heiko






