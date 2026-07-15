Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7719FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcIRfrbuvvEOy1EVAdQ0GdATJLshKcgOJCqDWzfbhjA=; b=C1mOLITkRX4oy0orgeCw5y/XKN
	1iSUWlYr/3frdY9WA2BuuJEHJW288fa7gv/Kk+UY6mIDFYVazR0Qkse/Y+gAkbbjLEgm0q1q3ltcI
	/CBGCwze23XEP/N/P74g2WNcc9EB+pyhdbnvu0cs6bHrCOi5Bm4NzyTc0nT1xBnt74Z3HXe6cLTpx
	5lOMionLFUQRzF+5vWX2SRB0iEkES1gAD+xqt2NtE/5chVeZYS8cA5sOkqnC2H3Sx41DxMYfqaAwd
	vKCu/YSbA23IZnkHkHvUrNCsoZZvTHUgv9oFeIlRr9szjVRzeBl2tEWs23/DbZ7vH9JOG5uGWmUiS
	Zjgt0nTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwje-0000000EQdb-3iDx;
	Wed, 15 Jul 2026 10:21:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwjc-0000000EQcJ-3wWj;
	Wed, 15 Jul 2026 10:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784110858;
	bh=y+ynGkCaYoXRDmgB014d4Ad6Wj5i1LOY4L9jyC5DNh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YJfVJDzNldvpTUS5ABBvAnFhP6Vnzwp+yH2e3DTFWYOwgB0Q3VP1YHf6rvLm1lHwj
	 /3J/fXZAoEC8Kf1shil5y3lnP/tFvantshMIHagW6+zcctJ99IYkVKfjWm/LfWwsHt
	 ke1tXGJu1eANIyj2XclkQ+6be8j3POLtQI7cQFmTQ9kCL2HqbC/k3Q8lmtS5mvgo1t
	 qeHjH10VKhMROLXBvov2e2lbL4Qz6m3hNj32fptiBdq2Syrd/GTAtz2cFSLed1L/z/
	 HQolHnFHd/YWOR5y25nxtbr7x0G4n/EZlwzTwsz6eRA10QZjnFKUySHY26UfQTHmgX
	 sBzYr8njRAE8g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D15117E0720;
	Wed, 15 Jul 2026 12:20:58 +0200 (CEST)
Message-ID: <f9e34c90-5f9f-4a51-9968-0fb3467a782b@collabora.com>
Date: Wed, 15 Jul 2026 12:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: mediatek: pwrap: use correct log level
To: rva333@protonmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
 <20260714-6572-pwrap-v1-2-d8e5a39cf7ef@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260714-6572-pwrap-v1-2-d8e5a39cf7ef@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_032101_138052_0F3CFA00 
X-CRM114-Status: UNSURE (   8.91  )
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

On 7/14/26 14:42, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Errors paths should be dev_err, not dev_dbg. Replace all dev_dbg in error
> branches to have the correct log level. Also simplify dev_err and return
> with dev_err_probe.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>


Yeah.... I agree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 45 ++++++++++++++----------------------
>   1 file changed, 17 insertions(+), 28 deletions(-)
> 

