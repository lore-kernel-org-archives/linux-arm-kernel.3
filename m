Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8DAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 21:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWwWVbUibGLIJXdNXlh1LS3yR/JeJLEJ0HZ0lkwr/2w=; b=EaxSNhRI07gjtZ2Anhq4ADJrdy
	xevAfrImzAFLp4UC5z4Oj2IANk03mD+45foKjTh9wRlHVNJGhh2xVamG9DXS+lC1ntFJIrCcw50Hv
	1Ic3lBHlUg5bKeC36bK+qRMoxPlq9h9eeBn4QfbAspm0BgVbD8WeCs6psMD/s+EQGc7ix6rZisLLY
	gEWoePrqQ+szsA8H+OAFFGusPQVgMkG6C1SDOu7CwHNsn48/xkOSgKHPK6FC7cZ/oCjg7QK3vRVff
	HE7hn2+4nfuncc4Grzb1yFHWLZXfSWMnyD+U1lWEKI0cFIu6RZl6YnhU89sctLtt5QwGS2X9Y6Ob5
	jZHJomGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yvJ-00000005Cjm-1aJx;
	Mon, 21 Apr 2025 21:43:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yqs-00000005CB7-43lg;
	Mon, 21 Apr 2025 21:38:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A5C14A393;
	Mon, 21 Apr 2025 21:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20443C4CEE4;
	Mon, 21 Apr 2025 21:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271533;
	bh=P6nmFQfl8tDNHNuZzm4b6tttJQZW4Sac0+eacXTdEPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SqvlGE7AxRIVNM8q2NdMVuX1QDRm31fP5PW6Me/cYE8T24hhSJ+s9XcJ9Xj6NBehq
	 Z4EJTSvJZWaFB9CLVrajvm++/uOVBw7FUS4OCI0pk1Aa1l3ZUV62B0Q4BGMID6IQYr
	 APNMubOH9TEwCY2PS+7dINzSYC9XwzzzNF/6/95/HTWs1G6K9ArEMUOytYvKVSF5mf
	 jcqT2RwfSVzOIMDUNK0LncWVGfPO40M8/ehb73KYh7ueiF2U5dMetgA4M4/KYRMu+Z
	 xI5m0LhjqEc4bN0s2Kk0umYFpKpaHTShxw59p3hzfWT3Lc3vSzS2Llx8+z0q8SXYnK
	 imSeilgUrOzCA==
Date: Mon, 21 Apr 2025 16:38:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, andy@kernel.org,
	dlechner@baylibre.com, matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org, jic23@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org, nuno.sa@analog.com,
	conor+dt@kernel.org, linux-iio@vger.kernel.org,
	zhiyong.tao@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: iio: adc: Add compatible for Dimensity 1200
 MT6893
Message-ID: <174527153072.2973088.9157423165074778113.robh@kernel.org>
References: <20250416120235.147889-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120235.147889-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_143855_026162_BE0CB025 
X-CRM114-Status: UNSURE (   8.95  )
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


On Wed, 16 Apr 2025 14:02:35 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the Dimensity 1200 (MT6893) SoC; The AUXADC
> IP in this chip is fully compatible with the one found in MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


