Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5788DCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 22:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgLSx7e64sWUF9mZjgijgEncCA3Ifjs0gQT6anRu8Go=; b=Via7m6w+4MH48BoXQtFfvoj6OJ
	8PkP/tRx7GI+CqfolwovHEthdhLAoj6bIyCeii8253v0aFRRL3NCFFRdQvrkB41U5sovEIlAsbg3b
	JHXL0JbdeGEEXgrjMDS4easDF5RXuPiejttpFG0VnnvCAsO83g1+BKoDNK9BjbmmqEIbMILt0WjsS
	Ygj9gGtz4V9FZEtu2I3EygVd7iZHCO+89WUQK5OnL99DXcB/m/aOrdy4VqhQpzdpKX8h/30kepOrS
	ojSrG0kffkymzQi/Ibl7SOijDkpuez+U8O3h+igW1ztpH8f5v58IHvdTxwKE59hb4C0EWCxaTDQww
	5VhdiZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7bf-0000000Gwny-180h;
	Mon, 17 Nov 2025 22:21:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7bd-0000000GwnJ-04ip;
	Mon, 17 Nov 2025 22:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MgLSx7e64sWUF9mZjgijgEncCA3Ifjs0gQT6anRu8Go=; b=tk6NOalizXnAmyQ7QCnKbfCYVl
	yD8blSj86GmwPEJJ+W2g5TMggFbNvs9xpzRpEFkd4ttqZ6GJbstDzxWnPayyYyEtpW3ArUWpW1qKg
	F3xiXxC8Q+cNyjJTVGm+uz8BgXdlcH/3sbF+prPJsjEJ/xv+/UEb2eqkbUYO9ei9gNYiMNTEyXBFE
	X2CEQHxRY8XqBv9/D/NTnzE8TK0K/h3it4jEtpya16JSr3m4kL4KTDsdttvu24XxJ714KuQR23Rq9
	YxTGZjRIF2m2J0xwaGqp0QosSjyD6TbsDtjO2RdXZ4LOMYJdKakw2zJOBL+qEVvNrf0plWccFiunX
	eEf43V3g==;
Received: from [31.12.4.86] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vL7bb-0001Qb-8j; Mon, 17 Nov 2025 23:21:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip defconfig64 changes for 6.18 #1
Date: Mon, 17 Nov 2025 23:21:50 +0100
Message-ID: <2738363.Lt9SDvczpP@phil>
In-Reply-To: <2101096.usQuhbGJ8B@phil>
References: <2101096.usQuhbGJ8B@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_142153_054044_7AB1DED1 
X-CRM114-Status: GOOD (  12.64  )
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

Am Montag, 17. November 2025, 23:19:30 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Heiko Stuebner:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:

This is meant for 6.19 ... I messed up the subject with the wrong release.

Sorry about that
Heiko


>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.19-rockchip-defconfig64-1
>=20
> for you to fetch changes up to 60705b039f960378bb2a0a844f9378646bc0c6c8:
>=20
>   arm64: defconfig: enable rockchip camera interface (2025-11-16 00:34:27=
 +0100)
>=20
> ----------------------------------------------------------------
> Rockchip support for basic camera interface (CIF) and Synopsis DW-DP
> driver, as well as the CEC extension to the DW-HDMI-QP driver.
>=20
> ----------------------------------------------------------------
> Andy Yan (1):
>       arm64: defconfig: Enable Rockchip extensions for Synopsys DW DP
>=20
> Cristian Ciocaltea (1):
>       arm64: defconfig: Enable DW HDMI QP CEC support
>=20
> Michael Riesch (1):
>       arm64: defconfig: enable rockchip camera interface
>=20
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
>=20





