Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BEEEFCE37
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 20:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEhVJmS85dWuXz+i/uzPhkGcpMPxtb7lSKola8x84hc=; b=h1g33l9bk0NWupcNmcaawWfP00
	GBIhI6aL9IEWuKOI+uYaiK6RyQx6P83HDsjT4gXWEm00XcjIordt7xXVt9dF6jeKJo5iWZsvyuAi3
	HrcFBq62HwVWQEiQTy+zBLcXMe31GuqLqyNotoWGQPjXHCIq9vvzfPKm1LR8YBTQlVIk/wCRLiukU
	ElGnnFwqZhDNq/upOYTmziMWqrZj7rsSGkDcQlqUDmx7hojWumP3jKCgr5sOpI1ihZ3voPCzkDY8o
	wZSoEZQIb3YxpTjfO2wOeRvkzjjdUhkW/PlGFXU93FQ3obc2Y/ghY2Cv1TnRShcJPvkkoL62UFlW9
	DxnV8kbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsTN-00000000Qws-47lR;
	Wed, 04 Mar 2026 20:05:34 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsTK-00000000Qw6-3HKw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 20:05:32 +0000
Received: (wp-smtpd smtp.wp.pl 28053 invoked from network); 4 Mar 2026 21:05:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1772654725; bh=bEhVJmS85dWuXz+i/uzPhkGcpMPxtb7lSKola8x84hc=;
          h=Subject:To:Cc:From;
          b=oJ1OIMXjqjeXFFszYYc3yJgoFq7PYYsoyzNz47hzV8pdAlQtEaCjfxx7YY1FHvGfy
           N7skD9lCQo2nwpqjEQwuqzUWd8K5Kz3Btb/SKwzPoJRNeb47AIQt+4tMB/xDfLaVFu
           ftfhuPAnY4idLRa6BgS36h72UjMoo3a5v2yD/HFRpepiJNdG/Z75q1yksiF3ilFdS+
           Jjd82u5zHToUvAOD8WvRbcN+Unx7XA62cVr+CuFvJfzFmkhC+3/xKhjlM0eiIAWfeI
           FoCE62fG3Od2X+c58DoHh1o+8FPwpq+yyw48SA3yLaWobrtPaU5RFS84QPZvKaFDtP
           YiRyDKc9+FJPw==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO [192.168.3.246]) (olek2@wp.pl@[83.24.116.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <ansuelsmth@gmail.com>; 4 Mar 2026 21:05:25 +0100
Message-ID: <5df659ba-4850-4c04-8153-9fb55af81bd0@wp.pl>
Date: Wed, 4 Mar 2026 21:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: airoha: en7581: add crypto offload
 support
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lorenzo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260303193923.85242-1-olek2@wp.pl>
 <20260303193923.85242-2-olek2@wp.pl>
 <69a73dcd.7b0a0220.1ac46b.9bfc@mx.google.com>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <69a73dcd.7b0a0220.1ac46b.9bfc@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-MailID: 98f13932068cf993ee8247d24573eb09
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [QerX]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_120531_303258_D2EE9827 
X-CRM114-Status: GOOD (  15.33  )
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

Hi Christian,

On 3/3/26 21:00, Christian Marangi wrote:
> On Tue, Mar 03, 2026 at 08:39:18PM +0100, Aleksander Jan Bajkowski wrote:
>> Add support for the built-in cryptographic accelerator. This accelerator
>> supports 3DES, AES (128/192/256 bit), ARC4, MD5, SHA1, SHA224, and SHA256.
>> It also supports full IPSEC, SRTP and TLS offload.
>>
>> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>> ---
>>   arch/arm64/boot/dts/airoha/en7581.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
>> index ff6908a76e8e..4931b704235a 100644
>> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
>> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
>> @@ -300,6 +300,18 @@ rng@1faa1000 {
>>   			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
>>   		};
>>   
>> +		crypto@1e004000 {
>> +			compatible = "airoha,en7581-eip93",
>> +				"inside-secure,safexcel-eip93ies";
>> +			reg = <0x0 0x1fb70000 0x0 0x1000>;
>> +
>> +			clocks = <&scuclk EN7523_CLK_CRYPTO>;
>> +
>> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			resets = <&scuclk EN7581_CRYPTO_RST>;
> I guess you can drop the extra new line between clocks interrupts and resets.

It makes sense.

>
> Does the driver supports these property tho? For example the clock is just
> enabled or tweaked to a specific frequency? Same question for resets.

As far as I know, the driver doesn't use these properties. They may be used
in the future.

>
>> +		};
>> +
>>   		system-controller@1fbf0200 {
>>   			compatible = "airoha,en7581-gpio-sysctl", "syscon",
>>   				     "simple-mfd";
>> -- 
>> 2.47.3
>>

