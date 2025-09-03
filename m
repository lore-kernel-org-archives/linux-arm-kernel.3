Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBB6CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEyeMhR/QXTIN+yafgST63K3oGIIG+IXiOqEdcRlOfE=; b=GG+bgch/4aXqgtpO+E1DrHKR/g
	wSuyjtP3elNrwC58Q6Veu8x1Dda1uzWYw8XifY6RAc5qhTledjsexkNgK68LVcjLaPkkQl9wIXaHA
	ckCpcuOMtrNyWzpY5wa4w9Bzi2T3fhOUVmolnPi6Q/yH75cbPV1agz/3naoF89SbyZVGT63zdB7Ee
	dhusiWUvXyuFD1WzkqjJfUkCgKLRnPc9SshQ6caeOdALCqBZ5b7e0rwd1wBMqaogr3Rw4uLFaCllj
	Ae4qjzgIaZ2rcuAYFsLzEBmdaAxfug/eKVC9BsvA7YNRnY1AsCiE0OLYcornXPgTQycgY+FbJ4IZG
	FyA6YDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturk-00000007dSz-29ZN;
	Wed, 03 Sep 2025 21:18:04 +0000
Received: from mail-pf1-x463.google.com ([2607:f8b0:4864:20::463])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqAU-000000071ou-2K17
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 16:17:07 +0000
Received: by mail-pf1-x463.google.com with SMTP id d2e1a72fcca58-772843b6057so55474b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 09:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916226; x=1757521026;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEyeMhR/QXTIN+yafgST63K3oGIIG+IXiOqEdcRlOfE=;
        b=K4VuUTGYfwU3TSM4my/HjQ+eOu5Jbu1TAWvCbtgVkRWbg+SR9tvXjuaT7txa6HELxc
         IaApNrSXmcBjXPtbRgHQVM2FtPL8Kuv+tbqZ9fDC5la7vOTllILL1bR7xDutYiIc7HWl
         qsgNoV5ZZJzE6sAMIf2ni+dTze94UO5wF5XTnL5fgvEvS8QdcNryMk+n0bqovhQaiYIa
         D/PPS5JnYTtlux3UGMhKJSrhXETqCQjTnZ+gLff5EQOaBDKYR8tyTi2DLphtjqX89IBa
         nTHDP0PbXArm3Zp3HiIznG6W5jivjacvgEBLIFpNwM06niciIUFlU4DZzunfF+ardHC2
         UqFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfCJ6xhy96SJbFdYstEKQYqdlM0EqWs9Db6bK930wTtuYUdS1A9T2zSsfFHBFCYtFZt1oAz2fVmL4A75n6pK2I@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6q2a+DMXPslslHY9+1JALMT50JFVU4laVwaBJG0ADazbP++s8
	ESzpFlTqlMHC2Pn2SGgi/gC73HlvejTcHrEw5IzCT6yL77M3DZTDIon4mY1O5V1UrUlhvlRRmQI
	yYqs+XdCa79PyR21Mt0ZpoMXlCgQF+YVv9BxoWS4sFQhOkMkoSPpx2G60Nz98I4Qb4t9Xsk1oR9
	GAIr3lDhQsZ8ncq04g8CQDHh8SWD9pk4k0wze7+J6g+GOZt11QqhKbjhI/5NYujvwOsDT0Wmg1O
	ZxO0ttX260Sn7bnuqrGxIDEGiqbUF1lW6g=
X-Gm-Gg: ASbGncvIMs00EfHkctytrdALaAE/Big5aQcYdM2jb+zWYO2BB9ooDHtMxtrssx9bdNC
	lRK9xqh+M24gn12rIq3ah/SFgTnRaLm4gJ3+wYMX83pNdA9zMo3KavwnSFnh9nSzH37Rxfs0nTS
	UR5IeUfoJCEYXiHE4cwObamkHzGkBf7R8whAgQUEhBzz0C6qFh45AB+y74ruhrzXblr//BO5qXr
	MrfFPkpnR/+zVhsBa1D3WBl/RadbKYLve9ZNXAp3M2umkxMJZ1cKqDEUX6QDc4FWlP0Z3nIz3wJ
	ek9SIXVvyeF9cgYF3xdTDpXF4Bk2CnHIhiQZODl2ZTvn4JRiONzE8oUq5ADFpHyt14SLUOLeacQ
	BwmaAMdWuo1LbEQ1Pj49jFPoE7yqoUDS5U9/ED36QhiK4uwAgMvvzcS960ZoFPceJxK9atI+RrQ
	lCU0GJFaY=
X-Google-Smtp-Source: AGHT+IFRQlTO98oTiaPPZnjiPkY9uuwZQ/hdfk0W6agCiUXHov4yS3gsmILRTLQRzxT9qc3i4mRycjNx/ODM
X-Received: by 2002:a05:6a00:2d24:b0:771:e4e5:2ea0 with SMTP id d2e1a72fcca58-7723e2246a8mr16532312b3a.10.1756916225570;
        Wed, 03 Sep 2025 09:17:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-7728416c140sm96756b3a.8.2025.09.03.09.17.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:17:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b47b4d296eso1791441cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756916224; x=1757521024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NEyeMhR/QXTIN+yafgST63K3oGIIG+IXiOqEdcRlOfE=;
        b=iOcxzWLBxZ3iUVxQgm7O4v4J76OPqe7COJ024BmNqq/59X0WsE24/IaBf0VRIHV3nS
         GUTP6biTpdB9yngKtL3jRW63kLWRroc09bt5gEFayUu+NndMt6a6B0h5pOfH8qT5giBN
         SOIOTb/klaHVC1PDle72E4fpvJJj6/dm0Zqk0=
X-Forwarded-Encrypted: i=1; AJvYcCUtTraX+jBIWWEg0pJuhQCZYpRppP1Hwz6KyskhKUhHqOQ1uI4ONApEPIbAZb3NZSGaAqjUKi+gFR8KoqbmgtD5@lists.infradead.org
X-Received: by 2002:ac8:57cc:0:b0:4b3:b34:9395 with SMTP id d75a77b69052e-4b31dd27962mr180189221cf.65.1756916224079;
        Wed, 03 Sep 2025 09:17:04 -0700 (PDT)
X-Received: by 2002:ac8:57cc:0:b0:4b3:b34:9395 with SMTP id d75a77b69052e-4b31dd27962mr180188711cf.65.1756916223483;
        Wed, 03 Sep 2025 09:17:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f756d93sm13694341cf.33.2025.09.03.09.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:17:02 -0700 (PDT)
Message-ID: <b229ea9b-96c9-4910-a827-f4d9cc14fa96@broadcom.com>
Date: Wed, 3 Sep 2025 09:16:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] include: linux: Destage VCHIQ interface headers
To: Stefan Wahren <wahrenst@gmx.net>, Jai Luthra
 <jai.luthra@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <uajain@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-list@raspberrypi.com
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-1-5052a0d81c42@ideasonboard.com>
 <20250827124016.GF5650@pendragon.ideasonboard.com>
 <we7tl65ijs44ae2zxfejmvnml3ls2pkfhcp2fqsmvec2eqevwm@yb45fs7nnf5s>
 <8ed6519a-6e45-4793-b11b-7b63c1703d6e@gmx.net>
 <910dae68-0545-46fa-b41f-8e4fb32ed649@broadcom.com>
 <c35ab51a-e9df-48f5-bc18-889980098d08@gmx.net>
 <175690728665.8095.6551736878574350999@freya>
 <02213561-7a72-474a-be83-98d5ba575f0c@gmx.net>
Content-Language: en-US
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
In-Reply-To: <02213561-7a72-474a-be83-98d5ba575f0c@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_091706_594215_A7A2BC69 
X-CRM114-Status: GOOD (  17.47  )
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

On 9/3/25 08:03, Stefan Wahren wrote:
> Am 03.09.25 um 15:48 schrieb Jai Luthra:
>> Hi Florian, Stefan,
>>
>> Quoting Stefan Wahren (2025-08-28 11:49:47)
>>> Hi Florian,
>>>
>>> Am 28.08.25 um 04:17 schrieb Florian Fainelli:
>>>>
>>>> On 8/27/2025 12:05 PM, Stefan Wahren wrote:
>>>>> Hi,
>>>>>
>>>>> Am 27.08.25 um 16:33 schrieb Umang Jain:
>>>>>> On Wed, Aug 27, 2025 at 02:40:16PM +0200, Laurent Pinchart wrote:
>>>>>>> Hi Jai,
>>>>>>>
>>>>>>> Thank you for the patch.
>>>>>>>
>>>>>>> On Wed, Aug 27, 2025 at 11:54:08AM +0530, Jai Luthra wrote:
>>>>>>>> From: Umang Jain <umang.jain@ideasonboard.com>
>>>>>>>>
>>>>>>>> Move the VCHIQ headers from drivers/staging/vc04_services/ 
>>>>>>>> include to
>>>>>>>> include/linux/vchiq
>>>>>>>>
>>>>>>>> This is done so that they can be shared between the VCHIQ interface
>>>>>>>> (which is going to be de-staged in a subsequent commit from 
>>>>>>>> staging)
>>>>>>>> and the VCHIQ drivers left in the staging/vc04_services (namely
>>>>>>>> bcm2835-audio, bcm2835-camera).
>>>>>>>>
>>>>>>>> The include/linux/vchiq/ provides a central location to serve both
>>>>>>>> of these areas.
>>>>>>> Lots of SoC-specific headers are stored in include/linux/soc/ 
>>>>>>> $vendor/.
>>>>>>> This would be include/linux/soc/bcm/vchiq/ in this case. I'm also 
>>>>>>> fine
>>>>>>> with include/linux/vchiq/ but other people may have a preference.
>>>>>> I agree with this point and I might have missed to notice the
>>>>>> include/linux/soc earlier. That's seems a better location to me since
>>>>>> it's actually broadcom-specific.
>>>>> I would expect that headers and source would be more related.
>>>>>
>>>>> For example:
>>>>>
>>>>> include/linux/soc/bcm
>>>>>
>>>>> drivers/soc/bcm/
>>>> This is not Broadcom code, it is Raspberry Pi AFAICT, therefore, just
>>>> like drivers/firmware/raspberrypi.c, we would need some namespacing
>>>> here that reflects that, ideally.
>>> The VCHIQ code originally comes from Broadcom, but the current
>>> implementation has been adapted and tested for Raspberry Pi. I'm not
>>> against a Raspberry Pi specific namespace.
>> Thanks for the suggestions. For v2 I'll use:
>>
>> include/linux/soc/raspberrypi
>> drivers/soc/raspberrypi
> I'm fine with this.

Still is not properly name spaced IMHO. There is clearly a lot of cross 
pollination between Raspberry Pi and Broadcom on the BCM283x and BCM27xx 
SoCs, but ultimately, Broadcom makes the SoC and delivers it to 
Raspberry Pi.

I would really rather that you used drivers/platform/raspberrypi and 
include/linux/raspberrypi than the previously suggested paths.
-- 
Florian

