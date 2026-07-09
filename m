Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06FAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46gRT6EGamNoSUT5rbdn0gLPqND7Y+nkwBGzaqBABbo=; b=S0HFBkmQ0r6oT4o3hh2KuWZda2
	XzvXq58zIEe3/4LmSQNd35ykVAVmO1gnQR2t1QOwsPy88K7t4KpK1go3HBnGOljGhP9gAF8Kcgo6N
	Fj2KmXMQyojArTC2tDKStN5M+eIzyq/zSYFidCBIQtDqMwx0i8h6jmsQUERbCd4i+DqxQXJFKwnh3
	co353SzzY8EYWlFHwnYsgUFjWHk7LqPMElDWtnIULplhjwwP/53IiIzEnw7J9NbaONUTHUEPxTChC
	pfZ8tRmp9L+fbvyBrzaDpcLdOSsMzeVDF6WVPvhikb+RDZWXRDFzSh/Gkym0kqpIxiyLSrS+yYORp
	RVXalFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpGq-00000002et8-27au;
	Thu, 09 Jul 2026 13:58:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpGn-00000002esK-1SS4;
	Thu, 09 Jul 2026 13:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783605505;
	bh=DjWIojAzSpqrury6RVuc3AKXDQ21nXDPRrnz5nALTGA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uk9k61TiU5kLuxeWd3yKSlAqlof2xEMCyZ91YUH3EfsxlKkfbd0J9XbYPF2Ozvnx2
	 znsCEGFc0wsenIpMQNl9u8fUGgAEXMNXikFccXqUNWwyipJ6b4k7hwQdB+28KHNYgV
	 DhGM+/SdJbKXOTVW8bKfuCRp6qIndc4Bicdywmrx8J4xx3lLAWIOOTO1Uui4dEFIlM
	 njnJBYlIgqMZkMzTUVIyiAa4RtLla1XMF/0vUPccM7sSh2aOyGfsAHSchAmSGL9UJx
	 GMq1i7dDU2zbAh61mKNXgcrr/LfUmlxvBwforDJ3gRoQAAgG63SBV3U7NlObDn0Baf
	 +WVSbE+qB6gzg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08BAF17E071A;
	Thu, 09 Jul 2026 15:58:23 +0200 (CEST)
Message-ID: <fba4f7d6-d480-4f1a-8d80-3dd0a797b61e@collabora.com>
Date: Thu, 9 Jul 2026 15:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: soc: mediatek: mutex: Allow
 #trigger-source-cells
To: krzk+dt@kernel.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, matthias.bgg@gmail.com, andi.shyti@kernel.org,
 djakov@kernel.org, broonie@kernel.org, jitao.shi@mediatek.com,
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
 jason-jh.lin@mediatek.com, kernel@collabora.com, chunkuang.hu@kernel.org
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
 <20260701122043.19612-3-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701122043.19612-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_065829_620016_F27D169F 
X-CRM114-Status: GOOD (  13.89  )
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

On 7/1/26 14:20, AngeloGioacchino Del Regno wrote:
> This hardware controls trigger sources, and there's even a generic
> binding just for that: allow #trigger-source-cells in MuteX, so
> that this is allowed to provide triggers to external HW.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hey Krzysztof, I noticed you gave your A-b/R-b on the other two bindings commits
but you skipped this.

Did you have any doubts on this one that I may clarify for you, or was it just
that this one slipped through while reviewing?

Cheers,
Angelo

> ---
>   .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index 1ba086ad749d..429ea149068e 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -57,6 +57,9 @@ properties:
>       items:
>         - description: MUTEX Clock
>   
> +  '#trigger-source-cells':
> +    const: 1
> +
>     mediatek,gce-events:
>       description:
>         The event id which is mapping to the specific hardware event signal
> @@ -119,6 +122,7 @@ examples:
>               interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
>               power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>               clocks = <&mmsys CLK_MM_MUTEX_32K>;
> +            #trigger-source-cells = <1>;
>               mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
>                                     <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>           };



