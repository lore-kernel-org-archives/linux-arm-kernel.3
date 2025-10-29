Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67365CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vfb6plEPmJbn3amdLgPlEfqVWUsm/4wMJ+J8r4Y6MtU=; b=gTAMb8qodJfA1jmku7WOx6v/K1
	Ug4MDM2WvtEVRvhEejAiz3fhnWFuhfuamVnPP/qAdB392NRdgSZl+eJa1hHiCRSK+dyhOCEbXG8WY
	WMoY/hpiyyxYctnY31OeyzSrxFqUuJtxZ9NJVOdJaA2QKBhYwarHii96wcNgxe6Vz3XEWp/A4EDd+
	xZcJ1m2p5NrvAokbqK5X4l3y7LvKqgRm5tTROKntNgJgfY7y3aO+ydkE3XaHAcoo1f8G5lL9/r1+L
	QMc/ZvPbCQNg+E1AoiylTi6K4BO7iCWLwfhkxNt+H6F6VvuNGGIiVzUYOw9XZrKR/0HenUsYRNQMz
	WD5xGbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5yS-00000001JMX-2QkA;
	Wed, 29 Oct 2025 13:12:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5yP-00000001JLG-0GeM;
	Wed, 29 Oct 2025 13:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761743536;
	bh=HTF8B+gVcGSI+m7SBYfVfnrEJZHVBlnzm9rsfsDX+Nc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W//xex0QgbWA6pRlnueMAZLqXGd260REuvWPfQKBV1OMlEYzwHahXbAo9QClnsHTV
	 V7ofaA80uJFkz76vh+IWoNcS4OONVqJbEooCCwHCaVfCkFgCxoDq3+YrWnbptnJ3oN
	 XFfrs0hWjCz8qj6mV/GI2mC9MbLd6mKuIb1nCayL/GNqxvgTrFXCS1c4+oe8Xvgatg
	 lYdKr4fH5LzG2hCJ+ahDs9DKV29ziyqDQlaGLRBEeNzN3lfBxrhodaFS3Gwem+8e7E
	 lP4ksJjWJU8/nrOs7rFGkVuGijg8P5W6hxQwPm6YLxe/xVj1qb8mNp83vxZeVbx6eS
	 HTIGxkdAOp1ww==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5A1617E1315;
	Wed, 29 Oct 2025 14:12:15 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>
Cc: wenst@chromium.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, jh.hsu@mediatek.com
In-Reply-To: <20251029130842.32633-1-sirius.wang@mediatek.com>
References: <20251029130842.32633-1-sirius.wang@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Add extra entry for MT8189
Message-Id: <176174353568.31020.16855973534724867360.b4-ty@collabora.com>
Date: Wed, 29 Oct 2025 14:12:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_061221_303180_749E1D3B 
X-CRM114-Status: UNSURE (   6.72  )
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

On Wed, 29 Oct 2025 21:08:34 +0800, Sirius Wang wrote:
> The MT8189 has a different socinfo match for MT8189 SoC
> (commercial name Kompanio 540), so add it the driver.
> 
> 

Applied to v6.18-next/soc, thanks!

[1/1] soc: mediatek: mtk-socinfo: Add extra entry for MT8189
      commit: dd1d7af420e5a085e08c33220425caad35289bea

Cheers,
Angelo



