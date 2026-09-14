Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFFBC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hc0y+HWj8Q7xkHkS8F8lXBA38gDV91dQqaarI1miWdA=; b=4839UGcRqqJw5xBRVs9X/FS0He
	V2dJwemyLUaqRzG4xQvpNBx54ohTmKvPymVfDPeFCjv646pIyGOhuDGbFhGCI8um4fcZ+5slzHnbh
	aHpFZAt+lAzkCksvT6C/y7AV7M0erZXQVSoplYbRSfYAvJxBqp+Qc15OQMcSpymUys+b6xqUcXZdX
	1n0MtovjgkD9LMJBXZZ1VnGIpomnqhT13CPX5TOkLGLUYeUsX/y5SnLwxZYujUi4PW5GgvL2g8apI
	jSHFhxINrKZRCvLXLxgoS0LWelR+/ImA8ulBM9Zug2pTYaMlhXxculm+Qs1Or+J1PiWafTdLLifXn
	LKYb61Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65qh-00000003ZHX-2Ksb;
	Mon, 14 Sep 2026 12:31:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65qf-00000003ZGH-2PeR;
	Mon, 14 Sep 2026 12:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789389106;
	bh=JprKAj3WcBPMjGGlKwMb7u1QmjKgBn6gWZ8gnKo1/yo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gFuUeK4krZqgQHfcKDSyoAiSnzipqUN7ouuMdphPMobsw04OFTxt+5Mu9HPYAkASH
	 tR2s65Q7i+1ETuV57y+xhrIbLgPZRPMwAZvJeMXbZb/TImo4m1pSyo9ap6O7VEYQw7
	 Xk/Mh4fIw3DrKK9sHmNYe91I8glwXanJQvD/OKlI9lhsEqFoHC2qrXyCOnH/URx6tr
	 AFE5hvIoMNjspfyGTdcxy728DGtsXkWG/emg3ljf7+ItyrlnSwBIwH80kpF4UV5djl
	 MPGMv3iwgpiAGbEwLiKwOpWaz0zgXFQJ0JOJQR3U95gna5Ap2G6ZjFbIUbzSLubvfi
	 DXnpIWDkg9XKg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B049A17E020C;
	Mon, 14 Sep 2026 14:31:45 +0200 (CEST)
Message-ID: <a8610c0e-3332-46b1-9a28-1c1ef504a727@collabora.com>
Date: Mon, 14 Sep 2026 14:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add mt6572
To: rva333@protonmail.com, Sean Wang <sean.wang@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Long Cheng <long.cheng@mediatek.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_053149_774714_EF3C04AA 
X-CRM114-Status: UNSURE (   6.14  )
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

On 9/14/26 14:10, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6572 APDMA, that is compatible with
> mt6577 IP.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


