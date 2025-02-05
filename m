Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E4AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4GsADFOHfjcUX4KtlxuL+Z7Dquvlgf9Jzn55Ai7h/Y=; b=JNmGhJK4MSyouoO+MV2ZBXrE9E
	O69X2BGYJQCnZGgy8llPd/1j2KETNXoOqZcgzyYgJBax9pDV4LV59ScaoBYJ7FZZLiXxGr1e4wTyR
	3dG1zNkSRNtAFetQCOM8eyJ94FBw+9W1qbdNzB5viNypV8p0xwkjVpMhCd/lw44UlHkvaUL1E9F6w
	VWY70sQPof4W2/dTwe1JihRpXZmMWbuoyYtoaq2k2JGHKgoh3Ab8ARtxyLAqlJd735drz5bKMhu16
	eBIRw4cp1HSdxjwSTKOxYnin8EcK5bU/zu8ETKKUWGz1IFqBhyl1Ep2MvVmo2xusloYRV3uYIxYyW
	qUMjGa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgJA-00000003Wee-2FZz;
	Wed, 05 Feb 2025 14:23:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgHn-00000003WSX-0eTB;
	Wed, 05 Feb 2025 14:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738765308;
	bh=fhMEwcALAhSfK+SWPU9qQDr85DpG/Eze5bn+xtW7Z4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DrbhifpmzXk3n6sKkMH891McvA2rfGevLNNwxdqOuE5qZGNITVOXx6bZBzTJ/TEaX
	 wAb7wOkk7PCzGg0+DiFM0FmZdTSIJUzsKoJPWYYnKyCqDRXlsaRUSxUjpXKaCN83Gs
	 eqJqE4z2CRGnz57Z7NUeyjif7aW9XQlMM2xq51Obyg/fh0YYdAp1U6yK7glHGBQxVv
	 qXp4jKAHq4T6GH2t0W1OHAGMDoxggPLXkz7UhggqGtHDTeCIJtQQ1XibX3ZwRITdqp
	 aWcpQBY3KglIt2YK9PYTq4SZldTHOkjm9yDbBBsT9bmz6oSyVwHCAeExLuFzYCQQRs
	 ZIybmSCm7sQ2w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3ACE517E1519;
	Wed,  5 Feb 2025 15:21:48 +0100 (CET)
Message-ID: <83a354d0-e220-449e-b03a-12012ab0d5b6@collabora.com>
Date: Wed, 5 Feb 2025 15:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: mediatek: add mt8370-evk board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com>
 <20250115-dts_mt8370-genio-510-v2-1-fc9b01d08834@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250115-dts_mt8370-genio-510-v2-1-fc9b01d08834@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_062151_346436_9AB21178 
X-CRM114-Status: UNSURE (   9.16  )
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

Il 15/01/25 11:29, Louis-Alexis Eyraud ha scritto:
> 1. Add compatible for MT8370.
> 2. Add bindings for the MediaTek mt8370-evk board, also known
> as the "Genio 510-EVK".
> 
> The MT8370, MT8390 and MT8188 belong to the same SoC family.
> It is a less powerful variant of MT8390 SoC and their main
> differences are:
>   - Arm Cortex-A55 cores number (4 vs 6)
>   - Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
>   - Arm Mali-G57 GPU core number (2 vs 3)
> 
> Like MT8390, MT8370 hardware register maps are identical to MT8188.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Since you have to resend the series, please remember to add Conor's Ack
that was released in v1; in v2, this commit didn't change at all.

Meanwhile... please also collect my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

