Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854C2CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85bf3Bwm5zPNrRpw6Kz2kWnimc4LviNT955VzKxH2lk=; b=Off8ztHM32r5BefU0UyC/cnDML
	3ddYjQdNW4hBddDoRta2xWIPFb/uctPB3cD6eRN5KzUjfZUXEPuPI2P7QtBCutlPbrxxm8JWP72yc
	N1VpFTHWFOB6XkQ3S3MFiHOsCVj4E25gqMHdobKidpyngJ/0u0xRxdA/f3+bm1YhdQZ9Oz9f6E5QL
	T4MbOxinF+xsfm265VsR+NjQ/9m8Dg0Jo/uMV6NgenpqYWjIcEKmBltZIb2XZxpgRRKXN4T/kIYFB
	pWY6ztlb0T2+XzxTcDMMyjCCA0xoGyoORQ4hD2Lun+9CIb5y5MrQqKePhlar6F1AkT3m1/DmA7MeV
	FvIR+9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NLj-00000007rAQ-0jcn;
	Sun, 21 Sep 2025 16:55:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKq-00000007qLT-0T3i;
	Sun, 21 Sep 2025 16:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A00A6013B;
	Sun, 21 Sep 2025 16:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21659C4CEE7;
	Sun, 21 Sep 2025 16:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473687;
	bh=85bf3Bwm5zPNrRpw6Kz2kWnimc4LviNT955VzKxH2lk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sglWRXT5eg3VsPmjVcdMnAvpaVOd1bi1fZcxXEGo48ARQRKosryzz5h3y3KswKUjV
	 1tJkZDVzHEk32g/AXEkiemECUhZYB6EhUI919En9rw11YnM6dhAYHsG6gQzos+NlIf
	 RzW5kfwmawaI3ucvMgHNkNA+lva3Fcu/UyoPsaA1nWjTO9b2w/vp31Syy0seQOFGPQ
	 3OQOS6q4DYZ2LTTAxJDWvF/i2t4Kczt0Gea3V52fCISo8rBN/JI9E94BluJpMdTN/+
	 7NzC+V2bBZqIrk9ZrwAYShTVxplVHZ1qQe+uO/fUVt4OHe+iWHi5wPlUU9r0Pne3LU
	 5vLUN2rLnbf6Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-22-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-22-laura.nao@collabora.com>
Subject: Re: [PATCH v6 21/27] clk: mediatek: Add MT8196 disp0 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:46 -0700
Message-ID: <175847368604.4354.13252498572745408389@lazor>
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

Quoting Laura Nao (2025-09-15 08:19:41)
> Add support for the MT8196 disp0 clock controller, which provides clock
> gate control for the display system. It is integrated with the mtk-mmsys
> driver, which registers the disp0 clock driver via
> platform_device_register_data().
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

