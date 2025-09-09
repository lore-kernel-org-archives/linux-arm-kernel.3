Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF9CCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kG/y3hskerYQUiu/D0qW2CJgX26MtzYKQluqP+NGHe4=; b=UZwLu2CMwp3SRK4uD+XkWmdVRK
	vDcXqR2tMSJNZtuchUCvHas8snognQZDrlurI+fc2vp5oCWJVee/jZhhPSWnCY6NCN1UhczoYs06I
	XvAxcBTGrd5FAICtTNEH5T5Yn/ymTCqeuLCalLKunn8StCxUNn/mGtDcL9O2Az/a+CkXPHtKb0m2G
	lwFfu/j5yX5+zPiB/4bxO1Yu1cfkSwgjzCP/K7IP8THB7VqlGsjIJmJ4LF/t/GUov8C+Ck3HirW+0
	q3sdXU4AEDrrpkxeA5NQCuNXRCkcRiYCgx5RlFoGCRrM8imKnfL8JDjU3aBky9Sgy6JExlvGD9ilb
	va3Ll1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv40-00000006A7y-0UkV;
	Tue, 09 Sep 2025 09:55:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtZt-00000005Wio-1czp;
	Tue, 09 Sep 2025 08:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757405987;
	bh=c9HI6QHEnx4SZmGcYwto+EmPcdziqlGyEZf+Cvq1mkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pyAO/z+B9A0tdgO4emayr/NiYrJcJRQI4Dod2Ftt632RBsne1+oB5UP0IO8AsehjS
	 mjWQYW/240W8yhsF+j0KS50iFDENcV2W56CpyFAlr2mZPDQzVJAlKGEAyFpQt7NTfy
	 IqrZvV8UWvSyBPo7yi254UJVb99vk9vd5KEVTDtLhwbAr2xvVZDh7C4++egbt2p65a
	 X7azCkGgLWyHKtL1w4JDL6TrBgGClw1FODsVbcRBPceqaHAYjNoZ351SK9gFyFxfhw
	 Vbw5e7Ncj70IfJoCjceCBnksZRJ0IdeM5qkB4Hucr3Hto1gSYYnefCHTIxK50Ci1iX
	 V1ExwHuuLAXSQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B7B117E0100;
	Tue,  9 Sep 2025 10:19:47 +0200 (CEST)
Message-ID: <2dcd7668-5928-4376-b4de-e38302dda3a5@collabora.com>
Date: Tue, 9 Sep 2025 10:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] dt-bindings: arm: mediatek: Add
 grinn,genio-510-sbc
To: Mateusz Koza <mateusz.koza@grinn-global.com>, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 marcin.czarnecki@grinn-global.com, b.bilas@grinn-global.com, andrew@lunn.ch,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250908130620.2309399-1-mateusz.koza@grinn-global.com>
 <20250908130620.2309399-5-mateusz.koza@grinn-global.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250908130620.2309399-5-mateusz.koza@grinn-global.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_011949_613118_820A25C2 
X-CRM114-Status: UNSURE (   6.34  )
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

Il 08/09/25 15:05, Mateusz Koza ha scritto:
> Add device tree bindings support for the Grinn GenioSBC-510, a
> single-board computer based on the MediaTek Genio 510 SoC.
> 
> More details about the hardware:
> - https://grinn-global.com/products/grinn-geniosom-510
> - https://grinn-global.com/products/grinn-genioboard-edge-ai-sbc
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



