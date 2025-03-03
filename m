Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A4AC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZmKf+wHfnaZmVaHzFYkJTxDGfGxVqtsDskNcVDpJcs=; b=Vsd52MfCstEWtJjPPLobc6Bz0p
	EbdRa/ZoVOPz54xWa80b4NJ5Uby7vI/xnLCVb4tFU1CXsu/YGEW1pakZBSZMONV8NIZtdteq6nesr
	634j8vgEl07Rh+YgshIL3QoCrANO0mzCpG9XmiadZn0wSse0yPHNS3IwwnfUfb3Yep5PSqQ+oK0bI
	+2YvkE9I/NW4wg9w6nCaxurlBtDc9/FYKviV2M14KNaFXTbyQaVPCPZl86q9tYmk0kyHJmodGfHAS
	m8N+wySJ7xPdRVMVlxs3qeiCwJlDEbZSGL/JJRtXjQLMER19LTIWeyDuBxTHae5a1+ZDuC41C3oC7
	yF7hN+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3gZ-00000000TYE-2lx9;
	Mon, 03 Mar 2025 11:10:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3dR-00000000Sao-2xIS;
	Mon, 03 Mar 2025 11:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000016;
	bh=7x29ALLJGLsAxdzXWmZzfzjZ0OENp/QhL5O8ZxSNDmM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jWi1jIQEj98Jm/972q0KLg1fmnX9nh0ecBVHUos7KYiNd2OFkRQQ8y8raJdJiYPrQ
	 Gd8pqESSfAlbs7uBAzCz3JMJAVwf7evTwUob3kbRL4T8CYc5P0oZ0YZzZTEyhXPcKS
	 05HEG3lGEzwjeRMY2mhkFH3xKI2ey67o3nToPYGUYuKjeauXVBOF0mz8DWzrWsKVAL
	 C/yDk1CdFcmZIS8CuKLDUq5VZLcwS3Hf5mTT7H+leB1TbulFZzBKyZ3erhX/Z5g05F
	 KBoWfF4530PVqNIcSbBNTbud7kJoeKo0ikrEdoVy6CUvvpixOo3Kwo3dBm1Gtt12hO
	 KDAqbRtO0hBfg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C43AA17E0E8E;
	Mon,  3 Mar 2025 12:06:54 +0100 (CET)
Message-ID: <925415fd-0415-491c-8e32-14dbd326f2a7@collabora.com>
Date: Mon, 3 Mar 2025 12:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/20] ASoC: mediatek: mt6359-accdet: Always configure
 hardware as mic-mode 2
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
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
 <20250302-mt6359-accdet-dts-v2-16-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-16-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030657_884659_35BD3E0A 
X-CRM114-Status: GOOD (  11.71  )
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

Il 02/03/25 17:30, Nícolas F. R. A. Prado ha scritto:
> The driver currently reads a mediatek,mic-mode property from DT to
> determine certain register configurations. Since there are no current
> users of the property, the property doesn't directly reflect the
> hardware  and the default value (2) is known to work on
> multiple boards, remove the code handling this property and instead
> always configure the hardware according to the known to work default.
> This property can be properly introduced in the binding in the future
> if it really turns out that different boards need different
> configurations.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



