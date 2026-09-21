Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42A3C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJVEr6a0OZAW7OKTnS0O645VXXgFRtTC9GGc4jO2eGY=; b=WnAGewlvTSOZ12Q+RU6anMmysQ
	mfQfbzaXZzFHdAJ9AUT3FksTwqH8fqtxxPPwFRnJVSGpkjDHzDNfA1gPgE9pun+9hiq//ryp7PPvq
	Du+z2AcatJIEm87dzKQ71FVH2drmk+WJHnMcygRAQw1N8Z8eAmUNAVrmh5jI4oD0NS6Ss7fkNzuBg
	bhgFpr8gas91h9hJ7ylhNw1lXLBuq24xEst4+lfs4jbSj95dw812zomXCy8SxMuskEw8WyDPSpJro
	s4J0VNzFFpI75ccgx4YPtjYs7T2lTGrGQPQVRKzdrDTi3PdzTw4VytVgD99v0Lgzhmc3q2KniwZSH
	vhvOtNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bPD-00000001ijl-08HN;
	Mon, 21 Sep 2026 10:37:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bP1-00000001ifA-0DIP;
	Mon, 21 Sep 2026 10:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789987056;
	bh=s5tfGQ9gAxXHj++YoLLRdSqIzPeYCvALiQy+qEXoTMw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zqfpw35gzxYJv+ToFK9pr0yMyQPJ3kDMtZdJUaMn/t996IR/WqfwAl5g5SIVPttvv
	 qj8CBE9BfRwPS4jkvkLV0ShzmdcUNURqGUjGoh7pYJSltmmFI2anQqMVPe7suo40aM
	 IiIiWA8/jUBcU68L/8FeCsYUw6yQhNCar3eWjjOeUJjT9l2uP/yv00U6MxEI5aOedC
	 f7x4pk4ftC4hxVD8Ehtfvd/wVYGDTzkO6nuXYE9ySsU3lA/Ac6/yGphhQrc+m2+yck
	 r4VEyjWCu3iJcp9MtvystFeWvep3xAh5bAC60MLJDJku/e8dov8R56I8AwsvpceSk+
	 btcS9NSBByVug==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E630317E03B6;
	Mon, 21 Sep 2026 12:37:35 +0200 (CEST)
Message-ID: <8fd92e56-85c6-41f2-98d0-3b3422ef2c1a@collabora.com>
Date: Mon, 21 Sep 2026 12:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: describe the
 RTC's nvmem layout
To: Ryan Brue <ryanbrue.dev@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org
References: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-1-558b8f95cfbc@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-1-558b8f95cfbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_033739_786223_0C33F943 
X-CRM114-Status: GOOD (  16.38  )
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

On 9/18/26 06:57, Ryan Brue wrote:
> Four of the MT6397 RTC's alarm registers use only their low bits; the
> high byte of each is storage the clock and the alarm don't touch.
> MediaTek's documentation names them RTC_NEW_SPARE0 to RTC_NEW_SPARE3 and
> assigns the first to a fuel gauge, which is what a battery driver reads
> at boot so that the reported capacity does not jump across a reboot.
> 
> They sit in the RTC's always-on domain, so the driver can offer them as
> a battery-backed nvmem provider. Allow a board to lay cells out over
> them.
> 
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Makes a lot of sense to me.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 3cbc0dc12c31..5c89c589b53c 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -81,6 +81,15 @@ properties:
>   
>         start-year: true
>   
> +      nvmem-layout:
> +        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
> +        description:
> +          The RTC carries four bytes of storage that neither the clock nor the
> +          alarm uses, in the high half of four of the alarm registers, and
> +          offers them as a battery-backed nvmem provider. MediaTek's
> +          documentation names them RTC_NEW_SPARE0 to RTC_NEW_SPARE3 and gives
> +          the first to a fuel gauge.
> +
>       required:
>         - compatible
>   
> 

