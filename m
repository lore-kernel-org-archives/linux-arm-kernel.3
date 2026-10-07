Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26086CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 17:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvxKkeCz4r8K1OufXCLJN0cStPAlgS10ILxM3oLPg8w=; b=Rb1nNBJMqCyooTAm+QhIAgu8po
	oxtaCMdROWAU1mUKUWnKEuZRKUqmOKaBEXvy8inGY1PcoMPonpouhMiNvCqHeROIII5NkAx8etUDt
	wM5k8HYmtksSjZCdn/Fzwi2kCdqmB2pNNWta3s8bQMruqb320jwOueixT1VL560F2babI++NScMkp
	Uab31nDruqY2k3MpM+ft7oceq4eyUexJmo85F/rn5dxRJbmZHLj2zjp2+eBtprO4sIquflnS/E0jc
	C8JLbcsU9J0KYpJGRiQDxKkk12X7g/vL8CUNwPcTJR0fXWrAjMsNIug3MtLnE7NaGvuQnSiCNKVDJ
	3MhiuCTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVZS-00000002o7B-3f8p;
	Wed, 07 Oct 2026 17:36:50 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVZO-00000002o6D-1vDC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 17:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791394598; bh=EvxKkeCz4r8K1OufXCLJN0cStPAlgS10ILxM3oLPg8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nFZx0bowzRByiagFkvuunYFpjAlCClGKPaWDv8spGd3txFewhBw3uIWoyjFAZM4Os
	 fiT9fT68CfmQY7zDu5ul9hL5vTL9mzd+ALg9LMpwvFzzD8D/1kFCTqcXNxl5OymQXF
	 8aKg6bekDw9oRWJjT2WCVgB/hathsnkI14oGP5bI=
Received: from [198.18.0.1] ([220.171.158.107])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 923AF8DB; Thu, 08 Oct 2026 01:36:35 +0800
X-QQ-mid: xmsmtpt1791394595t3k5iaf9j
Message-ID: <tencent_67DE4800018C924922E62488AF02AF24E405@qq.com>
X-QQ-XMAILINFO: MSHuecu5THA/PZQZruFFagj5YL2w1LBX6SzgVknt85gnzJKeQQfIA4kfm0Q29W
	 FHE0j0AtcY9h9jrQOpyZp+JcBOYJyqNC1B7dmm0gX6szGuLCCSWNYI51+t4o+TnXp6xi/44R7WQE
	 SFHgWvyRCnelJeHEGwv3JRthuo83pWWBhtVahWYezFpqjQxl0rlkOa9/tc/U28rGjh5spGjr2fae
	 pGAeArZBqzqLp93HO6CRHt9SwgtDt9r1PdPku/td+hqdxFWHQSaTuQ/TqdzUB71fzXa5OU5XDWwI
	 mvmmFBKlqs4IjSU6evGlwE+boI9OEi0QEswDj6LhhoDhszTflpNjDM2OyKubdL6RcFsU+EKxQ3xY
	 jopSr1WC4hgpy33xx/icybqxgzm8V0fJxAZr3tOamZqvJqK1SRL1ITgV+ACGTQS0nbHb9shobb2W
	 tlFjaf2SqApYssTU2xY8w2PTnU4Ynwm3Wy3RhFks1quTRcOIjfaPZTlEnULdCHdMSh6ZQqxBh05D
	 ghPrDixwoSd4DruO4sprShqu+DK5Hp/XTinqibNfxIcg2MBWuQWRFdlC3ill2SzgcTbmtbj25k6T
	 doDuxWBQ48tJK/tjF5myaILtYMuF0eddscjsFCmYrO4xpPhlpsofrBhJihu9LI1V0TStBwoiuVlX
	 4XSS8fh7HcUTYJs56UCNnZ+Z9j7cDZPkbxh29iB4O9UGEXMyGQeYbIH196r4I4B71bAnA5GIuTCr
	 8ei5/QvC4AldG5ibx/XLPK7b+gGkEuTk+HCJrTOYxevJhUa09oOD9RddSW9ThoFZDfrlL82BFVnG
	 62S94e9Ct2lVFvOYP1S3H21Ms9WDpG9IFmPxVTHR9butYyeOGfRXbF7wvU7ZwKgtDRGsT3M61pho
	 uyi32EblD7pMsAoE3hCGjLzFY0waUHUc77XYlYl1ZSM043fDlbSwgJWVbfeq2stxhf2q7aFQWdE9
	 CZ+7EcsGSKnMe3jWXYstgloAfAiH5we75uEE1MIfyOuzmrxP0YIMR2Cwws1OISiZ0jV2IW8Og12c
	 CGE1X6ubLNkREy4zIdrqwF7fCGNqwP+BbLsN0Z5R0bozbuztKJfeYqCw4qZeg=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-OQ-MSGID: <8ee39555-cad7-4b01-bb65-7441acb3f282@qq.com>
Date: Thu, 8 Oct 2026 01:36:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ALINX vendor
 prefix
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
References: <20261005173308.710986-1-2254650260@qq.com>
 <tencent_0512BDFB22810AB03126E3189320800AF607@qq.com>
 <20261007-92e855de534df44fbf665e4f@squawk>
Content-Language: en-US
From: Pufan Jin <2254650260@qq.com>
In-Reply-To: <20261007-92e855de534df44fbf665e4f@squawk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_103646_811043_A9C1105B 
X-CRM114-Status: GOOD (  13.61  )
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


On 2026/10/7 18:35, Conor Dooley wrote:
> On Tue, Oct 06, 2026 at 01:33:06AM +0800, Pufan Jin wrote:
>> Add vendor prefix for ALINX (Shanghai Xin'yi Electronics Technology
>> Co., Ltd.).
> Where does this ALINX come from? Website url?
>
>> Signed-off-by: Pufan Jin <2254650260@qq.com>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index ba2002969..97e7ef340 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -90,6 +90,8 @@ patternProperties:
>>       description: AlgolTek, Inc.
>>     "^alientek,.*":
>>       description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
>> +  "^alinx,.*":
>> +    description: Shanghai Xin'yi Electronics Technology Co., Ltd. (ALINX)
>>     "^allegro,.*":
>>       description: Allegro DVT
>>     "^allegromicro,.*":
>> -- 
>> 2.55.0

Hi Conor,

ALINX is the brand of Xinyi Electronic Technology (Shanghai) Co., Ltd.
(芯驿电子科技（上海）有限公司), https://www.alinx.com/ - an FPGA/SoC
company and official partner of AMD Xilinx, Unisoc and Baidu.

The board is not in the alinx.com shop because ALINX describes EdgeBoard
as a customisation done for Baidu: Baidu owns the EdgeBoard brand and the
sales channel, while ALINX designs and manufactures the hardware. From
ALINX's own product documentation [1]:

"...as a Baidu AI partner, it has customized the Edgeboard series edge
  devices of the domestic AI flying paddle system for Baidu."

The FZ3A hardware manual and the schematics are authored by ALINX - the
manual cover carries the ALINX logo, www.alinx.com and the legal name
above, and every schematic sheet has the same ALINX title block.

Since ALINX is the hardware designer, I used "alinx" as the prefix
instead of "baidu". Happy to switch if you prefer the marketing brand.

[1] 
https://vd100-20232-v101.readthedocs.io/zh-cn/en/VD100_S1_RSTdocument_EN/00_aboutALINX_EN.html

For v3:
   - Fix the v2 description mistransliteration of the legal name:
       "^alinx,.*":
         description: Xinyi Electronic Technology (Shanghai) Co., Ltd. 
(ALINX)
   - Put the website URL in the commit message.

Thanks for the ack on patch 2/3, I will carry it into v3.

Best regards,
Pufan Jin



