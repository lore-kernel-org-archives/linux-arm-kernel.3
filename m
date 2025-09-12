Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BA0CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORJC7cWc9DQ0tyORlPWQOS5/87fYLYV/eRLmvhtL77o=; b=ZGkuGYXzOnEOn8jRBIhr0s2zva
	AGRRqD3STP66sc0UWfmSb5tDQxytuKVs7GtRyIIVvjwLYsQHXJ4Ua+Q6EcC/0L4w7o5BrA3/xLL/l
	Fpe1U8/ijR2xURky33EgJxeQcIS9a84ioWfGbW7+v/3qPFNgq7ZEbiRBNY0wqLdI52srOeKSXYHTT
	3TxT8VcOCjdsRpKne+rXN7PD53EbV0deAZMMi9phFgWwGcJbJJt3NHrEgT4hib3uggYDu+ewOLgm2
	bxWtMxBY3T7olgtrj3ASor6ww04h0G4ycLVikiDDaO4Oi26zNZcYq9e0Mv0DQjuvh0OFQLhpqaVhC
	S4F6Mm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyuw-00000007qdg-2zgM;
	Fri, 12 Sep 2025 08:14:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyus-00000007qZD-41op;
	Fri, 12 Sep 2025 08:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757664806;
	bh=PVzSvXABa8GXSjgAUepECwM4ACTyEKcHNTczAbtBCjU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R0dWqSGHxdsV0gXXW25c4EibkmCsCm2OPiHlXMnpPIBKSNJie2tyslyzzq6WNg2mF
	 rTwsEjaY34TvtovRAl9MZ108lQd7YytIzGM1DzsUn5QAxtwqs8N0bTv9DBh7vzwJ94
	 lrtktDu/FiCs5ZLZpuclhTOZSrhqz5gmv7n0TBU/W+IkBcDcOCJLUTVxwTsQhMvbh/
	 u3MgQg7a2cB2EtIxANExKbqnJXQiwHuPLX9ECknbYnHbgiIvg4YDMEAxr8oiv3e4uZ
	 bbyCjLrIMD5otaK5/0pn12bBoxXsZPfP53ATCpl+6SIavMPIkFGRwJH96tVnfQt8qJ
	 B5EU1dBwHXOcQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3FAB17E13B8;
	Fri, 12 Sep 2025 10:13:24 +0200 (CEST)
Message-ID: <3526ce55-41bd-47f4-ad8a-118a4b14a076@collabora.com>
Date: Fri, 12 Sep 2025 10:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] dt-bindings: input: Convert MELFAS MIP4
 Touchscreen to DT schema
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-13-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-13-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_011359_193175_A34FDB46 
X-CRM114-Status: UNSURE (   5.74  )
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

Il 11/09/25 17:10, Ariel D'Alessandro ha scritto:
> Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
> controller to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



