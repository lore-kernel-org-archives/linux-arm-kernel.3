Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8630DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VropRRCJmyIDE6mt2lFPIyoGvs5jUPiwexBau4cLyg=; b=i5knxIXEKrwL4SVZsyZmFdSRQB
	N0qTtRVs8w1Z2GScxt3my0XNfTcXkdMKqqCiYfTulOjkiIetm8QfzqM7IGTezDkBkm9TAc8MsHJuQ
	AvUpFSkyex+tN854EAxD1yt1tz/6nFjzJhIZu7fthDxOdD/ytQ83ITCO90p0CXAdDlvqVLvTf81qZ
	bW7I1QpWNmpcB8L/sR+uhFrKmJvVI+SCjDhPzSu12i0PvjB7GiX6AJRFgAkIoefa8N06vCFmgLL3E
	Xs0Pf+GyEnIAnQw5OE2yuW78FCi5GBsmmtDCBLrX8XKOzYb7NZ4mYo+BcNgK+nvV9x1ubqOGf5Leo
	bE0ryMNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQND-0000000EMOq-2x7F;
	Mon, 27 Oct 2025 16:47:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQNB-0000000EMOS-2Q6Z;
	Mon, 27 Oct 2025 16:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=6VropRRCJmyIDE6mt2lFPIyoGvs5jUPiwexBau4cLyg=; b=KPaZUyTDWThc0N7lTe/ONzVw0U
	ESn0Fa6QH5v87GZZ6plLOs7iA7tv/CUYy9djvkl2fnDloFoe5XRpSU0oqtSxWZBW3XR+URwVte/2W
	R+4WTo3iZ5QT7ZsKeBkIdwb5ie0EX5kP4jhA/BenkUcwqSW4ck1YTKiP84kcIOraRifLEta7N3662
	QuNhAZVmwpnU9K1Fx7IP0pQ2d+3QPicBeyuOxKh8yAH/UzJhaFKJxtIr4TafFrRR5ZklGk/kmC7N6
	O7kf9O2sGUHubyFX814JIxD4jFmdOjQPXJoIzAOZHSO2Gzri8pUkiRzSKE0i08NtNlxmPEAIZ2IHS
	BMfhM9tA==;
Received: from i53875be3.versanet.de ([83.135.91.227] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vDQMx-0002Ep-6h; Mon, 27 Oct 2025 17:46:55 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Diederik de Haas <diederik@cknow-tech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Harmonize regulator formatting for Pine64
 rk3566 devices
Date: Mon, 27 Oct 2025 17:46:54 +0100
Message-ID: <5054965.31r3eYUQgx@phil>
In-Reply-To: <DDSFVM1TXN8C.3JNX2M8XX04IF@cknow-tech.com>
References: <20251026153805.107774-1-diederik@cknow-tech.com>
 <DDSFVM1TXN8C.3JNX2M8XX04IF@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_094709_641205_9F3804F1 
X-CRM114-Status: GOOD (  24.10  )
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

Am Sonntag, 26. Oktober 2025, 18:44:42 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Diederik de Haas:
> On Sun Oct 26, 2025 at 4:37 PM CET, Diederik de Haas wrote:
> > The regulator node properties in Pine64 rk3566 devices were formatted
> > rather inconsistently. To name a few:
> > - 'name' was sometimes put at the top of the list, while at other times
> >   it was (mostly) sorted in alphabetical order
> > - 'always-on' and 'boot-on' were sometimes at the top of the list,
> >   sometimes not
> > - 'state-mem' nodes sometimes had a preceding blank line, as they
> >   should, but sometimes not
> > - other properties seem to have been added to the end of the list, not
> >   in their alphabetical/natural order
> >
> > So harmonize the formatting by making all properties sorted
> > alphabetically/naturally. And harmonize the formatting of the
> > 'state-mem' nodes so they all have a preceding blank line. While at it,
> > also fix 2 incorrectly indented nodes.
> >
> > No functional changes.
>=20
> I just found some additional ones.
> If these changes are considered OK (in principle), then I'll send a v2
> at some point.

Originally, I always liked regulator-name to be on top, identifying
the regulator, similar to how compatible works.

But I do have to concede that this is just another "special-case" of
style-preference, that makes it harder to explain things to people
and in the end we should just follow the documented sorting, without
tribal knowledge :-) .


The other issue with moving stuff around is, that it makes it harder
to follow git history, because git blame then reports the sort-commit.


I guess it is ok for individual files, someone does take care of,
like Diederik for the Pinetab, but please don't start resorting all the
existing devicetrees :-) .


Heiko



