Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAE0CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kH/zjW2C9vFNpW+x//wSoOuLPWBCSMD6sNcP8TxdV18=; b=D2X6UDZOks+d+towevmdSiQv1R
	KS3LO3KM+RVObdtn71JEvhVGExJQSKF5q85uv5c54DszxJVSe9NXHpvZ4WXA+IqaT1o7aY+A8TNhI
	giY3A0Wl4uG1RMeYmxCB8i7KeXbuHIaywMR7SHtxyIbcJtyNP/lXDO5qYPObzRM+f5A3d9512y6UO
	a/oGm7RAhR35trAYozwWeI6EYEUR1tzWq5kNaUPdYISejB5H6mKBoq5qp97JrkEk+ma1e63ftkZTV
	6daDoBIhV3vwkBnupAVJLRo1E3svub9zHRCR1HWeAS4Odjh6XmBYwAr8Q5nvYlG6LxA45wJAGdqUi
	n88BxC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKPH-000000004fs-0lxq;
	Thu, 15 Oct 2026 12:17:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKPG-000000004fd-01DB;
	Thu, 15 Oct 2026 12:17:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7EDB41FBF;
	Thu, 15 Oct 2026 12:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0671F000C4;
	Thu, 15 Oct 2026 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792066677;
	bh=kH/zjW2C9vFNpW+x//wSoOuLPWBCSMD6sNcP8TxdV18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Qxyu6AE6nZcEnFpeDP1G6VIh/Anf1wZt9KopvjKUzAjQlGfp+olDhcwXHq5hFJbQl
	 Y/hBfoqEhLjh9YFtSpzl4XWO42EAKLJ7njc0TEZHmZBVDLz4BEHl1KmhsDiJJDcN+p
	 5Ip1aMQSUq7J4upFYBVLbmD2MdyoZTkeuUHGjaCJY1Il1ksNCOHkylBdwOEqXv0mGJ
	 aWANrpfTWHGAic3BGzDAnY+1nXHz+Q1jCNl90XDnny0WpS1YNiTOTm3TMyifbgw5gB
	 s9aOU26BoFOq1BJGxNcZZL7MxpyRHwk+eTaMNsHfp69Ts5PONRzaBtx+P0XS3fcF/7
	 dZfXf/DN19dYw==
From: Lee Jones <lee@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Ryan Brue <ryanbrue.dev@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
Subject: Re: (subset) [PATCH 0/3] iio: adc: add mt6397 PMIC AUXADC support
Message-Id: <179206667323.1910726.10765951043723632991.b4-ty@b4>
Date: Thu, 15 Oct 2026 13:17:53 +0100
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

On Tue, 15 Sep 2026 23:15:25 -0500, Ryan Brue wrote:
> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
> reach. On boards built around it that ADC is the only path to the battery:
> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
> boards use have no ADC at all, so without it there is no pack voltage and
> no state of charge.
> 
> Patch 1 adds the compatible to the existing MediaTek PMIC AUXADC schema and
> the header naming the channels, patch 2 the driver, patch 3 the MFD cell
> that instantiates it. The cell comes last so that no commit in between
> registers a child no driver can claim.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add mt6397 PMIC AUXADC
      (no commit info)
[2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC driver
      (no commit info)
[3/3] mfd: mt6397-core: Add mt6397 AUXADC support
      commit: cc6597f4e3b752de42249879e0c7054fd23628a1

--
Lee Jones [李琼斯]


