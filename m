Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CF7C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmADAoEBvHdHD2d/gST60pYasMQlUsuvVozABAcoVak=; b=ewh4aGF/D2WKZ5EcyS+QQomeg+
	L6XNzo9aMKGif7eFAvX0BQLZDDcYbXkQ8kRa9iheID54rC9wczYa67D50QX5pXedNwY5ctKXRq9zW
	XGRxM4siKidK0eSztXuqqSLdue0rtV8YD+QepuU7PvRinvAZPIehBj660Y0VllrVYroUfDncIz3IX
	aG6LiL9eKlJ6l32CQpMmrZC0DxyyArrAqUlmBaF17ybQr9pl4AwE4PoSYISDPxLsnFH26ewekwURY
	sbQbWgmxSR0Yj9tE0i454A914gvgW5kckIuSdPWgtnbHmi6pzu1/GQXM3kdUTZy/Q60Co+L0LG4nH
	KDOZ+6hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FCo-00000007d9B-2BND;
	Tue, 22 Apr 2025 15:06:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dii-00000007JHC-3bPV;
	Tue, 22 Apr 2025 13:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328687;
	bh=FJ+H6qNLc32NphI5YX+2HPS2FGnq/hpZqebOoXEmT0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zi4HcB7xvv2AnzdQmSBfHK/iExVod1qcoLkof1gFRJNrv+xk/ETPVfVCyIuIaMIkp
	 6x9l0rjNlqQzEYkzw6mhujTOG7eOJEQ8kayVAQn2wru1AOxpkHet6r7z8Li7rUkqTe
	 g12ebHEcXleSLdCqpLMImo/pKhoU8PiaVcOmIhAs/pg4MBc0WlVLevdL7S7mjL3rdc
	 dr54cIAezKNrb1jdrgzQZqTk/+/OQradYxvW72Da/3pI/xT4IRWDCHy9vqJjxdM3zY
	 PN5XaIIupGaq8HbGg3i5OlxBAKJtXC4MC1BD/Gfeh3YdrGpqFyQ2r8GrwSpZlrnYyi
	 Bl8osISpj2YLw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 39DC717E0CAB;
	Tue, 22 Apr 2025 15:31:25 +0200 (CEST)
Message-ID: <80b19eab-78f8-4403-a734-73db5244a07d@collabora.com>
Date: Tue, 22 Apr 2025 15:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] phy: mediatek: xsphy: support type switch by
 pericfg
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-7-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-7-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_063129_043100_306AE045 
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

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> Patch from Sam Shih <sam.shih@mediatek.com> found in MediaTek SDK
> released under GPL.
> 
> Get syscon and use it to set the PHY type.
> Extend support to PCIe and SGMII mode in addition to USB2 and USB3.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



