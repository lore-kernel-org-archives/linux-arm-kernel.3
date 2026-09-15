Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FDBC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5REm5S6zcIznrQIDmtk32/NCP2kRm/zm57f0UbZR8EM=; b=ecslLKebNHGjadUQk2/7NaCqGD
	bqifkgeCR5V7d6TXd+1wOBDkbweZQL1T+bVnqqs7e0wUntBrP1PWzc/qxU0zXM6LGi7YxVL2ki5o7
	dOm+xGYWiywo6c5RyO8293cjpj0p3NwykYWNh/o73TUvXfjNJhGUXJu0VeASE1paRgyqeXBOfd5Yr
	34QRwHHrYCuQE8qZjsXbzJs+2KujSN/tkaxNeBUZPVRAa0EjpEE3sXiu8NT/Vnfx71REMl8N1ZBt6
	mO/esduedAxL1uxEKIERkYPgmGpQRmjqOqKyZ2pyIKXSo/IQnJYV5YfSLNTSt6cOq69zsrM8csRUe
	DCUG4SAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OG5-00000005aGe-1Imi;
	Tue, 15 Sep 2026 08:11:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OG3-00000005aGE-3FYV;
	Tue, 15 Sep 2026 08:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=5REm5S6zcIznrQIDmtk32/NCP2kRm/zm57f0UbZR8EM=; b=Snr/rU6nt8U2f9ZJNylG5FnDlC
	Q4FB+5FKeppASyv1jTHvc/N7xi3Hgh5HcSFcUcEf6B9C9kFxIYj9ALazGL3F5RxpvEnzvVHtQajyX
	TlNw1kchtEQ1wCSkWze/DY4jCvCYyC58on23Xh/vhHUlSGZluhmK3TXOrcO2gcDJlJ9edfire4EFn
	gHyAFmLb02kfwwq1x89SHGx6xKvP/KQr1WX+o8RLeu5yBe2PeQqKyNQ0/qgjLzL2MoAG6hK3BjE90
	W1/DVUh5wInW0T8feCSssT7UT0iwmdnE+ladvXHqXNtCRp1pHLafi5u42TzNw/G6YasuXQdl1YsJa
	8r7+oozQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6OG0-00000006PiX-1kyg;
	Tue, 15 Sep 2026 08:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789459870;
	bh=73uxHy1r6MDxkVonn+dnL6V76W/WjmgP/tDb7X6NpH0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=SNehmjn60lFlzv7E5Awg/TFLz5X6IXjV7ICJJ1yoSOLR6Z7ZmKSaEVaZbkI7T5ar7
	 T7/N7K8G2pf+FKgQ8+zn13SXIfQTdmdRLPU3TiLAlRAngPiymIcIbrZcH2bXoOMrSq
	 WMW6vd959bdeeZlPVCxdwlOu0E1A2kpbNEiapKipIgs8+K0rkeSL/MzqTF5cXMBeVo
	 iYMHGGUscFnJ/3Mvvkgv51WTqut/My1F0QAQTs51yswrFD1OrM24mQeB9xpi5FZ2x5
	 6DVh0NkOzQIEoSOm7SvmFcRiNL3e9u4chIxOHgm6Px9Ty62UQ8o0Wjy+iHXJbQazPj
	 ty0MMTMnTr57g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E50D17E0A27;
	Tue, 15 Sep 2026 10:11:07 +0200 (CEST)
Message-ID: <b81258a5-bc38-40f9-acef-4109aeb94d56@collabora.com>
Date: Tue, 15 Sep 2026 10:11:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next] dt-bindings: net: Use consistent indentation
 in the example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>, Vladimir Oltean <olteanv@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jeff Johnson
 <jjohnson@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alex Elder <elder@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 ath10k@lists.infradead.org
References: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914155645.112508-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_091113_045652_F0BCDD9D 
X-CRM114-Status: UNSURE (   9.65  )
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

On 9/14/26 17:56, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> In cortina,gemini-ethernet.yaml also drop the wrongly indented mdio bus,
> because it is not necessary for the example.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


