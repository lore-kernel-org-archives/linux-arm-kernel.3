Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8732C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85legAFamZkGWcJVGBEbj3Ci4erJikI5OAxiXQSDocE=; b=qh2K4JHudWIhbt3ZTO3/qqtaEY
	0E6yBk4357/LKXKU7MGyxx8do4IVpMKcT0rDQVpfuXXkXqKrqQW6Ucw0Tptf5FQMmpEop+IkflUR8
	5jvUMxA7SEuy5A20WgUqk/6QB4DnLZ+IYRhYUs8ewClaT+Vl2XJHUJaiigmOqkH8abCAm0Gq+bdm3
	38Vgi3EQyh8CIX3N8R5RXcbuNhnCTfOJcKIcw3ukasQCFSGrcyvuU6x3jsZ2vHYwTWlHyuAIKFx+S
	/78sfyyJfV/enQumTP9SHtiSzhxAmTWf+j7gYI3EpRK8sZ9iGtEZGgowBWo1ZKzsTfPGwxMgXNW6O
	aPNQNz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgOy-00000002U91-3el0;
	Thu, 28 Aug 2025 17:27:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urci3-00000001kQ9-3mXZ;
	Thu, 28 Aug 2025 13:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=85legAFamZkGWcJVGBEbj3Ci4erJikI5OAxiXQSDocE=; b=MjSRELgmrGIxeWFYBilE6LIvRe
	hTXdchlJ7Z/o9a60hwZkjCo9zAh6N9eY941lpFPkKZzFQxR4+BuWB09cSNPquacZcF1CMAwb0KDwV
	iPinv1lS4X0WJPSfG1QmqK40JzFvgV9NpQBgjoGi0kCaSgapeeVEpdWNhcuUZBghNJoZBElVtMPdm
	MXUwOOXPzI6B6X7gRSCuxAgKB26prGIzTgZZElMhKVdX4ibptubxoBFOw5uIEfYSif1jztQ22o0lT
	84vJS0hfRiNtg0H63s3HNqRERcezXVbnx94754KUP/k6desPKt41QEPMaC2yaIYyo7aGB+fQ4XMoq
	o+sIwJYg==;
Received: from [185.205.242.134] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1urchz-0004qj-7U; Thu, 28 Aug 2025 15:30:31 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Ondrej Jirman <megi@xff.cz>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Add vcc-supply to SPI flash on Pinephone Pro
Date: Thu, 28 Aug 2025 15:30:27 +0200
Message-ID: <175638782389.3533599.13962706538099315140.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827143501.1646163-1-pbrobinson@gmail.com>
References: <20250827143501.1646163-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_063035_937093_D8175B33 
X-CRM114-Status: GOOD (  11.57  )
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


On Wed, 27 Aug 2025 15:34:58 +0100, Peter Robinson wrote:
> As documented in the PinephonePro-Schematic-V1.0-20211127.pdf,
> page 11, the SPI Flash's VCC pin is connected to VCC_1V8 power
> source. This fixes the following warning:
> 
>   spi-nor spi1.0: supply vcc not found, using dummy regulator
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add vcc-supply to SPI flash on Pinephone Pro
      commit: 497aa80ec7ee145b3606e7434d57091974d78598

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

