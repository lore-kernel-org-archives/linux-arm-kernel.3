Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6578DC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxXQkqIhX6I12bQkySYJXAs6hMwqsNTWqZQKU/lujJI=; b=H8TTSJU2XknoFVTZOdFFgAGQO+
	Uf+hRCd8vaYWGRzeh7nK5Zn6i7PrfRyKPPKfXIYc1b79nNmCsBOvsOcU2p9WWLoAyNrUi+BfAWe2R
	pI6STzlEiDigAz7YA1bOZuaaTjO8+SffgOv2WE7t6/zNLHXxe+/p7NFSq7/fBwZuu79FJeLnAMvoI
	GRy9syOtZSjpuR6xu9euJyoMc58HZA5s8Qz/sF4U0PabOCTRN5Y/sujg71Aet+lspQP4uGu2R3IHP
	zk1gB6+ZxJvTMBgdGApNbqy7+9zo+mLTlaXok/rSdPK6QQnUkvEC9wV9MVVOJuPfu8knihVM7b25u
	jcqjKJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Y6-0000000Aeok-2bfT;
	Thu, 06 Mar 2025 10:33:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7OV-0000000AT9w-1WpE;
	Thu, 06 Mar 2025 09:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741252793;
	bh=HaJSPixWk9LaPQTM/7v8ziJlqwgqjQtFlWD0716NMgA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YEpxC2nfGB56882Ka73HUj6sruDMJS5dK4rsbbJv3CacywU3xGTS+fkvrsZkHN5ix
	 JmSBie5uIbZyfaKJlQoIVqh+UzbjQaLGSqTF9DkOKU6nMwUSqZjZhiBzyL5mpUO42Q
	 +7DXScC4/SVm+y6d1jpa/s3rjPxq3BnifGor7uqhPacQ5WVLt00Ghx0UmtHGLTE/y6
	 CJcBrCTG8X+XI/GoszYcMqAkTwljE6Qezxbdo+ADxKoAZEYuu3+kvzBXk2TjNroPAz
	 6cMigYwHRGF+5V5EAV21ybE+9Ah9b2ddxTJ4L9y274KsmskIPFyxmIq0pSUIMkEtJK
	 RH52QjaWQugFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C53D17E0599;
	Thu,  6 Mar 2025 10:19:52 +0100 (CET)
Message-ID: <3e84fda8-2566-4f18-8ef9-850c84789c34@collabora.com>
Date: Thu, 6 Mar 2025 10:19:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mmc: mtk-sd: add single burst switch
To: Axe Yang <axe.yang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: yong.mao@mediatek.com, qingliang.li@mediatek.com,
 andy-ld.lu@mediatek.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250306085028.5024-1-axe.yang@mediatek.com>
 <20250306085028.5024-2-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250306085028.5024-2-axe.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_011955_586790_015C8C90 
X-CRM114-Status: GOOD (  19.98  )
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

Il 06/03/25 09:48, Axe Yang ha scritto:
> Add 'mediatek,disable-single-burst' setting. This property can be
> used to switch bus burst type, from single burst to INCR, which is
> determined by the bus type within the IP. Some versions of the IP
> are using AXI bus, thus this switch is necessary as 'single' is not
> the burst type supported by the bus.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

I am mostly sure that this is not something to put in devicetree, but as
platform data for specific SoC(s), as much as I'm mostly sure that all of
the instances of the MSDC IP in one SoC will be *all* using either single
or INCR.

So, I think I know the answer but I'll still ask just to be extremely sure:

is there any MediaTek SoC that has different IP versions for different MSDC
instances, and that hence require single burst on one instance and INCR on
another instance?

And if there is - is there a pattern? Is it always SDIO requiring INCR or
always eMMC/SD requiring it?

Regards,
Angelo

> ---
>   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 0debccbd6519..6076aff0a689 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -100,6 +100,14 @@ properties:
>       minimum: 0
>       maximum: 0xffffffff
>   
> +  mediatek,disable-single-burst:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Burst type setting. For some versions of the IP that do not use
> +      AHB bus, the burst type need to be switched to INCR.
> +      If present, use INCR burst type.
> +      If not present, use single burst type.
> +
>     mediatek,hs200-cmd-int-delay:
>       $ref: /schemas/types.yaml#/definitions/uint32
>       description:




