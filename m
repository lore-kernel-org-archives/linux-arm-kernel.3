Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA115CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOC1FJ1dZ8Ed5BFxEGVeWgL22mKSWnuTkoOTFE8Asdk=; b=AQnNdhhmcQNPtt08Z+ZozZO5Rc
	SIzSStG3ypDC5UpTgBtxQdcAiMG8UrZNDMl16tyWQNGIHLIyABRkro04oPVuNQgp27+jiIRlNVvR0
	ZncIwabgHUN5RwJeWXVXArWIlIbhecrU8K+P0Uap3HE8AGJiL3b7C55TYIIA4RoOeEgUs0R/vr5kw
	bGINwmyY4PfWy9QhP11xlYU0lYnuyYpu46Vn8dVsCH85zFjIY+llOsJf2vDvdWTDXpNvQZqlXbqhS
	jVuV3xYfYrZ8Uj4329F17nG1KAeT3Fp/31mZBxNyJJsU329U6iguiXXe74LdBoGX+UsBadpY0sxnD
	vgGI/IRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJF-00000007oyW-184p;
	Sun, 21 Sep 2025 16:53:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJC-00000007oy3-2TDU;
	Sun, 21 Sep 2025 16:53:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 040E24029F;
	Sun, 21 Sep 2025 16:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF85C4CEE7;
	Sun, 21 Sep 2025 16:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473585;
	bh=pOC1FJ1dZ8Ed5BFxEGVeWgL22mKSWnuTkoOTFE8Asdk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hnvdXyr27NfEjzQxiAYLEySASSRxwYe37YWbHTqXGkPN78k7AO8RST6bORNKi2nt/
	 AIuCCOTCDXQx69JULbDh4v/wIRNFElzKjmxuPx2Qk92hx4wapgdKzzkGSfVHfiZTZ+
	 8CRFb+Ojo4mSorbJmEjof4hBptpZ0rH70t7pIlmFWNi08cpmZqpl1l0+mJ/M4tITUO
	 QM5XKF10LHf9BrWaW50hM+A4FMWJLWCF23pgBkMaRs1rCr2HNj384F4nb8AyAWCwY+
	 Dyr2Bvgek+nVmxOdyXo3DDH/sf1+jRIXaAZQc9lYjuMPd1ZSowMB7dnjvtFNXPKvPR
	 04giQeGuNtR7g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-2-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-2-laura.nao@collabora.com>
Subject: Re: [PATCH v6 01/27] clk: mediatek: clk-pll: Add set/clr regs for shared PLL enable control
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:04 -0700
Message-ID: <175847358414.4354.6792968051513586535@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095306_649033_9467CD6C 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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

Quoting Laura Nao (2025-09-15 08:19:21)
> On MT8196, there are set/clr registers to control a shared PLL enable
> register. These are intended to prevent different masters from
> manipulating the PLLs independently. Add the corresponding en_set_reg
> and en_clr_reg fields to the mtk_pll_data structure.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

