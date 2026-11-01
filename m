Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930E5606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l8ehj2Iq;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Im3G/s89
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RlMmBJaoFVmxxA9FM3cQTpEG1wm1O3AcY8dpRqM2fYI=; b=l8ehj2IqlKQG94cxLEKMrp2jgq
	QxT1Vl1WN4OP/1//YRcAHzJNERFjvlYpjOSWxoI4BbcphXea8RUdM61Ny8SzbnpsOz7dNx6XG6QBb
	yi/IVTQuVypJahaklt9aPKbXiVhrOzKzavUluGMfxBb59rrva2JxCyKKTn1C//Wts8m8S/FuWBG6j
	iM6Jk8uOfAW8rhvTjzG1eSmHz06Dd2RqH+23f0jGt7dgD66ROOM1V3LQbuHdFoWwF9Nc+3ighVjuB
	Yrz+9v2UYx9Mlnn2ZRAlmy0GTmCayfpkLTmakFU+B0OByZ+0TcEWNLDkWDCMIivY1NQ4s5inl4Ew1
	0/dWmboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNduE-0000000F7f7-0aFe;
	Sun, 01 Nov 2026 22:20:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdu5-0000000F7ah-3cJ2;
	Sun, 01 Nov 2026 22:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RlMmBJaoFVmxxA9FM3cQTpEG1wm1O3AcY8dpRqM2fYI=; b=Im3G/s89G/FO2EZ5tMahT52ktm
	iOfGJMjkmb4qCWjJ/iIbvyijS1l5gGkKgcGml7frVALCyYLTuJX9BKVgbqhRcrhmSSr+1xE1CtfSN
	2vK1HwKYYgbeyT9EPNEFGJaRVJ9+HZix+vpIfeqfjofs3bcqNlV8V0jeYMtH0L3RqFey4Jd5cGECw
	zx2O9aUmmSYdGZOke4G633my6buU5BYfuN9cyOpDLbVJXsjhDamQ9MFaUL58VndidhbuZ8jL2AY5r
	6R4DSx6Fa+0VvWKSmheX/8kNIxIy8sgI9g/D5aGlJLyj8mJlGm7JVK/kCtZ8LihwFU5lwDz0r1S4h
	nzPvjJLg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, joachim.eastwood@gmail.com
Cc: Shawn Lin <Shawn.lin@rock-chips.com>,
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Joachim Eastwood <joachim.eastwood@gmail.com>
Subject: Re: [PATCH v2 0/9] arm64: dts: rockchip: NanoPi 6 series fixes and
 improvements
Date: Sun, 01 Nov 2026 23:19:46 +0100
Message-ID: <17766357.Ash8RoxBsO@diego>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141953_903238_D1626F29 
X-CRM114-Status: GOOD (  16.13  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Joachim

Am Sonntag, 1. November 2026, 22:55:18 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Joachim Eastwood via B4 Relay:
> This patch series contains a few fixes and miscellaneous improvements
> for the NanoPi 6 series of boards.
>=20
> Patch 1 fixes the voltage range on the SDMMC regulator.
> Patch 2 enables HS400 mode on eMMC. Tested on my M6 board.
> Patch 3 adds an IIO HWMON device to monitor the input voltage.
> Patch 4 moves a regulator that only exist R6 boards to the correct dtsi.
> Patch 5-9 renames DT names to match the schematics signals/nets.
>=20
> If patch 5-9 is just considered churn I'll drop them. These are more
> nice to have and just makes it easier to cross-reference DT and
> schematics.
>=20
> Schematics for the boards can be found here:
> M6: https://wiki.friendlyelec.com/wiki/images/8/85/NanoPi_M6_2405_SCH.PDF
> R6C: https://wiki.friendlyelec.com/wiki/images/f/f7/NanoPi_R6C_2302_SCH.P=
DF
> R6S: https://wiki.friendlyelec.com/wiki/images/2/2f/NanoPi_R6S_2208_SCH.P=
DF
>=20
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
> Changes in v2:
> - Add schematic links to cover letter to ease review
> - Renamed rtl8211f node to gmac
> - Add R-b tags from Shawn Lin
> - Rebased on v7.4-rc1
> - Link to v1: https://patch.msgid.link/20261014-nanopi-m6-improvements-v1=
=2D0-e713f71eb4d3@gmail.com

looks like we worked at the same time :-) .

As you will have seen just now, I applied your v1, so please send any
needed changes as follow up patches.


Thanks
Heiko



