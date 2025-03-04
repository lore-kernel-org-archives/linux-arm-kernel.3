Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ECAC282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMQ9BUWaRZ3pRUDD9tIzkeY7S/4jMOmVHbhMaiqCNAs=; b=no/0ALa1mJ24v+PHnqiMQL2k4N
	aO3kKjeEGGCqeAEhbSpMWRTGVMxs5oHf2rEuN8sgXgIuZjEPcEC/1UR5yN1GCQOCuvEdEO5noZfmw
	OWOcs45F0LuOqd/tUT8frgSxuf8brTICtjp98kijyDvIZgdXhpewewI0mNJIVdlFQRp3m+UUdlJZK
	ZaxGtWS0QgbVLZHSo+OGsv27Vfmzr176/sa1i/35mt90gxF/B9DaJcTxGBNwRXyjVfENnZb/78vqY
	6xLbVK/V8MpOWIJ7M8QYloYAYwbAkV6b8ucXQVr1f/k8XXkHqMkxQlSQgyD+b0WCgraaOHul4uvMR
	w9YmtJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVSG-00000005UqV-190V;
	Tue, 04 Mar 2025 16:49:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUMX-00000005Fb1-36F3;
	Tue, 04 Mar 2025 15:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741102755;
	bh=fako38hVX0LVYpZs9xYEYP4PjzxUntB/52NIfIBrRh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i+bPLmCgsg5dZ8m8Hes7HFpiiXY8n5V4CAEfPSV9S4rI9D5jpRFMikKSA1/bWF+Zt
	 vSbg638lj/IPGdaJpSEBpFh2AEVdtjeuIPLXWB3CX1hpjvb4QldcbNrUL59GaqrOO8
	 pS1+uLVG9qkuvSZB+5+WWjCgIuWU7vEIwztDZzDpDF9+91MgGGZueZb+XML7JUwgp2
	 Nxt4Q4nX3b4qxRtdSEl/lPnmmiy6kwSrMWMkWUSze7/eC78g5/DYYAterNdfJIOz+k
	 xmBHZjdpW8DHayRH80VvnMSRI2IxO6zajf1YOv4kmCexm4LYCeWewDcB8BzEKlXvd7
	 h7d+B3Jbh0uVg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B52C317E087E;
	Tue,  4 Mar 2025 16:39:14 +0100 (CET)
Message-ID: <58528744-4afc-46e8-81a1-ff0704751b41@collabora.com>
Date: Tue, 4 Mar 2025 16:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 mediatek,accdet
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250214-mt8188-accdet-v1-0-6bbd5483855b@collabora.com>
 <20250214-mt8188-accdet-v1-1-6bbd5483855b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250214-mt8188-accdet-v1-1-6bbd5483855b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_073917_919177_1094AC65 
X-CRM114-Status: UNSURE (   7.72  )
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

Il 14/02/25 16:14, Nícolas F. R. A. Prado ha scritto:
> Add a mediatek,accdet phandle property to allow getting a reference to
> the MT6359 ACCDET block, which is responsible for detecting jack
> insertion/removal.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



