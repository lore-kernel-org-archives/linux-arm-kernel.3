Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3061091904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgB/oAPv2Ng5VSm6Q6qVgOpNaKbrs+RRk8Mf2PFJJLc=; b=e3M5gRfbY2uHV/iK8gLP3QMDei
	KhJGCW3SxMpNs8OncqWiZTE/AV2KtPOQTgH7H47DIRnJDLbcuSF3FoqsT8VFfH8VUMbI+y/NmVk26
	bvY/sbgFnR0E6u1gVn/8002Zb6dG2GnRE6Bww8Ck6zrFCsSjTwq8fptYu6GnFvbipZ/thuiIiS+uM
	R/7K32yaD7SPztUVdhvUVALOoAbuyX1Ut81LMhTEwxyL2MVJtTz86EoOC9xRfdWGVR31ptPYTLZvi
	hOmaYYmyzcOEPM6pEvzXBMewNuw8LtZWS9/oBd2s0QEWQv83f4QktNG4QEDhNUoUv59lVXAtrN5yC
	57tTOZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hrr-0000000BHQ3-0pkn;
	Thu, 19 Mar 2026 18:13:11 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hro-0000000BHOV-1D15
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:13:09 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-2b06c43e6a7so6201705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773943986; x=1774548786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dgB/oAPv2Ng5VSm6Q6qVgOpNaKbrs+RRk8Mf2PFJJLc=;
        b=Jmi+aE/jJAotT8VUQWi+L0/7SpNKEWQf79fDdyUv5w4MsCJ/fdQe2YDUXU6ElUb4oP
         OMlX6P+qlhu7PWmnHmHnoOnXMr8TwW725qTDkpenPv3jQbWRcjyCGTGCVjF34zY/OpsJ
         Tp1dqf1Kee+hNsiBOZbMZ7nF2/0nju5hfAH014CFKSjDlMqLBWVjiCpbPdMjrmhyoNve
         zhmC+JnTGPifgiTwMIAbiQK8iGAnoIPKPdPnn8UvZeRw/2hOYkCyl8xXhxc7wMwBwcaH
         vi94yFZUL1DWIoWQZQbgutgJ2kBX5SibGwDLrAHh5X6gfboE+TanvLTkHBfJMPyjVIeo
         09fA==
X-Forwarded-Encrypted: i=1; AJvYcCVCCG9FdA2lm2C8ujfr1zQMXPYzAiRgXzWz27WO+ueA/anXK6ncenVchVcrOTozgQxcOqaxXbxnHQksdaWcuGDX@lists.infradead.org
X-Gm-Message-State: AOJu0YzrIlP2KmwWM8cKeXQrdWdCveAGqBjitMv3CCb4h+GowaLnP19z
	d18hLlBrvz8Kp0N46qygWpPq8AsDuOWLhvOduXyumWHKK4C915q068S3siCaqIEB3iyfpbhDxV0
	aVuubXDYADOQzaVwOrz6P7X59ialfB8G1tiDmowBCIFjcaLSb3oWPMHV4uJKDxK2MMG/hihsJVA
	VGhiXu5mF1LWzkMmWF1MquEiVFpluk12Z1uDf4bEJaiSa1dThCBUHj7nLU0SF3/X9gtotbzPhUI
	mnTjmhwVsy/Og7VYCV+LbNeMtRYXvu8+aY=
X-Gm-Gg: ATEYQzxnHm4qdPuoa7+Si0T9E1wxVXDLvpw3YQj9ZJnsfI7Jj54f/TGbnjKpFjvrvTf
	jVXUSF4trelCqkvOFsGl2JGlRkqKFiI8Nv8dGX+WFS9SMdyQixYC9/Porn1P5Y50ONiR/o0qrId
	DF66kRNKdhd3g8gMlk+TCJN4EGN8E1831mEbL1AnID609Jhi2O2VTalJDG1Gz6FUHB89oUur9A1
	aqXkGVS+gmEM/DtinMTUDesm8NwMspXMLGlV/sAIfqpzgBotkXa21EahAQz3YRIDnmYRWYCmirJ
	CJkI1EawwGD2vtgwe2lgLTo9eMPYsC+T47aVVqMzMH/3iNfUNEthrI3CNLMbGtgt+msvQvXnEJO
	s5d06Uyd+YoWFKQGbiF+3LM9vBJNQeuijmbbH5bGtStb9ps+Ha4PINi82NCyYx7nKZ6OJMLemG5
	BboE6Q9B4Q7phR9NLO6ZputxlY+49rSKXnZAVAxHYNxpjlYNUmiDKAF9HrIgLLHh6k
X-Received: by 2002:a17:903:244b:b0:2b0:68d1:2537 with SMTP id d9443c01a7336-2b0827e3487mr2082895ad.42.1773943986546;
        Thu, 19 Mar 2026 11:13:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b06e5f45bfsm7060635ad.33.2026.03.19.11.13.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2026 11:13:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so880233eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773943984; x=1774548784; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dgB/oAPv2Ng5VSm6Q6qVgOpNaKbrs+RRk8Mf2PFJJLc=;
        b=VCJ5egwj+2GzTc4AeY+KbHOoJbZVMJox6dzmC2GhwJqsjxMDXjsiupE9otzQzumnuO
         Z/WAuOGUm0cxWbn2YR4hE1ee4rjUq1Y3nItfAb/p+jFl+K4ZAGiz3TuANmkcTHRTHx39
         EDzYjsUCmpV2kID+dhN5zujQQsx1jMB/fgDtM=
X-Forwarded-Encrypted: i=1; AJvYcCVYrRw9VAMmcHRjG9Vsk/qbIy5/wrkXZg2Hjs8xOFrxxjjwm6OMYJfwsEMZCFcyeI3Bg1TEhuvGpKp8xtUn9RDX@lists.infradead.org
X-Received: by 2002:a05:7300:f68c:b0:2c0:d233:d7c0 with SMTP id 5a478bee46e88-2c1096d532dmr198791eec.21.1773943984511;
        Thu, 19 Mar 2026 11:13:04 -0700 (PDT)
X-Received: by 2002:a05:7300:f68c:b0:2c0:d233:d7c0 with SMTP id 5a478bee46e88-2c1096d532dmr198770eec.21.1773943983785;
        Thu, 19 Mar 2026 11:13:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e536894bsm9978899eec.5.2026.03.19.11.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 11:13:03 -0700 (PDT)
Message-ID: <4d4a244d-f179-4e24-b8ff-b3f77bc83f8d@broadcom.com>
Date: Thu, 19 Mar 2026 11:13:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: broadcom: bcm2835-rpi: Move the firmware
 node down 1 level
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114015810.701076-2-robh@kernel.org>
 <CGME20260114182227eucas1p16eee8f1fbf41f998214b89517793bb0c@eucas1p1.samsung.com>
 <a9a202c1-048f-473e-b8f4-6f0550bdba2c@broadcom.com>
 <86bce6c0-dbaf-4508-9f40-ff209c85a76d@samsung.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <86bce6c0-dbaf-4508-9f40-ff209c85a76d@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_111308_347064_E1DC6BCF 
X-CRM114-Status: GOOD (  21.87  )
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

On 3/19/26 04:19, Marek Szyprowski wrote:
> On 14.01.2026 19:22, Florian Fainelli wrote:
>> On 1/13/2026 5:58 PM, Rob Herring (Arm) wrote:
>>> Commit 32eea985999b ("ARM: dts: broadcom: bcm2835-rpi: Move non
>>> simple-bus nodes to root level") moved the firmware nodes into the
>>> standard /firmware. However, /firmware is intended to be just a
>>> container for firmware nodes as it is possible to have multiple types of
>>> firmware (e.g. SCMI, OP-TEE, etc.). Move the RPi firmware down a level.
>>>
>>> Fixes: 32eea985999b ("ARM: dts: broadcom: bcm2835-rpi: Move non
>>> simple-bus nodes to root level")
>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>> This is only half the fix. Unfortunately, a kernel change[1] is also
>>> needed to make this all work. I do plan for that to go to stable. I'll
>>> leave it up to the Broadcom maintainers whether it's preferred to revert
>>> the fixed patches or apply these fixes. A 3rd option is revert for now
>>> and apply these DT changes some time later to give some time for stable
>>> updates.
>>
>> Let's wait until your fix for the /firmware match table gets applied
>> and then I will pick up your two changes.
> 
> 
> Florian: I've noticed that the $subject patch has been applied to
> yesterday's linux-next as commit 0603d8af97ff, but the code applied in
> Your tree differs from what has been posted in this thread. See:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi?h=next-20260318&id=0603d8af97fff097daa118faf04d9f439b2227ec
> 
> https://lore.kernel.org/all/20260114015810.701076-2-robh@kernel.org/
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi?h=next-20260318
> 
> 
> The "firmware" node in Your tree is under "soc" node, but without adding
> a "compatible = simple-mfd;" property there it won't be populated, what
> breaks operation of all drivers requiring the firmware driver(s).

Yes I see what happened here, Rob's patch is dependent upon 32eea985999b 
which I had initially applied then dropped, and then I did not (re)apply 
it again as a prerequisite for that one we are replying to and I 
incorrectly resolved the conflict as a result. It should have been clear 
that no conflict resolution should have been necessary, *sigh*.

This is now fixed and pushed out, sorry about that, definitively a 
sloppy move here.

Will let that simmer in linux-next for a day and then sent out the pull 
requests.

Thanks again Marek for catching this, my test rack does not currently 
have a working RPi system, something to address.
-- 
Florian

