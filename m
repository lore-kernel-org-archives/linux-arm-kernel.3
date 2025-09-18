Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C84CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdFfxxNFAPVCrQi/eEqnpPZtGLtw4f+fz6WYYOK5dHQ=; b=PoUU37hLTHBJiT3SWE0alHZE7X
	LFKu2TfD/cqwtns9P55qlyf5GFKzETKycpByA2J1YUCpASkSHKkMhozwpUGKnzXTXlw9XCrpI6hqG
	XDQUZxyiyyUWhPgLDf5rtxsTPV+s6326ZvmNDU/GLZ7LZj1XU33pI7CaWRko+Ho9ah80q1Mn1vr+e
	+WlAtetjKlHTGMkXo5TeZPYZZu+w8C6HwevfRqF+lT6Ima+rjDdNLNth2pzSw1Kmll5Z14GpKfLnr
	jWA+sAplRt1GNzNdiuc8u+hCZMJGs0RfAyuq2THoJrWgZeTlCUOQtNkPlkB58paazYp9oGpq2zY+W
	S+o3Z7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDRB-0000000HLFa-1MjM;
	Thu, 18 Sep 2025 12:08:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDR8-0000000HLCj-2Iy8;
	Thu, 18 Sep 2025 12:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758197308;
	bh=P0vvBsCMPE9HUr2EnkPlQHcU36fhBR6Uw7Rhq/WgBSE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ktNmaoJkLqqALEoAaj1Cs2rF5wWQvvuG7tuopmXTSk1u61yapIkUYhFC3Hb5HlQYx
	 m3f7fQjD1NnjfNbDEaBn2bf1Qgkpbf18m5114gmAW+04pih+QDfVGbuNkpZotnPyRy
	 OIlT27AHjzEEIepJwi2ZH4duRoBaYi1TMo/+jRBK2igslBbzDmjhTMGr46rcdFPvfV
	 TGO67YNI5YcwjVRMF1MzWv9VOmbn1pP442Emvsr3fWJ1GYirtcuta9R4ipSgkAdyHz
	 mm8+Dfb7MiHPKyR2Q9q7cc/S63TAwa0/fiqRyPdXpW8R24wqmntAUrgvXL0qoiB0bB
	 qZIZJtyz0WIYw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9945A17E0DC2;
	Thu, 18 Sep 2025 14:08:27 +0200 (CEST)
Message-ID: <f2eded27-54cb-43a9-ab48-54cb9ecb45be@collabora.com>
Date: Thu, 18 Sep 2025 14:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: timer: mediatek,timer: Add compatible for
 MT8189
To: Zhanzhan Ge <zhanzhan.ge@mediatek.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250825033136.7705-1-zhanzhan.ge@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250825033136.7705-1-zhanzhan.ge@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_050830_774910_5A8093D8 
X-CRM114-Status: GOOD (  11.67  )
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

Il 25/08/25 05:31, Zhanzhan Ge ha scritto:
> Add the compatible for mt8189 timer to the binding.
> 
> Signed-off-by: Zhanzhan Ge <zhanzhan.ge@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
> index e3e38066c2cb..5ceedc3a4f91 100644
> --- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
> @@ -43,6 +43,7 @@ properties:
>                 - mediatek,mt8183-timer
>                 - mediatek,mt8186-timer
>                 - mediatek,mt8188-timer
> +              - mediatek,mt8189-timer
>                 - mediatek,mt8192-timer
>                 - mediatek,mt8195-timer
>                 - mediatek,mt8196-timer
> --
> 2.45.2
> 



