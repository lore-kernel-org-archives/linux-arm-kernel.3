Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23A7C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6UuMu/AFXB1J2Fvbcs0Z4aVuMaDIUe9W1rXV4DbR0E=; b=xhGcNh4mdrbcJSDvRcwPqfcXJo
	2WwEDVJRMi/PA2Oil89zoPsAfiq2uCqcb/o7uG9pfCHp5M4YMkZoGnqKa3AI7+Ykk25DvLz0JcqkD
	Z3C35q8OLcVRvLnpyq4seFlnlMiqpMnk+TlQwwyDW+1EiKuz+yer4OAB81t7sL1vx03dz7CvIbO0n
	aWojEDWF+j9cRicFNu9e4gfz8z0jvpOOvMEYInyRs+59v/AeAkSuMLtfxyLNyB4SsnjShNHd7p6zT
	cwR3XUmg62+lifOimDy690SCCo0vWMZkKdntjxy4lf5xVzYm+PoP4j3ZhcANfTABsVTnApeqouXPt
	D0SHIY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa5v-00000000yyJ-38nr;
	Thu, 15 May 2025 15:01:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZxf-00000000x2c-0qsX;
	Thu, 15 May 2025 14:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747320805;
	bh=HpQRl43T3yE7eJuYJAXq7uvNAvyBKP3XkwGFJiWhycM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pr+dR13n4yOyDf4BqB5b+ZxTRwYBoLgRHSm9VECFKNQl8TWz3tXg0E4/bYhGiajqO
	 jZHyV21wg+e+pbvg8LKtAjt4YUrJ0R9EOmHg6kh0cVeB3nUaKR8TBrJ39u93Yfy6V8
	 BtMw2z1OLYXU/db8iG05px3LYYqUrFN+TJA8QGEiXZIijf36YHLmyj3MbTg8vLIzRd
	 Qoh2ehDg07ud7V5PF6uO3YXQkeV1Ys3bOK2zguLts63pTQonFtPjG3s7uQIO8VO7YF
	 Y1ctfZnKyYX+KzMTC4vxYBE0lxsLh23E9FaoXerQ3f0h4Llw+KVCILvh0N5KkqTeTI
	 VSLAMO4cTUBOQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E966A17E0062;
	Thu, 15 May 2025 16:53:24 +0200 (CEST)
Message-ID: <b693991a-db50-4871-91a4-20d9859a2f43@collabora.com>
Date: Thu, 15 May 2025 16:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8188: Add missing
 #reset-cells property
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Garmin Chang <garmin.chang@mediatek.com>,
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-2-cda383cbeb4f@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250515-dtb-check-mt8188-v1-2-cda383cbeb4f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_075327_398581_971909BD 
X-CRM114-Status: UNSURE (   7.05  )
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

Il 15/05/25 15:31, Julien Massot ha scritto:
> The binding now require the '#reset-cells' property but the
> devicetree has not been updated which trigger dtb-check errors.
> 
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")

That's not really a fix though, so after you drop the Fixes tag.....

> Signed-off-by: Julien Massot <julien.massot@collabora.com>

....you can get my:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



