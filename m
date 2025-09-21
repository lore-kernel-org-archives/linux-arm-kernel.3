Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD2DCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUJ3QTE5SKSMJ7av9qqcw/J10K5MvzFo+ogFOfZXTM0=; b=kFiWIh++a2Rrx5nrT1/hWTzEvr
	GuRGtnP8gcKD0E0ppSW+Dxf/NGRV5+HR+pvtfhaZdcyd9eiMaQBt23XqGUqrnw03xSyxLQqOvPBz7
	ZUBcWw3UimTzrgJxhIPlhNty6geqGDEUdQUBX5xA5jdK2BjRysipvV/aMJjoUOdwfxjHhOAIPtGGD
	aNdS6dMoOLHjU3Rpmd7u6S62m++GI5yRgeT/5PU24HPasGD/1HjNj6ZlM3qsfZLezcwGjKwYxYQj4
	iUQ+TmzAOTegQ/knjNDrEiJDq10wTBD0kSAgwCKZ7msOwp1s5oR/eWctFA90wmXtapDkIf4/zgoLp
	aqehbfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NLc-00000007r42-2DYe;
	Sun, 21 Sep 2025 16:55:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKl-00000007qHK-2alk;
	Sun, 21 Sep 2025 16:54:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46AEB44160;
	Sun, 21 Sep 2025 16:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E39C4CEF7;
	Sun, 21 Sep 2025 16:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473683;
	bh=jUJ3QTE5SKSMJ7av9qqcw/J10K5MvzFo+ogFOfZXTM0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=W8qReoNU/pgcmYsfUAQvRCy3+8vQtXKM9xWomvoR2HSXOEJx7egiLXPl6J7D8Y3zx
	 AMy6GmNCeSAjNID6JolZvUqx/DV4968w5CX9t8q8qQBEmYZjrMZCZy2wEgqad0SYn0
	 WJr0exZOYnWqYEzwvTOJDifR0f7z9B34dzsYAftypbPu9x9L9V5mlKEl6nNV3J4aIe
	 RDI5/rtrFkDvLDiCpjSIDSB52Vpq7ZN0aW3N1gexc6dIMJ0lOolsUo315Tiyy5ls6X
	 bRd4vH3Mf2TB5vh7Bglwogg6wuF0kMpgiLFNGpMrdFNGsJ1SxIWdAfVcomuKCinJWE
	 oNFAhJzo9DssA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-21-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-21-laura.nao@collabora.com>
Subject: Re: [PATCH v6 20/27] clk: mediatek: Add MT8196 mfg clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:41 -0700
Message-ID: <175847368181.4354.17704668308510890460@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095443_681999_F4EC08EE 
X-CRM114-Status: UNSURE (   6.34  )
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

Quoting Laura Nao (2025-09-15 08:19:40)
> Add support for the MT8196 mfg clock controller, which provides PLL
> control for the GPU.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

