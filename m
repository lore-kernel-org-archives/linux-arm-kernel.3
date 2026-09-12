Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEABC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 21:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8//k2tt/DAzpaRSDYkVVEJC0drkQwp8Q2YveHgNVO8=; b=kWZ0PPFZi4Eqp6uZcSopYzYYD3
	yjCh4AjmP6B0d0RAOV+83pf0LVDyToPJEneoZo3Dx5RkhH/9gG/fVZeY09/o5Hq7PZJceOUVemKLK
	pgpVFpSVg5cCy5UmCXL4C+jKZxaTuhNjHAjFozacfxTh4mANoqP5rDKZNgPaXCUnF1e86WkTTdTDa
	PUponBhhPDTb2lDCwZCekRPA0CFoKwzWBehge8i92yc6r7qA+cT0bHoZqVKDhO4yvux9Ae+L8osTt
	8dCs9GfZUhjJ7bf01+7GI+BZD3+YJ+7Lje3/KxmFq2Sg0N7P1rPN8SVLECbf5dmJ0wgnLVdO3wv4y
	xabR7q+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5V3J-00000001D2c-2GD3;
	Sat, 12 Sep 2026 21:14:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5V3F-00000001D2I-3PHQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 21:14:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8009E416FA;
	Sat, 12 Sep 2026 21:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9F41F00893;
	Sat, 12 Sep 2026 21:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789247660;
	bh=/8//k2tt/DAzpaRSDYkVVEJC0drkQwp8Q2YveHgNVO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N53qReGzBEacqG0KFHEgGPHjZ40KVMKr9Esf+xzdtWIEqd+J56EQYz5Kox6MjxFEW
	 zpqxX4EjeLZs1rlUuRn+pq5DbHIeetnzjoS8P9zCNzA3gq6OdYQJZGAMX6bIc7JDoy
	 4EpZPckk6jYw3bGyGSDoTFtvc58ClGFJe40byLOU9Y/DCP6pd60GIkmH2QRHPrpn5m
	 Dy+Bwu5u8LBgt5xre1asnF8kI3naoQKogFJTxv/S6VxZMeLairz/honP1TMGxGaebx
	 Tdz3yOXUVI6GcxqwVXFpyGEGxPkjtAyfs1b/xxoF1BVToIzXIE6TzgG964O9ug2oJf
	 7hyWIbuk/wNnQ==
Message-ID: <158e15df-f8a0-43a0-9f92-fd4e64b06b1f@kernel.org>
Date: Sat, 12 Sep 2026 23:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Initial Apple Silicon A18 Pro device trees and
 dt-bindings
To: Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260911-apple-a18-pro-initial-devicetrees-v2-0-08d06cf011d4@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 9/11/26 18:58, Yureka Lilian wrote:
> Hi,
>
> This series adds initial device trees and dt-bindings for the A18 Pro
> (t8140) SoC and the MacBook Neo (the only Mac using this SoC).
> It only covers a minimal amount of hardware, but is nontheless useful
> for further development work. The hardware added here has remained
> largely unchanged from the earlier generation Apple Silicon Macs.
>
> Similar to the M4 devices, changes to the m1n1 bootloader are required
> to boot Linux on the MacBook Neo.
> Also, SMP boot depends on further patches to avoid WFI and WFIT
> instructions [1][2].
>
> Merge strategy:
>
> Since there are no actual driver changes in this series, we'd prefer to
> merge the dt-bindings changes through the apple-soc tree once Acked by
> the respective maintainers.
>
> Link[1]: https://lore.kernel.org/all/20260804-arm64-idle-param-v3-1-d10f8159062b@cyberchaos.dev/
> Link[2]: https://lore.kernel.org/all/20260811-idreg-override-wfxt-v1-1-1c71228d0719@cyberchaos.dev/
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---

there's a single typo in one commit message, otherwise for the entire 
series:

Reviewed-by: Sven Peter <sven@kernel.org>


Sven


