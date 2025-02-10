Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3FCC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bMvAb6VuvqQp2qpxj3J93pXgEyeX4il1MJ2pKp4Rx4=; b=MdwFPYJ68ORHt+fZ155TUGLgeu
	3z2zH7slB75F0UcJveLa+pS8K0Pa/5FYuU0fUkfKLXsJTilHNjsWvcUYtDGLyXa4vl/sfT7Mcrw8s
	pmnde8dAmWVIIXF3H017H4G9vw936Z0hN5Z+IS2SMDpLotJP9rTPzduIBMWVRqS1nefLXpvWDcDQ1
	RirUKLGCupi1598n567aMAO+EsriL5+4hZWTUMiumFgn65zstHTr8oTLITYaIp3uvgZoouBaWMDGp
	0RZasTyoBCJe5ptH0AlDh6q7V4gpntTFv2OSzMv/rrF2xOrXfk536CJOf7kpk87u40m2mtSMlN6Bn
	GlJOH6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRZQ-0000000H8Ep-0TYt;
	Mon, 10 Feb 2025 11:03:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRP2-0000000H5fN-1OHH;
	Mon, 10 Feb 2025 10:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739184753;
	bh=3XQQnMznbwiS00Y1JIDlmmzTejfYfNeecvMctR7zyx0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JIEzGoMQRT1DyZq7W7ni4SwwrNDCvYsBY7QKyW+m1gZWp4dk/9C56ZMvEvlqNuYGV
	 35/SMeBvVl0LIelx3Nzm71LQEIjTIsgEAkCyAGp6xtFz8o3GDBPPG4LDZdf+X86X/6
	 V3A53ffTkjDD3Ac4FoXyWT05KEAwO61kt3zsWrzBk2khUsA+xs7cGv5Vv6dZbz7h7J
	 Lo8Q7Lehv2mUKcyQ+ypEJD/WdRIdSjEPobi0pVjJVueZzGxn9bjYds+gmSMOujibPj
	 9sVQ7xjaSpKsSTZc8W0HcPFWuxW3MF43EcDqr/z6EmNbyrRDsqbVav0JdI+P4N7M9u
	 2oJkF7vvsFjfw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE9DA17E0FCC;
	Mon, 10 Feb 2025 11:52:32 +0100 (CET)
Message-ID: <918ebb70-8c46-4bbb-8fca-7136465db39b@collabora.com>
Date: Mon, 10 Feb 2025 11:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_025236_552377_A9D24C0F 
X-CRM114-Status: GOOD (  10.36  )
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

Il 07/02/25 16:18, Louis-Alexis Eyraud ha scritto:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core),
> with the same platform data as MT8186 (one regulator, two power
> domains).
> Despite their different GPU architecture (making them not being
> compatible), the MT8186 platform data can still be used for MT8370
> because it only describes supplies, pm_domains and enablement of power
> management features in the panfrost driver.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



