Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF54CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0UuewBCkb7EeMqtLL00zhUpTDcPavTZ/4OHsiAVQ/Y=; b=I3h7LsAyUGidmWd9g6PPTGxfJu
	eJpG2nI4Ad0Cld3P/3Fi+hW5c0WSXRqPaFBA+278XqLq2ypgIAXbIwm/0lavjUvdWc7UkDvwkZaKB
	EYhki2+1Gm1qTaiC6IuzOXbpr02M58WSr4nW4LCWDYWwQII2YSvJ7zVJ+gHc0FSxWGCIKoa3GoLmJ
	y3jtrfiZm7LT7kAR9guIEh0amDWEicOXkMEcc0E80LFbjRoPFmA88k2LFcNmc7U7S2B7nCALX77Tt
	fq8mIE0DS4cxUV+x6pGTyEz7Qs8SjVp/TQl18elW4vvZGCYXyB8Phz2k/WXzXpVP2m6Gkgbx3FvwT
	iT7gq5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Yw-00000003hyG-1rzA;
	Mon, 15 Sep 2025 10:35:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Yq-00000003hpr-1xwT;
	Mon, 15 Sep 2025 10:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932550;
	bh=UBbHhzhMcY5RDHdtSw2V1FqJDniDFZuY+O0uFwbO0E4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TYgEeBAdEYp8rWIMhzXznGM8IkgcKSEfGdsTlbNTZeFhEiEO+I8nTaromXd102swp
	 FYIYLXoO5xPe94UX7kDKHrxQIB57+MGFi7oxXG+MMtez1MKBSqL1YWxcZkfjq6961T
	 uk+9MsHgFpRYmeWUFzPyyXhUC9mQtGpVPHAhDIszYJRHI+W/HPI34EFuzGXljYNLre
	 1Ak/DoDoxwYjI3WzynevGhUpgYjcX7DeAVKht5YhZTM/w1i0t30uKAyj8Cm2gTsCdR
	 uD/Rl9NTpdQ/YxuIYHWoaSfRSWob1mUZ3WPb3E57/A/+J84fJGfFDZxAq/If/XixoU
	 /efWatEnwWrIQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8296F17E0C21;
	Mon, 15 Sep 2025 12:35:49 +0200 (CEST)
Message-ID: <7dbfb425-4bcd-41bd-8860-9f8d1b9db798@collabora.com>
Date: Mon, 15 Sep 2025 12:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] drm/panthor: move panthor_devfreq struct to
 header
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-7-779a8a3729d9@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250912-mt8196-gpufreq-v2-7-779a8a3729d9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033552_670190_24F41972 
X-CRM114-Status: GOOD (  10.41  )
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

Il 12/09/25 20:37, Nicolas Frattaroli ha scritto:
> In order to make files other than panthor_devfreq.c be able to touch the
> members of a panthor_devfreq instance, it needs to live somewhere other
> than the .c file.
> 
> Move it into the panthor_devfreq.h header, so that the upcoming MediaTek
> MFG devfreq can use it as well.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



