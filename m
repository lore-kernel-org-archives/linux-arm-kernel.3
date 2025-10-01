Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B06CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REY5MPBUvyw7JEoBE4wqPx+Ebw8YSmQnOCr3RtTwLVM=; b=DdprQeBII33uOh83iQrjnzHp2z
	8KvngtAezaD0oO8OoPw6cndCPSvpjPf1eZLPMoGLXT3JIISX90QkBiRZirabgaA+misBSV3e8P7H2
	AwfZ1pGLBrFkdDG1g49gFTWD5JG6B+J6hO1jum2AWsc4OzxqK4ZR6DwNq72nh329eLXjTXhjWdlkM
	NZt/rwIb8XDquxYcHU+miyJ09onEAwCClF6mzOk+OWcIL8Onb6yVIEtsyDMYyWCm1/AAL8XEkC3L4
	XhYAQTAAwArA0t9KjaNaSpYMfvzUxXFgB7LSldvpYXphFWh/urkPAdv5hRCOYEzOwx8Hqlj6eqaG7
	XmWaU14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ykx-00000008OJx-2y0O;
	Wed, 01 Oct 2025 15:28:39 +0000
Received: from mail-io1-xd62.google.com ([2607:f8b0:4864:20::d62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ykv-00000008OJa-01tU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 15:28:38 +0000
Received: by mail-io1-xd62.google.com with SMTP id ca18e2360f4ac-88703c873d5so279365039f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 08:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759332516; x=1759937316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REY5MPBUvyw7JEoBE4wqPx+Ebw8YSmQnOCr3RtTwLVM=;
        b=enXAdKcre81tDfyYMNThT6WCidBMrNQKEZQmOcWbWUhsnD+8SVXp6AU7YstCeZw0KL
         ebBfscGhvIj6G5yRclrE6qx9T40Jw0LxcHvtLNPTay3SEr42X8M8D2rlmnvk9xPaLgeQ
         U5DfJA9lX8cP9PI/68CpFHmh8sF6CqwEWi6hbpjHZDTWpvjFn4H8I/rix2UtB4R6CR5s
         RIQ3nymsdmP2kUjIwO0xfg3tUhGsRJrKOAOi3Kph6lpX+dLIc4GwAJS53uf49UPFFU19
         8jt12qNurbMWuB5Vmcv5+mPHS516uB8d7nVbENsI88hObljD21VJgTkDsLeToVvUiTxJ
         Z40w==
X-Forwarded-Encrypted: i=1; AJvYcCXyGYIGx2UyrFpC2M/B4vt0fUqD27LXkbcBBeu8crcLz5ceDA74DZig0addpUczIC3NZub2BvgKx35+RnXScw8i@lists.infradead.org
X-Gm-Message-State: AOJu0YyjtUOFKm4Qo7DwWuPv35C0BBWbQbGLaK29wP+SjWZ0Yi9nVCRO
	3UTNHdPv9pctFbaVw/C0GhRpyHN3dpBZeNAqXp8b8OHcuLp51R0pZKq8tA7FE35vHryuKY7fOhX
	z5I6MzwVt9QpWD6q0XOtI9ctsofksB4T1NXZop+LLyL1Mktb17gxeh9jQRk2JCsTt7QPCV6FgJ4
	JuSaVFJ1aQid24MfEAkdei5f5qRUJs6Xhu73HTaoLUbGyduefcaTH05EmzKQQDGNdVaSqgcSEqR
	Ucxue6Uyq6Rd9uxib9rfWI2fnmHUmXH6lw=
X-Gm-Gg: ASbGncvfXEDawHnJbb0pVIQ65tlnYJ8gU6s3qc7za2gfSHSFXdVHv5/8LpbPsClRtkr
	HPdf+HFXkuFEoQo5KV0CoT75XDnZonRyJyLz8O4h1YEo9WFjbh4LwopBjgD/y8vdTd4KTwfPLoh
	DwxRawDbXMTRkb3gbV0kd+VWZjjwdfIa7tl6EsLTGoejXBh5vMw5LPr27RwP5x66VrUAqRPS89R
	tyukYmpkU1RlQtl7z1XCag6dwJDCspYqQEkziZNLOEU/cM0Pxju3AAyp1ScvTF3aDeJLa2BN5hr
	iSvXClx61IYkbd44xAxjUjMoN9qi6r6ClWyJ9LcWLKKiatkveypYq0OyX+DFqmEahknQVbv6mFB
	kSMRXSlZ9uSS/QrneC0A1b4g5Ji7YcAOTT1DH2UE9xxZP6okLRuWAfOWi5DCbpb9+t6/EzwGDwM
	tnSSg88bcw5ga1
X-Google-Smtp-Source: AGHT+IEilUqVh8z9TiiTCS/MLlZc2inuCwoU4WHOMK9fvUb2tnQu8+wqXMtzoguq83jZBZ3DeK8Zjw+DI7Ye
X-Received: by 2002:a05:6602:3890:b0:91c:fcd:88fd with SMTP id ca18e2360f4ac-937a92869eamr603538939f.7.1759332515827;
        Wed, 01 Oct 2025 08:28:35 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-92ec80b6fadsm27324639f.12.2025.10.01.08.28.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 08:28:35 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f68c697d3so25346b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 08:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759332513; x=1759937313; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=REY5MPBUvyw7JEoBE4wqPx+Ebw8YSmQnOCr3RtTwLVM=;
        b=aXK6FVv24mf9f4w5ngeqx8QJDzke3HNnNpgfDOsZrqBgzkmfeai5xWBFwkhRPoLsTO
         awQRh3G4e19GPpzY039CVWbWQ/6pj2hI1AUbvyRk1kpfaoLp55G7RcKZC2XBC0As8ur7
         dLIiVqDk/+BocMwOE9nGtomK/9onsclkESHvE=
X-Forwarded-Encrypted: i=1; AJvYcCVFsJmG/3DpZts+BXDfueYrRcI5l/wo6rmmUJJUQvcIL+SAMQB21H3elOkSLa38wehJBjUnk/4rk14qYy22UFrX@lists.infradead.org
X-Received: by 2002:a05:6a00:190c:b0:77f:449f:66b0 with SMTP id d2e1a72fcca58-78af4261855mr4611400b3a.32.1759332513150;
        Wed, 01 Oct 2025 08:28:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:190c:b0:77f:449f:66b0 with SMTP id d2e1a72fcca58-78af4261855mr4611365b3a.32.1759332512669;
        Wed, 01 Oct 2025 08:28:32 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb1902sm53209b3a.31.2025.10.01.08.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 08:28:31 -0700 (PDT)
Message-ID: <68e10834-0c1a-4cbe-be0b-76e17f8341e0@broadcom.com>
Date: Wed, 1 Oct 2025 08:28:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock
 support
To: Peng Fan <peng.fan@oss.nxp.com>, Kamal Dasu <kamal.dasu@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
 baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-2-kamal.dasu@broadcom.com>
 <20251001025817.GB23170@nxa18884-linux.ap.freescale.net>
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
In-Reply-To: <20251001025817.GB23170@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_082837_058869_DD41179A 
X-CRM114-Status: GOOD (  15.79  )
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



On 9/30/2025 7:58 PM, Peng Fan wrote:
> On Mon, Sep 29, 2025 at 04:06:24PM -0400, Kamal Dasu wrote:
>> Adding brcmstb-hwspinlock bindings.
>>
>> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
>> ---
>> .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
>> 1 file changed, 36 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
>>
>> +  - |
>> +    hwlock@8404038 {
>> +        compatible = "brcm,brcmstb-hwspinlock";
>> +        reg = <0x8404038 0x40>;
> 
> Just have a question:
> the base is not 64KB aligned, so just want to know is this module part of
> the other ip block?

The alignment is relevant to determine whether this is part of a larger 
IP block or not, though I am not sure why you use 64KB as a criteria. 
Our HW rules are to match the highest OS available page size for the 
systems, for us it used to be 4KB and is now 16KB alignment.

The block is part of a "sundry" IP which has lots of controls that did 
not belong anywhere else, for better or for worse (pin/mux controls, SoC 
identification, drive strength, reset controls, and other misc bits).
-- 
Florian


