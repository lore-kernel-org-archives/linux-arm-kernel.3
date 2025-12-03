Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB9AD1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i20hbqvP55IyXBV4D2jMT+oxFvBKY8IKEVZOfneP6RQ=; b=oZRSVNuGpbCas/P9zwBbnCZ21r
	UGDGkpPz5aozeVhw68L8Tw0zppwx1zJIdT8Qj7IogsWUihSkdV+OPLWR9GqhTGjOpE/xqmfRpuAF0
	j4mMrRV6l05ijQjdNk/dZP0uFRCsGcoVthQ9u6WMZkpb1p/iolMz9r6B3GVyzE7nibq9azKmW2L8/
	GFlYwisonmzMgMbJ9nU9hv5+8P0AK8455K2tH9nJp4Y2JHb/8sxl9ICP04GDCMIVLMcXxxmZWqM1t
	FflfWfWZzNcFMFfSQLfpEfGG8pFhn98UC0AmpckFeAd6fPwkcUo6IYn/c2sziOMyO9LPaoSk5P9bZ
	L003rUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgmN-00000006Du5-2Grf;
	Wed, 03 Dec 2025 06:55:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgmK-00000006Ds0-0sMr;
	Wed, 03 Dec 2025 06:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764744952;
	bh=gsFLc2zmBo4F0KsnAgDtyrBQx7AbnJC6RqAr81QjdDw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CW3CAbAsmQxZbP/bT7Jc5sJlHtZtm1JVemPgee+ntOP9RUamxGioEn5u7EPa2V1YH
	 +KI9gQlHIf5/OJXFDM9CwMuRdk1Tl/B6cWWaV4JJWNqLNvs4BaOIC4ZDUN3jfECtc/
	 f/bw/7ufv+R70i2nPRrXKYPhQJVvncUpR5gYOOoChCfB8umRDluYPUI5hZls0iQBmI
	 av3PoOycawILqjd9OAlEAje/J00g0NkVPjp4QtW2eaNGBphd5Ty+H3R3vQj/Ky56rd
	 Ne9g/Bk9F2asktVaMieoEHGQpiu3I+6Soco22FYZKQrdGsQp8yzZYVlY4jXQrn89Fy
	 890gylMhtHUVQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C0E117E0330;
	Wed,  3 Dec 2025 07:55:52 +0100 (CET)
Message-ID: <7b09d179-be5f-4daf-bb74-c1420a3b6fa8@collabora.com>
Date: Wed, 3 Dec 2025 07:55:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: arm: mediatek: Add Ezurio Tungsten
 entries
To: Gary Bisson <bisson.gary@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
 <20251202-review-v4-2-93f5cd2a0d4a@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251202-review-v4-2-93f5cd2a0d4a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_225556_431629_F7296FBE 
X-CRM114-Status: UNSURE (   6.29  )
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

Il 02/12/25 23:08, Gary Bisson ha scritto:
> Add device tree bindings support for the Ezurio Tungsten 510 (MT8370)
> SMARC [1] / Ezurio Tungsten 700 (MT8390) SMARC [2] + Universal SMARC
> carrier board [3].
> 
> [1] https://www.ezurio.com/product/tungsten510-smarc
> [2] https://www.ezurio.com/product/tungsten700-smarc
> [3] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



