Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DC6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5BBPXfTs/GUDM8oI1RSx5D4ei4IZTiTQ2sAvTMcsJE=; b=ON7cXLK2vYL9IfbG40oBw/dIfn
	/TpW+ZiiSqO4BxLZswsgV3RfGhtNv4wsvlmg0QkuaYHX7cdBwCFH1dkDDo85eu9SACS2Z5rA9RFqg
	w0otriyMmwL+SwhoB6TuKd5QyiHROXyRWU19W+DqzTQ93V5twjMCxsTZhExPnmKbwdRxeH4iiRewh
	cIXJWFLqGTfN7B/3EpfereMkhlyP68ReFe1kdKxEz2eaMG5sssg1Pyt/cod/XRr4AxB75ZbVwXQha
	13qvlq4GZkqKH9pyzKVL6cmpZ9XB+JxrYQpsnKtLorHt/nOltRg7QUisN05J/B0vEuGbrd9YgahNE
	SgzgiRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s5O-0000000DLuc-1Wya;
	Thu, 24 Apr 2025 08:37:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7r6H-0000000DCR6-07mI;
	Thu, 24 Apr 2025 07:34:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36A285C5C5A;
	Thu, 24 Apr 2025 07:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F84C4CEE3;
	Thu, 24 Apr 2025 07:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480064;
	bh=rGl4QjSoKK2+SbhVWRRtNC1El4VOWXYBbVc1P2EXWdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJHH5w0bCFhjooGe42U2kOEnmwjLmprQMBr8Ek5a1J6cl8auMWUbV/SKfHaE8131E
	 08IU14q+hwb8HU4b3Dr+JjuSOS1CnIcHp6Tv0rb3K4Q00HRoGONZ1hgt2LgvghVarM
	 4mai/E98rBTkBKCzPmXImX9G0nIPjtk55U9jqwOccWP7IPGNN/n+OiuanIwP8O4Tsg
	 K3iSL4DX+Algi3n2I+qW4NoJSh3wygFTYtY7Q8y3aplQqTmuxfzMRp94Vc96tMXqZC
	 GuKRyKuEKOL7nJ+eJ2PvPGfrwqUOStWE4NE+/WK1pB3brOXqKay/dYUnyd8pt9MK74
	 Ef9oye6LNchzw==
Date: Thu, 24 Apr 2025 09:34:21 +0200
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
Subject: Re: [PATCH v4 4/8] dt-bindings: phy: mtk-xs-phy: support type switch
 by pericfg
Message-ID: <20250424-witty-outrageous-parakeet-7c93cc@kuoka>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-5-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422132438.15735-5-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_003425_112649_CF90B974 
X-CRM114-Status: UNSURE (   9.60  )
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

On Tue, Apr 22, 2025 at 03:24:27PM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add support for type switch by pericfg register between USB3/PCIe.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v4:
> - changes based on comments from Krzysztof
> - change to phy type configuration controller/register
> ---
>  .../devicetree/bindings/phy/mediatek,xsphy.yaml   | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


