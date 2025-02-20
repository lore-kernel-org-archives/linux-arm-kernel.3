Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF3BC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1x8VukiUN/0Gxs26y+HBIw/LOhfBmkuOCw1Gf2ThDGk=; b=zLQYpT9WOaDClFFNBYIMDf3xuX
	Kc825dFRvI2nTNr23LixhNr+D4y3gtpYQGU5RwCrzNyao0HiYMaI8L71t8K4hm4y9uc9qgKONx51g
	mqIln/7U4Mv3DhpZSonUC7F4dZCoyNV8/wAdZbWlu9uoiXoLYhFIm6Z20k8T3mRqwIKIg55z/Wj5k
	d9r86XILraXTpjvIXCgH+td1WCkKumAScZ17VpT/GgxiQttqnIEQXLGpEzAAHaYsZQ/E0/QW75Q69
	W5ScBUo4yaYE6I88X2nllByWcPQlXLZ6mBSo1Bg+9RNMne0nhzAkS2+wEiVnvlAjg7VxnkWSzx/Zl
	0ZnJCHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7Ac-00000001Cug-3b00;
	Thu, 20 Feb 2025 14:04:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl71o-00000001AUw-3vBu;
	Thu, 20 Feb 2025 13:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2BDC61452;
	Thu, 20 Feb 2025 13:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95B3C4CED1;
	Thu, 20 Feb 2025 13:55:43 +0000 (UTC)
Message-ID: <c896221c-5ff2-4a2b-b431-7c7f805b4f68@xs4all.nl>
Date: Thu, 20 Feb 2025 14:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: cx231xx: Convert enum into a define
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
 <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
 <20241203093114.0ca49c01@foz.lan>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20241203093114.0ca49c01@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_055549_091898_6B98B7F1 
X-CRM114-Status: GOOD (  18.31  )
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

On 12/3/24 09:31, Mauro Carvalho Chehab wrote:
> Em Mon, 02 Dec 2024 15:47:15 +0000
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
> 
>> The code is running arithmentics with the enum, which when not done with
>> care makes the compiler a bit nervous.
>>
>> Because those enums are only used as defines (no argument or variable
>> from that enumeration type), convert it into a define and move on.
>>
>> It is required to build with llvm 9 without these warnings:
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:673:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:680:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:687:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:702:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:709:21: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:718:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:727:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:737:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
>> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:749:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
>>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h | 18 +++++++-----------
>>  1 file changed, 7 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
>> index 5bc44f194d0a..62ffa16bb82c 100644
>> --- a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
>> +++ b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
>> @@ -57,19 +57,17 @@ enum USB_SPEED{
>>  };
>>  
>>  #define TS_MASK         0x6
>> -enum TS_PORT{
>> -	NO_TS_PORT = 0x0,	/* 2'b00: Neither port used. PCB not a Hybrid,
>> +#define NO_TS_PORT	0x0	/* 2'b00: Neither port used. PCB not a Hybrid,
>>  				   only offers Analog TV or Video */
>> -	TS1_PORT = 0x4,		/* 2'b10: TS1 Input (Hybrid mode :
>> +#define TS1_PORT	0x4	/* 2'b10: TS1 Input (Hybrid mode :
>>  				Digital or External Analog/Compressed source) */
>> -	TS1_TS2_PORT = 0x6,	/* 2'b11: TS1 & TS2 Inputs
>> +#define TS1_TS2_PORT	0x6	/* 2'b11: TS1 & TS2 Inputs
>>  				(Dual inputs from Digital and/or
>>  				External Analog/Compressed sources) */
>> -	TS1_EXT_CLOCK = 0x6,	/* 2'b11: TS1 & TS2 as selector
>> +#define TS1_EXT_CLOCK	0x6	/* 2'b11: TS1 & TS2 as selector
>>  						to external clock */
>> -	TS1VIP_TS2_PORT = 0x2	/* 2'b01: TS1 used as 656/VIP Output,
>> +#define TS1VIP_TS2_PORT 0x2	/* 2'b01: TS1 used as 656/VIP Output,
>>  				   TS2 Input (from Compressor) */
>> -};
>>  
>>  #define EAVP_MASK       0x8
>>  enum EAV_PRESENT{
>> @@ -89,10 +87,8 @@ enum AT_MODE{
>>  };
>>  
>>  #define PWR_SEL_MASK    0x40
>> -enum POWE_TYPE{
>> -	SELF_POWER = 0x0,	/* 0: self power */
>> -	BUS_POWER = 0x40	/* 1: bus power */
>> -};
>> +#define SELF_POWER	0x0	/* 0: self power */
>> +#define BUS_POWER	0x40	/* 1: bus power */
>>  
>>  enum USB_POWE_TYPE{
>>  	USB_SELF_POWER = 0,
>>
> 
> IMO keeping them into enums are a lot better than defines.
> 
> Perhaps the right thing would be to join both enums here.

ORing enums is really not a good idea: you would normally never do that, and the
compiler warning is IMHO appropriate.

I think this is a good change and I plan to take this.

Regards,

	Hans

> 
> 
> Thanks,
> Mauro
> 


