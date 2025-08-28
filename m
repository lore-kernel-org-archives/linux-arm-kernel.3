Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2170BCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 02:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prg3sotdOQOd9SAT1I4QjPjY9bIuPacP6Im3454z7xg=; b=YOiDEVAmsR3dLYaAQLG3PAyal6
	Dx7usNMr3sgK+Z8CYOD96/YX2ccClHio2EbEIJbFvvviw9ZuK+HtXf9/zxOmh6HESr8ekTEXT8+3q
	DFYN7FHs4dnc8T1XRfHz199AadSqK4WpVfkRMGNfkgpDfnh/BmqhnLgb6VYGbl8daP08ZJTE+uL9D
	PVtoHvzwrQyYTQqN1d04Jl+WEKvpUMJF+0KVCwiMTHM8Ck8McFOmN6ndbsRYLfIruD7h5TKFWJBqQ
	+fc8OScb7dT3DihnmV3/GUUtoe5dUf54ABjwLG8pxuMlvGyXKpg0cmnDqXqzG6ZOYJpkbzyXqxzAj
	E71ZziLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSFR-0000000006L-2Rzu;
	Thu, 28 Aug 2025 02:20:21 +0000
Received: from mail-il1-x163.google.com ([2607:f8b0:4864:20::163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSCg-0000000HaZm-2GfO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 02:17:31 +0000
Received: by mail-il1-x163.google.com with SMTP id e9e14a558f8ab-3ea8b3a64beso2603815ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 19:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347449; x=1756952249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prg3sotdOQOd9SAT1I4QjPjY9bIuPacP6Im3454z7xg=;
        b=pQgutT5kUE/9dobaAeC3Bfshdl4dqlpVFnEEfgIDZKNtpQH736IrsgOeOYtSk2gpk1
         i4Gj0757/5cmb1b62rT6hs7v3CCx0/sa4NcJWlxZHQS/vu3Z1aHdGav2xYUyPU7bUxH/
         PT8Y+5jTEJSCimOB8Q6bXpgipvWo2e4+Rp23ACbiUqLBDMWtm4rXIAISvyTx2ZQJQu7H
         tCBhz7OBUtfAbhm86Z4faEbJE1uxtyy6/YFBWLS0/oFpsaJV1OYXxCqSB/j2UTDBBylj
         cxT+VDWT5vzE7MNT5S3er41ue4BS5WBMq3vyulBzXy2XHnXBDwYvFQOC6lBu5ZfzXkRn
         jLng==
X-Forwarded-Encrypted: i=1; AJvYcCVd7jH8DDDQjzNOxaNzGR1es+Ik0G24EiVr3lMQ7IPOH5tU1bbNbpj/gEgJKZgIwYVcwoHpcq7CaRa6TYsSRX31@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv+ulmFVPn9KPY1tojaCVE/RJtPwDdTNc3hH/WsVKf/J9RddyX
	FynlqglDzNYtSynPgHNJ2nnvgjuDd1cKLhYwwPlBy30Q8IJclAPiR2nzzITy366I+ltDKEneje9
	vsiL4wEmkZ9VE9OJbPWGRwWpjIPLkdF2Jwun+AtlsRPCmrmo6U6hDKQbHj+KZUTLZHu6TCCH2jN
	0AFJKsDbWftfAgV6/E9pYgai1GPcRWgvjTH/DxPadqSV6ZAkTrURpj1rmbahBFazurDdvPE9rrV
	DdpDkBP5ose1VLLLoURXWcPJu5wCFQixNc=
X-Gm-Gg: ASbGncsQwitEH8VCdAq7RVNelL9dEfU5NI+ht4+gSboFBLHQ4qcd9j5LgqS0QdNLRlf
	OLzoOEjn3q617fnM8hvTNrfBFQxyGurWhNWSDmFQB/0vbOuqcHDb7vYtGHJXo6iYidIMxYQRR6l
	ghkPYo5Ejpvx4l4Qy1TOUoXfDSGrPneBMv2Z9mb+FS+e1nxyoo78GDrUuN/HPanPzTBiDzH0W39
	jbTn58mgLgu7qniLBPSt8L7HP/y3dZhGW26A2QIq8WgL6zq96xueRxSi/WMOgbFdz9nSub6RQFO
	Cb1GIrCe5M9yF9SfHE34/Rc5xUEHxTDt+YfuC0YSzRnxaultnqgymwkjRLxThNOmqHklcE5F298
	oPue3SR5Qx4lMMW549ovf2ujrcRbevyiw1UJeOCeUPTNy0TqqTYVcRSTXmCj2P5WvsCWPMUR39B
	3ZrN3R2nI=
X-Google-Smtp-Source: AGHT+IHsJIGSkPFgpAE4WulbcFJDn36k3u6CR6lDJYMrYCoAv6FtuqoTQ99qaKTqJ0UZzs7mwsDzU184gDGl
X-Received: by 2002:a05:6e02:19ce:b0:3eb:f2eb:6037 with SMTP id e9e14a558f8ab-3ebf2eb60ecmr226750415ab.12.1756347449137;
        Wed, 27 Aug 2025 19:17:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-122.dlp.protect.broadcom.com. [144.49.247.122])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3ea4e83b847sm11535045ab.39.2025.08.27.19.17.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Aug 2025 19:17:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-770562b1ed3so692307b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 19:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756347446; x=1756952246; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=prg3sotdOQOd9SAT1I4QjPjY9bIuPacP6Im3454z7xg=;
        b=DVr8cR7gCL6bg8Vqkt6mS+X8bpsGWyANdNK4kDX69n0uoC5oLGXFJIotipx6FGe6rX
         oRZRmJKoRcnNiCztFwrOj7hHh2pfnXRSZ+e7BM+yVwSqFtmctG6oC4JQ3GkFpQWIisMs
         CAznvctMeIv6YA1GGb9NoIEb4tQR+aI9CC5Ug=
X-Forwarded-Encrypted: i=1; AJvYcCUGbuSJgKYWfXWgshZBwT35NM6FDsDrdz7tESfcAj1Lx+gYeoM7i/iFnCaNv9qvp5ryASEiG8jXjNROsWKMFd02@lists.infradead.org
X-Received: by 2002:a05:6a00:190e:b0:758:66a2:981f with SMTP id d2e1a72fcca58-7702fa0590emr29938713b3a.12.1756347446327;
        Wed, 27 Aug 2025 19:17:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:190e:b0:758:66a2:981f with SMTP id d2e1a72fcca58-7702fa0590emr29938690b3a.12.1756347445858;
        Wed, 27 Aug 2025 19:17:25 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771ebabeeffsm8361867b3a.30.2025.08.27.19.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 19:17:25 -0700 (PDT)
Message-ID: <910dae68-0545-46fa-b41f-8e4fb32ed649@broadcom.com>
Date: Wed, 27 Aug 2025 19:17:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] include: linux: Destage VCHIQ interface headers
To: Stefan Wahren <wahrenst@gmx.net>, Umang Jain <uajain@igalia.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-list@raspberrypi.com, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
 <20250827-vchiq-destage-v1-1-5052a0d81c42@ideasonboard.com>
 <20250827124016.GF5650@pendragon.ideasonboard.com>
 <we7tl65ijs44ae2zxfejmvnml3ls2pkfhcp2fqsmvec2eqevwm@yb45fs7nnf5s>
 <8ed6519a-6e45-4793-b11b-7b63c1703d6e@gmx.net>
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
In-Reply-To: <8ed6519a-6e45-4793-b11b-7b63c1703d6e@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_191730_648204_7C274022 
X-CRM114-Status: GOOD (  16.89  )
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



On 8/27/2025 12:05 PM, Stefan Wahren wrote:
> Hi,
> 
> Am 27.08.25 um 16:33 schrieb Umang Jain:
>> On Wed, Aug 27, 2025 at 02:40:16PM +0200, Laurent Pinchart wrote:
>>> Hi Jai,
>>>
>>> Thank you for the patch.
>>>
>>> On Wed, Aug 27, 2025 at 11:54:08AM +0530, Jai Luthra wrote:
>>>> From: Umang Jain <umang.jain@ideasonboard.com>
>>>>
>>>> Move the VCHIQ headers from drivers/staging/vc04_services/include to
>>>> include/linux/vchiq
>>>>
>>>> This is done so that they can be shared between the VCHIQ interface
>>>> (which is going to be de-staged in a subsequent commit from staging)
>>>> and the VCHIQ drivers left in the staging/vc04_services (namely
>>>> bcm2835-audio, bcm2835-camera).
>>>>
>>>> The include/linux/vchiq/ provides a central location to serve both
>>>> of these areas.
>>> Lots of SoC-specific headers are stored in include/linux/soc/$vendor/.
>>> This would be include/linux/soc/bcm/vchiq/ in this case. I'm also fine
>>> with include/linux/vchiq/ but other people may have a preference.
>> I agree with this point and I might have missed to notice the
>> include/linux/soc earlier. That's seems a better location to me since
>> it's actually broadcom-specific.
> I would expect that headers and source would be more related.
> 
> For example:
> 
> include/linux/soc/bcm
> 
> drivers/soc/bcm/

This is not Broadcom code, it is Raspberry Pi AFAICT, therefore, just 
like drivers/firmware/raspberrypi.c, we would need some namespacing here 
that reflects that, ideally.
-- 
Florian


