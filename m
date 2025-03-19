Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984F0C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh7AJaNWcNOd1yFftuO6nezPa9E+9YkAr7Oq2b1ue6M=; b=ToBKwd6QpT2SjFIFZzRkC4TO83
	R+ja4HetC4TYKLm4lDib5/UazB7W5yfXoFI8zv3/R/D9Qr833kR2RO6AqF5AOYzTCdeExX+xEtxvU
	VbcgmYWdswfvAlWt6IaQrLgX48u2A7C3foq+e3DDoayPLYN9jFxKCiD3LhBHzUj79YjnmGJdwzNu5
	zoxK1OPnM8nvau6WahjUSmZZiZSpDZzIk1vFQevwT4nY7RNpyCecfaR6pRk5cyCdKvazmjowLb7Tp
	OTHuwyUBeBCkb96LSCilwMZ6sP/w8FBlTrAUsdxXNUWeeSAYtRSviRdjslk8wP6H69p9reyPhe5au
	j2qcloRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupxD-00000008XPh-4BGv;
	Wed, 19 Mar 2025 09:43:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tupp4-00000008VPA-12On;
	Wed, 19 Mar 2025 09:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742376888;
	bh=srUPQaoIT1eUxODIcp9G8q+P3AERhlCZzGqJ5NwwctY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ahXaX6zGlXiBq77NwXPNWqOMkalJx7KwK2ftYjFCRCXuLWBM4tanG2A9RImzZN3NE
	 uuZZSmoE4oLFnjjFCadB1Rc5JTeSvw8ULfA5HYyQdlQj7hzH+ns+iVsOvajakgRk1k
	 KQmVeSKibWyJdGmso5lG8pcf5D7BrloRFCTF4CGEscMmUogPWIU95ytZvi+VDbk8G+
	 EuzjomDCoTxKvC0NePvTckMEVEj71k/F0BKjxywVE7bmuKmKmiRJYIXUoL5RZkXPjV
	 uODrCu8lxMaJWmyUiLk1XsoJIGqEjZ3WsbrIM1xw5aCmMQxuQ2dy5Q/6pc1B49wVYl
	 bRy61TDStiBPA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91CF717E0385;
	Wed, 19 Mar 2025 10:34:47 +0100 (CET)
Message-ID: <70c10764-121b-43f5-931e-84ffd666c594@collabora.com>
Date: Wed, 19 Mar 2025 10:34:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: mediatek: Remove l1tcm for
 dual-core MT8188 SCP
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Olivia Wen <olivia.wen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
 <20250318-scp-dual-core-mt8390-v1-2-8733e192cc73@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-2-8733e192cc73@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_023450_439963_15290EB4 
X-CRM114-Status: GOOD (  10.01  )
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

Il 18/03/25 23:22, Nícolas F. R. A. Prado ha scritto:
> The SCP present on MT8188 does not have an L1TCM memory region, but the
> binding incorrectly requires one for the dual-core description of the
> MT8188 SCP. Remove that requirement. Also update the minimum number of
> reg and reg-names to 1, since as this is a multi-core SCP with no
> L1TCM memory, only the CFG memory region is present in the parent node.
> 
> Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

As far as I know, the L1TCM is present on MT8188, and it's at 0x1070000 len 0x8000
exactly like MT8195.

Moudy, are you able to please confirm or deny that?

Cheers,
Angelo



