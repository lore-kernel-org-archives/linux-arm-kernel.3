Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC17C88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAsJmPxRImlCYuJ9vGlo0mSRQFzzdCFhDR4wSqoeuuE=; b=rb2RBvFzNOOx/8j5e+tbqv5VF3
	dGKPr0d8JSHeNCVbwrVFDXx93WvkYTBCEfu5h/C0UIUZa1oNIfYzjjxAwEFwZ4gWqP6OygdYF99cY
	LlKAEkcbkgEHfaU/ycT3Fx6A8wtgE9MpV8LWw5LFR13/6SKsrZ0CeyXLIoxjgSW1Xvks05GJF5FoD
	DU7bwqfb5eunCl7LYphRx2+uhSs+8WaY67QVbyQZgUUXkrUwd7574PGk0LmCwlL13ILUsy1J1tbxb
	EfJxpH2w/KnTXM1wsr+E1bPahDWYtn5YXCoSJTsFhlOgzlAvVyhSnIBUt+JgnfBQ1Wh38xBWlOwoF
	RXJvM46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Q6-00000003T02-0kRU;
	Mon, 14 Sep 2026 12:04:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Pq-00000003St4-0j2j;
	Mon, 14 Sep 2026 12:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789387444;
	bh=gKOpORfZZq9WL4GdKkT6J4ZawStjF0sjbadPfw+E4YI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WOdQfsOx/T0ceqL5oapOcdLeeiktULtm7ihs6SFh+NUe7Y/achPrLONtXSgaWdanO
	 NDfWJMUiA4gk4wNunkSvPqnZX8it41xUrl+r6OapZwOdrUlxsf3hCq6ELaE4wXM6yc
	 GzLDOkovTKeEjTAOp8CRXH1V7iGhF9WhrobFk0y4yecR9nQN2Q/toQk29E6ekCGDI3
	 beYlUSMdKVoyraor1bhH7ZTkAhqj8oqQFRuvadhAX6aObEDXXR0tzA0F2Z2C1ld9BH
	 7cUZtBoC7SRM4TuWcOVAyXJ+H6ib+Apq1uLVrbTon46L3wGmLPqONmylhoCWPojD3B
	 R3oIFKLp1hzaQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 04BFC17E091A;
	Mon, 14 Sep 2026 14:04:02 +0200 (CEST)
Message-ID: <94a11a7a-0f9e-40b5-aa1b-7d5be34c99ac@collabora.com>
Date: Mon, 14 Sep 2026 14:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/24] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>,
 Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 "Martin K. Petersen" <mkp@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20260914-mt8196-ufs-v12-0-9279d7ef814d@collabora.com>
 <20260914-mt8196-ufs-v12-3-9279d7ef814d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914-mt8196-ufs-v12-3-9279d7ef814d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_050406_382073_0DB5E9A4 
X-CRM114-Status: GOOD (  10.36  )
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

On 9/14/26 13:38, Louis-Alexis Eyraud wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The MediaTek MT8196 SoC's UFS controller uses a different set of supplies.
> It is therefore not compatible with the MT8195. It also have an additional
> 0.9V supply pin (AVDD09_UFS_1), that is specific to this SoC, thus not
> currently described in the binding.
> 
> Add a compatible for this SoC and new property for the additional supply,
> and modify the binding correspondingly.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


