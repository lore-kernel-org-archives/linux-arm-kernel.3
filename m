Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DD0C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCZrYgtPWjIWckd7VGhJje5/BrYsMHBsXx5vU3ljpw4=; b=uKAghiPaJSNTcg+LHbPSbzFpPS
	/WakPN9aeCdDKR+fPcapBz9UPjV1RiGxzroTBpLyXtDMdm0TpepuxNtae07zI9Bvg0gC5ltZkfvca
	X0snYJR7kOZO+5EU0a95vzucRjrmj8bO1X9/+T94xy8swp3UqN59lzcpXRE29f0j8ObAqewSn6X6a
	u2FXmaT9ZZ6svCyQgkbV82PtzY6F1nTib/hGLojHbGMq5/EJ5XlIcohpAkGV02FyGaeZyBgghmbld
	xt9+ew8DfPTLW5tnMMd1gSrjL7IFt16q6+Ku494rIIbNIBOrvK02adk7+wIQVZKSXIGLZuYOooZQv
	AHupiO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUQd-0000000Cowx-0nnc;
	Mon, 24 Feb 2025 09:07:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmU3O-0000000CkKz-3bKZ;
	Mon, 24 Feb 2025 08:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740386585;
	bh=SozSg9dc1TXOA0tDS6ZfB+gsRaqvUCgzO1QzpaBKudo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lfEQ/0p5DwuSRVgPtxscSm6UyJaA19pSK0T7kj4PDjI1oCFlDLKiCklRvCYSX95Z7
	 i9DaHLl48ZWUIATV1XzgL21XL7s76EZ4dLzJMQYdQdrHOO00qfCNPUrXJJAz9gFnwL
	 XGxdjosE+2LbfSKZMT8hNUxsStdwLOKORt025a80DXpPRo88Z5VakYejOJ8wlzU83c
	 AetXlnVOguLFcJrmYOGCNy9PAVq1AG7PA1wv2ClUhhIE3lBSVoAK97z123f5LYJ2Ef
	 QC90IhwY5kw5+3ICo39YwYK15qmYFSijd8mJ9+6EYDx2XE+/NdTVxaR8dxlnoL4yAs
	 5W7/Cb7BzEaoQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AD2F17E0187;
	Mon, 24 Feb 2025 09:43:04 +0100 (CET)
Message-ID: <9225a454-f76a-46af-9a90-e0a074c3e268@collabora.com>
Date: Mon, 24 Feb 2025 09:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Fix duplicated
 regulator name
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250221-fix-mtk8390-genio-common-dup-regulator-name-v1-1-92f7b9f7a414@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250221-fix-mtk8390-genio-common-dup-regulator-name-v1-1-92f7b9f7a414@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_004307_070678_01213227 
X-CRM114-Status: UNSURE (   6.52  )
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

Il 21/02/25 09:49, Louis-Alexis Eyraud ha scritto:
> usb_p2_vbus regulator has the same regulator-name property value as
> sdio_fixed_3v3, so change it to avoid this.
> 
> Fixes: a4fd1943bf9b ("arm64: dts: mediatek: mt8390-genio-700-evk: update regulator names")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


