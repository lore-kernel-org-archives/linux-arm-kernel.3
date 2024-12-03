Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C45D7833F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeGzqDsKfny3adR/ub4DCJNWLuB81OD3FWB1yFQDSQQ=; b=dvbO+3bs0dkvfM3+QcQUf1YY6b
	aOQjtJFOxdcIU962qtGVfqzz420o/UWfjsgu/mJwbWgAWJbYEtDVX2ZK8clNwF1vXCQT3S9UjJoXA
	LvVcyonaGDgbjOiou/HGD9oiULX4ruVfd6zLNdGHXkptcXv5nkPdeS9BbAEzgCw1dBOSPWKcjs6lg
	Uu0OT/6s9pPO/WrFom6o0gTzKidVpJCfrZTwvnvB+GC+WKvXxUAZDfCZTXVVzdQAR87QiT3sP+Y+i
	U5YTBIZ4hbiuopRUTu83zAucJqBYEcDFMqOdWa/9k5U5M5pya0fMeUfy8lp+xEQyzLxCwckNnFsNR
	2QM48niA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPaB-00000008yv8-20uz;
	Tue, 03 Dec 2024 09:52:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOi-00000008w05-0KKF;
	Tue, 03 Dec 2024 09:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218846;
	bh=laaNjMg56MvPUhDv1LwgpHIuRSg4IY7Sa4HQlZTICyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XLv5+hZd5hwAXAebciYwJoi5NvNz/4bltwvcvQKKuUna+1DX0bteqvVe16tRZii3X
	 XDZ4qi/2/hzAyOGw50wZ82N+SmaQszLte2Wef4TetoBESmPtIyCz4t4soMSe9GeeGK
	 u8EN4BhU6Os//ICh4dIvWdOr2gxxY21gHIW4ezSLAroU2s/07mSbmoTKG0eX5Dt7tZ
	 OuxLnduNqfXEDZT3M/wtfrHK96I1KVWFNiKqNBHqJhafwTZieQc03OCDiix7vIWGi2
	 iWsMHNEh6uQfO9XSE9JYkN+oijuoPduUzDQMs98IDetG01+ghIfG578WuLVCFtV1ti
	 FBDP3s188ys1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B25C17E35D0;
	Tue,  3 Dec 2024 10:40:46 +0100 (CET)
Message-ID: <32ef5ab8-a163-4fdc-8603-f5a6f0e8526b@collabora.com>
Date: Tue, 3 Dec 2024 10:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/18] arm64: dts: mediatek: mt7988: enable serial0 on
 bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-11-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-11-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014048_260290_3D50181D 
X-CRM114-Status: UNSURE (   6.04  )
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

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 

arm64: dts: mediatek: mt7988a-bpi-r4: Enable serial0 debug uart

> Enable the debug uart on Bananapi R4 board.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


