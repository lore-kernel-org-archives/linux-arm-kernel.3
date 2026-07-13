Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB40C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIw2BCcTyrAqvybZP6qCfsnARhDfIWS5/tpUpJJR3CY=; b=XNStAY4OOBKb5OQ0Virj3RssqP
	SBVQ4FEVjQ/4KmL1VHblGNf05QjWGwg4GCXBgIGpKEHq2PeVp4Voxm+GucqqWI8XhPEeiUxnnyhjR
	EF6zhHviPmIMjizzVz31DzRUILPIwokXST0xR9ScZPdiqA2WTTovmoiSQaYwER//RocMq4rj4vw+w
	a8KwVWg1udWDqYROIpeNG0QDt/uc9PtXLfjKPDqfZ32NhEpnDGppIx0VIspBwofNCH+ULcd/q4pJo
	gQg75c2wxbzeMFUehh4s2oEgGNaZ5PKXyTfdog1kXESeCO6pk1eYGcnH3xExG/YHSDXrtY1LbucNK
	bulTLW/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBC9-00000008RzQ-1W2c;
	Mon, 13 Jul 2026 07:35:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBC8-00000008Ryp-2kiW;
	Mon, 13 Jul 2026 07:35:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EBBA7401FF;
	Mon, 13 Jul 2026 07:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F6F1F00A3D;
	Mon, 13 Jul 2026 07:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928115;
	bh=EIw2BCcTyrAqvybZP6qCfsnARhDfIWS5/tpUpJJR3CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CSZqzrV7G2b5txZPBXw/5gEKu5V8zJeTh/qAVraJT7A8/OagkLNYIGIQRNhKZI4PA
	 j0zKeQ2Jylb4EVdjfow1luPl/VsFGKWaUvlcBEuMmYVYKpCvbWUlg/q1XoP0xkSbBX
	 421dggl0kNTWQV8CkMwCryXAuV7To21EwND7YKIDINYVv96CrzmXVEGsCfgTUgTlnh
	 jr/GXPxAoFOPuMXr6TEFh7uKQkpBwg2DQhiR8fL0aoWV3L83FSTMTTShH8uCmAvbzD
	 ssZASH2hr4jcY1MQeqPoWT/rSxZnC15EVZWi4xzz1+xEK7299xS/EHvvOrYWh/nDsG
	 KRQ9JBX8aEUZg==
Date: Mon, 13 Jul 2026 09:35:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikolai Burov <nikolai.burov@jolla.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Nikolai Burov <nikolai.burov+review@abscue.de>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mediatek: Add MT6858
Message-ID: <20260713-gifted-loyal-labradoodle-a54aef@quoll>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
 <20260710-mt6858-pinctrl-v1-1-f75ab558f0df@jolla.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710-mt6858-pinctrl-v1-1-f75ab558f0df@jolla.com>
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

On Fri, Jul 10, 2026 at 06:00:23PM +0300, Nikolai Burov wrote:
> Add new DT bindings for the pin controller found in the MT6858
> (MediaTek Dimensity 7100) SoC.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
>  .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  | 190 +++++++++++++++++++++
>  1 file changed, 190 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


