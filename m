Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A56CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4WHwJUmlePCiEAC3DPy3BCfyYvs2Uy1/VTEBeoDePI=; b=2imeMzVvvvfXe2erFLeN0l97kx
	Lzm3XyjZwhN7/Fnq14GZSWBAQLGzHdw61aPwnJUoS9X4RmHneZoKzUoPa3Gp8yrLrgCFEm11VEZcD
	iLsFfK3XQFPYAnjSBtbY8PKVZVuM+288axxQM6FyCPPIvG1BH/P2XinNudvBJg2JgWK4K0tZIXZd4
	JMaG1+kr7ePDxto7l0N6uiM+NOR60zc+g0nJFF3bri2QD0vfi09F0lAP68sWsMA04i140xOxulMRv
	ueJ3UsSMe0WkAHQyJi/rS9H0WwH17x3DPB8giCGt0+BWZ1kmzSnzIt+ACRu4jOPZM1Ot5xLV8scOf
	nOGZv5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9HD-00000008hwE-0nO6;
	Wed, 12 Nov 2025 11:44:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9HA-00000008huZ-12Rp;
	Wed, 12 Nov 2025 11:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762947872;
	bh=T/3f2aH4OlFw/lLjeQrh+LUIMpt0NqIajGPJMFGS/xM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HDyiKCrWYa7YuVZkprl1h9/2UwefZKbnbSHEJBtlKGb27Y/rdSpmZ1p0CaVOiGolw
	 27G6PajNHsfMo5C1AYZxQK84XKeojTKNfkMM99dPvJYPoxcV9kvGJQCAcwQ7rDJPXE
	 1wrXT+vq7eoRrAWQ0cIogYvPSA7dslEzJAxdc05K7agpJqAs2Qb+6tJcr6Gxym35XM
	 KpCo51S/SUdtnMl92hmumkrC9veferld3nIwKWh9nlBrsGQ5lrWTqIs/sJh/Ha45Gt
	 t2506BZE51fZItv4ZdghI+2+XI94Kmenq26eu3fC+ijTvwDP9Xp+/diii9JXsag0Sr
	 nGyxCZmGHEl8g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F61117E129C;
	Wed, 12 Nov 2025 12:44:31 +0100 (CET)
Message-ID: <a5ebb6ac-52c8-4b48-a67b-2d1e34aa73ea@collabora.com>
Date: Wed, 12 Nov 2025 12:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] soc: tegra: Simplify with
 of_machine_device_match()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
 <20251112-b4-of-match-matchine-data-v2-11-d46b72003fd6@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-11-d46b72003fd6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_034436_454321_7AF93612 
X-CRM114-Status: UNSURE (   6.40  )
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

Il 12/11/25 11:28, Krzysztof Kozlowski ha scritto:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



