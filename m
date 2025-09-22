Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D06CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxwUKlOwEESknbd+JhAL5AsxkLK4doEFu2HbM6hDsXA=; b=PsARW3mpPgF5SwOnwljSHiKLSw
	Q3gJHyWAaBDu16nvRP1GMNE5XVnfGG2HgR2WxCuQH0MqFpl7qF8wWBnNXba68DMqjFYtqw7fZK9mY
	I9ihSBJ1WrWzlBbxZkFU66STR0ATA3C6wC61HWRrFAIW1aDaGiKqMpqhdytyAfv7bur004hsq7duC
	cRmzOnAUI04+y6qrvZWQff9gFWDnzDP9xigOa/HHfSz8pxcLSpT/D9neZ9m3ER/XObLe851VNR7iL
	vsIzeVIVS7DsOzyvKXcU+yaWF+I3RdxtDBVoQ6DK+HZ+AleUBoLtBdr9BaYxjQDiKkxGbexirf01b
	erzPX78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bOf-00000009YKX-2wl3;
	Mon, 22 Sep 2025 07:55:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bOc-00000009YHg-35Ff;
	Mon, 22 Sep 2025 07:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758527736;
	bh=mqGkL35d2nAV740tOqCB7tTDbkawSkgqIN7WEgn3v2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bbYUroKuQyvxF+EmcZlnhWeQZvg1VPp6HPukgoFZkoU3yvga/+FKPVtepmRphsj1C
	 A4/kOlnaXC6FzfT2i1qsM4yMxNIWDpZHWSHpylFkNL8Bjuyh9oJPvmIbZBsPWBcBat
	 ULBvUZXv33vT4YAweBRSpRxjOsCpv3Qa5VKdBCeqeiniTtLpscWrpybXtzVsAnpsNq
	 4xhshjEqRZxmWWZMCj2Mhe5CLcmHTKlvFxP501lxQ7+5Cv1Iz69ntCl95zQs9G0qlo
	 x+OsoGwHb/xaWl+p1IEU6r3w1cGCoI0m0F9fr4qvOPrDzWjoebqSjFexsLuUTcq8tR
	 2xe4MQ/MNtGVg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65ACB17E10B7;
	Mon, 22 Sep 2025 09:55:36 +0200 (CEST)
Message-ID: <53d152b7-7e72-4189-adbe-6045418541a4@collabora.com>
Date: Mon, 22 Sep 2025 09:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: Document MediaTek
 MT6878 I2C
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
 <20250920-mt6878-i2c-bringup-v1-1-d1527ffd3cd7@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250920-mt6878-i2c-bringup-v1-1-d1527ffd3cd7@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_005538_926179_9C5B6DA7 
X-CRM114-Status: GOOD (  12.84  )
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

Il 20/09/25 17:31, Igor Belwon ha scritto:
> Document the I2C controllers found in the MediaTek MT6878 SoC, by adding
> a new compatible string for the controllers.
> 

Sorry but this is not right :-)

compatible = "mediatek,mt6878-i2c", "mediatek,mt8188-i2c"

That's what you need.

Cheers,
Angelo

> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index 23fe8ff76645e440c19469999ae9a86b7fdabe68..b0d7dd0dd8fdd7b0dba14d11f75c8f0b7ac15f58 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -22,6 +22,7 @@ properties:
>         - const: mediatek,mt2712-i2c
>         - const: mediatek,mt6577-i2c
>         - const: mediatek,mt6589-i2c
> +      - const: mediatek,mt6878-i2c
>         - const: mediatek,mt7622-i2c
>         - const: mediatek,mt7981-i2c
>         - const: mediatek,mt7986-i2c
> 



