Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D20C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVfAYzFAbFhoCuhpoyBz85BS0+PhNfm7zYlHiC3uOuo=; b=0EsY4ouwZZBUTcm+V+/BqGwNMg
	uRnScL5Hpq/WBgBw0iFocuFFmF2EkKW93U8xD/cYGpTMFeQGE+DXd4U63uWXXUGyLSPQQfCZOg0qw
	S9vKQ8E++RiTtBHQDjwck6SMaiAPIXCn21tjFLLD4iJH39+IAhaMx9gd2jaOIVVIBWcQJa3ChbDpm
	OgR48zxel7zJBTA6uIQsvf0xoOtQUvJ2cvbiCdUQjiTrkSGdDycRAbnJRphI1i/J+b+tqZCa3EnDs
	SovGrQP8BqhvmPKmaoMyfV/Aji7bPohFfHXwemD3kHJKU8W9CV7dzbOKFThGk0fpfkV/k5VvdBHbj
	BAFuMdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDcf-0000000406M-3zoh;
	Thu, 02 Jul 2026 09:22:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDcc-0000000403n-2YMA;
	Thu, 02 Jul 2026 09:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782984131;
	bh=PMD/aF8FkZeWoqSItJsVZlgmCIdDh61HmixCB3obWYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QBLkTgtYdOAR/cBJ+SbwMPp5bjzj7dZK1mSiPfvHrVTgvvWB+0+Mssy3njTU1V3m1
	 4oUzYXr8iDBoQmmBbVCbN7+mUXfcTaBd9l3EYGoj1NpCfh+1gDOlgS7EyHcjXcyGBz
	 w8+HWI79PKv7Vpi0uMIivIiybTFc3egXhDAmSmhSKKsKNbdQ/5h48mYBveGesDu606
	 6TNIVybK8HYHf6tm/6bOGJ9mkMJGStSf8JtefUeySE14cc+fct6+ayUpzWc9AiBSR4
	 vMmAyne10jyuEeIRkNy70ryXCaHlF9Noe+qThO+yAnsoyou8gZTMzxOSQnv5lRyZHB
	 euSIWy5LXZFEQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80C1117E0E9E;
	Thu,  2 Jul 2026 11:22:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260702083746.578461-1-wenst@chromium.org>
References: <20260702083746.578461-1-wenst@chromium.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui: Add supply for SPI
 NOR flash
Message-Id: <178298413147.12161.8178749419830343248.b4-ty@b4>
Date: Thu, 02 Jul 2026 11:22:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_022214_797170_B3A1EC3F 
X-CRM114-Status: UNSURE (   5.73  )
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

On Thu, 02 Jul 2026 16:37:45 +0800, Chen-Yu Tsai wrote:
> The SPI NOR flash is powered from the always on 1.8V power rail through
> a load switch that is controlled by the security chip.

Applied to v7.2-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8183-kukui: Add supply for SPI NOR flash
      commit: 1f16e99cd8361b33758205eba587dbe40a82975a

Cheers,
Angelo



