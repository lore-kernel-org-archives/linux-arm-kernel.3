Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D852CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auNJPNuSwVxarXGnGQ8rrJJRGIFtxN0gXFYvvOj+Af4=; b=4OqKBpl7uwE3ks36AOCdNLQJf8
	qPQfXs7w5DWqHe/uEV6AT2XfBS4OzABD8lO2KQyA5BTa/L3lR680d2YMVLKe2g5BG63ewqOn2DSwn
	4VCGKxX9YlUVJNgcpLaLt+f0Al6miYbrJCZUeCXsJ/dGRXGWkZD/cxVcwGM4QNGrGP2X/4SjSavNE
	XAyB3M+lRqomMXszUgb5eRHM1bdI6JL0saAqhbEPZaOlOolgSiF3pdPkEdt4QwandMFP+Uu/GJwtl
	akKlLAgGhytYA5ARAjKcgOLRCZgShNhH08l/W+QyeUxg1JjCt4cbmY9tKIoPmaT6fadvPHChAOIFw
	3+b+uCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NLt-00000007rLO-3mdG;
	Sun, 21 Sep 2025 16:55:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NL3-00000007qXM-0JSC;
	Sun, 21 Sep 2025 16:55:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE9E143BDE;
	Sun, 21 Sep 2025 16:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20DDFC116C6;
	Sun, 21 Sep 2025 16:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473700;
	bh=auNJPNuSwVxarXGnGQ8rrJJRGIFtxN0gXFYvvOj+Af4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TsG08DTgl4WqY2E4uWV/SI9YAVmr4FEdQN1bOzbMmI5/QrAaShSkbpBpVm5sgXFPb
	 okxcc3wIPD/RfytoYonoz56bagHIgSbZvnNJuu6e/d716pHWmIg25eScp1E2g8AFWK
	 3pT9Lt1vR+ojzj45ZxfZM4fRVrBo3/SNvLNjc4pEAMrrvn9KfBlFwHakFpc/wWlZBp
	 XyKGCm0ZjlpPa/j0bk/lAzDE+e+A9DE/rbZT/1Wa97sc0ZA0S6QQnpI1wUZ6HDp+Ld
	 rnmBOxE1THUM8OtC50437SEc46+TV2SCExjpPR24MJlH8W+DD2swI2+5xchJgN1eO7
	 uoz4RVYgYxHRQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-25-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-25-laura.nao@collabora.com>
Subject: Re: [PATCH v6 24/27] clk: mediatek: Add MT8196 ovl0 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:58 -0700
Message-ID: <175847369883.4354.14575336138362030084@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095501_152400_BE66EBBA 
X-CRM114-Status: UNSURE (   6.97  )
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

Quoting Laura Nao (2025-09-15 08:19:44)
> Add support for the MT8196 ovl0 clock controller, which provides clock
> gate control for the display system. It is integrated with the mtk-mmsys
> driver, which registers the ovl0 clock driver via
> platform_device_register_data().
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

