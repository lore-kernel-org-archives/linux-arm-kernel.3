Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47184D44D64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yquc1pkSmkMrAJj2ZpnsB16hp5c977D4E2q6n4j0fMI=; b=3jAudwZPbJ8tpJG9KuoNBirI+k
	fNtIrc/72phn6SHHSMSkYlJJ7DfZ4cMREDrNnZwlhqkAMCULEGPb5xpYPLltGf/Sj27IRLGI8SAzU
	NtfEA+QsqQBIaFcIQCP+U5rbEi+reG3wy/6dlrN1QRHu2pD5qB8sFetDWEZNF3Xk4iWj8NXDjvFrA
	j5QSC8ZkUc8Y1bTxYkqCQlz4zpc+RV5XAt/qkxqHkj9pQ4srmFIeXbwPx4BEkEyfOu+T45Bm8Bwhu
	Ijimvu9gLZF9CPuE5iaV1COWa3q1D1RIaJ05/eNva+2XbSYNXcozZFnnvV6RF7pk0PrSLUaBeUid+
	5qTHlHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gMQ-00000003TRN-10kQ;
	Wed, 06 Nov 2024 13:46:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fwI-00000003Ocs-245b;
	Wed, 06 Nov 2024 13:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730899152;
	bh=Y2kuF1y/NzxzZSdECkHXDyEvhGwvQEEzHrCK+JiFvvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UN0qJRIDf4u6ncttlCK8iOruGkwAbwef2x9WrpUy9FNLFlitXgFWepwQ+0TNStCA0
	 13oClNhi0cghSZgnpcGa+2XyB6g9s3LyaNFRlZhV6HkLtzV+YCp52WkYxl+6rhhJ0l
	 tjtRNaEbm8uNuSELwvJFR6floWAkbKrolFLAgKLuUay+ZcKMeiuJgKKh/U9qhOpIcB
	 rkjiU2uzTUJkhN0PFi/gL27q/pxy0ynZHQfdtYZkwdzNFucQmnzAhbQVAbg6nom+8h
	 8s79lL/sp4rZ/N9q3pLpX6MTjtfsqF0QeGUcM090msrFrOTiCOXkrwGRYulYL2lsjI
	 bD9TJoq+mZCyA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D9BD917E3624;
	Wed,  6 Nov 2024 14:19:11 +0100 (CET)
Message-ID: <eb0a7307-de25-47b1-aaed-032c7734ec70@collabora.com>
Date: Wed, 6 Nov 2024 14:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8188 Lenovo
 Chromebook Duet (11", 9)
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241105093222.4055774-1-fshao@chromium.org>
 <20241105093222.4055774-2-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241105093222.4055774-2-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_051914_715602_294AB7A4 
X-CRM114-Status: GOOD (  13.07  )
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

Il 05/11/24 10:30, Fei Shao ha scritto:
> Add entries for the MT8188-based Chromebook "Ciri", also known as
> Lenovo Chromebook Duet (11", 9).
> 
> This device features a detachable design with touchscreen, detachable
> keyboard and USI 2.0 Stylus support, and has 8 SKUs to accommodate the
> combinations of second-source components.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
> 
> (no changes since v1)
> 
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 1d4bb50fcd8d..4b68f0baf010 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -307,6 +307,19 @@ properties:
>             - enum:
>                 - mediatek,mt8186-evb
>             - const: mediatek,mt8186
> +      - description: Google Ciri (Lenovo Chromebook Duet (11", 9))
> +        items:
> +          - enum:
> +              - google,ciri-sku0
> +              - google,ciri-sku1
> +              - google,ciri-sku2
> +              - google,ciri-sku3
> +              - google,ciri-sku4
> +              - google,ciri-sku5
> +              - google,ciri-sku6
> +              - google,ciri-sku7
> +          - const: google,ciri
> +          - const: mediatek,mt8188
>         - items:
>             - enum:
>                 - mediatek,mt8188-evb



