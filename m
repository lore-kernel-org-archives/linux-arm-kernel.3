Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821E8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 10:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbNfSFNrHDgDNrZ+/H7lHhcDN6dmQwAQL58o4shbTQk=; b=qGjx5VSikscEqzjfMtm5BFhtL+
	UWPFoJdOo/uEn7pKX0mxWXzWrqQuh0xZw0YHROjhsznwdLxsEJiPZG8C7zbVle026sFfkfrcSWHU1
	cmz2RnQT5kdDn/xwd0XlHdkfClpfSlmhXqWHXgB6SsXQGnl8F1b7O1+KghDlykSuD0i8e7Qq1f7ke
	4JsPIS4f6UN5CJJfCuPHsxY1gWzt1eaNxFSJXyfNJ6ZPEIEii/sslXz/4/PdpLoj3VPtg9TyufDHG
	zhVw1Djy+eiL1QkgfOL6BkwqbMhmaqF8kyi/cpJtQvyouT1T4hcoN6iUd98yMxWTU2K3KVh9isDUi
	GdyImOGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRTkm-00000001hkd-3F0P;
	Sat, 28 Dec 2024 10:09:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRTjY-00000001hcY-2XRU;
	Sat, 28 Dec 2024 10:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AD5B5C45E6;
	Sat, 28 Dec 2024 10:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B8EC4CECD;
	Sat, 28 Dec 2024 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735380467;
	bh=/4bgWVBd69cDnBnv2kPWPDo7b8Wmhz/t9s4lQNfpEkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FePsOUxEHorR0kyGbcVZsELjlzRTe9KEsN+2LD5f3YkMAmJN8Om6O+6yy3/gmrWH+
	 4s9w4sfHfmp9Dgi51VThztmA1O/pT3ZniRnDjzG8IYOAToZcn3C99+xVJPgNDvzv5M
	 xDa9xD7xc1zjIBYORL1DE00FqCfSkmTlO4ZoTsX0uKRpExk9jxNwuRLgOIRfCrsvBk
	 c4G3FuJfTbH2V/7nbRpZ5YZ9jzFLT/tQjFYF+7F6c+qq+9bpuDXBon894BhAiYmIMs
	 9vBoOG1D9tOt4FH8c91t6C6dJr+bS6diWi9iguUvM6ZJT/j1rsfJ9dUuI/pgFgVphv
	 XucKQHukH/9Iw==
Date: Sat, 28 Dec 2024 11:07:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, Fei Shao <fshao@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: mediatek: ovl: Add
 compatible strings for MT8188 MDP3
Message-ID: <364cot4pxfneirzw5cc3oazy4dpvgmze67gsncpqi7kz7sqadr@qjd2buftiwtr>
References: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
 <20241219181531.4282-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219181531.4282-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_020748_691888_012609C8 
X-CRM114-Status: UNSURE (   8.42  )
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

On Fri, Dec 20, 2024 at 02:15:28AM +0800, Jason-JH.Lin wrote:
> Add compatible strings for the MDP3 OVL hardware components in
> MediaTek's MT8188 SoC and it is compatible with the existing
> MT8195 MDP OVL components.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml     | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


