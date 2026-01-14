Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA8BD38FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TJ56owaA/niKs62kHQlZBqWStUJL2ADR9XxgX9yLoM=; b=1/pWWfU+gNMeMB0ekW2BQ2TvQX
	QYrgkNQQ/gQZb/hI2KBZtQw+F+RIvcMyYTm7X6CuStA77i/cpC48a4AU8nDYEFaaf9S5nrDBOde+b
	F+fapUV03IkEjoNxZDizkmu7WgDUP8+1yBDegcHdM6wjvjzDFRF54ovlObhIRJCO+xWhAWH1aA1zX
	FlqoI773360P64Gp7ceUg7/qtVt+icDiDuml0iZWjf6z4EHgkLdP+k2Pdp6lcNaVQXJgdwGimUQOa
	im+sVyBU+tJlYXCiv3RTxm23UcN9RWtY4g+TP8oYiSEt5kAKNAfaDFJOGvjWqo+7mSxDEJgzZ9uft
	TlwlEI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg50V-0000000ACxF-0WyX;
	Wed, 14 Jan 2026 17:50:11 +0000
Received: from smtpdh19-1.aruba.it ([62.149.155.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg50Q-0000000ACwT-1mfn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:50:09 +0000
Received: from [192.168.50.220] ([84.33.84.190])
	by Aruba SMTP with ESMTPSA
	id g50KvJnVjclBZg50Lv2sF0; Wed, 14 Jan 2026 18:50:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1768413002; bh=qCiNYpj/fD6QvcI2JnZSyaYV1FRFHfQHPffRlHULXxE=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=nREDKuJnqIoQQLsYftRsNn5nffXuySjn+oCgGh/Aa5t0Q0a7eWV0SN6QAmFU4XMyy
	 3nZE71xJ1f4M+0d/Q4X0Fkcgb7PtJFXtGxIxLbAjQ9Zc4sW6s35pZjuItnX3z6uvae
	 /vK3laL1CG4P13W2ppwDOdFrhgITxtN6Eit8b0RejdXXE8PlCUZh5Y1WhMaigNymWi
	 kXVxxoY+bQLsM1HRyw0ornvuC4+deQcX0VHxjb+y7nE0dTp4dxdsEpHzETWSbI6IIo
	 anxFGkkrwox9yVxPWntXOB2WDnD32f3L0wGa1rc91w/t0GCNZM1bh1sVHUeqfW4COl
	 7N47H0FQPGCqA==
Message-ID: <40e45abf-7640-49a6-814b-9924510395c1@benettiengineering.com>
Date: Wed, 14 Jan 2026 18:50:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: sun7i: a20: fix MMC index enumeration
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
 <20260114140653.05365221@orionap.fritz.box>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260114140653.05365221@orionap.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOlfoxKjK0AY8atOCrqaGKkGzr99mKANRPOLxddXbdjSNeayXmE2yayY5do5xlWoXgqwZ0wwuOZyDy/9xoYnWY/z0Eyv44tXtd1AXJK4SwhypD0kUp3z
 JMLMPL3ZhNEjNLrr9cMDRDd8OFCabBPVktqMmNzuc1UGoRXwBzZufKP14t0S/uZ3RADKlty6Z4n55EOKI/oUicZC7KCRVq8J+Anb6/bPhcvClSeqjevTKybG
 YTJM0uTLXxJc7nslKra1WzQk3HdtR35Ar6PsjeuwigKSxenZdW5+qFdhIV2DqHea45pA1t4wEqIztGzgRHvB0NUlyuAj2cWpDCplJGidGqEJ6OaB9IOQwTAN
 sGdX5XHxCThh1sGYd9pjXpKA3aHPAF0zTFWl7aalLNCpNCgHEGTXgGdGyPtrCU+6D331vOUnCQNqESN1W0VBkNNIkd5Gsc07dto9tkyG4mybvrwiG/u8nGDZ
 6i8zKyXRNbW0NXAI+F8cHZzNyM7RevCE7m4TD/7nmTcvU1r/hIxuQy+33HSHB4QunkDl7/lWLCEjXNvRSbtBh4jil2ZsS8yLf9+R8g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_095007_560214_29D7FF99 
X-CRM114-Status: GOOD (  21.94  )
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

On 1/14/26 15:06, Andre Przywara wrote:
> On Wed, 14 Jan 2026 11:50:04 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
> Hi Giulio,
> 
>> Currently, the OLinuXino-A20-Micro experiences non-deterministic MMC
>> enumeration during boot. When both an SDIO WiFi module (MMC1) and
>> an SD card (MMC0) are present, the kernel may swap their indices.
>>
>> Explicitly define mmc* aliases to ensure consistent device naming
>> and prevent mapping conflicts.
> 
> So this comes up every now and then, but for sunxi it was decided to not
> support this. The enumeration of devices in the kernel is never guaranteed
> to follow some order, and this is widely accepted for SCSI (/dev/sda) and
> NVMe. Distros are coping with this forever since, using more sustainable
> designations like UUIDs or labels.

I see,

> If you don't want to change the way you communicate the root device to the
> kernel, you can actually use U-Boot's DTs, which adds the indicies for its
> own purposes, and can pass this on to the kernel. Just don't load a DT
> from storage (which you shouldn't be doing anyways), and just use
> $fdtcontroladdr as the DT address when booting the kernel.

Thanks for pointing, let's see if Buildroot Maintainers accept this
patch as is, otherwise I'll probably go with UUID.

Thank you for taking care and explaining.

Best regards
Giulio

> Cheers,
> Andre
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> index 5f44f09c5545..a958400bcd7c 100644
>> --- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
>> @@ -55,6 +55,10 @@ / {
>>   	#size-cells = <1>;
>>   
>>   	aliases {
>> +		mmc0 = &mmc0;
>> +		mmc1 = &mmc1;
>> +		mmc2 = &mmc2;
>> +		mmc3 = &mmc3;
>>   		ethernet0 = &gmac;
>>   	};
>>   
> 



