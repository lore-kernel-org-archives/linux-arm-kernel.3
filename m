Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD1CC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsPe0qcPAXRvw0+aNxPo7AzAywB1pBKSYxQkxu74vQw=; b=j4zEWeDQCV1DKErXtpNB7xMja4
	Dht5jYuBfBdTrQhpOBz3/7+bh+qhacR8HnxXLspXU1TPDVz52wKiYs4mMA1iOnyaJCPZwUcIg52gF
	SZck5NRxGSZO/FguSn/ae3tD24PTY0LLyyc0sbrbn6u8LX99NHkK+Ii2YAGOLczOxQ0iWbRgfqHPk
	Dmij1jqn+8Rr2DpwqJn6yviy4YiZH6FmoDP8fMax5+NJqRego253GncGONHDRF81yfJXKsIIc7zn7
	EjTA5hppG8RDetMiGiNZRIfdPVeE8Mm/NiUvSXne8cfIUVtonf5hQBX9A1kXM1dO9vd5BL+hhA0KO
	qfq/vIow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3f2-00000000T7w-2iuS;
	Mon, 03 Mar 2025 11:08:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3dR-00000000SaZ-0acy;
	Mon, 03 Mar 2025 11:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000014;
	bh=2mMR/ffIZifLi7BsVpihCzekLorj6Q7yZBnc0SUddy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CPxDhkrgmN5GXKvZ4GjnqUOfTwIM7W1gCMAs8tB8bHNaGd4CGhGVP67J0Y8+THUOH
	 qCY6oELE7AXtztYg6cD9GF7Df7qE+bwnoPgXVGkPUtpCcLKO1Xh4ENPj738g4SF4ta
	 XDYZkIExX1EbI3Z4PLEM+m0PnWwuD0GfPnyNnE6uuCNFvgm+wAbVq0LrCELx79ZW8o
	 yWbqwSPNxYNeFBKG5a+mg1H+loqLdzDffNegaEFRHL0bhBLiapnDQ+juXvNYpei8MU
	 SGtmeo7U6xmf6Ssl1UH9HmN5u1AT4jxf5r+K6SjGz5JrYMP+wwMWTLVfo13flTqBY6
	 v8XStgxapc4hg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1D8C617E068F;
	Mon,  3 Mar 2025 12:06:53 +0100 (CET)
Message-ID: <b1087fb6-99e6-4c54-b981-b8553bdecbe6@collabora.com>
Date: Mon, 3 Mar 2025 12:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/20] ASoC: mediatek: mt6359-accdet: Always set
 comp-vth to 1.6V
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
 <20250302-mt6359-accdet-dts-v2-17-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-17-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030657_327456_6B12E20D 
X-CRM114-Status: GOOD (  11.08  )
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
> The driver currently reads a mediatek,eint-comp-vth property from DT to
> determine the voltage threshold of the EINT comparator. Since there are
> no current users of the property and setting it to 1.6V is known to work
> across multiple boards, remove the code handling this property and
> instead always configure it to 1.6V. The property can be properly
> introduced in the binding in the future if it really turns out that
> different boards need different configurations.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



