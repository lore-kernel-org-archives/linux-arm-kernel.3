Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6D9C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xqp8dT+Ye3YrQyEUC0xYokzfvys0GW363dC1/p+RcfM=; b=Gcx0VVELHSOfFTpZf/CqDvIMAQ
	ixt9MJwnzwRCzxf6DpX2FClKt3a/ftWn3pFu0dwplBbSVnrTbZ1UILa5gThc26KNOtOGZ2dxuMNv9
	VTI7ZxMBRZpmNOZ4w/mnw32N0+Omwr+hFt5WNxaVJCK723pjgJoi8o3AOG5mAih+5hMztFQQyDH61
	7TNU7RS8X5DkC1SPJVvA1N4AnDXJkys9FS5K2b8ISoKhJuFQkcG7//YW2MPmKn1cO28YmCBZXWqby
	+6O4/1pQ0a5T3XG1iyvOigOwsT5SzYkHiEvPJdlrlAJrvV/UEEUNSpzNTIav4xyOHRsZ3SyuMBtEC
	elWXo3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ISu-00000007Y18-2qsI;
	Wed, 23 Sep 2026 08:36:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ISr-00000007Y0T-2H88;
	Wed, 23 Sep 2026 08:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790152587;
	bh=pIKL25u+pkh8Tw9brVYeuAUUS8Ix8atvIczZ+79EDqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e5aypmkNDlu87q3PuvIE9WjhpjIu9trcaPkaFRfgh/gBzMqUOEUikd1YfLNohz/M5
	 B5I44SlSL11n710pEQMXJ4Sj8t1tLD2DDqQeNKKh6rxqHvjL6sk65Jbx6mjoNZi9YV
	 ovXbioqaw36JaLI1bFfxy6ZUNyTmB7cfLxe3VMjftEpAhI1gmpPICHpE/hSeGgjSF/
	 1zrRpeoTSBcsCltuk6M6C3mxysvGAC6C6G6rH6O9lcldOmZkH9qW2/WefMHk+sQQRT
	 YdWfWdo8WHOALWOYtI1HKnvM8HarZrFe9+NEH2Hhbo8KICXaOnprTtIsmERAYt0iRG
	 DWMTeqrqLJ0ww==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1187B17E0104;
	Wed, 23 Sep 2026 10:36:27 +0200 (CEST)
Message-ID: <b98716ab-1c7b-4da2-85c8-e425be39b4d7@collabora.com>
Date: Wed, 23 Sep 2026 10:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] cpufreq: mediatek: add mt6572 support
To: rva333@protonmail.com, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260923-6572-cpufreq-v1-0-41f7af6d6d1a@protonmail.com>
 <20260923-6572-cpufreq-v1-2-41f7af6d6d1a@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260923-6572-cpufreq-v1-2-41f7af6d6d1a@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_013629_744386_0C6F52AE 
X-CRM114-Status: GOOD (  14.83  )
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

On 9/23/26 09:23, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add mt6572 SoC platform data for CPU frequency scaling.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index f15135b2898b..615bccc77c98 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -737,6 +737,14 @@ static const struct mtk_cpufreq_platform_data mt2701_platform_data = {
>   	.ccifreq_supported = false,
>   };
>   
> +static const struct mtk_cpufreq_platform_data mt6572_platform_data = {
> +	.min_volt_shift = 100000,
> +	.max_volt_shift = 200000,
> +	.proc_max_volt = 1250000,
> +	.sram_min_volt = 0,

Are you sure that there's no SRAM regulator on MT6572?

If there's none, there's no need to set sram_min_volt here, but if there is, you
also need to set sram_max_volt.

The ccifreq_supported explicitly set to false is ok for human readability of the
SoC features - that's also unneeded but keep it for the same of understanding
what's going on with this SoC.

Cheers,
Angelo

> +	.ccifreq_supported = false,
> +};
> +

