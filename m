Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA448C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CK8ZU2RGQ874r/JtQBe+jLs760SpSw9eFRle+TVxKD4=; b=FuJVNNBys2yUO6Ie15t8aIZuj5
	XhyjCTuL0KIFVqGbyQO+OKI4QQ3qv8YDofbbyZKCzipp2WZ63/FeYT7bjmGShoC7Sb/B6Sb6m/NRg
	kweltIxDQovX9cOs3JGNHOzFTmiDU1GYktbLvw52bjKetfOSZHB8sDsaW0N6Quh91HqnsaeKMmVYf
	yKCoe7ljRNjr6UvM0BihhIWmuq7Btza2y4tbUiEfqn0pOw+vBybdAacroIeTk9rouv7WpEq6dXHFg
	3o30+Q4AhIPbLCOMSeix31RPQG5eSv1vLEL8oC8jJcGBGifg9aEMnlxgjyxnqlsuatZy/1p19vydp
	F9wVmI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QWa-00000006XBK-22pO;
	Wed, 09 Apr 2025 08:11:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QIL-00000006UGQ-25yQ;
	Wed, 09 Apr 2025 07:56:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 608E668438;
	Wed,  9 Apr 2025 07:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E59C4CEE3;
	Wed,  9 Apr 2025 07:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744185384;
	bh=fRl/2fJxhLh5pxmQTXfimVdKHqwMdfvWC15mYy1K/zA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TM438mU+mHRflGQqwTTahRAHpXKkGwkrdYen5nCjr0gBDC1BbLQoOxi/XLpeEU3uS
	 zcSF7rV4CJoShkNjPIiGrPOsUmn6erPVUPsaI4roWH/E2vKX8n4EHMFXImdkbe8OhM
	 iyk9xnFwFTxxFxOEpySepA39twljtSjOFImZ1OJ57w2+EqGBTs86mrD4TdCGkN2sh8
	 wIiTYliaoUpwuhwBKVvAgXfMmxEsNbsxQ4juItxhJFl5Ei7t8imP9x1aDe+KYtLtBK
	 BumaHD9KrXChC7LHadVfu+4ZiGfm671eesJRp6kU6DxL9/dH394C7dAryY2gcWQoXv
	 zzwL8VTVomCZQ==
Date: Wed, 9 Apr 2025 09:56:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: rockchip,vop: Drop assigned-clocks
Message-ID: <20250409-ludicrous-blazing-chimpanzee-e5dba5@shite>
References: <20250404214030.401629-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404214030.401629-1-robh@kernel.org>
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

On Fri, Apr 04, 2025 at 04:40:29PM GMT, Rob Herring (Arm) wrote:
> assigned-clock properties are implicitly allowed in any node with
> 'clocks' and don't have to be specified. The max here also appears to be
> wrong as there's a case with 4 entries.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip-vop.yaml  | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


