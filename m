Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C285AFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UxmJs9YUkaY+OCHXGGOYjeYOBIbUD4lZnOC2jEWgzw=; b=2gMezv6ijvuYRz3drQcpeR4nb+
	g1veLFRjjaIjo6mT4gIuGLn5XdgaTMajujj0REZu8q0/eHx5Q+Zop8Vn30bJJyLJ25Co638UQkHr/
	vK16qAY0drV4uebZuflAS/nP+zj/d/55QOAQddDbSZPpS+MBLHZ3XM8UQdfPQOITcQI8r7yNpRd6p
	A91GExwGKXi1pjaatWUvpOhSBN+JY+IwgwHe59D8CCn0ygiUqh6nZU9kbDgerzerDxxtXWx4kJBij
	xSYzqZhByBHZE7R9rX2QOX723BXmcC5v2p/c/Wqpg5xZ/L2hFIBWQPD5rmoI/CCsqDhQ/e+u1+kYu
	y2thZ2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvtB-00000002rqi-1Zl8;
	Wed, 29 Apr 2026 03:47:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvt9-00000002row-1wQe;
	Wed, 29 Apr 2026 03:47:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E245B61339;
	Wed, 29 Apr 2026 03:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA830C19425;
	Wed, 29 Apr 2026 03:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434422;
	bh=2UxmJs9YUkaY+OCHXGGOYjeYOBIbUD4lZnOC2jEWgzw=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=dPBeAraaZcakNTGhkd9j17NvkoydxTRevkgR7lGClIzQstr/y3wDVZCX/CYTDfsoC
	 B2t5WZ94k9dX7dawUpyU69VX5yIMELMuyhQSRaPSvna4T9cYmaLFEKk9tCgi/LaMpH
	 J8nQnslyrntITtCFJ7swqh5Y5ZtaI22BdZoS03hy2OTDMfGomM2Z3t5E8+2CMq6cF0
	 nULCYD2j+0/F3kTuMN3PvRCRodVUlnD7p+mjkkhi/H6RFOUxauZe7CUxBPB59ONDj0
	 NF9UeYhJAcqOpj4vWIS/1IJWj7yb36mexSxUPUjHByXZUHW6JNx/VNhEUC+gfos9H1
	 iasd+bvm9BQLA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
References: <cover.1774499536.git.daniel@makrotopia.org> <9667e8a7a0757f7fb9d6bb3fca105df97afd007b.1774499536.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2 2/3] clk: mediatek: mt8192: use MUX_CLR_SET
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Ikjoon Jang <ikjn@chromium.org>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Sam Shih <sam.shih@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Tue, 28 Apr 2026 19:06:11 -0700
Message-ID: <177742837171.5403.15766311984942947032@localhost.localdomain>
User-Agent: alot/0.12
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

Quoting Daniel Golle (2026-03-25 22:10:47)
> The mfg_pll_sel mux has neither a clock gate nor an update register,
> and upd_ofs is stored as u32, so the -1 truncates to 0xFFFFFFFF.
>=20
> While upd_shift being -1 (as s8) prevents the update path from
> executing at runtime, the bogus upd_ofs value is still stored in the
> struct.
>=20
> Use MUX_CLR_SET to avoid passing sentinel values to wrongly-typed
> fields.
>=20
> Fixes: 710573dee31b4 ("clk: mediatek: Add MT8192 basic clocks support")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

