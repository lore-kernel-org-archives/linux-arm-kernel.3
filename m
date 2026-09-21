Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B525FC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDV7ej+Ox1nQKHx/ew3bMhanMK8N1Rijzwg3wqZsevM=; b=TI6hQZwiwadAbPSn5+hkG890A5
	1JgI9WrjY4OZED+rxP8X6cm4cTMciWWiCIJzXL+YTceVAnlHObcG67ZJa1r8ILzHeM+UhJ1c/PO6Q
	+fg1BLlC3ptqUm4h0uVlDpVFnatoIVjojLOeW213mbZqDh9bH5aLIA/pA7JPYtxIDggq/qyE4bjRs
	qtCtBK2K0Y7BkTlajElFBPPtc5NFcEAhpsxod56WsnCQGZMSOld+uFy4BQBOIg3vTwXo5QInnMCPz
	zyBuBqarYPJ6v6dKFxYwcXwFTA0oiZG/n/ff5cFmysLVqR3Z0nD2936mdnzOZ0/6Zo2dZxfNh1slz
	0xaCwm2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aLi-00000001W6o-2YnN;
	Mon, 21 Sep 2026 09:30:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aLh-00000001W6b-36zc;
	Mon, 21 Sep 2026 09:30:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27E8F43222;
	Mon, 21 Sep 2026 09:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA9E1F000FF;
	Mon, 21 Sep 2026 09:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789983009;
	bh=fDV7ej+Ox1nQKHx/ew3bMhanMK8N1Rijzwg3wqZsevM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=T6EkPaW8nl5RG/Vrh5zOqyl+8Ps/1gi42E+fU8sO/VxI5JycNTK5ponQGxnzZdn3L
	 DJZjxsqg5xDiRvEj3pZ9GKOV9t5nO7HjNpqnMw3x6TPbd+LP47KW4JmWdCtQlkaxTJ
	 1Cxhv7j78QOF/q3ohDJHw/DzfogmHEvUpte9i7vbKSI4O8ZRp+F5SOtkBLiUmBbvAg
	 zXsZvUwaL2X5+2bBwblJNxkEF8i7CLtp4v+8ehb1qu5LGVWlYxpAbdN91sALGYkflb
	 dsR6LY+He8uO1ODCjKpl2C+fAsZJ6eoY00roHxzQNufj8AJ+xdBcfYpW2PgqHrlRso
	 L/Tif4pXiKUkg==
From: Srinivas Kandagatla <srini@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260921-mt6323-nvmem-v5-0-2f5d308369f0@protonmail.com>
References: <20260921-mt6323-nvmem-v5-0-2f5d308369f0@protonmail.com>
Subject: Re: (subset) [PATCH v5 0/3] nvmem: add support for the MediaTek
 mt6323 PMIC
Message-Id: <178998300288.889964.6727834790176967515.b4-ty@kernel.org>
Date: Mon, 21 Sep 2026 10:30:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Mon, 21 Sep 2026 10:50:01 +0300, Roman Vivchar wrote:
> This series adds support for the EFUSE found on the MediaTek mt6323 PMIC.
> 
> Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
> mt6323.
> 
> 

Applied, thanks!

[1/3] dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE
      commit: c29abe7af10aa891da6c0b68274258232ee3a1a7
[2/3] nvmem: add mt6323 PMIC EFUSE driver
      commit: 70a3d85e936cb43165331b9ea470b311a5beeeaa

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


