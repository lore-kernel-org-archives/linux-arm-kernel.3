Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B54C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jTRaPeLFxICmQzAMOqnQ7nrzx5ix2JLpEMYkLJQFNk=; b=4IMZKMXKvKxaoclq8NWF5M5EIR
	kQS3zpxACu/1Z8I7iglG08apOyS1JlICYmUCp967ImNVYZzI1u/wMJJwAexWf4lxP2yquGykpkSB8
	XgcxQCOJ40OlXTrppT6DjZfj39lgF7g7pY3pXT+tZ7jgPmAgNRdmCzznXXddBftmYKkUVv7cY1bjX
	zpxMJMc9XgxM2hPciENygD+FO/7XBHFCesFJieY8FUekrbXP20HQn28EW7V6zxtzMDCPyuencEGJs
	D1ZlQ2fndE110qvgvhatB3qgsVh6fP1GCWE4yZGJ3oSICxaeIp/wgVrzbbmP7UHNPqqvTBBvRMTsC
	ufG8vyvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLsm-00000009qCG-31XZ;
	Thu, 17 Jul 2025 10:30:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLqK-00000009puO-3P2K;
	Thu, 17 Jul 2025 10:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752748078;
	bh=kZAo/gWKz5R05BbdTMkuNvyoBn5ADeZBmyt+dfokfUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i2tfqxfPA271AfqEbRdi8hCJHi3qedj+kHeVNbbEE894k4HJEHVV/jNvgb9Toh/Bq
	 DpruPNCztV+FcO7a80k80d+WIU700AWXzuqrJ3fSLjaOAHNKFcOwjd8NAC8uZsGkl9
	 GjlBRkNolFxFaiCWo5wQyeOnEtyCIOCGisyBPmJ0T2k93xEVJFZGmqjFGIfM7WwuoH
	 Mt8ZPaUFaJpM03vPkAZyF8PaXVzeMbunxkw56TjOTKSZ+Ac59T6aJPocdHkqBfAicx
	 I92wDcy49czV8pDkQzoWZICWSFN+HTYcAmngcCjlkEnONoEOjqGqvF+Qg+aAM58/6Q
	 E2y5YF0Prdoog==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C1DB17E0D15;
	Thu, 17 Jul 2025 12:27:57 +0200 (CEST)
Message-ID: <c97f9e7c-4985-4e2f-aaaf-981960974212@collabora.com>
Date: Thu, 17 Jul 2025 12:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] cpufreq: mediatek-hw: Add support for MT8196
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250716-mt8196-cpufreq-v3-0-d440fb810d7e@collabora.com>
 <20250716-mt8196-cpufreq-v3-4-d440fb810d7e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250716-mt8196-cpufreq-v3-4-d440fb810d7e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_032801_007790_D94DF968 
X-CRM114-Status: UNSURE (   8.32  )
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

Il 16/07/25 19:51, Nicolas Frattaroli ha scritto:
> The MT8196 SoC uses DVFS to set a desired target frequency for each CPU
> core. It also uses slightly different register offsets.
> 
> Add support for it, which necessitates reworking how the mmio regs are
> acquired, as mt8196 has the fdvfs register before the performance domain
> registers.
> 
> I've verified with both `sysbench cpu run` and `head -c 10G \
> /dev/urandom | pigz -p 8 -c - | pv -ba > /dev/null` that we don't just
> get a higher reported clock frequency, but that the observed performance
> also increases, by a factor of 2.64 in an 8 thread sysbench test.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>


