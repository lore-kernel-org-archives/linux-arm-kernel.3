Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E1C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xX2QTZYLKQYJ+FqcN6OGn2xHkuAiKM2iQVHgYFJj+VQ=; b=45skwx2aUPVj1Akwvy7KeTMWkx
	CoEHRmRJ/Jxts0WxWEN0k9b/1o0rxw33MqB8iQ/tO/ZBTnhwUsxKyvvfduoTLkA0Jx3/YqEdreTJS
	9d3BxGYh6Ui6bSIGoXeX4NBTtUP9HlQYsyQz0ufXgO24Il528EbHMLeq6BaLGmbDQsWztinKStWOJ
	MoZFBAuFMrTJyYmbWdcvWcnBmOUGoWZheThqFCJEmpuI/6hsAFHKSiNsieCe9U5c4Q1toUh+YDhg8
	Urqh7SFn/h+2q8u708r9TnPjgBshGZ+Dn1pfxh5ZJOmZrPTodWwbNZaO51mWVohTBmqnWnnMAnoKr
	UZUr535A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughTj-0000000GVr4-306V;
	Tue, 29 Jul 2025 10:22:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughJx-0000000GUhJ-1nfy;
	Tue, 29 Jul 2025 10:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753783952;
	bh=l45JpMbEyFD0Shr+CnJlAga+Yxcov8Uu2dF6QgMPcvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RR03ngIkNg0zObH7QhMizyOvNCD8gjxDB6nGi9aMo82Jbfpmwha+dshtuxV2p/43d
	 oTWrjKEgidakvx4EqhVJWSnr99iTKVkSJSD5kXx2mmSeGLhRdzxOxZNBG1dmYRjce4
	 /bKh+00VAMX1NNFiRqsbxew4J6BuV76ICrUAXLrzzStBvVvP0oy+BDFtOJZfkeGWqs
	 LnNjhPmrU/4LJYNb4o1LtnM8IBvTvMxTxWTARmghgTuS/OY+jeFFW+h+m3K/ULrBGi
	 AUe52ZeZJ+ylhegHJpA4rJ0XoYD3jfIN4RmzVGOAB8Ssw8XDwksVDxlmxRmLyVhxW5
	 58Htzm0Wv+ikw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 088F617E15D4;
	Tue, 29 Jul 2025 12:12:30 +0200 (CEST)
Message-ID: <b4280c72-1f49-458f-88ad-35bde791151d@collabora.com>
Date: Tue, 29 Jul 2025 12:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: arm64: mediatek: add mt8395-evk-ufs
 board
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250729093506.273337-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250729093506.273337-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_031233_614941_3853C90D 
X-CRM114-Status: UNSURE (   7.99  )
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

Il 29/07/25 11:34, Macpaul Lin ha scritto:
> Add a compatible string for the MediaTek mt8395-evk-ufs board.
> This board is the origin Genio 1200 EVK already mounted two main storages,
> one is eMMC, and the other is UFS. The system automatically prioritizes
> between eMMC and UFS via BROM detection, so user could not use both storage
> types simultaneously. As a result, mt8395-evk-ufs must be treated as a
> separate board.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



