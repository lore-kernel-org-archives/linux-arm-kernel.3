Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C43EC110E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOd31gbr0lZq+Fa5ICtAVm2dtJyNGlWV+xft8+m0FVA=; b=VSSwRDcZACtbxjkSqzm20gRtDR
	zTYl6UhJftChz1yM8lSAtnRVRfRIwXCbA0z7/3hF3Nfi4d8/gbLveSUAqU7EeZcfWgZTpj8ok7JoA
	PFEalpC0jkSMThwYFYuUQd8AVvpLEGgmiMVXohgWBb4Aopeq4VkoG287deiHiWvdJpPDZ0bKsY1E+
	MkIjbZ/ZTzXtUQUR+qvZpR9FlhkdM6WpPTB0Hjy8FSqHDUi6wrpQ95VZW5dLE2sSdHD9yvTni8TGW
	TM1HALYY9Fp3dCvztDEUKsBpPgz/X8zqaPXwT0av9tAloWlYctHaN740/VpPG4vSw4TzwwVf5ORq/
	2Qw+p4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZax-00000000l1N-3cRT;
	Mon, 23 Feb 2026 17:19:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZav-00000000l0Q-1sqk;
	Mon, 23 Feb 2026 17:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771867178;
	bh=K21kjy9qzrF9ypXG7rQNvPH2O306QauFy/abdov4/ag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BsXDftefiIPUo9wBEuCnGW+eH0sGWoHtFskViUB2WUIk7UeGUDEwdN37H2Dx8hAqw
	 VSt5oHBb94OLuZb7p+Kp30EalU9tKFKhrdxna+uT0/w7jhLR1j6ZJD6SPXB9JyT8b1
	 Lzdzp9m7Z1wbQrZ4P7PnCvsWLNI7U1njaKVNARQtslKNW5Z8JvhHnsdJMA5bMjkDu4
	 B3SSFhrUvj/UIFMdzhuwXHg0hXhgmQfJ6vMvhRXrOyaTSsNZEJoz00cNYHTLY270dL
	 iB48v4ED6+xIJElC1oS1M2km1gQaGOMGUdhMDLHdtyhAwBCe0O8qaXmeyoi6WB2wqN
	 wayFEyy6Uo1Lg==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66D6B17E041C;
	Mon, 23 Feb 2026 18:19:38 +0100 (CET)
Message-ID: <39f493a6-fd98-4cf6-9991-334ab4ddbbf8@collabora.com>
Date: Mon, 23 Feb 2026 19:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com>
 <edbf38b34e98ee039f45faab5aa5b00a585799ce.camel@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <edbf38b34e98ee039f45faab5aa5b00a585799ce.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091941_631366_AAF6815C 
X-CRM114-Status: GOOD (  16.50  )
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

Hi Nicolas,

On 2/23/26 4:51 PM, Nicolas Dufresne wrote:
> Hi Cristian,
> 
> Le lundi 23 février 2026 à 14:25 +0200, Cristian Ciocaltea a écrit :
>> When building device trees for the RK3576 based boards, DTC shows the
>> following complaint:
>>
>>   rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg):
>> /soc/video-codec@27b00000: simple-bus unit address format error, expected
>> "27b00100"
>>
>> Provide the register blocks in the expected address-based order.
>>
>> Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video Decoder on
>> rk3576")
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> index 49ccdf12ef7e..45eb0d053a6f 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> @@ -1281,10 +1281,10 @@ gpu: gpu@27800000 {
>>  
>>  		vdec: video-codec@27b00000 {
>>  			compatible = "rockchip,rk3576-vdec";
>> -			reg = <0x0 0x27b00100 0x0 0x500>,
>> -			      <0x0 0x27b00000 0x0 0x100>,
>> +			reg = <0x0 0x27b00000 0x0 0x100>,
>> +			      <0x0 0x27b00100 0x0 0x500>,
>>  			      <0x0 0x27b00600 0x0 0x100>;
>> -			reg-names = "function", "link", "cache";
>> +			reg-names = "link", "function", "cache";
> 
> I have a vague memory it was done on purpose, due to the "items" in the bindings
> requiring to follow the same order. I was not enable to run the DT checks today
> (some pythonic version miss-match issue), but wanted to raise the flag.

As I mentioned in my previous reply, I think we should change the binding to
allow using the correct order.

Thanks,
cristian

