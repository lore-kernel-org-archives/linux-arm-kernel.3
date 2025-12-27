Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C298E8FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgLcQ4MmPsnA74aTJYgjhTgJWCkhOF+5ZLEQkDPjih8=; b=2PWTgPBAuYXBqGEGnL3CJQPEDK
	Tz9KMh3FnTEkHirfRQNkrEw7NwaHTKSYIni7lMRqmKs2xy7gIBwo1GLMCMHHcWkomeKPxvj1Kk6xS
	fuRetkUayevyGICj8p+qfOOkKkrMoBDJ4VFhvJeBeNhO8MbF4swTU2lmEVeUCOylzhfuzKBVhsPev
	7Y4fauQY8qsEaWAF3Oql11j7BZbqHKcBTB9G3Jm00zBMHVxQ3ZIGJLMiehZr9NUrnF7DZB1YpHBQy
	bFwNYzgLS65xvOcHPsqnN3fV0R+/Cg1KSga+0SkXCHfx3uCEbWYZMgJrKvjs4cwRNGGlhJBxo90mi
	WbPUEGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTTk-00000001yIm-1gJf;
	Sat, 27 Dec 2025 12:33:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTTh-00000001yIN-2MYv;
	Sat, 27 Dec 2025 12:33:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99DAE419F2;
	Sat, 27 Dec 2025 12:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0737C4CEF1;
	Sat, 27 Dec 2025 12:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766838779;
	bh=8ehUF8iI3V2JVPJRE2KySeqarSaCv7UrkDB5YzapNqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/XDgj5WaTbz4WrqV+IBoxhdV/NzmbYVJqpQqz2k2V84Qs8qK93nQpnYVwYbLOCKE
	 gtMN7tu+qfWbVpo4dT6t2rtMgffYBzuEMeU//nc37vWNO2vV69F9vPdDrlAIyIL3fx
	 TxfPRlRf8NxD3h5a6xxkymrKnM5Oaxm0IYQnU/z3gmKJOZid8sVMizdx2Ay/C8YKk2
	 nTHvcp9ZWOUVVeDTRWjh559fTiwaB1kJrmIF0/h6F31aKOLR4CbV9oRfP5gxDcgcas
	 9EmezOjTuXBNy9zk2U+2/15E46EyNtGav54xyh/CuvLVcGb7d4khHTZcbvO+NAWurw
	 a5SuYpab67xcw==
Date: Sat, 27 Dec 2025 13:32:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, 
	jh.hsu@mediatek.com
Subject: Re: [PATCH v2 3/4] dt-bindings: media: mediatek-jpeg-encoder: add
 MT8189 compatible string
Message-ID: <20251227-glittering-opalescent-caterpillar-3c24d8@quoll>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
 <20251224031721.9942-4-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224031721.9942-4-jianhua.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_043301_647041_2A353A6B 
X-CRM114-Status: GOOD (  11.64  )
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

On Wed, Dec 24, 2025 at 11:17:20AM +0800, Jianhua Lin wrote:
> Compared to the previous generation IC, the MT8189 uses 34-bit iova
> address-space (16GB)  and requires a single clock configuration.
> Therefore, add "mediatek,mt8189-jpgenc" compatible to the binding document.
> Additionally, it corrects the inheritance for MT8188, aligning it

Two different issues. Don't mix them up. See submitting patches.

> with MT8189 due to their shared architecture and 34-bit iova address
> space (16GB) requirements.
> Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
> iova address-space (4GB), such as "mediatek,mtk-jpgenc". This mismatch
> results in an ABI break, as MT8188 cannot function correctly under
> the 32-bit iova address-space (4GB) configuration.
> 
> Key changes include:

How is this related to above?
> - Introducing "mediatek,mt8189-jpgenc" as a new compatible string to
>   represent the correct architecture.

Why are you repeating the same?

> - Updating MT8188 to inherit from MT8189, ensuring proper support for
>   34-bit iova address-space (16GB).
> - Add property "mediatek,larb" for MT8189 requirements.
> - Improved formatting for better readability and consistency.
> 
> These changes ensure that both MT8188 and MT8189 are correctly supported
> with the necessary 34-bit iova address-space (16GB), while maintaining
> compatibility with their shared architecture.

This is not a contest who writes the longest commit msg by repeating
obvious things.

> 
> Extensive internal review and testing have been conducted to validate
> these changes and ensure compliance with DT binding standards.

Really, no.

Best regards,
Krzysztof


