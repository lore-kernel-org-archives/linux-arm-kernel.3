Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9C9D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 23:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1tJIqCgWeq9KnSLGyhg/d7DuKyd1LAar9bWTYe6j9Y=; b=A3wAlyzvrlccl0cpkCq9gixUjv
	EY/h21N0SMqU9UPLlUPBuHB5Hmb+p79AvTC18a+9pgooIwU0ZaPkcy6aoK6Rm56HKqf2h3CSFGGDZ
	rm5ZAXDJUjfwfggXflc1cJF/NtNsE2bIIKPA77+a7GIBE6DZkZrTCEenjCAqCOF9CV9eHgTL1hPFx
	10vukILapDHvO8YQBAC1MWFZXMlZAALnWMQ+1ZHA85T1Z+i6f+3AQ21g0+TQxump89Pzgp7GrmKPG
	lU6wgae9/meVWNyRlJLebYXWtjbmO9QDTpXoM2+ghtlTsdYQtkFYu+udQ2nBBadP/8QHl541tlr3b
	50Y9/rog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdOv-00000001ZvL-18cG;
	Mon, 11 Nov 2024 23:00:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcNl-00000001QT7-2PFm;
	Mon, 11 Nov 2024 21:55:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50D4CA40A22;
	Mon, 11 Nov 2024 21:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0FFC4CECF;
	Mon, 11 Nov 2024 21:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731362136;
	bh=Ulbt4wtJrj0rI8CCkCKH2MYB/lSP1izaiuAWB+R5AAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PG1YbClYCgPJFMl42r3GRpF8dyrEDfjWHxsCTW4uWM/fk5P9+Erj8yhmYkZxHu/QG
	 9HFsD4yg9KkRPSsnkdUY01psgxfcB/RV3snn15Pw0dmj+5T3vAVeafD/AhctT9lmLS
	 MVXBWEF3Kyuj3jGQhPr3+Q7G59OuZYnrebBvIW8cIQjgz0C1PetFpqBk5Hch/xYSDY
	 /5288fShDBpc1vTup8g8MIrz1T1Yo522ixrq4oHD4QKLOjPWHheNEp/6hZvfrAOgIV
	 FNTKjvSsp4hLiA4Nk2AFF3cl6kLcAflBn59RCkOMiyXw6kOEflubamwnhf5TjDb3EI
	 6jz6o8uTGAVjg==
Date: Mon, 11 Nov 2024 15:55:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Andy Teng <andy.teng@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 6/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add bindings for MT6735 pin controller
Message-ID: <173136213324.2011108.6481544003216572759.robh@kernel.org>
References: <20241106100741.173825-1-y.oudjana@protonmail.com>
 <20241106100741.173825-7-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106100741.173825-7-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_135537_698093_5AFEB032 
X-CRM114-Status: UNSURE (   9.18  )
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


On Wed, 06 Nov 2024 10:09:20 +0000, Yassine Oudjana wrote:
> Add DT bindings for the MT6735 pin controller.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      |   39 +
>  MAINTAINERS                                   |    6 +
>  .../pinctrl/mediatek,mt6735-pinfunc.h         | 1148 +++++++++++++++++
>  3 files changed, 1193 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinfunc.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


