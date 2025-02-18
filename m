Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348DFC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vI617hJIiSd+279o1LaKFJ3bEGat+OW0fQy6b1EuyOM=; b=sRan40ddapr0S4g/nPRKaNnr2F
	BhKm/g5+QWyv9Kp9vx1rNaFRN9AEphqgIuJi2p3lQMVOak9cbLfvkMDmm7xRPRRfytiMIWoiuFpKj
	Uh3ICJKgRq3tuJv98TGmZ1u+Dae6/RkxhzLQTAgLFIm/LR+Ao/Aeet7PC1kESl0rUnncjuXPOsLoi
	CAscWqLp7vlZf/Nz8BgemKj5sWiXMgOisxZChs3VfdqoBXB3NmqemLTwicYO3C2EDiGDTYlWWvKvH
	POp3DDIIeMxjsrhyds5q2o52tIVWe5wGBzqcL1jSbZKiDMkZS/n3qsIUDNZG2buTbisNVJ0/tMWEW
	l1hXN6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJSf-00000007Ois-3agP;
	Tue, 18 Feb 2025 09:00:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJPl-00000007O7A-0jVO;
	Tue, 18 Feb 2025 08:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739869031;
	bh=FAM8Q0Vg3RX0znVoiEabsoyA+LQWwAU+aFTdXsSmpow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UBX60/LOc8k0z48ex/gZNuGCt+3MgHPT4Ntt6Ib695Yai7diMjadnHACYzrE34M8U
	 eKjp9cws36qoco5fX9OsbLiQchRN3lp3whUNZ0SUoR5+e1KIv761G40lwnYzmSxMOu
	 nQPjdFpYJk7pKfvsIJlcgaZEAumEs/JouVKY29Z7cqHQ2rhFltEk67r2/BlWcS+JNv
	 wt6xF8W98DVB5rTsuF/szJYDf2K4bDd3UhI0co5z2kNk+VZRv7I5BJEY/QPhC8Cpbv
	 lMm6wszrA4QtfcQe50eT0C2bFhYtksAF12QZTix1aTdMs2X6rtc3GqTO9EyTiAP++l
	 shVCBOK08qg1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D2D1F17E0CA0;
	Tue, 18 Feb 2025 09:57:10 +0100 (CET)
Message-ID: <eb9d0d76-f366-43c3-8c41-baf588ce6ccb@collabora.com>
Date: Tue, 18 Feb 2025 09:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: usb: mtu3: add support mt8196
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20250215100615.808-1-chunfeng.yun@mediatek.com>
 <20250215100615.808-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250215100615.808-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_005713_384369_5FF3E0F0 
X-CRM114-Status: UNSURE (   6.87  )
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

Il 15/02/25 11:06, Chunfeng Yun ha scritto:
> There are three USB controllers on mt8196, each controller's wakeup
> control is different, add some specific versions for them, and add
> compatilbe for mt8196.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



