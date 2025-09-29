Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1904CAC5BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8o0qfuvCrHzLFO63/Fzf7CjNMJIbxoMIrqyk3vLOkqs=; b=SYN0TcVJqBeFiyeXWSjwLRmH4k
	0GP9CfFQodFt/saBAxWGny49LKE8FNjHIBKZDAzxdW5F9sJ7aZXnKylGQDTa7mORCRd6miSSdiC+8
	P/IlWaF5ZAi8ltCWSdme2kzbcyO3RvJEBtf3AiVi7zZ8pqX0Q7eOk2NkKV4hiY7/Lm99IyBvxe/Te
	FUtTy4heSICkzquuoH4ddVq75Gytuskjb22o5BWBDqaTDuCW2m9IzAXDofksEDeoNoTGwyyE540jM
	N+jUNUr6q5WVGdD9nNi5zj9qOCnza3ttpEjjJ75BffDgw10XMKPqR9h/9kWfT9gc2LSx/WCm6ulmD
	bTiJCUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BCD-00000002C0U-2HOz;
	Mon, 29 Sep 2025 10:33:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BCA-00000002BzP-42KS;
	Mon, 29 Sep 2025 10:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759142004;
	bh=HIOAcxzqk55E0UVOj9UZ1f0kcT0/PcCMi9TDvhhcoUk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cS0yyOL7GhFMZIpk4UJcx0VBEulvL0UePHWvnXOZWEGGxlqdzx6YwKr2SI48nD2Wl
	 aRYmwa3g9m9fBXKRoqLkwszIzj0obEEhkz7J7P5oOKM4sx5W7Kc122dX8+6csYGSPd
	 RsxcfHBxd3LvWQrm86qby4p2ofpsOltwT9FP1cUla1SPmjbMvMo8JMk0ZFXpNaImFi
	 SvagiSkK+ADctIiIyVBlsnVWVUtn4vX2tPyNij3n38XXckIzt+bLu4ubqy0TLUEWxw
	 8MEcG1E/9Za2MaqGUKtVfreMwR7G6vD4dlNXQ6F9/qm/EizfWClb/pHyYS7hete89l
	 g78h82wbmJTcQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F43B17E07EE;
	Mon, 29 Sep 2025 12:33:24 +0200 (CEST)
Message-ID: <c35ccf0d-0102-4365-9b89-b1c2f126d21e@collabora.com>
Date: Mon, 29 Sep 2025 12:33:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: mailbox: mediatek,mt8196-vcp-mbox:
 add mtk vcp-mbox document
To: Jjian Zhou <jjian.zhou@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250926090505.26267-1-jjian.zhou@mediatek.com>
 <20250926090505.26267-2-jjian.zhou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250926090505.26267-2-jjian.zhou@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_033327_207218_2F7C9564 
X-CRM114-Status: UNSURE (   8.09  )
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

Il 26/09/25 11:04, Jjian Zhou ha scritto:
> The MTK VCP mailbox enables the SoC to communicate with the VCP by passing
> messages through 64 32-bit wide registers. It has 32 interrupt vectors in
> either direction for signalling purposes.
> 
> This adds a binding for Mediatek VCP mailbox.
> 
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



