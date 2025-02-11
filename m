Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8231EC021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=It9LCQ2XUKJ7oy5739TDIfVlMmZ41ac1tb13IdCJgJc=; b=yiZRrh6HfNxuuSoKawmLlD/wsl
	syyTgg/H7yzdXFr1SLbdjrEywK4QuoBuE8LYcpRHwy5xfkgi9KbApNY6yifUR3gVPGUZ8gFCgoznj
	pHFtmYwOoPJopmyrQ26stY8kyK6QcksTHECtvytMOBlGxKVlNwz6Rp0IxvjQdJQNBy3tnGXtdog1i
	z8zfc9MYJ/t+je4ORm+ldxdC+Pm35V42f4LTesSW5WKezaAxcOy2wX42TfmdkQv9SyUudvWPngps9
	g7uT1ZpAORaC7MVF9KkkVAuI1CQiEDOg2rYcWj0bnMuvq6DdPCnZh00bVj8T7XfJQxH3BK+94l+da
	8K56kpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmai-00000003Aiv-2KpA;
	Tue, 11 Feb 2025 09:30:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmZJ-00000003AQS-1aBn;
	Tue, 11 Feb 2025 09:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=It9LCQ2XUKJ7oy5739TDIfVlMmZ41ac1tb13IdCJgJc=; b=FPUoz2pINDASL0PCM31yca+Zrf
	qPELdmkTvnp4HrTAQXGqQnoma84vAAPw7MW9At0upLRbRo0f29TuOFInpTqqGjDv2McMG4gkRdUZX
	KIiQY8e/LKYj1hB3cOwSpIn9OHqgiMtcfyxha2P+ALHSUaAMn7HciMtzJ03Aeiua+oYscgJTHqjhY
	/PxV2RxHY2NxCT9QQau2+7c8fDXgdJ9Qvkxja92mhk/rbdzN95sFZrs8RhdvBrfrp2iletJJQtysw
	JjwN4DOU87Uz0EDBIsWV16FSlOCaDL8scD31k7ZvHj96iT0xvnjhjykqUygxeFyJOD+YPzcMlAQlv
	fuj9A0Ow==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmZF-00000000Xkb-0Xgk;
	Tue, 11 Feb 2025 09:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739266107;
	bh=co1cSWx5jjebn1be3GgShvFIPNk5ZGYkgJ/NYGsS+K0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OAtSrdHCu2ucm3/qoKlfHhdLzbcY9eYa0S8LB/9+ydqOk4eKkVem/z2aQsOojjCtP
	 zTWtpglOAYoQdqUIwH21A3yn3k+mMqHtcG7ozrGKjRemj+Z7JquQpgOJkSgkN0s6a0
	 1VrBNBOXSqCVASYcH1Z6jEIy2xmrYYspCA+qhQuujmPdV3KLUmdP7uNchNxZxk40S2
	 vuIFaZwRhU5YGwGH3YyXqbWTV6wKvEhusmo2vgMTr5EJY9Dp8xnE86QOi1moZs6qFf
	 6eoQzryxc+dgYY+po2U9B3Cuj4+DRQhMd78XCPGTVpiikSwGFGDkqtLlO1LrYrKSa8
	 GGPXXiOXWqcEA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 73FC917E0EAD;
	Tue, 11 Feb 2025 10:28:26 +0100 (CET)
Message-ID: <9cbd03f7-c3e4-433b-96ee-3b9683fccdd2@collabora.com>
Date: Tue, 11 Feb 2025 10:28:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
 <20250211-nice-boar-of-abracadabra-f696ec@krzk-bin>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250211-nice-boar-of-abracadabra-f696ec@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092833_388891_EBC39FFB 
X-CRM114-Status: GOOD (  18.65  )
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

Il 11/02/25 09:31, Krzysztof Kozlowski ha scritto:
> On Fri, Feb 07, 2025 at 04:18:32PM +0100, Louis-Alexis Eyraud wrote:
>> Add a new gpu node in mt8370.dtsi to enable support for the
>> ARM Mali G57 MC2 GPU (Valhall-JM) found on the MT8370 SoC, using the
>> Panfrost driver.
>>
>> On a Mediatek Genio 510 EVK board, the panfrost driver probed with the
>> following message:
>> ```
>> panfrost 13000000.gpu: clock rate = 390000000
>> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
>> panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
>>     80000400
>> panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
>>     Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
>> panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
>> [drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
>> ```
>>
>> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8370.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
>> index cf1a3759451ff899ce9e63e5a00f192fb483f6e5..2f27f7e7ab813b97f869297ae360f69854e966e1 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
>> @@ -59,6 +59,15 @@ &cpu_little3_cooling_map0 {
>>   				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>   };
>>   
>> +&gpu {
>> +	compatible = "mediatek,mt8370-mali", "arm,mali-valhall-jm";
> 
> It's up to platform maintainers, but IMHO this is discouraged practice.
> If you ever need to override compatible, this means the node is not
> really shared between this and base SoC (base DTSI).
> 

That's true, indeed, but this is a special case, where the GPU actually is really
architecturally and generationally the same, difference being that one core is
lasered off from the lower binned silicon.

I appreciate you pointing that out, and effectively we shall not create any
misunderstanding on this practice, which shall remain discouraged.

Speaking of which!

Louis, since you anyway have to send a v4, please add a comment before that
gpu node override saying:

/*
  * Please note that overriding compatibles is a discouraged practice and is a
  * clear indication of nodes not being, well, compatible!
  *
  * This is a special case, where the GPU is the same as MT8188, but with one
  * of the cores fused out in this lower-binned SoC.
  */
&gpu {
  ....etc


Thanks,
Angelo

