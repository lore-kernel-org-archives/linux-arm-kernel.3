Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE934C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUby8+oJiTXxmx37zu5laLL2CVtXZ3As/XtzHzaUktQ=; b=QkNizszXMS0xQTb4RsWkahXy/5
	JddaTgVEoZLoXeCdFkL4tniDY47joqZp8yLMTkgZTCMyULxS76s6WI3bQubwN3Y/iR1pHyAAfxct0
	npac1X5eBZJRdecZBJ03z6fWLgrpG/UDN9eMKYvKx+cc8a0V2KzoEMHVFjGqRisqod4i3IlNXNHy1
	JgFx9mNmAr05yrYG8sRWlTtNMXcrRA38ND3QH+To3qcrnPePAQtwW0AfXIdK5Ua+JLSZ9mkBoVwAR
	QK2xvw5gLwvW0muOYx31AnuryRpVNAvt2FqVCGlPvbcaMWHFsjCerfR0sSclRYST1wND7b2NOZrC2
	OqnQj/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEBw-0000000BG3M-2M8Q;
	Tue, 06 May 2025 09:02:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDfK-0000000B9zw-01dg;
	Tue, 06 May 2025 08:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520115;
	bh=aKexJcbDf7RX3F6f/GBWM3WTi6g2qAawNgd8dqWrYnk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RyLGBYPq8471eD7UwJB9vj9G6r0qqaxS65kOUFBDqw4QGrLM+TnxnFTJN+X5G8rCB
	 jpTZttf+CjjWZ+4e2eHvWo6HmZUhunROKFqnYnCkSfjMJaqPtNdVao1Hwjtzgp+FYx
	 8OCxe0CdGaD2rNtlSQMHryGzRCQpSJzGETCwxwXmScintUXPD0wFiIRuf8NYGxW0CQ
	 IFobyEtwrMLHWKwYZQTImV1iwTvsEV/l1ObZuo/rkVWicL3HoUlBIn2TO5aUw7BmI1
	 1CscvnNxDbjzOIyl4dnmkLvTI7sTUJMprgVoLAtmJv7Ns1sZxVONyQnX4KtKStkHpN
	 sGxLjhXmUp6og==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 720E217E09BE;
	Tue,  6 May 2025 10:28:34 +0200 (CEST)
Message-ID: <65012c1f-9888-4231-8e7f-c96b7f09053a@collabora.com>
Date: Tue, 6 May 2025 10:28:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/panfrost: Add support for Mali on the MT8370
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
References: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
 <20250502-mt8370-enable-gpu-v5-2-98e247b30151@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250502-mt8370-enable-gpu-v5-2-98e247b30151@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_012838_190004_9C57FE12 
X-CRM114-Status: GOOD (  11.52  )
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

Il 02/05/25 14:17, Louis-Alexis Eyraud ha scritto:
> Add a compatible for the MediaTek MT8370 SoC, with an integrated ARM
> Mali G57 MC2 GPU (Valhall-JM, dual core), with new platform data for
> its support in the panfrost driver.
> It uses the same data as MT8186 for the power management features to
> describe power supplies, pm_domains and enablement (one regulator, two
> power domains) but also sets the FORCE_AARCH64_PGTABLE flag in the GPU
> configuration quirks bitfield to enable AARCH64 4K page table format
> mode.
> As MT8186 and MT8370 SoC have different GPU architecture (Mali G52 2EE
> MC2 for MT8186), making them not compatible, and this mode is only
> enabled for Mediatek SoC that are Mali G57 based (compatible with
> mediatek,mali-mt8188 or mediatek,mali-8192), having specific platform
> data allows to set this flag for MT8370 without modifying MT8186
> configuration and behaviour.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



