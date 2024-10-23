Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F64CDDE70
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1wO2zyb0c5ex6Wg73kl2dLgjmOq0KrKYmkyda00HVc=; b=U9DiUVkZQegeOtTZhpTNiN/RiA
	Xrjg5mgmeXfilX3Qn/s3xfP80s0wkiLXlBB22pH7Isd6oPzUpoFQflQfG+LTdEmoyPaKBrclRrkqE
	mga4jWfeOBlbzh06h7+EOoKGkVwK/3Xs5ifCFwwjhBgJFJTNUyLM7ofGovYGUu4f2xmymD0QgkK7y
	0yQ1HwDr050JmVrzWk0FYYpTyxOBjOXPd9FScroZAIZ6fUOb5sIdYi2qyvWyqfoDLwNX1DZeQf22A
	TwmZB2NqUpLBkO8ozSxoTkddKb4JhHQLKx+gaTvwvhlzw/1lYYsqBz9yISxkiBxuMQgxPSdvNd6/l
	ljBVZbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZpC-0000000EBtu-1fT6;
	Wed, 23 Oct 2024 11:46:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Yx5-0000000E32q-3OXP;
	Wed, 23 Oct 2024 10:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729680653;
	bh=TKS5gWQ26WbrWvfcYUusjWgWA7QNyzv+IpkLuOaZ2XM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JpIPPgFT47+UQJUwrpF/2XGnCqZZH5LmYkAVCJm9BKSYFn6/jIWm9RTYOR0TrHzfE
	 cm5sdZHwRszoAgRgkBjjdg0H5JONHWJaGvQXomf/oqsAKd7b9B6yH2eTZiDBLU7AG4
	 +jkPkFULqsPph/RNB4DoOpLgw3aWRskXY68nxqaOZKoixA8PeY4elL+AC2mJsb2Ro3
	 FeprclnpbP/5KJhRsdg9eLEWfAa2MnnTlUiwJn3Gwf+LxKkwJSRVdrAkKrEzbfOmom
	 Swlmq2GShzTdp82YtS9yJVlo19QVwd2B9nIBYtjdjNBxPnWM2ufKRdBXfWEKo/GSUw
	 oDFCQL6jjLWSw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3D4C17E1063;
	Wed, 23 Oct 2024 12:50:52 +0200 (CEST)
Message-ID: <b96beaf3-897a-4dc2-afa7-6e3e1f456783@collabora.com>
Date: Wed, 23 Oct 2024 12:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: add adc and
 led for mt6360
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-usb@vger.kernel.org, Chris-qj chen <chris-qj.chen@mediatek.com>,
 Yu-wen Fang <yu-wen.fang@mediatek.com>, Simon Sun <simon.sun@yunjingtech.com>
References: <20241023085010.7524-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241023085010.7524-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_035056_032994_C426AC84 
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

Il 23/10/24 10:50, Macpaul Lin ha scritto:
> From: Yu-wen Fang <yu-wen.fang@mediatek.com>
> 
> Enable ADC and LED of MT6360 for MT8395 Genio-1200-EVK board.
> 
> Signed-off-by: Yu-wen Fang <yu-wen.fang@mediatek.com>
> Signed-off-by: Simon Sun <simon.sun@yunjingtech.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



