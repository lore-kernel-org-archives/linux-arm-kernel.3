Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD1BCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 09:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Mi/KLOUb5arO23rwQT+9y7j1zQmga8RdlBDubg+76U=; b=OBloeSlurhlU7YO87wkGMWci6v
	c8ZZvGDVyXunYX82xoPFF6T7Ky/iHVCgkEKLBLZdEUxIG0kXuCdxevcPSs9ySo+xBEA35uTbFh/Z/
	tM4sNBJSU/4r4RXKtpe/qkn5yZLsbgujUVUwGL+MjabGSPgMq3BHJp+ECM0uVMo0RSydeTCYv4CDi
	MQtPfeU/fhJ0NVT6P+4ReoXpHgzoEnFW7PcnwdEzlfgbHfY7/O9dPlIzSVjJoKyQd3UjSIed8HSQn
	nZPLW0ROZl7Go0LjlQulH8/eMANCe2iwk5PWMIntjZ6mAkNHyd+JhNIIrB/ONHsjwVCSbDTjcKGpz
	wjxF7xTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcI9-00000009PyF-11iW;
	Sun, 31 May 2026 09:17:09 +0000
Received: from mail-43167.protonmail.ch ([185.70.43.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcI6-00000009PxQ-2plS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 09:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1780219021; x=1780478221;
	bh=6Mi/KLOUb5arO23rwQT+9y7j1zQmga8RdlBDubg+76U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kkS0M9o65E9vzU0tAQN3sG+1sNy/wqRGMLlBz6rgYzhRrhrKCYAcix10tZSei36Rq
	 A49IY34WBaDVMNn7Zt7eyW4Z3ernS+5S/Vwn2OhMTe3ohROjGNJj1xywXCUJ4X2GiW
	 +ZOD1u1hbuP5jc5AEIZLB702dpCk1xO+PccTCrDCugGA0zfHhMxEhzn8LUt4V2wjP0
	 K4JH90O8bLjt0AUV3k/ykRjl6LzupDieaAVunXpN7Onl7bNyl9FwsCNyJtXZSz8pfq
	 BeGeufQuklPkukCPDtABDmasJ33OVFmaoN44yBoDgl74Qj5o6Ph9Mo9rzcr9nGlM3t
	 dhq+BtB6dMFjg==
Date: Sun, 31 May 2026 09:16:56 +0000
To: y.oudjana@protonmail.com
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/4] MediaTek MT6735+MT6328 SoC/PMIC pair base support
Message-ID: <wQ6oaceRZHkMTNpnvLBdrScK2DqHJ1boThn_3lf03guV83pOD24rG4c-a66ziGBrXPj09-xHK_pJoA1QvsP_wxvGZGT3y8KAhnIXaRERtH0=@protonmail.com>
In-Reply-To: <20260531-mt6735-pwrap-mt6328-pmic-v2-0-dac37bf92894@protonmail.com>
References: <20260531-mt6735-pwrap-mt6328-pmic-v2-0-dac37bf92894@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 06f8c2a7c3d9eadd276875d922d56e33b78a84b5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_021706_853981_2FD26484 
X-CRM114-Status: GOOD (  17.00  )
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

On Sunday, May 31st, 2026 at 11:10 AM, Yassine Oudjana via B4 Relay <devnul=
l+y.oudjana.protonmail.com@kernel.org> wrote:

> These patches are part of a larger effort to support the MT6735 SoC famil=
y in
> mainline Linux. More patches (unsent or sent and pending review or revisi=
on)
> can be found here[1].
>=20
> This series adds base support for the MediaTek MT6735 SoC and MT6328 PMIC=
 pair.
> This includes PMIC wrapper support on the SoC side and regulators and key=
s on
> the PMIC side. The PMIC has other blocks such as an audio codec and batte=
ry
> charger which can be supported in the future.
>=20
> Changes since v1:
> - Fit regulator definitions in 2 lines and 100 characters whenever possib=
le.
> - Remove get_mode and set_mode ops for regulators that don't support them=
.

Forgot to mention:
- Remove MD register definitions.

>=20
> [1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging
>=20
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
> Yassine Oudjana (4):
>       dt-bindings: mediatek: pwrap: Add MT6735 compatible
>       soc: mediatek: pwrap: Add support for MT6735 and MT6328 SoC/PMIC pa=
ir
>       regulator: Add driver for MediaTek MT6328 PMIC regulators
>       Input: mtk-pmic-keys - Add support for MT6328
>=20
>  .../bindings/soc/mediatek/mediatek,pwrap.yaml      |   1 +
>  drivers/input/keyboard/mtk-pmic-keys.c             |  15 +
>  drivers/regulator/Kconfig                          |   9 +
>  drivers/regulator/Makefile                         |   1 +
>  drivers/regulator/mt6328-regulator.c               | 500 +++++++++++++++=
++++++
>  drivers/soc/mediatek/mtk-pmic-wrap.c               | 177 +++++++-
>  include/linux/regulator/mt6328-regulator.h         |  49 ++
>  7 files changed, 749 insertions(+), 3 deletions(-)
> ---
> base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
> change-id: 20260531-mt6735-pwrap-mt6328-pmic-de481d5c5e89
>=20
> Best regards,
> --
> Yassine Oudjana <y.oudjana@protonmail.com>
>=20
>=20
> 

