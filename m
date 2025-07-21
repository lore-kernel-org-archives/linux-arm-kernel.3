Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7041C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feKog43rJiR+7WrD2fyf/f609Ac+oo2RToGFuyZm920=; b=qAmGWpC3qTGPkSr5NW/BB+72H8
	N28joIGtHYZJfTaN5neL6Inbtfj2jdXQ1pcoptdptnaLVBKSuSACngIJUiO54sgTJbC5YAkEEgGAf
	WMAjzny5ndemhEo/69ZIv5+WUA7PWgii8Y+mmKt8kG425YR66rgHX9xB0xPi4e6hjj4OtcPYeyFVd
	MCpQIJ1d23zak5vds/gaKQRWEx06D9s6mplME+PM2TglL1fFW+xSUDEOCDmjChGUXTCYKchyWUKMA
	Q9jlqWwlOnj59QuS5/hLH1B5aPvjjZUv7EU9bKDKjgHY9UDbLdl95JPVxXu0vB6n5RsaYwH808X1c
	agdQfUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqal-0000000HOQW-2iew;
	Mon, 21 Jul 2025 13:30:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpOl-0000000HE99-1DkW;
	Mon, 21 Jul 2025 12:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753100017;
	bh=89si7M0WjZ1kR/Rl/+DZDesVyoQF4BNz1KXqMbCzo4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p2m3sLSRllogqBs79NyF8DpM0mdySNUVj4lyfqlTzxqVc7TQCb9Sw54jwx8lGMc7O
	 HAeoUofH3fXwXuh8D0Q+qveJKsy6D/7JxCOthcP3CZTHo4jUM1zcU4vkAvan2LlQBH
	 pNYj1SBIoauhQT/dd1N6SLT05P5ITtDUGEQ7CMlpWFEQsmfpsVua8BaYptZsvI50lm
	 s5aIW9bFV6YKpjMo1S2pXO1dIWN0blw9tfZIVtiaRPiJX7pc1p85O1INHV22vY1QV2
	 Ug2qfL9b7X6GGZjAs4e9qUZIRFqXyq960GO/ZtSdosJhmyRpg3YfHNmAbU3qZ7V757
	 mVncr6rK7EPhA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9D0E17E0CE6;
	Mon, 21 Jul 2025 14:13:36 +0200 (CEST)
Message-ID: <e2a58394-356f-4c23-bb98-198439cfbce1@collabora.com>
Date: Mon, 21 Jul 2025 14:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Remove suspend-breaking
 reset from pcie0
To: Guoqing Jiang <guoqing.jiang@canonical.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 jianjun.wang@mediatek.com, tinghan.shen@mediatek.com
Cc: macpaul.lin@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250721095959.57703-1-guoqing.jiang@canonical.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250721095959.57703-1-guoqing.jiang@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_051339_485722_DD04BF70 
X-CRM114-Status: UNSURE (   7.92  )
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

Il 21/07/25 11:59, Guoqing Jiang ha scritto:
> When test suspend resume with 6.8 based kernel, system can't resume
> and I got below error which can be also reproduced with 6.16 rc6+
> kernel.
> 
> mtk-pcie-gen3 112f0000.pcie: PCIe link down, current LTSSM state: detect.quiet (0x0)
> mtk-pcie-gen3 112f0000.pcie: PM: dpm_run_callback(): genpd_resume_noirq returns -110
> mtk-pcie-gen3 112f0000.pcie: PM: failed to resume noirq: error -110
> 
> After investigation, looks pcie0 has the same problem as pcie1 as
> decribed in commit 3d7fdd8e38aa ("arm64: dts: mediatek: mt8195:
> Remove suspend-breaking reset from pcie1").
> 
> Fixes: ecc0af6a3fe6 ("arm64: dts: mt8195: Add pcie and pcie phy nodes")
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



