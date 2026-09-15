Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D692DC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcXSJVTvVZthIHGprEq2KGGmZzyD2tJp3Y6QBdt23ME=; b=AYM8Fibz3og5Oz4KHkkq3TZp/O
	w8KHTVLiq31ptxPUZztIhJrDNOMaTmrvvUfAXTFkmgzEAvyBlg3NJfUp4T/2xQykpwDH6e1KAN54Z
	mS5S+d4z1Udv/PNL5tjizFW0oncYWv/iV8+zGTAHjEOmWUjsjYQo41neMeoD1XVabbuAzakSwHP5a
	OZVnkD+SszTECmSNIZHg9aqMDJSnzIDUuUu2CneSJrAUzg9UZdkg0UaLKcxKy66WddbMu1gMgrkQC
	z/7up8CrY58yjRGqs8RwbshC+CnxDLm2BcOZ8A3cJ9y4ZMsKErKwpo3VopOUaNlbfxiDkBvq+p4i5
	vPwSOP5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TCb-00000006jLn-1awI;
	Tue, 15 Sep 2026 13:28:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TCa-00000006jLI-0LMC;
	Tue, 15 Sep 2026 13:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EcXSJVTvVZthIHGprEq2KGGmZzyD2tJp3Y6QBdt23ME=; b=k1R3ij4SeHdzW8BuCs6LfhL3qA
	pDQ0Voc80rCzBvC7GI/7mScndWx++2l0W+byAjNxS3US6NPh5iIazfsTBoiKLWBWPad5hilUnFUSb
	KBQ+U18aw/D7Nu+V1pQQvxa1L/NMIWcv4yfCwCO5VA994qW+zPNdgUGrhLPX1d2wjnUeTeDgRewXn
	nsuZibAOJwpuNzSVsBKCoFKvWVg40b3YI9JkNON1Q8c4IqFhhEWXSMUXURCNgsIXQd9RZOZ+DnBr0
	xKG6gHfCpuLdBUHQw6inliUq6Tp7VAbvJP2U8KSuF2ZQeXQobSpEzOzCB6OiDlWBEuX0g29TaCSrL
	ygv/IkFA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6TCV-00000006p4M-3gFk;
	Tue, 15 Sep 2026 13:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789478873;
	bh=lohGgxfltMTEidmM0lOlsFdBrhEdgnJZYESmU16vlmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TWPA9Rt4P0ApNG8s1YVbxCYTY5s61WEx7UKrZaXAR7c4TsiqDLmjSAg/YM3x9/v8o
	 0xYKW2eshg4cNIBhUilWWQ1GxzkzOcbhKYh1UAXoz8OS+2vj4cnkErjHyD37FiRd0R
	 0Z7al0tPohX2G08Pnijxkrb5wIP0I4oepwnx+Fff8cobci6V4UuWQvhHHQ85aGUJDZ
	 7kkVDmVgT6/vaWcArKv2Du/KGbSg4GmE1T4eZlM4CoqwDVWtBsHxkfiX1T6bukXZLP
	 VRXY3KSOJj2Bv5f6bOj7D229WMZ8043D+BhLZM642ZK+3r1EkJfPl3tDf2icaIVm2N
	 f28gFzgSQV+Vg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 621B317E0082;
	Tue, 15 Sep 2026 15:27:53 +0200 (CEST)
Message-ID: <a463a9fd-dddd-4b78-8408-2be683f80f13@collabora.com>
Date: Tue, 15 Sep 2026 15:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add
 ramoops region
To: Martino Dell'Ambrogio <tillo@tillo.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
 tony.luck@intel.com, gpiccoli@igalia.com
References: <20260915141226.600486-1-tillo@tillo.ch>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915141226.600486-1-tillo@tillo.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_142756_932434_A303E4EE 
X-CRM114-Status: GOOD (  18.50  )
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

On 9/15/26 14:12, Martino Dell'Ambrogio wrote:
> Reserve 64 KiB of RAM just below the ARM Trusted Firmware secmon region
> (0x42ff0000-0x43000000) for persistent kernel log storage via pstore/ramoops,
> allowing post-panic console output and oops dumps to be recovered after a
> warm reset. Without it, kernel crash logs on this board are lost when the
> SoC reboots.
> 
> The zone sizes (record-size=8 KiB, console-size=32 KiB, ftrace-size=8 KiB,
> pmsg-size=8 KiB) consume the full 64 KiB carve-out. The requested ecc-size=16
> reserves a small Reed-Solomon parity block from each zone's own allocation
> in persistent_ram_new(), which lets pstore recover dumps even when the panic
> path truncates writes mid-record.
> 
> The no-map property is required so the reserved region is kept out of the
> kernel linear map. ramoops remaps the carve-out write-combine via
> ioremap_wc(); on arm64, leaving the same physical RAM mapped cacheable in
> the linear map at the same time is an attribute-mismatch and risks losing
> panic data to dirty cache evictions from the linear alias.
> 
> The region sits immediately below the ATF block already declared at
> 0x43000000 in mt7986a.dtsi, so no other reserved-memory child is moved or
> resized. BPI-R3 ships with 2 GiB of DRAM starting at 0x40000000, well above
> 0x43000000, so the region is always within installed memory.
> 
> For the carve-out to actually preserve content across a reset, the boot
> loader must avoid touching this region on warm reset; on standard BPI-R3
> boards with the stock OpenWrt U-Boot fork this already holds.
> 
> Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
> ---
> Changes in v5:
>   - Restore this board's own carve-out. v4 carried the BPI-R4 values by
>     mistake - 1 MiB at 0x42f00000 with 128/256/64/64 KiB zones - while the
>     commit message still described the BPI-R3 layout. That would have reserved
>     1 MiB instead of 64 KiB on a 2 GiB board and contradicted its own message.
>     Back to 64 KiB at 0x42ff0000 with 8/32/8/8 KiB, as in v3. Thanks to the
>     Sashiko review for catching it; entirely my error in regenerating the patch.
>   - No other change: the plain reserved-memory node from v4 is kept.
> 
> The BPI-R4 patch is unaffected - its values were correct in v4 and it needs no
> resend:
> https://lore.kernel.org/all/20260915135722.566918-1-tillo@tillo.ch/

You forgot to send the 7988a bpi-r4 patch :-)

Cheers,
Angelo

