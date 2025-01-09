Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154E3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=negqQgLTN4B8pDH5mYHTnsur/cNHNJUEY0g3ghRoN1o=; b=D/MOqm/YCMfDKRMikUR9emvos/
	Bc6PVZ+Y+vh/F3UsSeA/EOxDKuRD/sx60VCcahAZpcN6HcKankNFrtiJYjYgBRCID97qyQBs8RueW
	2OUZnLAXwRu6ecK5EcBdEH9v+kalwmi6Q/qxZ0mQYccCuyNPgmVa9eUDTgG+78R1gTtxmzmC48JnD
	OiQT1kyBriTtcMRY1sbXh0Ui3Llg5xcwkd85/UAQmqPq+dmKXBeggMdn0aVFN5fCP6TIWWgcJl/+U
	pTHx1KrP1Arf+ai8Od4/bTt/asOjAyQV8ZInErnqzcUEFCPJgTuquheQJJePSHbq5UNlnwddSkzY4
	WrRRNBuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqQp-0000000Bey5-2IK6;
	Thu, 09 Jan 2025 11:10:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqMc-0000000Be8w-3OXY;
	Thu, 09 Jan 2025 11:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736420767;
	bh=NSINwedzb+CJzoeaWNPp6t+VsGjFzCBylsKLc9BhvNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bebKQrx4PJq5NB9s3v4vJRKv4kTMaJryl50QSDFYTGLHA+OG48MLHXlhPjUwSsBpo
	 kRXCJ3x/FTRThqPmtdZjN5pwbdwFCK3gXYB9fxJAMT+VmVD2AFKQHBjeWLud5CoXtK
	 1m/XZ0JNYT02b3MUnORnZ6cj90JIoOBCY+Lpq1xmd1kTVDC3OdlMgHn2/9Dcm8AB+Q
	 QeHbu5uv8P/4t5gusqp6qyZ0SA3aJQ0u3dsYT7ZYoGqGVdrTlICojrRMPpoLuZeysF
	 E0tD3EXkJA8Ltgc6KePrZyTIp6Xvy/qV9p1YNplHhjlcwS545sagXH35dDHQtUHci5
	 vTqqC9nQkqgLA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A00FD17E1562;
	Thu,  9 Jan 2025 12:06:05 +0100 (CET)
Message-ID: <21be2199-cf26-4669-afb7-98ab296e2d75@collabora.com>
Date: Thu, 9 Jan 2025 12:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] arm64: dts: mediatek: add display support for
 mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
 <20231023-display-support-v6-6-c6af4f34f4d8@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v6-6-c6af4f34f4d8@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_030611_016926_2063FE41 
X-CRM114-Status: UNSURE (   7.66  )
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

Il 09/01/25 11:37, Alexandre Mergnat ha scritto:
> MIPI DSI:
> - Add "vsys_lcm_reg" regulator support and setup the "mt6357_vsim1_reg",
> to power the pannel plugged to the DSI connector.
> - Setup the Display Parallel Interface.
>    - Add the startek kd070fhfid015 pannel support.
> 
> HDMI:
> - Add HDMI connector support.
> - Add the "ite,it66121" HDMI bridge support, driven by I2C1.
> - Setup the Display Parallel Interface.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


