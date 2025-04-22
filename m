Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461ECC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ax92qNfk0o3f4jBGi6r0hS9ZQOL534BggnVtYherRnI=; b=PEnKPfkv7SX/QRObrA5PofSX9y
	hGFdpKQQNn3N2MFbR3BItdisBKvjV+/XyqWPKggx/AdVkA2o+s5NWboVozsTTTPVR4vcxy9QvFKDv
	yctznCvIltWtU5FszDxK7BIEOi4dUL19cn6Kic0PNtHNXpwgEeu74b55zdWpldfsR8wcKpvhS37zI
	BoP1HWjGmJTU8gsj510e4Y67/jAHy6shVhAF2cq7cpbLVUaP89UCboh737lDDkB36QtPeROOmeAxK
	ScNHmRrFbxbF7TKW+1kkcFT7gDUYO1igPbEMUtFwvv6AGkD0u14iEYOCH7JizOIdAQHnKfrEb6WOV
	PpKbRbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7G2Z-00000007p3z-2IrL;
	Tue, 22 Apr 2025 16:00:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DjT-00000007JRU-19u2;
	Tue, 22 Apr 2025 13:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328733;
	bh=a3TPpkp3dVLMhX0tMuwCmJmM7PVgdf6PB6QGOLrovas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YUBtroK/3p8k8uHM5z6Cxtc7xtjzoqpysmVKAjTwndu7tgXEBuhSQjtxkxMpgScmT
	 29TVMZplVlL169BEJPbfbphTUXVwRKSxNmoShfAns7m/OVq4qsSfLIzQayc9DuAQTd
	 uC7Cu8TfDrKu85ibkgwKdW/D48myOPHMnTIvsSQ5ViJBMkDS/eA0YfnqH/J+m2Xuyt
	 G+ZnkVaipXffimU20ICLHI41jGHxlT6kr22w+PaRn78wqfWf/FxeCaKLfsdh0Oj7F6
	 xmut/4fbjSpoUIH5bkq+EBLfg9rX9IF1QpY9/oI1JFFtk9KovbKZaDoY4eCwnEy9wG
	 zCIwqwx0nOPKQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD8E817E02BE;
	Tue, 22 Apr 2025 15:32:12 +0200 (CEST)
Message-ID: <950f38bd-4156-49c4-9b28-2e57d162fe48@collabora.com>
Date: Tue, 22 Apr 2025 15:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy
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
 <20250422132438.15735-9-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-9-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_063215_460019_AB054AC0 
X-CRM114-Status: UNSURE (   5.13  )
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
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Enable XS-Phy on Bananapi R4 for pcie2.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



