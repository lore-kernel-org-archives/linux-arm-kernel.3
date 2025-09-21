Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4393CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svQU/cF+pOmeM0BRLCwmilYjYm0JWiJQpaE+UuqtBRc=; b=RIrsUCWWcko4Be1ipavAE1WTKz
	wKLNtZwSif7tRC4LrSXRUQM1nZWeSawz7Fpz2DnfyfS8Xuh9e7E9r+szY7Zmsgb+uLTdvLz4mpkQr
	437akK5ele+YTdcOWg6fGl185fsEgrYbyneWIlOoYq9UzbLXBvF6wBOsiHUJOAMD6jvcPgBfZQ0yG
	KdLMdeumz/V1KBXeQ0pTcyi2pWxmqMh1qJbPJZ67PxtzHk2YJ/+9lyeayiAuP/5dPFrYL0WoohHdL
	ef77WHwWv7IlR5j1urcOHkjJemQZw9TEItSOE96RmSMDJYZsRxUW8wX/rgVUURfleotkE+jrV5t7Z
	CYh3FGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NL0-00000007qTx-1oMo;
	Sun, 21 Sep 2025 16:54:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NK8-00000007pet-3Zup;
	Sun, 21 Sep 2025 16:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22576600AE;
	Sun, 21 Sep 2025 16:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA0EC116B1;
	Sun, 21 Sep 2025 16:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473643;
	bh=svQU/cF+pOmeM0BRLCwmilYjYm0JWiJQpaE+UuqtBRc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K++q6ipj+eSjUeFGBvjPonXr3MiQGB8iTWQL7KWjbxTq8OMTpXtQsKe+XSSqCNC8f
	 piKH8YSifvaE/nrXSnM64fUVxr7P9RhmiLaWdlUxD/jshYwsvOw0RZl8PU5pnRZ2fk
	 ZAWurhjLe9iNW8xYZNtdmNV3CS9uchIOxqK8v81QxNnPb4djO0XJZZ+aDdaKbJSpyD
	 m+OWHrSuFOmtMqxDq/DsWDv+g75XoVD6uhiMYo7n65+EcIrK2T2BXBcqA2CjPRtQ9e
	 jKaAcZ4kyQECqG3L4thc9K3gpI3qQu6zC/IcaExXEtmMT9yOJMfbqVRr+e5L8QugRC
	 BHB+WxShGeEmA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-13-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-13-laura.nao@collabora.com>
Subject: Re: [PATCH v6 12/27] clk: mediatek: Add MT8196 topckgen2 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:02 -0700
Message-ID: <175847364242.4354.2630032735679327042@lazor>
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

Quoting Laura Nao (2025-09-15 08:19:32)
> Add support for the MT8196 topckgen2 clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

