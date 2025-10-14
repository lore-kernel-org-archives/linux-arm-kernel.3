Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13361CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oj5qr4oi1VTSzT6MAvMBwfS38eGP04vqEbQbs1TSh5Q=; b=LSsy/UJ6AG+jElqKXBzhzYR6cm
	HfAOHILWEOZx43cRhlwb97ie4Ojzboi0GpHMyV+fAcDyW/m/iKJtxKbLVAmUxAVZLZVN8cwn4ufJr
	mTUhKPsseDj9SSMt5In2i2kA6jJBdiWIAKgWMNl8OOX9jl8OpNEHlJgJxGO21o6bBybKQ6niMaaSG
	+SPDlubNQOTsx/jYo4E1ey/f1qjGnXeakiAravUchPjCGI0q9xuIm0inpxtNYTVOWPdsVJobnfMsa
	sZ7clPJK85er6Uao6csWWV5NIKq+NbLqQMpIsKac8vxpWa6WbiazzYRkFI3OF5Kfa6VTOU0wohNAg
	AYGJZYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8evF-0000000GRwC-2Cac;
	Tue, 14 Oct 2025 13:18:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8evC-0000000GRuc-3Eag;
	Tue, 14 Oct 2025 13:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760447912;
	bh=0PHlghkMy0M2zWI+PULLEdh13RRT9hr/l2k572RphtE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JiuDP1Uc68NZgbbmM9swTQoN8w2zjkaxiyAOm+cMoOh6thPGQgmRBsR9EIpYmYpDa
	 NSYAbqE+mRlhQkiMuqYvGvvxJM4A1WpuAuQ/5euOBX/W9Ag97QTmya5Y5ar0pqrUil
	 AQp2G/4fPuGHlhPZlzjXeVhipJbRDqvJZeZ2vSx+lvU7kiFfvLCxtu3+56yaRUnewJ
	 GyTQEbtLg6hFGDWVoUiGRHNHdTMSGCRd2GEwDM7U65J6rdgufQQxN+Z7meXvs00Y4P
	 OvIMua5nR7bwgVUEpXCOfJtW+yUN0cbP32ZDkFGrc1Jov2kzPbhZuwMelbJYI78MiF
	 EExxrSXt9Sfiw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7182F17E129E;
	Tue, 14 Oct 2025 15:18:31 +0200 (CEST)
Message-ID: <4c44af65-4d69-48a1-a0a0-3fb1cefa1046@collabora.com>
Date: Tue, 14 Oct 2025 15:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8365-evk: Enable GPU support
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250813-mt8365-enable-gpu-v1-0-46c44c6c1566@collabora.com>
 <20250813-mt8365-enable-gpu-v1-3-46c44c6c1566@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250813-mt8365-enable-gpu-v1-3-46c44c6c1566@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_061835_001599_71F893C1 
X-CRM114-Status: UNSURE (   6.31  )
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

Il 13/08/25 11:25, Louis-Alexis Eyraud ha scritto:
> Enable for the Mediatek Genio 350-EVK board the support of the
> Arm Mali G52 MC1 GPU integrated in the MT8365 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



