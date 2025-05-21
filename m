Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CEBC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSRkBOBlg/1USG9ps6Ul9fB4YSUCAi2SxPY58nkKv4g=; b=VrcRIUzutnWSPq9EIFNaN0YWrF
	Euk6LstZh3TQOiXM57q8pxAMTYme7jmaz1VDUIAgC4kCLE/jBZFtOuKzIhPo3MC6xwuB3vlFnMHMs
	3dVtwMrw+Z3Jg6TTGDuaClyooiu6rliZGaUrxSu/POw20WY7ZgFiCoFP5SSM2BXD+VfQFOtdd/pKQ
	Hf8EUOQdJZhJcq+QhCaQRf2C2Ny5BhWdyhIu8mj7UQNM5NBL+1u3XOKqp9qZPyfhcwtLDELrl1Uof
	x+yVOgqmNI1abnRMbNBlSl/h/jJmBJog0Msl2y5KG6W5FHlsWcY7SvLUZ+L2/4dtEolmE4i1LafIr
	iVyR+Uug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdgV-0000000F2Ry-0k0V;
	Wed, 21 May 2025 07:16:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdVN-0000000F0f4-2MQe;
	Wed, 21 May 2025 07:04:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E241F4360E;
	Wed, 21 May 2025 07:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315C9C4CEE4;
	Wed, 21 May 2025 07:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747811084;
	bh=rRJzzQvmbbQ9PvIlEeUG2481e8flDDWUv05t0aPKC40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDMspO6P8f9Sw2an17DiUgOTUW9EcIUq5t8wwx8mq/5Tt0dG740WLlPoWArBFo5HF
	 0/DdkmKBBn2T6jAZWLYWpjPNp+VJWFZWAu8DnGN0hJlxROWP0w7Tp2Sq038cRb1H63
	 pjs/Fo2ChUITXsmvgc+yjTwlCukG+6T4JBz367MY/bwhPvxqy3Z0M0LTyrpHjYwGnc
	 cnoK3n8ckTgAHfM865pOh+icHa1LwTcP5lUtpdxWzzf6YVvdQfDVukWooOEqvVZbyv
	 FOFG4pc5Mlo/rkAF8kHH2jgo2gMcu/G3eMfkmsUKUgc1NChmkLpNlzQYA31dxZxtsf
	 w7JLWUARMxemg==
Date: Wed, 21 May 2025 09:04:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 01/12] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Message-ID: <20250521-friendly-hissing-tuna-a534d6@kuoka>
References: <20250521022322.27576-1-kyrie.wu@mediatek.com>
 <20250521022322.27576-2-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521022322.27576-2-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_000445_619246_E5F74378 
X-CRM114-Status: UNSURE (   9.68  )
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

On Wed, May 21, 2025 at 10:23:11AM GMT, Kyrie Wu wrote:
> Compared to the previous generation IC, the MT8196 uses SMMU
> instead of IOMMU and supports features such as dynamic voltage
> and frequency scaling. Therefore, add "mediatek,mt8196-jpgdec"
> compatible to the binding document.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


