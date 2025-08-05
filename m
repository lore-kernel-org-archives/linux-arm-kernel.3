Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB7FC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mq8h+xLnHGJ8XkiMmmmLGvvQ4fgZKKt5kaoyZwJW8GY=; b=nveLvTvW/1OIir6ZoQzDlQfTsx
	i7QO+x3TGpb67fs4SfrzsD+/Jww7m7Nt1GKEuHASTIBNLEGqCxbu8ksLWEpbmb13S5wY9Djpcqmjf
	efztdhkLP+Nmd+fOMARYclB6rzGUlNGFwBJKD6AhT3N0/o9wYnNz73qktJi3GC5sXnzyVC50tnQp8
	/MVo2wv14uErmeROadfnbro7AhR5aUoZBHjKrezdBRgG2wTkfnRTsJOsHUof5GatZIvkQgmO20uY/
	UtSjH+QUijtjoTuFH3gYX7tauegY3GZKaV/oatNO5WKmNe+45Dhnbzz0uEFjeansvcgwJbbaopjPs
	lhAoZ0cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLli-0000000DT0E-1JLQ;
	Tue, 05 Aug 2025 17:48:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLI8-0000000DPGu-23P4;
	Tue, 05 Aug 2025 17:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C7A5A566BA;
	Tue,  5 Aug 2025 17:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14502C4CEF0;
	Tue,  5 Aug 2025 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754414255;
	bh=zPti4vHQ72c0KUJK1MFtmTjRrvlP5Fdb3fbdUSg7DhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTk+blBXu+Mhx+4uUQU5Gv/TlCK62jDarbWpdTCEI11qqCUJ0shwy5gSGTG0ZkRGM
	 GVn/0CuULcFpf+yUCB3kJo4vTZX5Mq5mzPySaZX1y3kJ/gqaeK5dShUe8qNguzewsL
	 1DfEpC87mz1fV0lSkKZ2OqSsW9wlhz4XLX5VEFtFAM4yhXvc1106qV2F8X6dx2LeMt
	 yJLMMvuFSzcREDDcFjmTNdvUUtxzawpdlR1d1Pd0rrKKQIBZhoPyKOQDuO2KLbB4NN
	 owm5jYt31sZvANBU8Rz0aqtrZSM2NzBPGjgl/2SrcvnSn1Uuhk7mElcoDCyA8ajAZB
	 Qg8SgcertQPxQ==
Date: Tue, 5 Aug 2025 12:17:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: bchihi@baylibre.com, srini@kernel.org, rafael@kernel.org,
	linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	arnd@arndb.de, colin.i.king@gmail.com, nfraprado@collabora.com,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, frank-w@public-files.de, lukasz.luba@arm.com,
	rui.zhang@intel.com, kernel@collabora.com,
	daniel.lezcano@linaro.org, lala.lin@mediatek.com,
	andrew-ct.chen@mediatek.com
Subject: Re: [PATCH v3 9/9] dt-bindings: nvmem: mediatek: efuse: Add support
 for MT8196
Message-ID: <175441425377.1957748.9727174250578457285.robh@kernel.org>
References: <20250804133035.309990-1-laura.nao@collabora.com>
 <20250804133035.309990-10-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804133035.309990-10-laura.nao@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_101736_593104_D01BBF1D 
X-CRM114-Status: GOOD (  10.61  )
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


On Mon, 04 Aug 2025 15:30:35 +0200, Laura Nao wrote:
> The MT8196 eFuse layout is compatible with MT8186 and shares the same
> decoding scheme for the gpu-speedbin cell.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


