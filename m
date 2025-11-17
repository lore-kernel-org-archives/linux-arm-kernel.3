Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA79CEBF91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLrE+Xe/tM2iNWEeeW9NyARXz//zc48PjG10FHjnRc4=; b=cg2JjmD+GBzfMkNeCtTeOVwFnf
	UOJsiPRsFyjGPKz8gnApQtzkoJrGyUgJQTAkE20RqE9QvOkq1le4Qw0vcsdzF9pCarI9sok9dVYFl
	mjNVG97vzLtVtR4nIfBz4JttFeW1HXf8L6WuxcWtX/SAXH6b6ID0h13/vnO5PuROhN7hILGcDTAhz
	03mePtgjnRE86xkv4WnfQ8FeWL6OU9eE0EXCgf5bwn1suuuso9ndVKAUk59vR8XK4xyZF039GgMRB
	vEJ/74nMgPc+sDDRwR+zSGJ/vmpsoVzkqaQfZWm4chEH7ltmFexkbyhYNFkGcZwSKGRRRfpzza6k+
	aWWFnF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyWN-0000000G6Rv-3r2G;
	Mon, 17 Nov 2025 12:39:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyWJ-0000000G6Mo-3n2P;
	Mon, 17 Nov 2025 12:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763383185;
	bh=PB0+E1D0L9+GU+4xrKEDPFnH7XAiL88Ghkuup4edRvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZP7xUdZnA+iY2xvQ8ruQCK64QTmNTmonLAj+Vbid/uSAR+6FRmf5Eq0BP5K31uPGT
	 rqUcz219GgcDxiw+FxHk1dZY2YBIdkMK54oQNItk8i7dc64jZeOXpdCAqh1CmCy+NT
	 5hFZMneqk/XMQ3B/GuBmDwgLET0MaI481++oUiS2z2623N73G1UyjbvOzdqPdHFxom
	 ZY0CYo9c/18qEsBGpQHAVV6jy/psfKck9AwYTgTToI3uydfMJRoNqaKaXF+WMswgJ4
	 EB//qy4LohQqYIm9zJPersg7sfaP8GTc12OKs+Syew73dJNJXMCBJJ2Whdtwdg3aSA
	 KAL5YuMdDH9kA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3CF917E009B;
	Mon, 17 Nov 2025 13:39:44 +0100 (CET)
Message-ID: <0e3c692f-a6ef-4d1a-a412-a57b0a0ee8ee@collabora.com>
Date: Mon, 17 Nov 2025 13:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] interconnect: mediatek: Don't hijack parent device
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Henry Chen <henryc.chen@mediatek.com>,
 Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251114-mt8196-dvfsrc-v1-12-b956d4631468@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251114-mt8196-dvfsrc-v1-12-b956d4631468@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043948_108923_4AF9A8B7 
X-CRM114-Status: UNSURE (   8.82  )
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

Il 14/11/25 17:54, Nicolas Frattaroli ha scritto:
> If the intention is that users of the interconnect declare their
> relationship to the child icc_emi node of the dvfsrc controller, then
> this code never worked. That's because it uses the parent dvfsrc device
> as the device it passes to the interconnect core framework, which means
> all the OF parsing is broken.
> 
> Use the actual device instead, and pass the dvfsrc parent into the
> dvfsrc calls.
> 
> Fixes: b45293799f75 ("interconnect: mediatek: Add MediaTek MT8183/8195 EMI Interconnect driver")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



