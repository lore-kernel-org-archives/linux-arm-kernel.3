Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212AEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4Gk/KrA8oPkicJVowBlr4OYC5g5B4WMnn6lUSReaTQ=; b=DAdggLRffoVqRnEWvPBo1/lLJ5
	Y1lUoQxAOMEv+fGfvhRaUUJH5+NGopbIIjGZrNFeE8B4fdIAW4caL76/ZiDcTDFlcbN7v7o80TM6H
	Z0hp1tS+zSPeo1jszTB8D1edP1YwJfqevouXtDC9eROPFee8ZQwTVvR9n54t25ynVHhniWI/eRGpq
	iDsJR+fcxoPpV6wywzAnlTyxeD5aOn0vrXwceP60wB0zoLWQVv51TSA7Yd4IEdFLRFej/DIlvYfQt
	jiAe4/FPpUTolfQ5sowQwJZn1RDJUDpOfZQl9xKQ7L6Se3WyDdhWdhitE17EIjZKFuldlpHImk6pa
	7Efl5x7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEIJ-00000001aJs-0ldz;
	Mon, 14 Jul 2025 08:12:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDzu-00000001WmU-2PXe;
	Mon, 14 Jul 2025 07:53:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1F05463A0;
	Mon, 14 Jul 2025 07:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA81C4CEF6;
	Mon, 14 Jul 2025 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752479593;
	bh=WyBsH6Kxr3hdAgdiGisPWnZhro430nfyV/zbVdiDpHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdGuz8X+SZTnxwRMQ4Ku8I12IdU7nKmsXDcpINxZz5/DsmmIHHJpfNLG8lRvr22mh
	 a5SvxkgfZhurFFI+qwC4YuYhdlIpFrS1UkEf724svoHxVTdNGATDEMS2RDNGDrkEwV
	 FR1Rm7RfhP3mhKOIJKIqfWM33qJNgs9uEDbC7t4b9SnAt1uI7cy+C6681LoIrZxkJU
	 jVHUnuM/NIlMd/sDXGrBLAduvled/NyiUZMqYPe2dxNUluVeOmti4bGcafgAVreiQr
	 PGFQJ+iOakMytLzmYAcfjfVh1uNfP5Fb00OfGRczZeI2xG24R2vXH5souGsXCIKz3h
	 sGucDBULIbGvA==
Date: Mon, 14 Jul 2025 09:53:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
Message-ID: <20250714-subtle-ambitious-penguin-c4a8c6@krzk-bin>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_005314_658113_95B1797D 
X-CRM114-Status: GOOD (  10.10  )
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

On Fri, Jul 11, 2025 at 05:44:56PM +0800, Cathy Xu wrote:
> This patch series introduces support for the MT8189 pinctrl driver,
> include the driver implementation, new binding document and pinctrl header file.
> 
> Changes in v2:
> - Modify the coding style of dt-binding.

This is too vague. Anything can be "modify" and anything can be "coding
style".

What exactly happened here? There is also no v1 link to actually check
previous discussions.

Best regards,
Krzysztof


