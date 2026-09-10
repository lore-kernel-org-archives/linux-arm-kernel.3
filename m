Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150D0C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rBPZVMVUyjo1kUIfdHiXExoRcCpgFuug24ae9XJXFg=; b=bXV9JHy9LtuBBtLGXwKKur/MUL
	lOIijyxbxwvfrf4YyvK1moVjoFeu40jv9YLunL2MhQulzrgF/mlNf3WSlnwd5FMpACzD/x8IGUypL
	smyrEgVCuxGqTtermsV8WQU0KiB+Wa4A+V0bPT+9kd8jxFOywNwWZcn0pE6cEUwoKnvjUOsPzL1BY
	LIkJJiHPw08dr3gyL4P7gs7Bpt18v44ST6KCRoMLUlIFlzRiZobFKX1IZ5hnoaQDIOKsWX6lS7sNH
	pSJ67udlZrl+L9roLOJ/g2gZPbcwcU1+4gpBf3P0gCLV4Uw0q0yYfu5UZwQ4sFbH4jy5Om37aax87
	bka5BxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZPF-0000000Degp-3cUA;
	Thu, 10 Sep 2026 07:41:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZPD-0000000DegH-3UsB;
	Thu, 10 Sep 2026 07:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789026068;
	bh=/mUIqen27iTJQ+qGVZdilGkl+ZjxfZXaVc7xvPeqU0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fG1tpQfzOnpcLFK8cOiDMMwPNoA6/CjjE4fbPt5eercMMoY9Rmlm81hIoP5mGSMD1
	 yrHgLK/Ol/sfgiB1qQomOQU2mk0H0XIUlNPmGubz4jNo4gfHURH5Ybr8RrGosuwM6I
	 LMMa+GriOtWXQFt5F6pd2MzUOErkRFp40P7dcCaI9w5DKNr0n+eq2j5Gzu5KkTaBp1
	 PWsWyYpGVbp/dtYHNy6ntZYYBRuRUGIJVqn0ZByzvFBmfdMFIJN74wB9zPr5KibdAQ
	 4UzS+L6+7LX+ANNewUBxBFd+/x2RAngBw/WWkiEYOxlHO0FMMWwukv1AE6+bfCGBee
	 PXJ4oTPoW8Uww==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C4B717E0785;
	Thu, 10 Sep 2026 09:41:08 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Justin Yeh <justin.yeh@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260903062142.1025443-1-justin.yeh@mediatek.com>
References: <20260903062142.1025443-1-justin.yeh@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mtk-regulator-coupler: Add support for
 MT8189
Message-Id: <178902606853.11258.8562228346904746355.b4-ty@b4>
Date: Thu, 10 Sep 2026 09:41:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_004112_026351_5F3CFB3A 
X-CRM114-Status: UNSURE (   6.22  )
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

On Thu, 03 Sep 2026 14:21:24 +0800, Justin Yeh wrote:
> MT8189 couples its GPU supply (buck_vgpu) with the GPU SRAM supply
> (ldo_sram_gpu), which is exactly the GPU<->SRAM relationship this
> coupler already handles for MT8183, MT8186, MT8188 and MT8192.
> 
> Register the coupler on MT8189 as well so that both supplies stay
> voltage-balanced.
> 
> [...]

Applied to v7.3-next/soc, thanks!

[1/1] soc: mediatek: mtk-regulator-coupler: Add support for MT8189
      commit: 6c5388154299ee0b5ab2c654d5f3631bafd524a7

Cheers,
Angelo



