Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096ECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlBAF2u6l/0LF/DAqfWsT1MEF7JNadsBSYHZboPiQ9g=; b=dGYuX5/wZQ7SNMSAw49PiNaC58
	XCV/tUIlOhUz3wl4NsZ7oBxfBhBdOO5d3DjIFmaFgNzZ2AHkxqEJUPuJuVlynHFwekY5Xd2EGBmDB
	XVGwE18Mtta8iD5jrssioSVe6N36F5sAxE2ouXTGrjP/ZM9esZbjeNnOVoXUi6omyfouMDMTcijmd
	HXc+BFlvWrknXsCtVyYW7MnIlo0yyzs5d+oy4z9a7nIPrCehIzD6Y00XMOLIprv342Ir5+qpoLL7o
	Ry/QGAbendxXoDpiJ+bxaj6/Bf1S/Re7XmEUe+djn9c5eNj3S64AH8JVHWnp+JSDExbsVOMaNqFpo
	f4OHv/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpK4-00000002gfa-3H2u;
	Thu, 09 Jul 2026 14:01:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpK1-00000002gdl-2zCi;
	Thu, 09 Jul 2026 14:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783605707;
	bh=NsUUyYLiMvVkx3K07K1ak3fXf989M3aFmNYTZApMkJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y94DA6lABAfIWKm9mEjfNwpSSs1ze7b4zequXSUlSnjcYU2iBEoHE+09fA9x8+tlG
	 gAMBhdkw+hXVTGiMKO8Qn4xoBLJ5DvM6+FXbkAgeZ+09RMDvYSFNRg0ZO/HH6VQ2mW
	 keAfhg5Ijdh83U32b72/4p5kgV4EqhEUbIJ5Mym9Le39uNfQii6lXmcTd9/bg7CdLi
	 U3Oyp80ASvEE+lkGxl1J1hPnPws/76oNSIJ/GYGx8NCgxZslQJowTiTT5sLNgOvLFK
	 7iJFoG+Rus5j3gV8hCzX4L8BsscHKysfrGVm3aaofUahICkOnVyya9yqYiY2p+olKM
	 p0xXvGGoXADSA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B847317E0D33;
	Thu, 09 Jul 2026 16:01:46 +0200 (CEST)
Message-ID: <122d78b9-7e22-449b-ad27-f456d807f9e5@collabora.com>
Date: Thu, 9 Jul 2026 16:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/18] dt-bindings: clock: mediatek: Make
 '#clock-cells' required for MT8195
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-3-2926da3db6cf@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-3-2926da3db6cf@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_070149_900332_C486B5C5 
X-CRM114-Status: UNSURE (   6.78  )
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

On 7/9/26 15:42, Louis-Alexis Eyraud wrote:
> Both MT8195 clock controllers dt-bindings (clock and sys-clock)
> document the '#clock-cells' property but do not enforce it as required
> property.
> As clock provider nodes should define this property in devicetrees, add
> it to the required property list in both its dt-bindings files.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


