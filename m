Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B903ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCvd8qhSnrjYEbbBKMxE60mVYAblurPp71JXdhjllZk=; b=Wafj+8sIl8j+XcFGSTDumI11aA
	IyD7Te5hHNwtrBFf1FiHY0BDDv8OHQHrHApwcTWLY+ZYFoWiqn+Pojdyh6QQiQpSx5aCoE8K0fPP/
	dNimqtEELfyukUu7jo3kft+3mPqNKWCa72h7pfRFSc8gDkR55H7zv3eQVdcefbA0Scp/CgmWXHyoa
	uxbht3swFE2yYmZvALDDueR6aAgX0/PsJxrk8mv1JkK/pIgEuDd72EhZFXCZ/jp491//RcrRsjIoh
	pMxPmhd+7o2zEUaNYsVOkD6/928w61enZ631DY0MOzyxR6M0SF2DSZqIntWu2LxHoMwwc6sdrGKNz
	a9IcHWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoud-00000001k2G-2CXW;
	Fri, 15 Aug 2025 07:31:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnvn-00000001cT3-0lDn;
	Fri, 15 Aug 2025 06:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44AA76116F;
	Fri, 15 Aug 2025 06:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBEDC4CEEB;
	Fri, 15 Aug 2025 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755239329;
	bh=yKdH7Z9mYp9349ekyyGJWE0NQ8UBnE41L7EHWM+Ek4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i7vsWi/BXk//+Pjnr9JDZdR0HIPG2NYFOihtA77ypfoS55mcrb4ozma1lsZEyZoVk
	 m+FYAHOG3jF1ZPXvAfl8bIAMzsC2Tqg6OgqkfQRnRPXo1gniB49cNcY+EUexxtGe3a
	 RpCy+0o0/Raz0YwrudQGXyX2yEwXjfeGTasxx8W4CLaFUhDAwT5nzY9ltBOkt1SA2Z
	 Ey/MbjOPMAsosrwbYb6j3toEkjm4zuY1L8jZtHmUJW3whHri/XTos+gT5HuAZkRNqb
	 0WWUhekbWH/zwuUpvT08oUTY05vmjF4w0aTeclQ1C82wC77PbGOA2Nzgn1SjCKbT0q
	 9k4tN3DihrAXw==
Date: Fri, 15 Aug 2025 08:28:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v1 1/2] dt-bindings: phy: mtk-tphy: add property for
 software role switch
Message-ID: <20250815-important-warm-dove-03dde5@kuoka>
References: <20250814234825.810-1-me@adomerle.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250814234825.810-1-me@adomerle.pw>
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

On Fri, Aug 15, 2025 at 03:48:24AM +0400, Arseniy Velikanov wrote:
> Add a boolean property to enable software control of the PHY mode
> switching.
> 
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> index b2218c151939..a90890d4a86f 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -255,6 +255,12 @@ patternProperties:
>            use the property "mediatek,syscon-type" for newer SoCs that support it.
>          type: boolean
>  
> +      mediatek,software-role-switch:

No, bindings do not describe software.

Also, never tested.

Best regards,
Krzysztof


