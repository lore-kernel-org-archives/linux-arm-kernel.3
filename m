Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647D2C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+TjYkeWtH29/hH7rFUt/RjEjcCETjZLhLZ9MVicTyc=; b=47Yo4brsLuAp489kp6ttC8aaQs
	l/I0wg1SMoQ/+Q5NJIHQjAf8cJ1bn9Y7ZGWZCDhm8PXEATCmUSOcRJwNTmSY45gipGeaEIpYxaL8L
	bAOo5OI+T/tVKOAoMyvSVPUp5S1Wh3jG142oT57CzT90Ldbk9iA5bPW/iBPduL/KtuaFldQBdB39B
	JczUj3f9sGNeAOWUngxjWV4v62V0Geg8bOXv9DHkDLrvgNELk2xv4z8hao7jWPbdcRW7JqPIOxvf0
	0Xqz6ftJjFVDtwXuL6iXhsliwyQ0QMd6bV6M+mkV1pOqrCBIzYVvKZQrKG5/lL74z4RmJmV3vv1cb
	yOFtIQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nru-00000005Wbs-3azA;
	Tue, 15 Sep 2026 07:46:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nrt-00000005WZr-2ueS;
	Tue, 15 Sep 2026 07:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Y+TjYkeWtH29/hH7rFUt/RjEjcCETjZLhLZ9MVicTyc=; b=nz9YVOSfjScWSd9tyTLTRNvmFx
	+Bn5MjMNbjGF/KUsGJLizpOwvtqmkC/uSGp/QT45Pylyx42AUX2/3UQZNjpr9CqR+t/oAA027zduL
	GxApVPBXeIm2oDWPPuKC5PWhdNd3XFFXa6x6pNTu7s5wQ557ZabCgCy/JZtmMDgmRn25lzEmuxn7V
	ZVfMFAkA/W3wabPdJ50H7nlciE2iZhtiQZ6f8N0la+Ubsh8gwOm57MFykl8rk0mHc5WeYDp6oZd1u
	Q+SwiN4FTVElc3Ypuo653xrcCVFPGV7dHQCN8qF07/WUZafCFo6JdEszdz9C5q+cu5wj+mGqeJdoA
	scvCneWg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Nrn-00000006OLn-2FdT;
	Tue, 15 Sep 2026 07:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789458366;
	bh=R2xJrxl6upO9LEZweJ/1XyeQgzkDVimk0RD2c0Xhaos=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RuHpU7fE5Z3XY4d1RQw7AynI1G6BDoB5xPNNPepviV3HvXt+ms0L31xc6+SHCLzxK
	 3iRHWRkSFYEfTowlf3WpUsYCHq943JD2sONUO1hchsQvSRXeRQOLwyeaRjXmmcwKeK
	 lvKFHWIqsyWUAEMvz0NjGq0oTNlLts5iy/XigFtwbrt/jhfrWIH/lP/zuskE79bnAG
	 hW7dKYFXKbQjRIIr1WoJkGK6o9MeiSO5wrdanTLQ7QT0171MdWICbAN5KtAVQkvRw2
	 azvGzRVR3aLd6f1gYWkrhED0LRtpdOb8Al3muwKT1CBvuc7+BAkaNlAkNttyau6+1K
	 cx1vOKlGON/6A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80C3417E007B;
	Tue, 15 Sep 2026 09:46:05 +0200 (CEST)
Message-ID: <a465210b-cd9c-4c5b-a54d-54d4b62b0706@collabora.com>
Date: Tue, 15 Sep 2026 09:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add
 ramoops region
To: Martino Dell'Ambrogio <tillo@tillo.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
 tony.luck@intel.com, gpiccoli@igalia.com
References: <20260915064254.1594808-1-tillo@tillo.ch>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915064254.1594808-1-tillo@tillo.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084611_877787_1D29374B 
X-CRM114-Status: GOOD (  25.58  )
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

On 9/15/26 06:42, Martino Dell'Ambrogio wrote:
> Reserve 1 MiB of RAM just below the ARM Trusted Firmware secmon region
> (0x42f00000-0x43000000) for persistent kernel log storage via pstore/ramoops,
> allowing post-panic console output and oops dumps to be recovered after a
> reboot. Without it, kernel crash logs on this board are lost when the SoC
> warm-resets and the on-chip console buffer is reinitialised.
> 
> With record-size=128 KiB, console-size=256 KiB, ftrace-size=64 KiB and
> pmsg-size=64 KiB, ramoops_probe() carves the post-console remainder
> (640 KiB) into five 128 KiB kmsg records, with the requested ecc-size=16
> reserving a small Reed-Solomon parity block from each zone's own
> allocation (per persistent_ram_new()). The ECC lets pstore recover dumps
> even when the panic path truncates writes mid-record.
> 
> The no-map property is required so the reserved region is kept out of the
> kernel linear map. ramoops remaps the carve-out write-combine via
> ioremap_wc(); on arm64, leaving the same physical RAM mapped cacheable in
> the linear map at the same time is an attribute-mismatch and risks losing
> panic data to dirty cache evictions from the linear alias.
> 
> The carve-out sits immediately below the ATF region already declared at
> 0x43000000 in mt7988a.dtsi, so no other reserved-memory child is moved or
> resized. BPI-R4 ships with at least 4 GiB of DRAM starting at 0x40000000,
> so the region is well within installed memory on every variant.
> 
> For the carve-out to actually preserve content across a reset, the boot
> loader must also avoid touching this region on warm reset; on standard
> BPI-R4 boards with the stock OpenWrt U-Boot fork this already holds.
> 
> Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
> ---
> Changes in v3:
>   - Resend; no functional change. Rebased on v7.3-rc3, where the v2 diff
>     still applies unmodified.
>   - v2 drew no review comments. It was also sent, in error, as a reply to
>     the BPI-R3 patch's thread rather than its own, so it is likely to have
>     been read as a duplicate of that board's patch. This version starts a
>     fresh thread to avoid repeating that.
> 
> The matching BPI-R3 (mt7986a) patch is being resent as v3 at the same time.
> 
> v2: https://lore.kernel.org/all/20260528123645.2650085-1-tillo@tillo.ch/
> v1: https://lore.kernel.org/all/20260528092807.1936177-1-tillo@tillo.ch/
> 
>   .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi  | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> index 0ff69da..6a8dc89 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> @@ -80,6 +80,19 @@
>   	};
>   };
>   
> +&{/reserved-memory} {

It's just

	reserved-memory {

Sorry about missing your patch for all this time; the comment applies to both btw.

Cheers,
Angelo

> +	ramoops@42f00000 {
> +		compatible = "ramoops";
> +		reg = <0 0x42f00000 0 0x100000>;
> +		no-map;
> +		record-size = <0x20000>;
> +		console-size = <0x40000>;
> +		ftrace-size = <0x10000>;
> +		pmsg-size = <0x10000>;
> +		ecc-size = <16>;
> +	};
> +};
> +
>   &cci {
>   	proc-supply = <&rt5190_buck3>;
>   };

