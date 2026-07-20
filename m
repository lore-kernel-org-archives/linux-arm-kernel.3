Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C164C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSDlN4GTb1G5NmA1g15sZRalQdEvyd48KVUtYi5cMYM=; b=IMrhzERRItsOejfrrcEVYSimXJ
	CE+CPhh5OkYFDQPAHs62yjgYvxfcvguWeXHPNtCip2julhExWeruYCxQR2YOBE0rXbIriml06rAVo
	b5tp86Hwcn+wOxTv29/i296kESnsmGQZB5M+deURqRANl0f9wp61kKORWQGOShb1ou5z7ff1vlFgQ
	Y5nOfn1PX2H24eTsb4FKPokWRbkuWsaLaDuN1faaDe2hgdMgX/0kqel1xzLvgcXSpJvIaLWN7W3Xm
	HKNvsGQvX5sXM2zmF59mW8zIRrrQKzajAbzrI7m0icg5I/xk2gYm9+cXB5eiRq2kMs/k4axu82ISj
	cAP8mWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnQG-00000006jRQ-0CXV;
	Mon, 20 Jul 2026 12:48:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnQE-00000006jQ4-19wH;
	Mon, 20 Jul 2026 12:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784551715;
	bh=PhW6ciGW0bqaX04kRmzCYiEg29y3CA9pNavpAO2grds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vm7/TEUNmXuqq7tDoOK0zKO6C1VZj8rnMZPw4M71gNDIownpmzTak6WRlcsCXYmOC
	 F4Gx9nWsY2I4xWslTvj81014NU2z6b6rcmxR5FXjOsbwW+qpvArs3RawCN9gD8HHyx
	 S2363yCEs20kM6jCdZ9SV7/jFuhiv+cVEa40MI3lf/9q2Cn5HMQB0gg26K1A+2CdVn
	 V5QfalOQeTiJBp/5xyz4FEQ+QoLkuNy+AlWzVZ/Z7hW7yVhnB4J2K8AKAiuntKE7lm
	 k+QnzH3+5dP67PQV+o+dTPIxJstkfR4CEaYMzAAs2bsuf5B+GP8oPsPROwSi55p0iX
	 gFXrNjQt2Os2w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29B2B17E0D87;
	Mon, 20 Jul 2026 14:48:35 +0200 (CEST)
Message-ID: <28c74091-f455-4bae-aefe-a35e66e88850@collabora.com>
Date: Mon, 20 Jul 2026 14:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
 <20260715-6572-nvmem-v1-1-9c13be99d077@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715-6572-nvmem-v1-1-9c13be99d077@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_054838_465365_9B6FD2D2 
X-CRM114-Status: GOOD (  13.41  )
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

On 7/15/26 16:27, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6572 SoC efuse controller.
> 

Please, avoid adding this to the list of compatibles that need you do specify

"mediatek,mt6572-efuse", "mediatek,efuse";

The "generic" compatible should disappear.. and plus, the MT6572 SoC seems to
be pretty special, as you had to implement aligned read just for that.

This won't be the only SoC as well, as probably all of the legacy one from the
same era will be affected... so please, add it as a const so that you can have
a devicetree with an efuse node declaring

compatible = "mediatek,mt6572-efuse";

Cheers,
Angelo

> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index f9323b3ecfc8..269e2b09f5c8 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -44,6 +44,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - mediatek,mt6572-efuse
>                 - mediatek,mt7622-efuse
>                 - mediatek,mt7623-efuse
>                 - mediatek,mt7981-efuse
> 


