Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2B5CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 18:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qT0XFDocX6IgDdh021QvgauQ5w1b0uGPxHrbBofkMBw=; b=4eqg1v+aCIluhqOd2RYnK/oRmi
	eW8VONJkGMNDh5JaoyKnkH/zgxFG6w/hI1ZZ/e+XXRFMhQ4NO/B0Tpc5OHuD/a5AGVVH25VInjO01
	tib72IITnMTLzJC3jyGJgH9nVFbprSknXYlTRweCnJvjv0COiih5TKxfVonkoXrh8HD4d9SEYMRC7
	1kXXYMH48NLjJwja34R53BSLLMRxehpuq4foBDuLQtGJIZsMHVNSJ3DIYG/uqYDkeiWziqHNiVNHU
	aDFkHPrtSAQ1R9mEqwJqpFu8qRBl6fNWnNN/7YeV/kx4EHbkWpjUKeVqJ3l72sGyIx26sQsJPpMnf
	YM8lv5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6v3w-00000006tAJ-0Bxy;
	Thu, 09 Oct 2025 18:08:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6v3u-00000006t9j-2hnz;
	Thu, 09 Oct 2025 18:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48F3744AFB;
	Thu,  9 Oct 2025 18:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6953C4CEF8;
	Thu,  9 Oct 2025 18:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760033302;
	bh=gFSHtsrqHS0nB/eq5mW+h7jeWQpgprps5uurLkFEa9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7cLrXOSSPv9MR5A/ylYV0/Z+zpdfDGiEkMnPvlAxx9Ss8U4TqvcmeCei37DqCZCN
	 sNXIjhS0l8rGmzuAegxsmG1gHFC0X5QNR1HstQwsCsFJzRONN2kIqIu7RiBnZbZ8MT
	 aW89CaU7aR60rmnELGIBk5rT07iD+S92PJtpGCrDEMXlfTqEUc6aCPf+rl34ouMI0Z
	 HAg8raaFtDAtTx9xRXg51u41Bf8/8Xgcd/U9mSuhDrduE9uUjip1Q/RN+PZj7Yypvw
	 jvlU3uNMgbnhT+TsQfuCd0Gft1ezc5fGn2L3W3KgqqRmJCOTZdmTm1ncaWLA1JLrxT
	 7giywDkL22yvQ==
Date: Thu, 9 Oct 2025 13:08:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: andrew-ct.chen@mediatek.com, houlong.wei@mediatek.com,
	minghsiu.tsai@mediatek.com, linux-arm-kernel@lists.infradead.org,
	conor+dt@kernel.org, kernel@collabora.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v3] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
Message-ID: <176003330002.2945848.1684483628516504811.robh@kernel.org>
References: <20251001183115.83111-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001183115.83111-1-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_110822_696487_1F065D9F 
X-CRM114-Status: UNSURE (   8.82  )
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


On Wed, 01 Oct 2025 15:31:15 -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
> Path to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
>  .../bindings/media/mediatek-mdp.txt           |  96 ----------
>  2 files changed, 169 insertions(+), 96 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


