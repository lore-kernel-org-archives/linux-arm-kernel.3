Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A5BC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlkeWf2+O8Ox/jS4qOtOfWYFOcC7DcKeM7EHeI3Y0Hs=; b=QrivNPKcSQZSSZqyWrvb7SqaUp
	MGBRnp3sBflQ1e4Z/P678Gl6WadRm8rE9AUov5d0M3y3pFC+moGsq0qCkVYR1SD5ls0bkEvNR2WL4
	gzz8iAPorraNI9EXoYNn0t9SdB9Qm06dWqYwtIUXfKKcrpNJp/XZUPFlGq9N/1K1G6al1DBFzqrDP
	LdQ8BZXhT6bNvPD2uMJ7/mtzwVGFeCbMP7U5jLpjK4kAFXT4GqsiJ/5ZUrWVDeTIHi8hCO27+Cdgs
	AoKKbVL051v6Grv2uH4l5dGi8PxO/shY8IwMd0ESPuAOW6qnpOi8WVRUOCosmrPWx9xB+OD9BvBay
	u9DkGhOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufReK-0000000AqVU-26ZP;
	Fri, 25 Jul 2025 23:16:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRae-0000000ApxZ-1Wur;
	Fri, 25 Jul 2025 23:12:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73D78A56771;
	Fri, 25 Jul 2025 23:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F03C4CEE7;
	Fri, 25 Jul 2025 23:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753485155;
	bh=lKPeV4dbiMZgeOgy5vCWxzKkrNkCOUiKusQlfwyyh4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUO6gcNman3Vtu/exvEYRzEjR7cFwafa00xuS8x2urfr/gOW2Bj7tembJ35BQTYTM
	 sg1PZAIPVXEHqG9QluUBkbzuEdOZRuljdC6ARmZ8pyWDWdeVH5i0aatgDw3RtEdxEg
	 xpPlkVUvOHHg19vB7hidb0J5UytvvysKl/vIvKGSIUtThtJWJLydupBWpQiuEqjs+d
	 EzUemwm89JaJBGb4llfCrohBuQSTN0iG/CNdVtQYdI5LqZlXNTaLvXEVJPyV5Ma7mP
	 IiLffzZHtemi1ChCQZZQA3i9Qtc0PnkfDdorR1wTC+RJH5m1NC7GGDg4VXVy14umvk
	 lCRTefb+Hgb5w==
Date: Fri, 25 Jul 2025 18:12:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: u.kleine-koenig@baylibre.com, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	sboyd@kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: Re: [PATCH 1/3] dt-bindings: clock: mt7622: Add AFE_MRGIF clock
Message-ID: <175348515340.2008768.1491160057381781606.robh@kernel.org>
References: <20250724083907.61313-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083907.61313-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_161236_477073_93F39891 
X-CRM114-Status: GOOD (  11.03  )
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


On Thu, 24 Jul 2025 10:39:05 +0200, AngeloGioacchino Del Regno wrote:
> Add the missing AFE Merge Interface clock to MT7622 to make use of
> it in the audio subsystem.
> 
> While at it, also remove the useless CLK_AUDIO_NR_CLK definition.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  include/dt-bindings/clock/mt7622-clk.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


