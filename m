Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CA5CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 11:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qM8s2aGAqq8d9mOeGsUcT1rmyd2K8d/u4x5LMbNc3g=; b=lfYpnzXvsXGCCeCl4uIKJ9XS4+
	GoNRe4egp7lMPJdpFOM4fA9LyZsEIzZqYKqb2gbHs722eL4LTD10XZYQc2/nNsi1u+QfD9rtzHbjl
	wzurOUFkzRtr8ldMHjgcK5ZgY1cYrxP6BwhjgUIy1hfyAeg1eB7PsGH6xbWHC6cRIICdyjQnyFkcl
	PJ0/wlghRzHVI41mrzI/QKLTiGz5Fijrm1jvVSvgRhNHFD/f3CjA9eL47H5bDVVQmP/mzKlhoK6W+
	wkR7XecOkvQ8m6xD0jrGgZseWxepoWeL7zy0fxVA5BJiuvzQIqnhEHI7wOBI47u3sLFev2Fe+TalW
	pgt87gbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eMm-0000000A9E9-1VIA;
	Mon, 22 Sep 2025 11:05:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eMj-0000000A9Dj-2wMt;
	Mon, 22 Sep 2025 11:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758539151;
	bh=R4tlWJgzes/Y4DKi4qcXXpLirntdDRaHq2QxnEkO0WI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K3A1IcUS1C5LiZIFZkICC+3I+uhRd2Cudsmvef2QmWxJO3L+1ZokRE0lFf82kKr2G
	 qMluh0T5op0YcZ9KAZ+oAMQpwxGTAqXwfIiU3Fcbq9+6X6xVxhAeayQsyE0ajcFpSF
	 0PvrwtfkyU6ZFXDYxHCOK92w4EpZjCQar3nK/6XzvzFtQGVpcBhaM7w6UNj912elWv
	 arwFBKwPCvUF9xlkKy7wS6p9SGaKSkMDjMdy8bf4vLNbH9vCJonQICrSjPCdC73Qkk
	 BqxfRVgbPebd85Vu9utTqJygdc4IbZ6fnM46A+JQ3QkT8PzugjWzGL4WVPXT7FPo69
	 MVqQLhk3iy4vQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3E5417E0125;
	Mon, 22 Sep 2025 13:05:50 +0200 (CEST)
Message-ID: <6657bfa7-9a6e-49a1-890f-81cf655940a7@collabora.com>
Date: Mon, 22 Sep 2025 13:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] ARM: Add support for yarisxl mt6582 board
To: cristian_ci@protonmail.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_040553_926532_2B4C2254 
X-CRM114-Status: GOOD (  16.26  )
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

Il 20/09/25 20:23, Cristian Cozzolino via B4 Relay ha scritto:
> This series adds support for Alcatel Pop C7 (OT-7041D) smartphone
> board, named yarisxl, based on MT6582 SoC. It also includes some
> preliminary patches. More in detail:
> - patches 1 and 2 add support for mt6582 to platform code
>    (verified by looking at generic mt6582 downstream source code)
> - patches 3-6 do some maintenance work to mt6582.dtsi
>    (I was unsure if squashing timer node patches into one)
> - patches 7 and 8 add devicetree and dt-bindings support for yarisxl
> 

That's simply great! Nice cleanup and nice addition - the only thing I can say here
is that seeing simple-framebuffer is a pity, and that I hope that your plans are to
continue with systimer, clocks, spi, i2c, apdma, mediatek-drm components, etc :-)

In the meanwhile, for the whole series

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Keep up the good work!

Cheers,
Angelo

> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
> Cristian Cozzolino (10):
>        ARM: mediatek: add board_dt_compat entry for the MT6582 SoC
>        ARM: mediatek: add MT6582 smp bring up code
>        ARM: dts: mediatek: mt6582: move MMIO devices under soc node
>        ARM: dts: mediatek: mt6582: sort nodes and properties
>        ARM: dts: mediatek: mt6582: remove compatible property from root node
>        ARM: dts: mediatek: mt6582: add mt6582 compatible to timer
>        ARM: dts: mediatek: mt6582: add clock-names property to uart nodes
>        ARM: dts: mediatek: mt6582: add enable-method property to cpus
>        dt-bindings: arm: mediatek: Add MT6582 yarisxl
>        ARM: dts: mediatek: add basic support for Alcatel yarisxl board
> 
>   .../devicetree/bindings/arm/mediatek.yaml          |   1 +
>   arch/arm/boot/dts/mediatek/Makefile                |   1 +
>   .../boot/dts/mediatek/mt6582-alcatel-yarisxl.dts   |  61 +++++++++
>   arch/arm/boot/dts/mediatek/mt6582.dtsi             | 142 +++++++++++----------
>   arch/arm/mach-mediatek/Kconfig                     |   4 +
>   arch/arm/mach-mediatek/mediatek.c                  |   1 +
>   arch/arm/mach-mediatek/platsmp.c                   |   1 +
>   7 files changed, 142 insertions(+), 69 deletions(-)
> ---
> base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> change-id: 20250920-mt6582-9339d7fceb34
> 
> Best regards,



