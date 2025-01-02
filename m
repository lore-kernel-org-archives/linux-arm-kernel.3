Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FEDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mA151M2qQJbuVYNevwkmHnHCTqTmgewVpxXxQowzE3Q=; b=uAIcei9uZD6IUhqO+FFEbmkIaE
	kQgiYggTkL0FxpDEU/mha0vAe6BAXbOHRZuvFbDk25aznZ0HWCtph0SwFDyknm2z8Hf4PA3/zPCkI
	Uon7xAfGilrfrG/lSy23QUFZ/7uYtfqNI1PLTS9pqfdHXfM2ZwGDVBiI+pPOOn5HCA4LrfBMLgaWE
	1sX45r048CpAZ7kPTNQgh+R3rRMR7i3tPP8hyif0pUqo45e4YI7wj7UMCjKuDU92wswNPrcrKum5A
	JDxfEg/q1mVghl7sZuRbdeXk4jspdJ1fLart/p/GFZ3mXNtOniz+B3QHmWPJw+RG74ZdGZDxAXx2D
	FhRI5Z0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKcN-0000000AO1h-28mg;
	Thu, 02 Jan 2025 12:48:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKar-0000000ANcR-0C1X;
	Thu, 02 Jan 2025 12:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735821987;
	bh=rPO//rEZigCKZoPA2paAhefsIjAROiOVo9/njcMMDyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ilhao3Ge3nqqAM5e0osgKqmIa1ciLQWuDU01ki117UmipDGQLJIJi/UIPISWToIYs
	 QKrDKIuEYwpF+OxbNlNaO0+KqyKqljNZdXlyqLZIeoyzoCT1k7yPBPJAqsCCd7xITU
	 PBCnOie3otlpOTYOVFKDFo7uEm7fy7C7S+EZLURkqzAglbFsWzIiSlhycNi+fWGQBF
	 S7miQjwpoLSukrroioioG7hMq4Ad1zMXbIH1nRQ91QqkCty47LQpck0PB4NQgUM1lt
	 IPHu+Ll+FFELMGuFBheAu3QH68RuKskt73j7qLoBm2vNcdVoYV3q9bBnCkxDeFZcys
	 Qq1bSM7LpsETA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C7FA017E156D;
	Thu,  2 Jan 2025 13:46:26 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241217085435.9586-1-linux@fw-web.de>
References: <20241217085435.9586-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v7 0/5] Add pinctrl support for mt7988
Message-Id: <173582198673.163596.6578000235046486411.b4-ty@collabora.com>
Date: Thu, 02 Jan 2025 13:46:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_044629_246621_2D0DED9D 
X-CRM114-Status: UNSURE (   8.90  )
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

On Tue, 17 Dec 2024 09:54:25 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series adds pinctrl driver, dt-bindings and dts node for pinctrl
> on mediatek mt7988 SoC.
> 
> changes in v7:
> - add const for pins and mtk_pin_soc as suggested by Christophe JAILLET in v5
> - left angelos RB because of minor change (hope this is right)
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[4/5] arm64: dts: mediatek: mt7988: Add pinctrl support
      commit: e2e02b57f5689b37640263b152edf1997f26b081
[5/5] arm64: dts: mediatek: mt7988a-bpi-r4: Add pinctrl subnodes for bpi-r4
      commit: 6aecde28d98b66c7d526caf4e8a3be046776b727

Cheers,
Angelo



