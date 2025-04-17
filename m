Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68C5C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 06:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACXz2+bNNW1XhrvLvXI8dB81fAjKSBVlGEniK8K933s=; b=RenWARIh/4pK3++a42lGSnKLwG
	uDgiusNdJ1CUYxPdo/vZv4g5fH1dBkiM2PFDxE9RMZpX9PEPl4l6epNIP3GA62S3huJPYrLctdtHy
	zKjOehyb5jG8VD8Y5UrlogR6eQgt55KVS5W7s2x8/3WAhmG3McxE4duZq0kPExnTen6CmY+adoPrP
	zmT+4RwrMd27oiIx8nx4L4DB/VAG+4ORCNqP+eO1/x0uoB/6Em6HWJKWURhAhzptD8fvY67ceMlqz
	L8iAgFBj2QX+F2//niMa9EH4dDUUkgbbSi/FAtEeH6860DiV7FWXwwsX+Nzx23vLX726iPLUakZS/
	9CGRyvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JCJ-0000000BzPW-3iTr;
	Thu, 17 Apr 2025 06:58:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5J84-0000000Bxuv-26Ky;
	Thu, 17 Apr 2025 06:53:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C85DD43472;
	Thu, 17 Apr 2025 06:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EC6C4CEE4;
	Thu, 17 Apr 2025 06:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744872823;
	bh=C9PJP4UkeEpAAoNxz6hVCAneDrneZyGWwBSuhOWnKqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S734jLaFHWX3qXivUZYGnlAgUCk2Gy0cVyeJrOiKNGdv9qgGEdqJhkDh1l5g2Pnh3
	 yLs2srVcPPP/1BMToiWz+WUtxyldKYdKM9NmgLfuMxw0y34g/bTbWj9vgIWJXkdUKo
	 zvmYPn7BSFU/42xvXranr/+PPnvnND5uKIpMsbK/sqJuuWWIRZWla5Sqa8vHa3aXnX
	 c6LnRWDzkUC0UHMEayez2PjbKMccKeuQRxb33jtWa0+86Mx1P3bfS4JStA6Sy7Rm3R
	 AoZ04Ol8pMkUPgZnRcyJSkngOIXaZIjK0cjseOuB5arh+BfXzg6GbNOT/gmvZBf6S1
	 MI74hhjTbfoxg==
Date: Thu, 17 Apr 2025 08:53:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Wunderlich <frank-w@public-files.de>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Daniel Golle <daniel@makrotopia.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 3/8] dt-bindings: phy: mtk-xs-phy: Add mt7988
 compatible
Message-ID: <20250417-competent-gray-spider-4d9b2d@kuoka>
References: <20250416095402.90543-1-linux@fw-web.de>
 <20250416095402.90543-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250416095402.90543-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_235344_557173_ED0B0710 
X-CRM114-Status: UNSURE (   8.22  )
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

On Wed, Apr 16, 2025 at 11:53:55AM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for xs-phy on mt7988.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


