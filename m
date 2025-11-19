Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBE6CF2597
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/ojDgKJ+K0E13rBWp57Hdy0+He5RzkFEDB2ur3bkqI=; b=uDnJBXBYGKSwpIqQqEbXbvQELV
	HuAyR4hfoMX2/J+J0YXw80rUHZBwpkp2BU3W4Lvon6Djt2Tutn488FG88Je326T18yiuO9Ih6yrfs
	noFqJ7Bf/l9jX8zfLR6gS2C/102yCFfIKoOJw5s1AG7h0hrEeo8YfWBSkeOEHDEDOQcrVMiKasBcQ
	nmgHkUEfDojmjAlNK64MlZeD7VfpeXzVhvS8iyooM19d/9SJmEck4WoL4y8wmFQ7sWd1/1gsrpcRs
	BKHHWiclYBz7UwdgkTPI4O6z4PSInuLyfH75rENml2KL/lnRYt4M4SsB2OfeNdiRj/7DYD8/dg89w
	s6duSCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdbJ-00000002nKd-454d;
	Wed, 19 Nov 2025 08:31:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdbG-00000002nKE-2exn;
	Wed, 19 Nov 2025 08:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763541095;
	bh=ZuBWKOdVAFAOmqoa5M4ZLpGMNs9qJYmQ3DcoqwSA48k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qJmdJSYXkVBe8OMKOImYi6JtUTraSCcrhS86SVW2eMTIfhuglwZJ3drtVSVTY/4Ut
	 cq+w2LJX09kHFQmY8N2NG7cvLZMXa6LPh8Rjd/1BBnkPmXhUH66O8om4EZaQYxm2s7
	 A5HmuuqIz7Usz2lllJGSL8b/Kg1hGfCwO00s6aFg9ptVk2BHFv8Bw8fb73Hi8pSsvg
	 DE4UaYvurTPUs7sTTB7/J3VOad1bnaqbYslP48tP8iqqF2bri92QSiQnEci60ZpNKE
	 U9ZkxhXmBDubbEGN1q/ne1G6EXc0/2JxmaWlBu2Z6NdCl0LqZyfBKSZjsqw4xOIVqi
	 AvaH6i00//DZg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CB3117E129C;
	Wed, 19 Nov 2025 09:31:35 +0100 (CET)
Message-ID: <66693e69-7ad8-4067-9bd3-ef1454e3ec18@collabora.com>
Date: Wed, 19 Nov 2025 09:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: drop firmware-name
 from first SCP core
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20251119070230.1716418-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251119070230.1716418-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_003138_868761_679F2780 
X-CRM114-Status: GOOD (  18.53  )
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

Il 19/11/25 08:02, Chen-Yu Tsai ha scritto:
> Arnd pointed out that having firmware-name in the device tree is wrong.
> Drop it.
> 
> Fixes: e36be19823f0 ("arm64: dts: mediatek: mt8188-geralt: Enable first SCP core")

Fixes here is .. well, right, but wrong - as if you "fix" that in previous kernel
releases, you will create regressions :-)

For all of the currently supported boards, I was planning to temporarily leave the
firmware-name properties in place for one kernel version (v6.19) and remove it from
all of them at once, for kernel v6.20.

I'd be okay if you send a commit or a series removing firmware-name from all of
them, without any Fixes tag and without any "fix" word (so that we avoid autosel
backports at all costs!), but keep in mind that I'd pick that in the next merge
window, and not right now.

Thanks!
Angelo

> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> index 7fedbacdac44..8e423504ec05 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -1166,7 +1166,6 @@ &scp_cluster {
>   &scp_c0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&scp_pins>;
> -	firmware-name = "mediatek/mt8188/scp.img";
>   	memory-region = <&scp_mem_reserved>;
>   	status = "okay";
>   };



