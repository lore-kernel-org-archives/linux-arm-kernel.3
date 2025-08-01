Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D14AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 17:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONxgia4Xl1Y/U5Md2wPoLdHCdLlxHcTUcJoQUxb0yDM=; b=3KEhSH2t0kqu0e9rPSogLC9BwL
	Uv/c7+7RVFZZHf2jawHOtoEdB+k77V7XXBHmL1WW2++MLRqIlP1knPUX5py2cOxmsiTFHLk1V/TEF
	oyHEaQi+eQzAA81azajEUADL3yTsflF9sFecoW73ZWOhF0LKfuHYT1cCG4PzRGv2gKokJXSzvs2W5
	xeKdMxhiZEqVTVUEqxvNYuSylLD27PR/BbYdsWhs5FTZe3g1FTmBbrle5zcZe/0TIrN/rPO9q7nWV
	hAg1919mSxo5Q/q6rS0TXrbGxJEtiPK9ZBjh6j4JA9B0hV1C1S4dfKJRJBAraHhyOdyIVvL9sbah7
	LXvoafAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtmF-00000006ZaA-1xfe;
	Fri, 01 Aug 2025 17:42:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhtW6-00000006XaT-09UF;
	Fri, 01 Aug 2025 17:26:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE56C42B62;
	Fri,  1 Aug 2025 17:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839CAC4CEE7;
	Fri,  1 Aug 2025 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754069161;
	bh=LAZESKJ9vhRa/bc31RvUlPJh1epXwsBYl7jFSiRgvlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPCBVQAmia+vZiDmAx2NhLMVzrZAd7zpvfeYEiS6WzsM7Xv5PHFnskzDNhmVy017R
	 fJOtLQESMGVGWGDoHuuQqP62qowOX/FJLnXFqLvT5ADCKB6OD5tP8riLjL10Jr3idx
	 XhBhxSre+7LteAoLSTpSBRs/ab5jO56RCFFN9rlS3DsP9PeT9RdJ6UcKhgS95ZJ+Ln
	 kANQkEq1BWn1kYtqIK7m4TD1amZ8i6vafmb3STYHAo937BVwXUks79e49iBPLRc308
	 6D5vPPHJz/VTHAhKgwVOPCqNGscXckHrBhWJ3aAmIxx0vWvnVpawGNEDkJ8rlGeq08
	 HdPB562ELicbw==
Date: Fri, 1 Aug 2025 12:26:00 -0500
From: Rob Herring <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ikjoon Jang <ikjn@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <jmassot@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/9] ASoc: dt-binding: Convert mt8183-afe-pcm binding to
 YAML
Message-ID: <20250801172600.GA3107067-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-4-6ba4e432427b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-mtk-dtb-warnings-v1-4-6ba4e432427b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_102602_093421_5BD69E92 
X-CRM114-Status: GOOD (  13.07  )
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

On Fri, Aug 01, 2025 at 01:18:06PM +0200, Julien Massot wrote:
> Convert the MediaTek MT8183 AFE PCM Device Tree binding from the old
> .txt format to YAML schema format to improve validation.
> 
> While converting, also document all clock inputs used by the AFE block.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../devicetree/bindings/sound/mt8183-afe-pcm.txt   |  42 ----
>  .../devicetree/bindings/sound/mt8183-afe-pcm.yaml  | 225 +++++++++++++++++++++
>  2 files changed, 225 insertions(+), 42 deletions(-)

This should come before patch 2 since it is referenced there.

Use the compatible string for the filename.

Otherwise, looks good to me.

