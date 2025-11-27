Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D496D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moEVtDcL42IP0HcsenV6WOiAqpgmM02qs5Y6D1+1cNo=; b=uIWCrDGA8jnhtQdX7By2oFSgoi
	C0DzjtSHCDs15KZD34zotolGTyK81oB0mFnzoCz0ivwPyBON8uSoJLBiT75pgnmX/hX+YwElQsSM2
	wzj3PQsO4PUrHrbswgmnHHzKjyLF7fGW1TGZZMn+guE6OE+PnVWByWM9rWJXEJi0pqttU0cCDrKs1
	tTmIl7Fpd7NODmYF9W1MvclhURfFIsf4aFVDUqFpOVDENv/Ukg8z3f3E/MzvZ3XtZRzxHJKbT8/EE
	9EcYljZ8SUaWy7DZZ2bZEj5IJX82QWl8fpKy8ONQtxKVFwr6tVcFRMr+sdq8jfR+bZC8dpWeMRYhN
	1rHs8cGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc06-0000000GfQa-3omK;
	Thu, 27 Nov 2025 13:25:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc02-0000000GfPK-30NY;
	Thu, 27 Nov 2025 13:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764249927;
	bh=aEiQVMDoMgNcxL4GiRqNIJWzllGGLe7RboB7EQdNgAI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AZzbizIkgAjmlxdMrCRH9UpGgY4MV+GjkNFPdScQP/b3jx/kYcK2Dafll06rvzl5l
	 Dwy5k0aDjZcLSaCr5/DhtxRTfOPLQExZm6jh7bmQSd9C/ca1XjVH7GDgniahP1bXmR
	 +ldD2Sl3F2bmpvdNgdFttemhwq0mKYaDROEQ9VJWdo9xdWYGSSPod7wYIqmQHp0mF8
	 2Y0FpjWm/exFALIMAMKG45up+DO54QVk8M8+QOgkp/B+Maer7LvwDu715bw05gOBdD
	 /7JCrJDdSdfSzYxc0nszBqn/46vwNg473QJnte8AnaTZS6HVAdC2QnTiN4VTHiOSyy
	 rXhtGXcgIQETA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D28DD17E0117;
	Thu, 27 Nov 2025 14:25:26 +0100 (CET)
Message-ID: <fc5febc7-d1ee-4b93-81c7-eca7134e9c39@collabora.com>
Date: Thu, 27 Nov 2025 14:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix address range for JPEG
 decoder core 1
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, soc@kernel.org
References: <20251127100044.612825-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251127100044.612825-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_052530_920870_DBFB977D 
X-CRM114-Status: GOOD (  20.55  )
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

Il 27/11/25 11:00, Chen-Yu Tsai ha scritto:
> The base address of JPEG decoder core 1 should start at 0x10000, and
> have a size of 0x10000, i.e. it is right after core 0.
> 
> Instead the core has  the same base address as core 0, and with a crazy
> large size. This looks like a mixup of address and size cells when the
> ranges were converted.
> 
> This causes the kernel to fail to register the second core due to sysfs
> name conflicts:
> 
>      sysfs: cannot create duplicate filename '/devices/platform/soc/soc:jpeg-decoder@1a040000/1a040000.jpgdec'
> 
> Fix up the address range.
> 
> Fixes: a9eac43d039f ("arm64: dts: mediatek: mt8195: Fix ranges for jpeg enc/decoder nodes")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> This was introduced in v6.18-rc1.
> 
> Maybe have the soc maintainers take this directly instead of waiting?

I'm fine with that; if Arnd wants to take it directly, that'd be easier for me as
I really don't expect any other Fixes commits for the moment (and I'm currently in
a very, very... very busy "moment").

Cheers,
Angelo

> 
> Also, I'm not sure if this error could mess up the JPEG decoder driver's
> internal tracking.
> 
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index ec452d657031..c7adafaa8328 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -3067,7 +3067,7 @@ jpgdec@0,0 {
>   
>   			jpgdec@0,10000 {
>   				compatible = "mediatek,mt8195-jpgdec-hw";
> -				reg = <0 0 0x10000 0x10000>;/* JPGDEC_C1 */
> +				reg = <0 0x10000 0 0x10000>;/* JPGDEC_C1 */
>   				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
>   					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
>   					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,


-- 

