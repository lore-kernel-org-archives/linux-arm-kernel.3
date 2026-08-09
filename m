Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB12C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLkXAt7OGH8Oo/NH9UiNt6x/1vsL4WiOEANljYk0/Ww=; b=I3STFgmkh36/fbZeWAP+JX1zDQ
	G/dK9lIuYGEazaapmTisRjuJ1GoEbdFMHMFmylxpvm/A87Y0ZxkbNXZKZsRZzfVnbkZTLsdv7UKAF
	gNUDNXmiSYwFVBcGgnuiFt/EdRgh+2X+0l3yXcaEjsJHJfOHzhr9T5L5HzGPHyobNwIS2T5wPCqZ5
	9mNvxCYifxgplvu/mxyoMtk9/ALO6irjHXtj6JMgEl9NTVEl6SxPl4YHl7DCmFGqWKVXyU9PYXa+t
	SBVjRQ60IBH72jo3UvnMnp78uesqqP7yGa4Ild9aqijrA2Wa0+ZJOu5OeXRDgWg9EIvzBvn3VgOXG
	TjK04XfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0CP-0000000A9uU-3S1V;
	Sun, 09 Aug 2026 09:52:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0CN-0000000A9u5-40lI;
	Sun, 09 Aug 2026 09:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=cLkXAt7OGH8Oo/NH9UiNt6x/1vsL4WiOEANljYk0/Ww=; b=EeMU3u0QzmIlGOIG+RqLB4XfG3
	CyfD4gxnEYqrFB8u5Onuh09iiMaDy5zTeoaTVRANFgLSgRmN/9B8V0gdrrjxtVU9jByUn3y0j942v
	hXuwiS3e19GRpBgjFCjfzAt4Tz4z0vkBRRrkL4ahZ6/f6n5aKKEPzxXpnIPAXxyoQMO9XZ0NzWfL0
	90WYdvSnvYAQoUgylNS0vEiHrG3B4446MmvMd690Su08KBxltdedBPqrcE6HAuiX14BS2GE2rCyGY
	k8MiDLLUmJudtsZ8q0aDUXS7FUy5H11GjZ6XqZfL0jkib58r6Hg5dq6Ze71mSALwS9sVRsIr1dc18
	4/ysp5AQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] pinctrl: rockchip: Add RV1106 pinctrl support
Date: Sun, 09 Aug 2026 11:51:56 +0200
Message-ID: <12961763.rMLUfLXkoz@diego>
In-Reply-To: <20260729072727.v3.4.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
References: <20260729132736.3807082-1-sjg@chromium.org>
 <20260729072727.v3.4.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_025208_010905_D1CEFD85 
X-CRM114-Status: GOOD (  10.55  )
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

Am Mittwoch, 29. Juli 2026, 15:27:28 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Simon Glass:
> Add pinctrl support for the Rockchip RV1106, based on the vendor
> kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
> 5.10.160 kernel tree). Each GPIO bank has its own IO control (IOC)
> register block, referenced by the rockchip,grf phandle of the bank
> node; the register offsets are relative to the bank's own block. The
> drive strength uses the RK3568-style exponential encoding and only
> pins 0-6 of GPIO0 have drive-strength registers.
>=20
> The RV1103 is a package variant of the RV1106 with fewer pins and uses
> the same pin controller.
>=20
> [1] https://github.com/LuckfoxTECH/luckfox-pico
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

apart from the new per-bank pinconfig wonkynes Rockchip introduced,
this is mostly a standard pinctrl-variant addition.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



