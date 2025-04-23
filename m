Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EB4C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVUYHk8vei/gLcz1PHeh3Ge12QSVhUejHc8eJMErRuE=; b=jMBag8hm7pJ8xeXNlvowvl0Tan
	3H4t9+Hn5FL26KuTXE2fENe5SODFcIApoqsXDQoHQ8onHax/xz8qUu4aoCMu3gqva1zaqeQpANPHp
	Tg/nrtb4zc3dzq2XK4tCjNSQR1qYubgL5nG6BMmtUW98i3HDKZ5HisYgKWAY39lkz9EJeyc+P0IlY
	JjSdpnp64VRpiPtHaaD7IjzH7rOYt27VdsstKKw2zBoOMAIQhPRgxj0fUigy01By6Guac5mPC44vp
	Zt2ShlaydATl8ZW97WrpjOmCEb1GCSe01YZN0DNdDFHcECf1RRrtA5boA5xTVlhuCZfjkfQgaJS1R
	aj5UrLrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XhA-0000000AEKN-3kKa;
	Wed, 23 Apr 2025 10:51:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7X4j-0000000A7aA-35jC;
	Wed, 23 Apr 2025 10:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745403087;
	bh=BT0URqQuwfsACm4vF9xOCdDJ48YY41muRXdHRTohRGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fcWNNml/dvVcgeCLvWLmhaz+03YnE1QwDR5CzBDMX7VIzBW2poxomoLaLFVapa6Yg
	 DYsiJVRG4LJpw5j+bEX6ALNndC6qa7blbyD29czqnVIkznj2YMTjHQLcSgoJ/v4UbE
	 aoLuv8uFTZ30H30ZMPs/sWmL0lxIkcQ17tRPb4zuLuT6ov5mi8e0ENnCkVudcEglFm
	 JUxiF93CwtpVHdAD8o541/A5qJj/ViwWJETMCUW0BkyvOEXi9S10q9DhRX4lL0tHig
	 Fo+jzXe82zzKWFalAmKRmCA/3+udRtEpf+glAWmdT0uCBRA8yav3KiQ3xGVhIogxK+
	 GIiAKS0ja2Ofg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5943E17E0FF6;
	Wed, 23 Apr 2025 12:11:27 +0200 (CEST)
Message-ID: <77edf457-75f3-439a-b3b4-b4b03e319ca4@collabora.com>
Date: Wed, 23 Apr 2025 12:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Add display
 on DSI0
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250224-mt8395-genio-1200-evk-enable-dsi-panel-v1-1-74f31cf48a43@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250224-mt8395-genio-1200-evk-enable-dsi-panel-v1-1-74f31cf48a43@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_031129_962410_FEED2BB9 
X-CRM114-Status: GOOD (  10.62  )
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

Il 24/02/25 14:34, Louis-Alexis Eyraud ha scritto:
> This board has a Startek KD070FHFID078 MIPI-DSI panel on the DSI0
> connector, so add and configure the pipeline connecting VDOSYS0
> components to DSI0, with the needed pinctrl and display nodes in
> devicetree.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
> I've tested this patch on a Mediatek Genio 1200 EVK P1V2 board,
> with a kernel based on linux-next (tag: next-20250224) plus the
> following patchsets:
> - MediaTek MT8195/MT8395 Display Controller Graph [1]
> - Add driver for Himax HX8279 DriverIC panels [2]
> 
Applied, thanks!

Cheers,
Angelo

