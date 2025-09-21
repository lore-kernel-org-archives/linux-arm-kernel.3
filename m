Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32648CAC5AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA6BCFTOq3NBFHY6q2lgyBET4FIS7eNAL7ai6/PmSoE=; b=IFrAObAcvhvDB8PWzXHrUU+8sz
	52TDD4UZawVJR0Eh6y5B6JQ2twoZyK6ArWq1S0tkxgAVOkjxDJGGT19wtVSPbDeeSta2KKWqb2MyQ
	dAWBsyTQ1GoZ6pw/I0hkdfpbqJvi+xZ9aCfdQEdNhkXuu87NUXILatjGwi4OCPelzuXfWCOOUO/Ta
	nWY7KEghskknVKCDnQC6skyF/lejFIHexhKeBwj1JcAa+wTWWM2N96FjJ0MVlNvyMHXY1uFQQBitK
	Q8WERDZjeAUixdTYBdVqILdzMvhqel5gXi4Ff4YXwPxyF537CMobqPF/d5mJOMMKgNUdqrYiWVaIl
	frPrK8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NKR-00000007pxZ-2XgS;
	Sun, 21 Sep 2025 16:54:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJy-00000007pWs-3CMW;
	Sun, 21 Sep 2025 16:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D9CD44118;
	Sun, 21 Sep 2025 16:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1FEC4CEE7;
	Sun, 21 Sep 2025 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473634;
	bh=GA6BCFTOq3NBFHY6q2lgyBET4FIS7eNAL7ai6/PmSoE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EeZm+GLxVHviyeka01Bsj2CCEeYvDXc07N0pUAD5Ce4fJDb4h4gxVw/VV8NZiBpt+
	 POTLqVL0YBPWSSYUEAiCZzbK0LiUWzSsZzW3kUWF+fLPRjGwpXB3NzQhbQ8Mo1smfB
	 kj0ikoXr+YPcTi4Q2QLsuCqUZU3mCncrI/c9Jmn3eLj1pRsKta4l00wqC3wNV9zHBF
	 dAFj23zUaKx4axLjQk6Rf6OCvg2xD/mVelxikLG+6WCn3vwiEtz34AORJDFFg8mEEL
	 Vqu4P1lQEZNlIZcvOmHaq7Tj2j/oeQopiuV58JWchDVGOms9PeWq7Ic7UDZ4pH6KnV
	 x988fSzi6iYhw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-11-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-11-laura.nao@collabora.com>
Subject: Re: [PATCH v6 10/27] clk: mediatek: Add MT8196 apmixedsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:53 -0700
Message-ID: <175847363300.4354.16886488568604694955@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_095354_835639_64FF6E38 
X-CRM114-Status: UNSURE (   6.21  )
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

Quoting Laura Nao (2025-09-15 08:19:30)
> Add support for the MT8196 apmixedsys clock controller, which provides
> PLLs generated from SoC 26m.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

