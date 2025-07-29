Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20829C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMaGGeGHpl4q0kPHM6R5Fz8DgB/JyDHDYQx2qu7cB4I=; b=RmLCkW3cXMD6XvfbGQ4R36cfBQ
	Z2WN5f77jQ6XlxWL+WOcENh54+EG34TnzM8I6f/jtxbsC8qiAfbIlsWqSHRYPoz2E4n3BQ+qn9m+L
	qWQ4w5t3yk/q9dAocuoPDo18MJLXJSqPoVrIzz+CvGxm9fZt3I/3w6ObtuJrTPHv41PTQehvRTA69
	hVFgcxagvEfj8p0qcMQplgLeOcZS4Q9lWe6quVGYAhoUHAx+BsOjGixtkC81zhtjOCUFCZQj+4fBf
	HP9XoM5PL2jvb/M/Bky/Vxz4c7h5LckENjhbgop0rEb/sORT3kRcOEr5NeZHm4q/z6Jaz0l2KthZB
	hHqkYeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughWA-0000000GWCL-3QsA;
	Tue, 29 Jul 2025 10:25:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughLM-0000000GUtI-402l;
	Tue, 29 Jul 2025 10:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753784039;
	bh=KCqBt2nHHSyKsCR7eaoD8lFqx1EfG6Nptsv2HTAspbo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=QsA8zBkmIBtA+Dt3J9nOwuC2s9aRQgBIqGyC5pNtGOTwUW1KeSY5kX+nrcLGjrh4d
	 UJ+3a/0fViXI7igUTedYX1gYRivwI/aaMx7xvs5i4xMBHMRmElf+nYyT3HCTgjMf0s
	 TGkNv0MhLxgfbTI+4QcpOQlhuIJy29zzxBiJenyGqynRwVuctK+scZiJ5YyY+Klve9
	 x+sLLv3jzTH5mguySM7ik6o4icAdIF3ghBF9mrKXzcF0NAclHbpeBMOp12J323gxn+
	 Iik5ya1qJvOaibOh5IKqUJk/oENeFdgId900NV+rEtNNemOcAmGm7rGqisQdMdr0mk
	 2RPys0on3yVgw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BBCA617E1284;
	Tue, 29 Jul 2025 12:13:58 +0200 (CEST)
Message-ID: <e6246af6-eadf-4bee-9e1c-c17adb86b496@collabora.com>
Date: Tue, 29 Jul 2025 12:13:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: mediatek: mt7986-bpi-r3: Change fan PWM
 value for mid speed
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Frank Wunderlich <frank-w@public-files.de>
References: <B06376CB-BE3F-4645-8A4D-A9C67CDCA3EC@public-files.de>
 <20250729075608.1651898-1-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250729075608.1651898-1-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_031401_178124_62CAA6A8 
X-CRM114-Status: GOOD (  14.61  )
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

Il 29/07/25 09:56, Mikhail Kshevetskiy ha scritto:
> Popular cheap PWM fans for this machine, like the ones coming in
> heatsink+fan combos will not work properly at the currently defined
> medium speed. Trying different pwm setting using a command
> 
>    echo $value > /sys/devices/platform/pwm-fan/hwmon/hwmon1/pwm1
> 
> I found:
> 
>    pwm1 value     fan rotation speed   cpu temperature     notes
>    -----------------------------------------------------------------
>      0            maximal              31.5 Celsius        too noisy
>     40            optimal              35.2 Celsius        no noise hearable
>     95            minimal
>     above 95      does not rotate      55.5 Celsius
>    -----------------------------------------------------------------
> 
> Thus only cpu-active-high and cpu-active-low modes are usable.
> I think this is wrong.
> 
> This patch fixes cpu-active-medium settings for bpi-r3 board.
> 
> I know, the patch is not ideal as it can break pwm fan for some users.
> Likely this is the only official mt7986-bpi-r3 heatsink+fan solution
> available on the market.
> 
> This patch may not be enough. Users may wants to tweak their thermal_zone0
> trip points, thus tuning fan rotation speed depending on cpu temperature.
> That can be done on the base of the following example:
> 
>    === example =========
>    # cpu temperature below 25 Celsius degrees, no rotation
>    echo 25000 > /sys/class/thermal/thermal_zone0/trip_point_4_temp
>    # cpu temperature in [25..32] Celsius degrees, normal rotation speed
>    echo 32000 > /sys/class/thermal/thermal_zone0/trip_point_3_temp
>    # cpu temperature above 50 Celsius degrees, max rotation speed
>    echo 50000 > /sys/class/thermal/thermal_zone0/trip_point_2_temp
>    =====================
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Acked-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



