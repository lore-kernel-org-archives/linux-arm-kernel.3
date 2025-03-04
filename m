Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAC7C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyKNVc8JxYN79I8VTX77bcN226SjTJ6GJGUUAp/AF44=; b=2EAFWYE3IrxbCBb816B1tOVCWV
	3Oc73aOj1JPE4kpbNvkpDKBMWdjR8P9owdMQX7vNnKv/TaHzxnnRaG9w8vqvCrbphskYdLT+ExO0p
	0nTsIJyzUJpPvAKUdIfjnxMJ+B123h8zx5JPNr/xKdydnuvM2wIVCk9s9pIcG7DvwCSdXDtoNUNgX
	rYZnJ1mkz3UKYbfzjDiITNNa00yAGSi3cAIhMntHoynyQcml2ebVUgMhHDUpKa9Hp3M1twBoabn4i
	qd8qennawoqy3phIIXYJ0IU0Fm6rZAGC+watYkRkQdo9s2mJ5afkaKNCxpFhvbahG8JBCvJu/r1NW
	CdEwymzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVX1-00000005VXC-3C1N;
	Tue, 04 Mar 2025 16:54:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUOh-00000005G4s-0wcI;
	Tue, 04 Mar 2025 15:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741102889;
	bh=mvBrY6YFvpRg5GjXOhGlre9ckKrCJg9/70l8HVzjw/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V11NaW9zfoFsYpy57yvhtH/jd6XnQ6HuD2gTqWIGoy3d7dZeymCxcnGTWVD/QoCRg
	 a5q8Gzn8tMjaTPeAua9SFilwR9UoLGPObKAQeMURsrPZdaN/sVvK58PVlyHS7ABiQU
	 kbQOqIrn4CxpB73Hv0btZ58rhadhw9jkvSziHEDMZ884paz59U9988ObhjcKI8uozx
	 SZPTPUHtEaL5P/vvKfPK8nI04c7lZJCmm4Wm6Whis0bVZfvgz8gspSnTCNoIJrXZA9
	 RDh1phsRPMPg3W6DImkTlO+/5ppOw5kEdP3mJbHz+3N80U2PX3i1EyaLeSFY+yZF2Y
	 P9hnwl8/3zmYg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7A5A17E087E;
	Tue,  4 Mar 2025 16:41:28 +0100 (CET)
Message-ID: <f9fad64b-963f-4059-9b80-7d1c877525a8@collabora.com>
Date: Tue, 4 Mar 2025 16:41:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/20] dt-bindings: mfd: mediatek: mt6397: Add accdet
 subnode
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
 <20250304-mt6359-accdet-dts-v3-2-5b0eafc29f5b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250304-mt6359-accdet-dts-v3-2-5b0eafc29f5b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_074131_410022_CD9327DD 
X-CRM114-Status: UNSURE (   6.32  )
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

Il 04/03/25 16:15, Nícolas F. R. A. Prado ha scritto:
> Describe the accdet as a possible subnode of the MT6359 PMIC.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



