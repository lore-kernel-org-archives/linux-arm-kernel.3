Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B71E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YE3opEnxm/i8xBcAdkbpSmxgg1FvyzKwDtF9q/yWsx0=; b=rxjXzdp/A6lJ0xgzLPFDXyukxd
	MAV0XopthZyOvyip4uax+ea8edbrM949TIGlj9Yo69LKmT9UxgnZ5tLz2ziPqAhYpYCCc9BlclijM
	6sTwbRqDd+iVnIyJ4HsFEMpST5RA7jS7/3uXJhCSI8bCAKs3JoN5dnPRGczPKbZsd2KykeHY1iK+z
	xZv7T6IahCRzG5SGMCQURxWBMAgfNreNEyzhkQoKH1X53iu28DPZ5wkiwZT/V54LlqtDXZIEFYuQs
	7mL3DOCe0Z7uHLb7A2uks40R1JR+oQ7eoGYsCkG9Nu78H4MickSufdWvOWJ9BsURNJpxrQAdcrNxN
	bytMZAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJp2-0000000592I-2287;
	Mon, 13 Jan 2025 12:45:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJn4-000000058RQ-0aSA;
	Mon, 13 Jan 2025 12:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736772212;
	bh=XqOdrAUyZQEqWO9kl3ygr7Rm5FHHWvXG6zMZ73zjWoI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hBPLmk6GWQy1vyJIfBrutua3CRI70AufqxQbmPahw15Hj9nSyI1dQSQc6qPqnSAHk
	 qrNtxLP7c6rsf6ufv/DpLShIacZVQ1gdEz91frKosTaIvYfq/N8v9DqRiQrWhZ7/go
	 21Lw5BeLj+GOGAN3x12YRhWxeMmeavLRAqx8hk0o00/uJq5Hg0qa4R0tDsZQ9lrkQw
	 WHwchd+kNiH/8Kf2WDIjNqXvQSAit5h283+B/RSdGazOUKdgqQpc4MnQY7E928d7N9
	 lnnBETKvzKen4SCgbMJrafrG8oLQkfjxqPU68KjLJhAbISI/0dXl82bz0go3d14Qnt
	 /oFEr7Gt0iQUA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 22DED17E04AC;
	Mon, 13 Jan 2025 13:43:32 +0100 (CET)
Message-ID: <97ea80ef-abf4-445e-979a-4357dbae2c2b@collabora.com>
Date: Mon, 13 Jan 2025 13:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add property
 to set disconnect threshold
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250111141542.5007-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250111141542.5007-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_044334_324452_FD2EFAFD 
X-CRM114-Status: UNSURE (   8.30  )
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

Il 11/01/25 15:15, Chunfeng Yun ha scritto:
> Add a property to tune usb2 phy's disconnect threshold.
> And add a compatible for mt8196.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> based on kernel 6.13-rc1
> 
> this property is porting from t-phy driver, due to the u2 phy are similar.
> ---
>   Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 

