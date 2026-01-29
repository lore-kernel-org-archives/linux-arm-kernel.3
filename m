Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732CCD46C0F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CM+wwJXObGbyyxl1sES3pJglJ/lxO2VMKG5c9djxeeM=; b=EODHVhtEPnanvKZ6ypVxZKkS0o
	UYLReClr4WXDunPPV5jYxIKkAYHfsm+mdQrypbWVjboar79lfpDIxQZ1g6TnWff4DUeGpykrnK3Ig
	7EwedMUh88egIGIoUtXkiu5TE1RW7evygwKqO3i7gLEaQgA87Sd154cjRe2W+gmDFltmE1uPVcgjx
	3pnBbmdB/tKpoWvwFPozdCK/aMUHlDnyKPquy83QrNqcRb3GsV505LWwqXMBHB8lnRSrCiz1y6qUP
	ouVLDtctqmZrVuSJeKidzxTDM7qJ0sOqLwZDIMl+WpuatmRP/Pr3LOPsYvQpLVNLkjqe11wcoNu/7
	t/1KWfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFSQ-0000000Gwyx-3p2d;
	Thu, 29 Jan 2026 00:00:22 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFSM-0000000GwyC-2vS0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:00:21 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-8230c2d3128so235536b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 16:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769644817; x=1770249617;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CM+wwJXObGbyyxl1sES3pJglJ/lxO2VMKG5c9djxeeM=;
        b=vMpo/WUfFH1fAG2KgR9bQW1clLbfDIL8hi6v+6uECMDSCnZHfgBQN060dZfEg87OFA
         VprAS7c3UCkiMrU0f1iaJ79GSKkBO8NtURKfkiyrjEfXervSqbl53zMcvYNW6tSPRi9Q
         WsorgYtuzZry4FZfSFT1Nds5EA00Hdlm1G0EoKLsn2HmBg+JGPytNnYBDqBKqb91Y6cI
         wvRVk9Lccl0H0Uq8dMUntOAXn5jupsTPmempYYC3AT7tQb+CJUhh29iRn6HM6/ygrCVd
         PoPgbSj80R24038cFS4ml2veaws3CuWb/KtWzOJiNSGPieSmFDOuGCraUsGwEe3Sj+QV
         Xz7g==
X-Forwarded-Encrypted: i=1; AJvYcCUVDgJFjKYpTuOLiaAtPNzS0SMGAaRJS1ZyYYG6G22iLXUw+xojwBooBkfj6t2WE0W+neGIDP7LhKPqNTnNXjBb@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw1PyKp+SRSfZAVE8aEEMxszT+5xRx48Lv20JvZSFprbhczkMf
	y5jh4UYjye/wvOWYW09cCASwIi9t36qajTDEhkk4whNKHReCF96CF7oRDF4ta0OmSzQDmKqVDYG
	LNmqMVe7XItrlZgetsSJ/HofUv2RRI+MT/PB8omWlQC7hwQzVOf4/PDinDnKEPM/sNLSe22KthD
	wXYrjdUfMnO3yGaH5oGpuQYrxgptggy5MCiHws59xMdL2CUhrwCLTzK//bnMS5uFbE6gPZPoabo
	ORfesZ5yZ+OS9djlER4R0SpUC2V2zIo2Rc=
X-Gm-Gg: AZuq6aKW/HLB3nqUYs1ZaWtYK4jMnxClmYhmzTTjJmN/XyC5lVKv2neFdrM/LFbVv59
	+JYZ3mKxCukaHAD2DX90rO91MW7LSzfdkMhiVO3b4HNn9Z/LDEEjMF/9lc3gNOgOd6CvovAr/iF
	qQb6PVqvQrjnj4zStMo3XRgsJASF1bOL8htOd9eATQvpAQc2JHx3J5n8dyS+yS07m7Cod8nc2+L
	rMay9ce6PGg6xZk63zTntSvKz8zd7BFzAPWQ+aPwRrBmZ7DneFyN9c+5QvqGh4BlkjxpTFR6JD2
	Wki8kZSJi3gOESWnsE9iFwW8F+Oy8rxjVxsNSoltvg/iJVPp6Sdy5vdvcgZi+kouN7XRqSj/aDW
	9Z4qiwlev8ZKrXf9ZBOs9Py+J3Zt3KJKpD7OCtgB1OD+H3a2i5u2LMhxB0hBnSlwUaL/caPDM9B
	Lueyikoi9+AfNDTfVeMdWSq9ZbvrrNUQ1yWqdAZsw6rWVG8yw0sg==
X-Received: by 2002:a05:6a00:2294:b0:7f7:6229:fbb5 with SMTP id d2e1a72fcca58-82369196317mr6533598b3a.25.1769644817399;
        Wed, 28 Jan 2026 16:00:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-82379b191fcsm426763b3a.2.2026.01.28.16.00.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Jan 2026 16:00:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b7155ca88cso481837eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 16:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769644815; x=1770249615; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CM+wwJXObGbyyxl1sES3pJglJ/lxO2VMKG5c9djxeeM=;
        b=bWjL3rbZrmAxc7r289nh/EBDguOVUqCWF7c3UwUrWc+gSNgz97mPQ+2Ht8WfhigElo
         eR9wrf7t5hSFVQNwk15H0YrfgDodBIIqo7xymuuYIDT7awk0Lc/xgqDbykLqgPGrbza2
         GE9/fUCeVXJdzI5UOJ2QP8jQK5wnsD7f32Pro=
X-Forwarded-Encrypted: i=1; AJvYcCWw4GMIQujPrmdYU95v96Ca1m9REGkMaIxUTRKc4p0MoQ3RWjfHGF7kUphQLKeDaTL+VQxxLv7i/p5xs+0443En@lists.infradead.org
X-Received: by 2002:a05:7301:fa8b:b0:2b6:c617:f79d with SMTP id 5a478bee46e88-2b78d8a51admr4078318eec.13.1769644815326;
        Wed, 28 Jan 2026 16:00:15 -0800 (PST)
X-Received: by 2002:a05:7301:fa8b:b0:2b6:c617:f79d with SMTP id 5a478bee46e88-2b78d8a51admr4078297eec.13.1769644814660;
        Wed, 28 Jan 2026 16:00:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a17083dasm5897428eec.14.2026.01.28.16.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 16:00:14 -0800 (PST)
Message-ID: <31760619-f86a-4737-8191-198aecbc82de@broadcom.com>
Date: Wed, 28 Jan 2026 16:00:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: Add V3D device node
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com
References: <20260114120610.82531-1-mcanal@igalia.com>
 <224913c8-52a6-4b3f-a375-e1b4fcc0c142@igalia.com>
 <eeb09ca3-bc8c-4747-a6f5-29f15335c149@broadcom.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <eeb09ca3-bc8c-4747-a6f5-29f15335c149@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_160020_531363_93B9603A 
X-CRM114-Status: GOOD (  12.13  )
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

On 1/28/26 14:27, Florian Fainelli wrote:
> On 1/28/26 02:39, Maíra Canal wrote:
>> Hi Florian,
>>
>> Just a quick ping on this patch. Did you get a chance to review it?
> 
> Your patch is based upon linux-next rather than the Broadcom SoC tree, 
> the devicetree-arm64/fixes branch is not merged into devicetree-arm64/ 
> next at the moment, therefore arch/arm64/boot/dts/broadcom/bcm2712- 
> rpi-5-b-base.dtsi does not exist in that branch.
> 
> Give me a few days to figure out how to best deal with that.

Rebased devicetree-arm64/next against v6.19-rc5 and took your patch, thanks!
-- 
Florian

