Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C521D2F7C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIBOjqLhymbGzeJmJsfulc8SQS9KP7NnWXWFVKje56k=; b=WI0Zwp6hfU+T0+DotA8TSQ3etk
	KarR2pznRzyrz1t65E1soEtrDe7HH+3yUl1UIiL1uJ10J1oWRfBBQVRrSCqgvTLLoZkw86ZThV9KH
	rJBv1lIEduqBbTSmzKR9beZd/37zEW0JS1O24METq73nBEBVBv2242+ILaPww2q/RDVg3EjjwXham
	+aC5W7L2VM+MJeW8prGvbUAJtPWFkW+VsNEcCxtuS2Qrz1X1L8SnNzxPSVc2pPbdxR8I5nN11bUOi
	W50WwqgwSLKaFWNfM/inykTAmbfJxhLIk0mcyna35bEDZGJYfl62YPd+4A7NX2DXaKVUf7nlmz5Gg
	kDiUl74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRkB-00000009FsE-349a;
	Fri, 05 Dec 2025 09:04:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRRkA-00000009Frp-3ujv;
	Fri, 05 Dec 2025 09:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20D5A60207;
	Fri,  5 Dec 2025 09:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB43C4CEF1;
	Fri,  5 Dec 2025 09:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764925489;
	bh=J2ovb+88K42mXDaoJYvkfnX2So3Ncf927h6EI32oRIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jky425Lq+xqdqknZN+dBqk+kDT1IP2zLRG1WHnvVFHtQsYWzTVG7rqrx0nMG/+IjM
	 cY4Diq4aZ3SvYp2nDTCwnHbwDh0YeWlvClkW3q7ZpoZRf8USSi2H/jaKM86uXnpe8H
	 ayDWr7Okza/mSssjih2k+367tAEGP6AUE7/xD7nAvB0ieSdrzcQnENr3ycmI+rJkuL
	 3eRPBZIjVZ4omPixobm0eE55Ls181cwwd5R1iHtGdvmkRre9DErDQhKl0RNhBj9AVn
	 0c5KUpuYw049LUaHjhAOD2jDs9hDnPN/lQAtGfOZlLBEA0MVCkvYyESKNuM3RApyoX
	 iTcPgrcMaqMvQ==
Date: Fri, 5 Dec 2025 10:04:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wenbin Mei <wenbin.mei@mediatek.com>, kernel@collabora.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: mmc: mtk-sd: Add support for MT8189 SoC
Message-ID: <20251205-funky-coucal-from-eldorado-7f8bea@quoll>
References: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
 <20251203-mt8189-add-mmc-support-v1-1-f5ce43212fe9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251203-mt8189-add-mmc-support-v1-1-f5ce43212fe9@collabora.com>
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

On Wed, Dec 03, 2025 at 12:45:34PM +0100, Louis-Alexis Eyraud wrote:
> Add a new compatible for MMC IP in MT8189 SoC.
> Even though this is partially compatible with the one found in MT8196
> SoC, the MT8189 SoC register layout has some slight differences and
> additional features.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


