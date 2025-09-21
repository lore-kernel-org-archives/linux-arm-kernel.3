Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCE5CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g9njdnLEl5mydRLxaH3jvOFTeBYgSNJqOzh79cP6TY=; b=f1o+pAQHiIksPU77D4qsNjYIrm
	OB088DsMwoBw90JN3Cyp6KTlgn6aTszkCToAMT4lIOmxt3BennHp5XsvXlaHVPz3uqIXfqkr3VQU4
	2YZrmsZbnWiWIONz9csMwvSq9rJFxHEzy5G5eH9AjONU2yEp3CRthN95wStnaeJonZu1DMaxImx3r
	2H7Ri+5qvFbZFnu4wjhheVFfcWNcoREKdiIhBMayPmrc9PauHNSZ9vH7D+l1noiFU5ReD9umuZM1y
	YKQUpWiMG1vMyS8dCdahETBNbRewO3xOJISrMDiHWsP7AnL426bz/JRfWmSZ7Sy9UscJaTuJrf79h
	lOCS84bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NLs-00000007rJs-3yrR;
	Sun, 21 Sep 2025 16:55:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKy-00000007qSL-1pEY;
	Sun, 21 Sep 2025 16:54:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D47F060143;
	Sun, 21 Sep 2025 16:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BB9C4CEE7;
	Sun, 21 Sep 2025 16:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473695;
	bh=0g9njdnLEl5mydRLxaH3jvOFTeBYgSNJqOzh79cP6TY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Mj0rfkbgZrPNLDegjH7Ma9euYqpgtpGYTjp+Sk2PpeWEcgCBTk6YjBOeAMxrY8mo+
	 oA/WB0M+2j61a2sxJVJYW+ygsixSY525TQbVSvT84HnmlrnECEYNHH4WBxxKwxR1PU
	 SoAuqD6AVddqZhMOO1flfo4wFbAsXIflLUf304Zr65T/hYRCW0eE7i+YViKIXRQLip
	 B6CqwusNYpeijrp7/hSyuLedPvkG1bdi/bP6tJPV5qbRtqkmZlHqaclUMsGCV+/hoM
	 /C0JR3vP2bvUkYFAyykcxw1hjj42tkGyHZ07gc3uuUjDSHgLOnSJ3blrEtadw8e1nE
	 8TuzZOAFn/9jQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-24-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-24-laura.nao@collabora.com>
Subject: Re: [PATCH v6 23/27] clk: mediatek: Add MT8196 disp-ao clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:54 -0700
Message-ID: <175847369425.4354.9985195366751682469@lazor>
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

Quoting Laura Nao (2025-09-15 08:19:43)
> Add support for the MT8196 disp-ao clock controller, which provides
> clock gate control for the display system. It is integrated with the
> mtk-mmsys driver, which registers the disp-ao clock driver via
> platform_device_register_data().
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

