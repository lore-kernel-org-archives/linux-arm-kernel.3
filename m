Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F78BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 12:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1dodx/W6V2vRanrdyrFobxtAPht3IBjUXG7tqnemMo=; b=lXaB8RsVrVMI7A/ocJ0WxIBagb
	jXFN90CJ5OZSRLsizdI+p8jCEtduVU03pmvv0LDRrvJM1bhyjqLsmyU2wykuwuwUrOa5gH9Hreuec
	KzBtzVglLJiZpMedwWvKSC8EmuWwywwpU39BvFdVJxMx2ae2Sh/OLvgQbxs2QDQdH7YlY0kjRDRGE
	wrsJvMqDKBvxO8sr80pPq3OEhORGTQFbd85JmDS+kaD4z0xj6KSPeXR0a8i0tWSzJnmiq31ICSUs4
	dHL2rTb6RI71J9B1TVUiJBhsi5kczmqw5AhA/HmwmITtXKXikQPSOLEzfbZKdWEiSCCAgIl/ykOQ9
	Xxg/va2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcid-0000000DbHC-0pXK;
	Wed, 05 Nov 2025 12:34:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcib-0000000DbGq-0X0s;
	Wed, 05 Nov 2025 12:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762346066;
	bh=UMSS8SlF1ZpDPeqH+yFQO3jA5s+oh4KLe88rrJ2+bxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bcdgeY+X4d42ju21u9ouguNkx+sAkHLrFdtoOdfrYifMeiAFNJNA1XNxUP43b6UJX
	 tlnlwWUse3ZMbACKuxaIGdtxNA9U8mlsauR/zeUhnL8jnSD5LHKh0aeM0Uc1rqfetj
	 i6iH/18EbR5lbJV//sVViA8M1qIhGET0vhxUKymPAvlD9W/vpuNxlWVZbB8AbmyDuZ
	 eZwuAXiEBfaI0/pPTZJeDa5GEkO6DZQMUw49uLj38zJiL6GqmusBfUMKR4+6o4/Wra
	 PQZuE3/jEsZKgR9JL//jqNWFiVdB4ESp3bHcC60rFFsiW3tDmrTN45DJfhqIKWwKGA
	 /uYcSaKHjDyEQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBBC517E0B46;
	Wed,  5 Nov 2025 13:34:25 +0100 (CET)
Message-ID: <0e4d55b5-92c2-4b59-8b58-419187e99a25@collabora.com>
Date: Wed, 5 Nov 2025 13:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251027132817.212534-1-linux@fw-web.de>
 <20251027132817.212534-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251027132817.212534-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_043429_324950_70D746A0 
X-CRM114-Status: UNSURE (   5.93  )
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

Il 27/10/25 14:28, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>



