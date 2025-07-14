Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7B3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFbiOjU5CleqjHaO+U7EQsSj6vbo/WRsUqE8E9yh4ds=; b=x9mFJZ/1sIHTImOKZDlUbQYe9D
	RlZ9IrZxCcRgd1JpMwxK+/9/vq7YBQSn68AlW04Hlo6a7E/bvSxJ91P3qZILKsUXKa4RGjr0tERaq
	QUpWarxuA90rkRcZJXetQ2ZSLZIFNN/2+TrhJsdCOZbqgEEsTG41N9ktYL1N6/juZrDhKradE3R/1
	cPaiOPVLso6aLN7UmQ5gKjKN6Yuo2VhkneUalOKKSD5oue/NYsq8E8aDkobU+wu8uZhhHZkneZXst
	tGxqgiQ4sZRHTeTYRHmmnw/fTKI011tq23h+cfvd/tnMzYoNEEZ+i78uIqvKy5lYNO7VXPOhFnRj7
	uq+PpevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEue-00000001h7h-2ys0;
	Mon, 14 Jul 2025 08:51:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEqW-00000001gXN-3Sjb;
	Mon, 14 Jul 2025 08:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752482854;
	bh=2yuai8UnBb9zpoj2Dz89OXxlnRC1pzOFSWPiKRkdFpQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wzm4jIIJtgJreaN92gm42sD6apc9wRY3xZ1FVNYWbhJdyNsOQ5Q2QlelUTgRDWdT1
	 freAjquBex0sEw9hjUvBpuL8JT0WGHkQXXrcZI0NxnAbxn5mKPsPQEE3qn433KL59C
	 gk/AASg+Ww7oar/9ABMOmCgdtmYBEq+iSjCsWjYt6diX0almRkMLN8XdnSDts+tdW6
	 pif5SfJrOYi6KT0FoHbPAyGzmIZH5MKi5r5vuBjoho0+whjaoKHq0JbxKA/Op/0Hdi
	 +gFiN36PItGgd9myBZxQ51R7NvyS4fCtVOZWTi7nLoyStTlkbav/wvIWmP6B/Wf3aL
	 fy9IlPEXbSnyw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 49D4C17E056F;
	Mon, 14 Jul 2025 10:47:33 +0200 (CEST)
Message-ID: <4537173f-7f79-4629-a2ef-cbf1edd2ed81@collabora.com>
Date: Mon, 14 Jul 2025 10:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: mfd: syscon: Add mt8196 fdvfs syscons
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Hector Yuan <hector.yuan@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20250711-mt8196-cpufreq-v1-0-e1b0a3b4ac61@collabora.com>
 <20250711-mt8196-cpufreq-v1-1-e1b0a3b4ac61@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250711-mt8196-cpufreq-v1-1-e1b0a3b4ac61@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_014737_050777_7412DAA9 
X-CRM114-Status: GOOD (  15.72  )
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

Il 11/07/25 16:57, Nicolas Frattaroli ha scritto:
> The MT8196 SoC uses two syscon ranges for CPU DVFS that are separate
> from each other. One, mt8196-fdvfs-config, is used to check for a magic
> number at that memory address to verify that fdvfs should be used. The
> other, mt8196-fdvfs, is used to configure the desired frequency for the
> DVFS controller for each CPU core.
> 

What is the reason why you're using syscons here?

Can't we simply assign the FDVFS MMIO to the cpufreq-hw node?

Or is there any reason why we can't declare it as mmio-sram? ...because I'm not
entirely sure but the FDVFS space should effectively be a [c]SRAM memory range...

Cheers,
Angelo

> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 27672adeb1fedb7c81b8ae86c35f4f3b26d5516f..5ee49d2ba0cdb72dd697a0fd71c8416ad4fd2c1e 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -88,6 +88,8 @@ select:
>             - mediatek,mt8135-pctl-a-syscfg
>             - mediatek,mt8135-pctl-b-syscfg
>             - mediatek,mt8173-pctl-a-syscfg
> +          - mediatek,mt8196-fdvfs
> +          - mediatek,mt8196-fdvfs-config
>             - mediatek,mt8365-syscfg
>             - microchip,lan966x-cpu-syscon
>             - microchip,mpfs-sysreg-scb
> @@ -194,6 +196,8 @@ properties:
>             - mediatek,mt8135-pctl-a-syscfg
>             - mediatek,mt8135-pctl-b-syscfg
>             - mediatek,mt8173-pctl-a-syscfg
> +          - mediatek,mt8196-fdvfs
> +          - mediatek,mt8196-fdvfs-config
>             - mediatek,mt8365-infracfg-nao
>             - mediatek,mt8365-syscfg
>             - microchip,lan966x-cpu-syscon
> 



