Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12206CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Xa1VwxwUjh3fMqDPnJkTYMgQnd/q0xRrpB4zEKiWyY=; b=lYqYeS4p7aelm8x3u1Kq9eN+3O
	oKiq5r8rFi4pZFYwYkYi4CKaaKfu5M1JJy6pM8xLvAQBpg3zTJq6SRR6wu2eMLGJ9UrzgEGZkzGFS
	/mIF99vG+cRVN2UQ3v/xzN5div3o+ghOyQDB62BZFL6inbaecb5A1XlC208irWaJHXHRi+wfIU0uP
	2fQ84fAHr0m/XAsuHjlJAh/aHq1D4Ddot73oEnVGLbnp0fkULpTb6NMN/z0KtkJPeS1cl5yR7l7Fa
	K3D5wJLOFoiH4qORVdpoSU8DI3pVmC6QIuttj3mjqOR0iEcgoPfQhGN8w+KMvHAgTu+ikx3d0aach
	dmMjohTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKS-00000007pyd-0XJt;
	Sun, 21 Sep 2025 16:54:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NK4-00000007pab-1if6;
	Sun, 21 Sep 2025 16:54:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCE5D601AB;
	Sun, 21 Sep 2025 16:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63827C4CEE7;
	Sun, 21 Sep 2025 16:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473639;
	bh=8Xa1VwxwUjh3fMqDPnJkTYMgQnd/q0xRrpB4zEKiWyY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WOZkPckfpJ/4SNxxHyGPCd9Mr2anUsb3R0qvU2qunlKrB6xvUfXJLFddUNhzafsnL
	 LB5UcG0uFegzEJ/BsM15we2sXuYN1g9xCPfZbGI9yrWzaL3RCILM4kkYKTgQyVYIDe
	 aoHc7Ff6CO2eExjDtKqGD+R0HClhbUl6Nzj/tnJXIDlZhjNcSJr9YPkNTATSPzTUwr
	 UHofxShRHx6wWJ3PFIA8XUU/bo2mNto47ohvvLT+VOMgUlXjBgmxiD4fcdAr2rADPY
	 NVy9BqxA34tW834i0JYTRXT1L54qg7VHyOF9bAG/57Rgg0+iCPQNuLkqQ/JTV5TD+7
	 B4NE9oTu16mYw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-12-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-12-laura.nao@collabora.com>
Subject: Re: [PATCH v6 11/27] clk: mediatek: Add MT8196 topckgen clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:58 -0700
Message-ID: <175847363821.4354.1814125440725649399@lazor>
User-Agent: alot/0.11
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

Quoting Laura Nao (2025-09-15 08:19:31)
> Add support for the MT8196 topckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

