Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0933CAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/wcBwhTPg+WhijPk23CaI2hCH/vm7Zi74wsiKBa9Ts=; b=GCQp81xM4ctBLt1655vcF21Rny
	+aY/RIWxdrN7PG0WyJWJhTwYW6xGsiH5HvjPYApytkH20Q8RqlAH6wGWFgq+V4yeyES9pjh+hYhJi
	UoZWE1R5r9kpRLrkmV0fgWNv/PEOMbpOIgH65kHJTfOAG81/3t9scWYo0RFOk4q+kmtF+EOtzad0t
	wAe4EiyogVhDWGXS9FXwjX8FtPati5qePjcqZpXy3tHkSzRmtrA7fxGFJfm6fS9vXEeOijPk3gPlk
	mN+CkH+tSXTswKZRAKEmj5btak0EEpEwsw2KkAzXSD6nUsWqvUwL+6Jhyo2onr/3mUzW2MPvS1Bi7
	oZnGw90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NQl-0000000Gp7J-0b9v;
	Wed, 24 Sep 2025 11:13:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NQi-0000000Gp2z-4220;
	Wed, 24 Sep 2025 11:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758712378;
	bh=mEaPxnXPWDr4+sD/gn++M63cz2JPCbACYRxAhexmBWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LpkfQhXpa9huGJydB70kP2swCrNVh7lR5ONAGi2uIpFKwLzt7bt214owUR9Wr9Ywm
	 oH8+UqTL9Bmf1iLkT1rkaCdxYcwgBhYHsTd8IhsZ7oDcq2SKRxb2i5v3odVk+qF8oE
	 dXuhqx9sMNrobUcg8p16NPBGXFpx3v76T8z7go5XExyAQMqSqQDJWNZ5GMfQrsKvW5
	 I6EZTdZEeFE9QTJxHPYzJsjVwZ3efFXGGno2yRvnaH1wvpVh4G2mb1lHpvGTLnZphK
	 u0f8wLM8IE1kImVtn4uApybH4xzHOo0QrQMeVBtmhv/LEXsa7ac7KTSGmVaRXAtLYh
	 672EkJtLChEBQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C3F617E068C;
	Wed, 24 Sep 2025 13:12:58 +0200 (CEST)
Message-ID: <f495967f-5713-47c4-afec-723d4ad005cc@collabora.com>
Date: Wed, 24 Sep 2025 13:12:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ARM: dts: airoha: update EN7523 dtsi to support
 resets
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Felix Fietkau <nbd@nbd.name>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250924094112.1918444-1-mikhail.kshevetskiy@iopsys.eu>
 <20250924104850.1930254-1-mikhail.kshevetskiy@iopsys.eu>
 <20250924104850.1930254-4-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924104850.1930254-4-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_041301_174917_6D44E4CC 
X-CRM114-Status: UNSURE (   7.43  )
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

Il 24/09/25 12:48, Mikhail Kshevetskiy ha scritto:
> This patch updates EN7523 dtsi to reflect the reset-controller
> support for EN7523 SoC.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



