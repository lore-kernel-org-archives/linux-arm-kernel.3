Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB69C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEcU0OCD0ivIfd7kCJhaGZPEyu7QVeNuMoMZGolKkXQ=; b=nDiINVsZIhyV1gHUsAZbIh7r71
	XUBlZirn+q4yHUyYFjaHWUxhOtGYR9TTf9xnbR/LAFySanE5qt6Twuyko/kAtmBfsCgEk4le9zgV2
	nFkKtazLmxJ/wX/MaquxICxGG+5sgWYeAO7boIj91qGnc6zhO3ODThEFdYGokCJ2MWvDnggIBhNov
	4VPlYzdbhiWuLsoEUthJCmbQEQz1s3K1zn4gQhiKabREP2M3WBVhy5ojtzjUCZ1vAfpmof3i1Zs2O
	0Foe5OR6DSM4Lxa+6Canvk5uR7CcHAFPbr0PVGfrGeDqCSRekC3rUkQTnOrikKDrZKPXzbQyVUZKr
	TXemAmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLvC-00000009qXs-04hR;
	Thu, 17 Jul 2025 10:33:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLqq-00000009pxL-3zY2;
	Thu, 17 Jul 2025 10:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752748111;
	bh=njeWmQfR2ai9XZ2ITqvd5C2J/w/hnFAgXQdfFFO0UcQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=goFADbouZPEm62xcrdBEBQ4wStXnDAZkiZ7cYFTr1o2KiRQ6fx6zhrE2H13mjeFxI
	 r7zJnDxtTdeHIgQm9b+FmAmhljUVi/LDgVEWn6Xj8mspK6ygd0Xb36Odd+VUSpbkxC
	 e4MBC6zKRmP0N+f5nZQxPUdVeYsX23V281J/O4sYg84MW52LHH5qzUbAq3lP2U8GAi
	 b3bTDMrR6GLzR0A4P7rIafgDEFzoQSdVF9B7mHG7YtGK4nbQ2ATBz/8MwzkSN4OExr
	 x0R84IgFpBEHe5F9vp+SqPZjxphLOIng5SRFdl+UPhc82nDRXAuzG2pqADnJlvYTNs
	 rrYQtIzKNZE8Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 83CFC17E0D15;
	Thu, 17 Jul 2025 12:28:30 +0200 (CEST)
Message-ID: <384e41cd-8bc0-4f98-9fcb-362608d93859@collabora.com>
Date: Thu, 17 Jul 2025 12:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: cpufreq: Add
 mediatek,mt8196-cpufreq-hw binding
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250716-mt8196-cpufreq-v3-0-d440fb810d7e@collabora.com>
 <20250716-mt8196-cpufreq-v3-1-d440fb810d7e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250716-mt8196-cpufreq-v3-1-d440fb810d7e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_032833_139376_DB43D441 
X-CRM114-Status: UNSURE (   9.05  )
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

Il 16/07/25 19:51, Nicolas Frattaroli ha scritto:
> The MediaTek MT8196 SoC has new cpufreq hardware, with added memory
> register ranges to control Dynamic-Voltage-Frequency-Scaling.
> 
> The DVFS hardware is controlled through a set of registers referred to
> as "FDVFS". They set the target frequency the DVFS hardware should aim
> for for each performance domain.
> 
> Instead of working around the old binding and its already established
> meanings for the reg items, add a new binding. The FDVFS register memory
> region is at the beginning, which allows us to easily expand this
> binding for future SoCs which may have more than 3 performance domains.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


