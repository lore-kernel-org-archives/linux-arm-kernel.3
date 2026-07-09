Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ABCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TQPn5ED0S2CEUi5fenqh4SrbmSY1R1oHCIp8iBG0cg=; b=awTcXrPuZ5Z9FDPtOGuYkKq0UG
	owY6/FaohUDCXgKg6WI2LZp6N8kd0D/CbC0+POmqmQM9jsiXGqGW680/FTGnKEVhk0AxIMc258JVX
	EFYvVCdU+qQi4T1K8jPRdnSWvOMgHLkq5onNbz9qBZmYpQ8LYQ6ZGWwP5fNOkYdlYAq0byrx0W3VM
	vBi2SNS3N+/B++8vEsUzMEEGXcF2AGmFARZ/CM7OH4U3WEnLQcTEN8miSEZA3ouQ5xaoatI7sdRIL
	d9Or3m6CZ7QbDz/JJu4O99I/GgDz5IHCG+MQBtaiok52HSNSmO2tVaIzZoB43ti4DvqhNIWKBamJ4
	XbxkvhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnFN-00000002GD9-3Wjg;
	Thu, 09 Jul 2026 11:48:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnFJ-00000002GBd-3kkV;
	Thu, 09 Jul 2026 11:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783597725;
	bh=ZHdYtULAHilEW7xPUMMiGj88dz/NRrO/fa+X2KxsnaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mwAafzonvtw8QRaqoEh1DXFgkwvz05LiCUyG6TDqLgT4YMqb9T/XmgEItN5FPv4sf
	 Gkr/RnWFtgII6U9ZmZWgu+y8Q7bKEyiKV5//R4Gz4T8XLFGcU7GjlsccweZfY3MM45
	 bw6HS9Tg3NEpzu9DmMUxKVM3Fu+6cYvT8b6zMMTlIRP4EM/6flnMFLzhpY+TUlQj/A
	 /amzCl4mqOwp2x+D1CgILdpWw+PK5StZJaT8ug1B18nAuT871+7tFC4+qDU/C3kvpV
	 IHrzrN//LBQwYBfSjxMYyYJiKS4MBkDRc9FXdDEwGaUZhsCW+QvBbhIo70rfIfIac3
	 f/o4+g21Q1gTA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5BEB717E003B;
	Thu, 09 Jul 2026 13:48:44 +0200 (CEST)
Message-ID: <d35e3376-b2d1-45c2-b1d5-96057cecf1d1@collabora.com>
Date: Thu, 9 Jul 2026 13:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: mediatek: cec: Correct the compatibles
 for mt7623-mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260624173627.19785-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260624173627.19785-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_044850_388358_34DA2838 
X-CRM114-Status: UNSURE (   7.48  )
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

On 6/24/26 19:36, Luca Leonardo Scorcia wrote:
> The HDMI CEC driver for both mt7623 and mt8167 is actually the same as
> mt8173-cec and the mt7623n.dtsi board include file already uses mt8173-cec
> compatible as a fallback, but the documentation lists them as separate
> entries. Correct the binding by adding the correct fallback.
> 
> This change fixes the following dtbs_check errors:
> 
> DTC [C] arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb
> cec@10012000 (mediatek,mt7623-cec): compatible: ['mediatek,mt7623-cec',
>    'mediatek,mt8173-cec'] is too long
> DTC [C] arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb
> cec@10012000 (mediatek,mt7623-cec): compatible: ['mediatek,mt7623-cec',
>    'mediatek,mt8173-cec'] is too long
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


