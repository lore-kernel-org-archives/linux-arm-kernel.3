Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05E7E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9ksRoDApIr7jCK2E3DPS0JzypynED2SfFwJ5YzNYCM=; b=K/yRoj5KnXUt77qgNmwa7RlviP
	MiEvbYd+YRhCv0lQtJT5gbKIZ8TJYXLplu9fT07QhzpKoC4FVKg12M/Da5Bmo+QCHoJGHI9U2qfr+
	IX1yPLMyBXuPAt/lLsFL0ikRl9Vux5bFp0vnt/qosiLzb9lihDT+swYWKoU6wM9llP+bCIKvn4/k9
	UbBgtBOkqCYJiFl76rFCcxvHbRu6+0TgPogXlaAPP/eRBGZfERWLPN5lW8/5mBkt0bS5BOmdfLIBR
	SyVSU0XZlT2JxtyWMaBbltTilOuJ+felmnOzhDmFEn4zTZJiNTQxtU13eOUeIOaAKoqjk67YfcoS/
	AFKD3LQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJ1k-0000000EQHf-1NLw;
	Wed, 11 Dec 2024 09:29:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJ0g-0000000EQ77-3N7B;
	Wed, 11 Dec 2024 09:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0D385C66BB;
	Wed, 11 Dec 2024 09:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FDFC4CED2;
	Wed, 11 Dec 2024 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733909278;
	bh=++8RmMYTbi+Kmf6ldH+5k2GCUXkok9XGBckOUFhE07A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+7f3g5HsQurGOZz6W0tx1hKYOkAqZ/GRHhZxK8iO9W1CfbwmFp0pUGcspfkt9fNG
	 f5eqY6wPeIXcGBHwZu2a28/SQsWQU3TBaiGmOacJJEgl4P0Q275sVp9qA3QXZqtat6
	 p2q6I8UXNRXB7bnZHdtgTMpITOfwf/Sbhvc/v+wNP/GV4O+7yR7ztevW+utXBJGc/s
	 oyOZAHA40asr0A8jxiG/gMaMIn+nJJ7UftyheUQTLONvSm5wuzie4VMSomInIYe4N6
	 W04hqqo9p2lp/RzcInGTtpg6bHyWTt1Zu0hikyLxJh5YHADYvrWGtl/AK0GCTFMgYq
	 XkVxA8y9GCkzQ==
Date: Wed, 11 Dec 2024 10:27:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	Frank Wunderlich <frank-w@public-files.de>, Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document compatibles
 that need two register ranges
Message-ID: <qgsqjp6bodaiwfzpy54vgeo7pkyhfpdalvt7qjkodosnec4v3w@34446achvtve>
References: <20241210073212.3917912-1-wenst@chromium.org>
 <20241210073212.3917912-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210073212.3917912-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_012758_884484_8F7C9FCE 
X-CRM114-Status: GOOD (  12.12  )
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

On Tue, Dec 10, 2024 at 03:32:10PM +0800, Chen-Yu Tsai wrote:
> Besides the MT8183's MMC controller and all its compatible derivatives,
> the recently added MT7986 and MT8196 also require two register ranges.
> This is based on the actual device trees.
> 
> Properly enforce this in the binding.
> 
> Fixes: 4a8bd2b07d88 ("dt-bindings: mmc: mtk-sd: Add mt7988 SoC")
> Fixes: 58927c9dc4ab ("dt-bindings: mmc: mtk-sd: Add support for MT8196")
> Cc: Frank Wunderlich <frank-w@public-files.de>
> Cc: Andy-ld Lu <andy-ld.lu@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


