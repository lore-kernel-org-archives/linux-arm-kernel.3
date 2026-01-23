Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1547D6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 01:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJpuTBCMY5uDHfr6gvM7scy0Tk2x9TA88Qz/tAbzNCk=; b=qHF/nBvgiXkF/bx7hbATdSnKYa
	hbp4mmadlC6j28dUYGXM1LQvzgYKviUNSCP8G0TjSjtGM8WCtwnopvwBIOAYTP4PhJWCC1ikw5w4D
	Fqgmcwu10uoH9eG91p9apuP8qOy4VxqClMoq89usy+JUiD4d/Ajg6GWOiRMskcu5SipBx+Yd74c90
	kVushxeujayOfYljz9V6vfYt7+aS2YMIoNlAfYPny21CsNUKSvZGEfMRfapv59LQv4OKv1a+7lDTN
	N/H9dGVlKngqVMIfE/61ldCwhHO+QihC+ihoDdiFIwhOEatKYhobTC13KIvhFD5Eo9J7xtq6yBws+
	z3km/58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6EY-00000007z4b-1wBf;
	Fri, 23 Jan 2026 01:45:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6EV-00000007z45-3sg6;
	Fri, 23 Jan 2026 01:45:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E27543691;
	Fri, 23 Jan 2026 01:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BE2C116C6;
	Fri, 23 Jan 2026 01:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132707;
	bh=kJpuTBCMY5uDHfr6gvM7scy0Tk2x9TA88Qz/tAbzNCk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Fyk/ZZZWIwUIDcTd3ClMks6Axr5hpQsNq9suw+391dlR/NAgAHG1HRIukWEpNt1YP
	 Pc9WvEQI/DP1Sb1oUYoW40/Fdv+ogmd/+9VlAkgqpzXN9Zn3LlbrhdQof1/DUT8h54
	 XO48fRmwhjeqG8GQ+ZaidxDSuNF0sIoNwYWDQ+qclfGqi2e7PuG2bG/XUW/musCtvt
	 krpSGG/1TgLD/UbNuXbaOqvpHQZeW5ndPzryplofZPzOPjbgTNJC3UUMjn4DWO3Urr
	 MVxscEhC4ePHQURdUZpVF8Nm488k1vzc5urro3khPGhpD/qcH8UcZz0TuItNh3qzLY
	 Q35UPRe9qgTqg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251215-mtk-pll-rpm-v3-5-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com> <20251215-mtk-pll-rpm-v3-5-5afb3191e869@collabora.com>
Subject: Re: [PATCH RESEND v3 5/5] clk: mediatek: Add mfg_eb as parent to mt8196 mfgpll clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 22 Jan 2026 18:45:05 -0700
Message-ID: <176913270525.4027.13703640991573141787@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_174507_991969_4EBCBF0A 
X-CRM114-Status: GOOD (  12.97  )
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

Quoting Nicolas Frattaroli (2025-12-15 03:24:02)
> All the MFGPLL require MFG_EB to be on for any operation on them, and
> they only tick when MFG_EB is on as well, therefore making this a
> parent-child relationship.
>=20
> This dependency wasn't clear during the initial upstreaming of these
> clock controllers, as it only made itself known when I could observe
> the effects of the clock by bringing up a different piece of hardware.
>=20
> Add a new PLL_PARENT_EN flag to mediatek's clk-pll.h, and check for it
> when initialising the pll to then translate it into the actual
> CLK_OPS_PARENT_ENABLE flag.
>=20
> Then add the mfg_eb parent to the mfgpll clocks, and set the new
> PLL_PARENT_EN flag.
>=20
> Fixes: 03dc02f8c7dc ("clk: mediatek: Add MT8196 mfg clock support")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Applied to clk-next

