Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE2DC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqWLTQ7zhXH5+VlwkOfoSyiykFUcF0hKyCkTujnVT5E=; b=VjSo2fxc/1J1d6A9I0vOIQFHwb
	m+Ksy3jJaJuRBEcXi3jTmoNP0zWpdocLPnJYAnlw6GR+s0msEKUkJz5DR+l9jMr9ZIgYPvlRuFCLF
	LwLVdDDyX2haMr5mZ9ok4nplrxs9/PidmkdA4zBMnl73CXVGIPk4GxAiXTq4NwM6JZFcGHEClhJlR
	Zn2EegVCtWRbF0jHMi3YDCSYQ79MFa1FgSdkZ2SVjbEUKcZnIcXP5FBXPsI9ffvkR+h8P81/ArGKs
	gcOYoXvdflp8HL6qYl4pepWv1D2TlU78Qnn26j537FmpRGhiQL9+wq4A+AQz4ynfegcChdzuLnuo8
	G7Q3HZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkR3-00000003bRk-2hng;
	Mon, 24 Mar 2025 16:13:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkNy-00000003b2K-1sJx;
	Mon, 24 Mar 2025 16:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742832644;
	bh=Gu2l2JLxMDCWKF/ck8d4RiqN/9CsaCC/fejEKfEzVwk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UFTK7VIn1/I5hwkLfw1XtFbanIRysbesCsb7Fc5V2u10bJp47QKQJzMxNFMd5F+YQ
	 akSezJjNHkk1SM7F6Yg74KtRyeXn1RjJr5dXTsjZavrUokJhiDalxFZs1qUAziHsic
	 ltV6lzA8gJpa7SZF32lROzTPIL01r4ystflTk419bzbr294SJTQjVxwl3jneu+1hQX
	 3VW21ug4qlj7uAjAIKJqFir6xaRJPgUdCpLZ8lYDmNSM1YW8HcSjjV+iibRNwiv2i8
	 ZPwUOohPHhlJp7A4KR/uyhGj4f9R2Jaj3N7QaBl/FVdM04PIxxijVdBOkc0ijYn6MB
	 U1BpVWajMgaiA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D517417E0A50;
	Mon, 24 Mar 2025 17:10:42 +0100 (CET)
Message-ID: <d4af318b-1bdf-4abd-842d-461a763b79a4@collabora.com>
Date: Mon, 24 Mar 2025 17:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] pinctrl: mediatek: Add pinctrl driver on mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yong.mao@mediatek.com, Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com,
 Wenbin.Mei@mediatek.com, Guodong Liu <guodong.liu@mediatek.com>
References: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
 <20250321084142.18563-4-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250321084142.18563-4-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_091046_660542_D7CA1263 
X-CRM114-Status: UNSURE (   6.49  )
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

Il 21/03/25 09:39, Cathy Xu ha scritto:
> From: Guodong Liu <guodong.liu@mediatek.com>
> 
> Add pinctrl driver support for MediaTek Soc mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


