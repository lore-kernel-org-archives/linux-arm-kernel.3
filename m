Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF5BD2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyrKJz6PMKwk5qm2HTkDflwTnAv1RI+K3notTIpruY0=; b=Eo9NpJR3P/hCet6TDBtoGJqgG3
	jun2w7gH6T3u2GiuCIxqpc4aeLIMBitveZIY0wHbx9R1XQmhT0nPUNo+6vfxw7np94Y5fep9m9j36
	rF8/hA/yY/bm3+tKC7NH8FZSO2Ymc7fXv0jRlUzqfzbo78X/w3HQhOA2IQ93JXyOCVD2yyK1vi6+y
	uwMBpk+BxCyGpDbwPu5HanM6jcvTUNUe6DzCNV2JyjP37Frnz17Q+1u64X7krHUQKIKHdooAWJ62P
	Y6WjVqEY8Ck6oDuPfvl3VgxXcHXPxZ7MaF3qxbLgyLtB8MJKWlffX7/+5bYxqB113hd1HNneGgh3p
	R35GyINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevcx-00000004GEr-0QLp;
	Sun, 11 Jan 2026 13:37:07 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevct-00000004GDv-1td5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 13:37:05 +0000
Received: (wp-smtpd smtp.wp.pl 13958 invoked from network); 11 Jan 2026 14:36:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1768138613; bh=GyrKJz6PMKwk5qm2HTkDflwTnAv1RI+K3notTIpruY0=;
          h=Subject:To:Cc:From;
          b=CUf/UaTedZOach20SFWH5Rs2F6kFXyWzcq6gxSvgPcDtMvWxO495Z5hRJRNxdQDsB
           rI56nFeVub6DBMVw6Eg1bw4iOvFMjCLzVunmpqYzebB4ZsqjY3e6jkFCw3RvT+L8Tp
           GitqJ0go56cUnEXOh4lUB0tCbFdKBtSgB5VMWXXZa93VFzfX+NwmTgrJxSqThgvXp4
           J7EOBF1vNH7J4I0P91c9Gto3rh1RBeX70lV6YsDK5T6YqyqdhOW13s/en5H2no+QE+
           PYREkxQzh+hBW97oqXHiAM/3HGbpWKXGhUBgAo5V1F/GfM60WQxlOT9o6Q8Ir4X0+v
           rN8y7m9wMVJtQ==
Received: from 83.5.241.112.ipv4.supernova.orange.pl (HELO [192.168.3.246]) (olek2@wp.pl@[83.5.241.112])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <krzk@kernel.org>; 11 Jan 2026 14:36:53 +0100
Message-ID: <d7ab5be3-8502-407c-baf6-714ac3a89cb7@wp.pl>
Date: Sun, 11 Jan 2026 14:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: crypto: eip93: add clock gate and
 reset line
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: benjamin.larsson@genexis.eu, chester.a.unal@arinc9.com,
 davem@davemloft.net, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, conor+dt@kernel.org, herbert@gondor.apana.org.au,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, robh@kernel.org,
 sergio.paracuellos@gmail.com, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
References: <20260102155341.3682013-1-olek2@wp.pl>
 <20260103-sweet-micro-manul-12eaee@quoll>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20260103-sweet-micro-manul-12eaee@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-MailID: 2fd5ca6ba679e5b337689a6786cb36fe
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000008 [4Zuy]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_053703_674502_BCF24F9D 
X-CRM114-Status: GOOD (  11.52  )
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

Hi Krzysztof,

On 1/3/26 15:11, Krzysztof Kozlowski wrote:
> On Fri, Jan 02, 2026 at 04:47:33PM +0100, Aleksander Jan Bajkowski wrote:
>> Add the clock gate and reset line, both of which are available
>> on the Airoha AN7581.
>>
>> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>> ---
>> v3:
>> - introduce patch
>> ---
>>   .../crypto/inside-secure,safexcel-eip93.yaml       | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>> index 997bf9717f9e..c6c99c08dc68 100644
>> --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>> @@ -48,20 +48,34 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>>     - interrupts
>> +  - clocks
>> +  - resets
> That's ABI break without explanation in the commit msg.
>
I think that the reset line and clock gate are available on all SoCs
with this IP Core. Should the reset line and clock gate only be
required for newly added SoCs, and remain optional for existing ones?

Best regards,
Aleksander


