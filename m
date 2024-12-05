Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FCEE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FSoBruGgC4Mashnn0FoJtbDnOZ/poQI2/POm1QQzug=; b=SobU61db0xbiowli3d0Bvq9b9f
	R+7dbdopRsPl3mVfG6epTKC21RnIdXXl9xJWPtmq32IAgZvrHTyQAd3zWg3BIw0c/cYvZkiWoWtNh
	EGvaAmIbpR0cyROaAPkazO6kTev+ZPK4QUq3CbAcrvqnqG5FpZ2HJIK8on8mchfU4Z4xZLarmEYYj
	5MLzNGrvq0UtzC4sUeQ3JyP7bCY5jBj4F8FqyGSiFJmVRGEMzw2m1ozocC29kGafHrAXk/hcagRdi
	XLmjPiZ6L+k/VIZMl7J9yxMLfo5SiJvU4wF2zy4JacKdOLDKaC1xtlkTOkYTVtQtQv5vcataOaTgo
	hvMy3P2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJB0B-0000000FxgA-2QFo;
	Thu, 05 Dec 2024 12:30:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAwM-0000000FwM1-3NrC;
	Thu, 05 Dec 2024 12:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733401601;
	bh=Cg2jZaaPgzMESHR4C1o8BdIGw9sLxW6tfmMx+40pTl8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LVF7mNhsDSmQY3t/UBWzTPXb0hNXbPF5YVmAtbK1domwZ+HjPsTVIZlYDi0gURnY4
	 DVZQLXXWs5/f0im6JEL0VskpfiMBnji8WZq7/jrmnHwWgH4KRGqWo5r0CiUuZRC7rO
	 J+67P+PsGvUqSgir5KOpgSqeTIworRtOyotTOIwa6RnEOddx1qR5A2ZunUvY8/mBjO
	 p1COnOU82p9dEMIZAGn4alnQmvAaI2/QOTGWgHOnm9l2ci6HFg4qIbbuwp/Txy3e5H
	 rLf+98X93ot7iIC2c4DxMn3trloOEXGYXtKFk4jQHflk0GLL7s4ES37MBPgLdzxWat
	 3JLd+FvRWz9gw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1811817E36B6;
	Thu,  5 Dec 2024 13:26:41 +0100 (CET)
Message-ID: <8192b0b5-31ff-45d9-9013-949483425791@collabora.com>
Date: Thu, 5 Dec 2024 13:26:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: mediatek: mt8516: add i2c clock-div
 property
To: Val Packett <val@packett.cool>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241204190524.21862-1-val@packett.cool>
 <20241204190524.21862-4-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241204190524.21862-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_042642_992900_59A390F1 
X-CRM114-Status: UNSURE (   6.36  )
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

Il 04/12/24 20:05, Val Packett ha scritto:
> Move the clock-div property from the pumpkin board dtsi to the SoC's
> since it belongs to the SoC itself and is required on other devices.
> 
> Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
> Signed-off-by: Val Packett <val@packett.cool>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


