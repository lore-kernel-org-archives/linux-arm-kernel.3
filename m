Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F5ACC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 15:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YlEgaPd6Z9fewZ7p5vLaAWBLu4XzO4vJo9oCsPW9P8=; b=nNxEl1B1plB54PlBKK5wiXpNcm
	UEtcVyuM15yTpBGMigSC70CQLyJ3MuhglNeIFPzt4vv8xi49diFbhUM99I43WTUIWwtilN5FIkJCg
	NCVvqCWZ61UaBO7eo/RTgL5IyTtS0YMlGlsbM3mawO0/W3x4zmwNRXChl4Uz8Yv8Kne0F9YcNc/4k
	KpsQ1Y6RZeiFgdylOAW9k/5HBOCeq4ZpxCAIlmjs4pr9tvbeCFIKRCfibLEElbISKtty1PTOUhFF4
	6AyMuvaUMqsYHR76BhhZh3t/RiWUq7P4goeqEjRcGNQMr6aS8qMyg2hQcD4F7YEbWd8m0hXue3AEK
	tZocxiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0dD-0000000FoUv-0hPD;
	Wed, 14 Oct 2026 15:11:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0dB-0000000FoU5-2MeM;
	Wed, 14 Oct 2026 15:11:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C20041729;
	Wed, 14 Oct 2026 15:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D99A1F000C4;
	Wed, 14 Oct 2026 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791990660;
	bh=2YlEgaPd6Z9fewZ7p5vLaAWBLu4XzO4vJo9oCsPW9P8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eXPRJoggwj6+DA4iIScqU4MtBIaL6nrzRe984mex7+vl4pDsGwdQT7xoHxuSz9SMH
	 eZMrxgsaVQzgkLdRZW8g0JOdt+gEx0jjsk/MTAZz6d59buSDsb3Ozm+Jh80V8PGe6j
	 ppd1a98OQmjrcO+ZoTQ9T0/eg5n3tT6ePG/0+91m1+WdQXP5Jm/Jer2gfOToQ8XY1s
	 XQdCXlIa9CIVAkuoTSA5Y8UKbz7wcohIo3e8DGbZzAgDzhdpRtC9aTzEhbK8FlUtRc
	 bsrqSV1eViV7HkfoRSER/LE95izqw96AF0rbAAs18FwOKrMXWMbCiOmt/Ol2yFwk7P
	 GcZbxtpzuME8w==
From: Lee Jones <lee@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260921-mt6323-nvmem-v5-1-2f5d308369f0@protonmail.com>
References: <20260921-mt6323-nvmem-v5-1-2f5d308369f0@protonmail.com>
Subject: Re: (subset) [PATCH v5 1/3] dt-bindings: mfd: mediatek: mt6397:
 add mt6323 PMIC EFUSE
Message-Id: <179199065731.1183599.12412463994737288833.b4-ty@b4>
Date: Wed, 14 Oct 2026 16:10:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Mon, 21 Sep 2026 10:50:02 +0300, Roman Vivchar wrote:
> The MediaTek mt6323 PMIC includes an EFUSE used for storing calibration
> data.
> 
> Add the devicetree binding documentation for the MediaTek mt6323 EFUSE.

Applied, thanks!

[1/3] dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE
      commit: 017b13566a0dd41188ccea52f9c7cb0074ad8cdc

--
Lee Jones [李琼斯]


