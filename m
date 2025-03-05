Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E89C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lgye2yM77foHws6u8c1JTelfKPLtmebETTQ0OAWFeyg=; b=YL9vXLwk/SxutmpEYCckkDV/Gy
	Ide9UdO5lspaNcDi9kpx5Pgohj5HZSH8mu+H3vhF6s8MTtMMGXNkC7ZNJc1RYNj8AfOx6NgMOl6Cs
	UXyTzWlhDToN610a4RWj7xUWL/vTy7zGPLCM2S9zL+llEqNXSeEjGdmmCP1L1viHAuWAhk8XsPRVT
	7Y5k5++cemTHyrJ0MQ8QVFn+XZBEbYONONRQE3GfYtWrghstgbtnqdN0+foaokS8j1CoNiBHC14iq
	fDGDIXBv4LDwHk1aypclquT6bK7evNoja/wjmw9yaQYwaYZID0unYTzJsvNElrMH42KatRkgRcliF
	BVZqnZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptKR-00000008uSi-0NKu;
	Wed, 05 Mar 2025 18:18:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsF5-00000008lNF-3P5G;
	Wed, 05 Mar 2025 17:09:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741194549;
	bh=WEjrtOD5SRlKTyy/y4mcSiqWzrehr6/dzujDScRVSXo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JIUlbDIHNioNd7WrpDtDuKtKn8bWX7d+oG8SQ2P2MeP9y5iWDknHOvrKE/09WnNbA
	 8HE+45oVuLOBSgwZanuL02KBAV1DJ47m1oHlQN6M+nWZoOi2jdUNTVrrFRMgYTmt8g
	 gWxQGel+PA5OQB/a0xCtVo6HemRRlBgwr2ruk6ZwiGgRsefROFVhmlNSDLH2YYwF87
	 hkoHuXC4rW0GsXoLOYfSNxbMPg0uAsMNk9pZMas6lS9yy/7DIOOqjcXoDm/nDh5XqI
	 WU6sj5qJ7VnEqU8r7daNnnI/GTSslVRAMwmGiWQuLW9m2myoALHlsnXSK8oSmaLvQe
	 64VBNtKkvYiBw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C659917E0599;
	Wed,  5 Mar 2025 18:09:08 +0100 (CET)
Message-ID: <dc68cb1c-0304-4ebf-ae38-444817a02f78@collabora.com>
Date: Wed, 5 Mar 2025 18:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Add jack
 detection with accdet
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250304-genio700-accdet-dts-v1-1-86d77c5cc745@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250304-genio700-accdet-dts-v1-1-86d77c5cc745@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_090911_997466_CAEDDA45 
X-CRM114-Status: GOOD (  13.73  )
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

Il 04/03/25 22:43, Nícolas F. R. A. Prado ha scritto:
> Enable audio jack detection for the Genio 700 and 510 EVK boards. This
> is handled by the MT6359 ACCDET block, which on these boards has the
> HP_EINT pin pulled high and connected to a normally open 3.5mm jack.
> 
> Add a phandle to the accdet in the sound card node so the machine sound
> driver can initialize the accdet.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

For the next merge cycle;

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> This patch depends on both "Allow retrieving accessory detection
> reference on MT8188" [1] and "Get mt6359-accdet ready for usage in
> Devicetree" [2].
> 
> [1] https://lore.kernel.org/all/20250304-mt8188-accdet-v2-0-27f496c4aede@collabora.com
> [2] https://lore.kernel.org/all/20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com
> ---
>   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 

