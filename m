Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEBECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhEmqjeU+NFYOyr5HyHp4DAurnHJrTWvo0NLRrLiAm8=; b=vGWVGuvc1adH82pfIWaq56FGWc
	Ord4GeC5QpG5ceRE10s5mMC7srGxr5h1LXkCZkz1UbwS0hZtL/2UMertkvhgosphVbugN+knlkU9q
	nMxeSDX3bXL5qRgVmIIVsie/pULNRVlLhWw7/BaPWLIUcikytJX6SxzkHHGT8FghQrp6V/i3YuayN
	ST2rbL2auaFvDL0xzY1YGIX8h6hDVWBxXprSIsQ7fU1i+sOgF4tvvpm0FmrVGkf5yInuAbWSu82Jw
	vsqU0WBZsPUPAqfCC05XuROdBY76gGiqsRKv4rC2nXGcJCSj4qyUvAfbyvUy3VBHxAuL3n7o8PRpq
	ppC/G1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NMK-00000007roZ-2tRc;
	Sun, 21 Sep 2025 16:56:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NLD-00000007qfe-0BSC;
	Sun, 21 Sep 2025 16:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A421C435DF;
	Sun, 21 Sep 2025 16:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64081C4CEE7;
	Sun, 21 Sep 2025 16:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473710;
	bh=RhEmqjeU+NFYOyr5HyHp4DAurnHJrTWvo0NLRrLiAm8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=upxuLHQdf+8AkBm8lnvTyDs+oIG9n2JAkPKQQ2YiUnkzomDTx7qaXo+84br1bWqB9
	 rrb1pPoFHO7gWKSE4j6aKTGq/zQGtVKhDLtR/e/oTGA89uTk40i/oUjoJCKKugyMbO
	 tVdjpJlNB5wWgo9ZejhkK5A03kuVWTfUGuZrA0CiH73yByNe294XDTOQLxeRDDwLjf
	 yRjCAXqDxDfnFMRXUqKHWMn/b4Tc+9DB6FNZNSZfyjRR3Cjq1a8DOW6hvVy2gPkkHd
	 IVIOT6PaPQihGYkGFdk3xokR8ZKo/3VILV88MDyPvMk4RAsHF1TyR5FqgXaJuliw8P
	 li5aXiYPLIVDg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-27-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-27-laura.nao@collabora.com>
Subject: Re: [PATCH v6 26/27] clk: mediatek: Add MT8196 vdecsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:55:09 -0700
Message-ID: <175847370918.4354.1172258827335473725@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095511_183629_FEFF4AB5 
X-CRM114-Status: UNSURE (   6.03  )
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

Quoting Laura Nao (2025-09-15 08:19:46)
> Add support for the MT8196 vdecsys clock controller, which provides
> clock gate control for the video decoder.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

