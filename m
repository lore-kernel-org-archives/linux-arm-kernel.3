Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD00CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTPa4c49LdfPMjZyUaXFF+HjOoejuOd56tJpRsEObJU=; b=hsJxU/8ecc+RsDsAoy26Cjk/qB
	2SuPITejP3HbxH0A8I9nJ7P82VBJk3F1RTNP3Sot4HeABRyWZkrYyiUeR6ZTGBjex4iF0u7weZ+Fv
	e0xEfHfh4xWIu+PYafidzxJOHKsCI4ydB7pdwEsoKPshwjO68kim/+H9L+UxLb78IRuaBA903wPXh
	AfwnlEUATKpgWuHKZabwfPpaXOenCx5/sLAA30weIy7LjYhjDCPrXiU0vR3Q0w35YxsLy78I6JnU0
	3BnLfg4zwitflLVD1ZhejIU4B3HgSxf/pCXUmY5LofgW5Mjd9zxDeSowKP7pPtn90z4rlwiVbEYyI
	vhP/jBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upScX-00000002mU4-0GNN;
	Fri, 22 Aug 2025 14:19:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMfQ-00000001s0X-3Q6S;
	Fri, 22 Aug 2025 07:58:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDBC460263;
	Fri, 22 Aug 2025 07:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC6CC4CEF1;
	Fri, 22 Aug 2025 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755849511;
	bh=Ic6PVseco7YUJ8wYEstg8CtOnWLOrVI1ECZNeO34Qes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPLcFWmIxPLVNhqJEwBoSDp0zB/gcFblbe5q+Tlg1+pt/QzDARCXJWMFBaen/AtnA
	 O6dBLrX0xnPHYsztCxM3D8clirEE0srRySAengcBC+F2S8aLnIBnrnXnUMJP325ivh
	 8o89BJf9hxbfhWZb4CKD/E5sb2C1jR6lafoV6YSmFL9peYz/pvgw4b8TCn4COQvZfg
	 MarhT5PatESobSxWIhMKy9XplyXaQBVdjlWrdWPvAq1dbcCfd7rnTIMRjeRPwpUMqr
	 f04lwgKQwgC+ayxHdwmwKljauAZITXP4mnyS4OPwGPmV7hxHhWqSGcMCnCFbOJzSKH
	 wHM2BTiGlgiFA==
Date: Fri, 22 Aug 2025 09:58:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jjian Zhou <jjian.zhou@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: mediatek,mt8196-vcp-mbox:
 add mtk vcp-mbox document
Message-ID: <20250822-notorious-lively-wren-c4540a@kuoka>
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <20250822021217.1598-2-jjian.zhou@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822021217.1598-2-jjian.zhou@mediatek.com>
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

On Fri, Aug 22, 2025 at 10:12:08AM +0800, Jjian Zhou wrote:
> The MTK VCP mailbox enables the SoC to communicate with the VCP by passing
> messages through 64 32-bit wide registers. It has 32 interrupt vectors in
> either direction for signalling purposes.
> 
> This adds a binding for Mediatek VCP mailbox.
> 
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>
> ---
>  .../mailbox/mediatek,mt8196-vcp-mbox.yaml     | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


