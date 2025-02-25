Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCCAC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGJSRmgQRhD/vAURW3zd5P/JOlKtOZiz4tKRljMEGkE=; b=eVMXJ8U0mTAoyeA8jg/uTvO0cM
	3eqqT+KV3KUGk2LV5nb58nEoVYwxR8ScXph4QkHoP967t96b+dTwU3j5dAFj/z4YfGGVM3GUpGyHv
	+zv3ZVbWeIsQvr+Ka+G9FPQ1f8sdLZTshKjGRdfhxfOokwAhkUg0j+A99+ba4K245LwHS0jTb8Yc7
	gxuz72hR7R79g2xcNTGKYXIAUYc3ygCfVxwGAgfQhzL2SqYRaOheS3WHsIJeL4+K7GLOm7aXsp4j+
	H4/knFjR4Fqumzni12k1DaPKZQNk2dM8n4yi2rKNhPUx8RhAD7C+o36ZoIp95gXCsnxOSFcwefFCX
	nU4GzJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy06-00000000KGa-0P8T;
	Tue, 25 Feb 2025 16:41:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw89-0000000HYxT-3mqb;
	Tue, 25 Feb 2025 14:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494511;
	bh=U2rDAp2I+pEhncHzmJrv7C++lv1LF8quvUr6u9b2A/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=czpa0L6fN4pM3gs0K9KagK4E7nG3OeMJE7PRBuQY3Vng84irHlgvSuRKIlHEb/kYe
	 EIjk9P8PwWmbYs4lxFwUgzxRJtepol3TGS/yYHnqHdvqNLcV1WWXxtAsVMb6yu9Wk/
	 5KLSCQWoOzOi6jJ+HowDKh8MLp0MhGHA/iNJUt9zzRZCd9Aq8uQQINwOr57I3af7Kn
	 eFwGZRvzDMbcFuh+UoNlk1meTdg85U1OpeoO4nCEzzRlLPUskT7TCbb8bCQLodNriM
	 KjuwUNS9SUG2smReJP1TpbWsed0+ep9lJnVSe7moF5savq0IT5PnLdpRyGVVvow7pJ
	 MOqy7paOSaJUQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C29EC17E0DD7;
	Tue, 25 Feb 2025 15:41:50 +0100 (CET)
Message-ID: <d3b65950-23cf-4f7f-95e1-dcdc54d15bd2@collabora.com>
Date: Tue, 25 Feb 2025 15:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: mediatek: mt8390-genio-common: Add
 delay codec for DMIC
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Zoran Zhan <zoran.zhan@mediatek.com>
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
 <20250225-genio700-dmic-v2-8-3076f5b50ef7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250225-genio700-dmic-v2-8-3076f5b50ef7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_064154_113531_9A19761F 
X-CRM114-Status: UNSURE (   7.77  )
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

Il 25/02/25 15:33, Nícolas F. R. A. Prado ha scritto:
> The signal from the dual digital microphones connected to the DMIC_BE
> takes 30ms to settle after being enabled. Add a dmic-codec with
> corresponding wakeup-delay-ms to prevent an initial "pop" sound when
> recording with the microphones.
> 
> Co-developed-by: Zoran Zhan <zoran.zhan@mediatek.com>
> Signed-off-by: Zoran Zhan <zoran.zhan@mediatek.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



