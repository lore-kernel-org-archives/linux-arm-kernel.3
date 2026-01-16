Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E17C98305
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 21:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZPxsf3cKGg5r/sDoaWbUA8YBIi5b4KFRVaME9GKXIs=; b=XsEGnwzH+EudsDEroxJ0NVqEw1
	unR70PRDx/2NahbwAaYvndQTnHrnH9ABypLv/0wT0RwDa76g33yIuyIGKzQquXKUBfm1yTWV+g9f/
	Vuw0PMF3p5t7ip5YkMP1F/6J9jTFQH0K1ifNuzvW6qHdPp0t4WoYOBSASb4DrsQaT8VTqnav1fQNj
	aPPt3+sDMA3Zo2fkFVb+f9euyTigEN6ZzSSPlFWokYOiNvGNEBDBurS1iF+NMl+Qj4/P5nPmtwH6C
	V6tPc7RyVBL387dKTrcp5IgPUMVwMckwyRpbmgVdQ2Fb3cj3DnkDReZDKubXTWBYIO4+3Cimt9FEH
	OAkT5SgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrhE-0000000EwpD-3boY;
	Fri, 16 Jan 2026 21:49:32 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrhB-0000000Ewo6-3zH5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 21:49:31 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-81f4e36512aso2456789b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 13:49:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768600168; x=1769204968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bZPxsf3cKGg5r/sDoaWbUA8YBIi5b4KFRVaME9GKXIs=;
        b=RH8RVdRWPpbfg5LvS8PEuTB4ObZgDnGQuzeMzqukzVtwqhscpsfB36B/s/+yOT/ZZJ
         Zij9cGi/0Ufgr1KIaSX6PORjUA8k5ZRErGzzGfborIRV6GrfLgoKTW3z8NPPA9vhlvxw
         ptP6nBae/J4/CGcX4/STTP5ZrdY/9lksc+wvpwML/+89dwfMEBQtfclR3B/9RWamkY2T
         1DZsUeazH5jjlqA60YtR7wHVxhEVMyPCk2cP+dfLRIqV+3E4mi9X8hlJsX2WxpVgzsWM
         xSwI3Yi9KgOHdgasjEmVoLeq2W040QVvKHMn2c9BclEfLtjyRnYiV+so9JQEv/T7TbEg
         NLbg==
X-Forwarded-Encrypted: i=1; AJvYcCWNsatckAQ76at3WdNGBK47tqUVeOHqV3ynwSqKnuMeTg5z3By0aoIBPtH41SuPHDGhlGvDpq+jCSpPLwngUyRs@lists.infradead.org
X-Gm-Message-State: AOJu0YxdzoOTrtBupwulUNrkFNyTH41ngT/XzuGPBRTqd23eRIfOwLlR
	80SdZrjdU6T+aM9MMnp+Q36MLJ9gi0bPPCF8PXlGtnOXmfYZo7vrWIHeGmtWTTl+q8NKvywsjnr
	ETVWxGFoWaX8/nZECxrqFMSvjVgZ1146nm7J6P0a1aiqjiobdNagwZCwUwXTjQiPdFluyZS0kEW
	f6aFTMAoRwLR3ZNi/CdA4J8W73PCqRyT0HVe9RVbD5Cwr5+ABleh+Vs3TYjMHmZ9LimG1ZkggPU
	vWXC9JrMZEOA6Ve2O4SVLkmMGrsZ/+P0ok=
X-Gm-Gg: AY/fxX4O1CwDgi5M3CpOmBovIQzJNANYbvjOKIivut0SGjDdgkHDNoUicUj7UtB0NU9
	xjMUoVl6kbckh9zikuuqc3Ce4d6hYjJTBSEq+O2z3gkAEgrlbSWyCPN6NJKyCoNTuOZtc4RcvGh
	KgMqbX6VQP6avI76q3fXHJGSHH9CkW3nl4ukSxHIyNuU/6YOfBka95M5qeaGskSRZWRPA8BqohE
	aRz2WqFFDQFMfNHGh5CbgINkpqj5lorBO79QG8AXBpmp1p5DjkxVuorKT4J0sZe98fkEabMoBnF
	fPBia8zIzoLOzw6CWFoBfHQMkDejYvACx1e18XhC0MvaHBT5tOrXo8OV53hsmSJHjewRs2ux7Pf
	jieZNIYMvBXwlxXQpdQ6gSliI0G0xT8NFeBcEV5rJQMZjf4ZDf9USurZRZWAwNYmaSWW9tW5lN1
	pqivOH+gPYQXaU8fkx3qiHP9BwXeJuTpnhkMJf9xFv+IbgTKM1wTsf
X-Received: by 2002:a05:6a00:9289:b0:81e:b2ba:5b36 with SMTP id d2e1a72fcca58-81fa18833b9mr3315000b3a.63.1768600168314;
        Fri, 16 Jan 2026 13:49:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-81fa1275b05sm394547b3a.8.2026.01.16.13.49.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Jan 2026 13:49:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-502a4aca949so44824481cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 13:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1768600167; x=1769204967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bZPxsf3cKGg5r/sDoaWbUA8YBIi5b4KFRVaME9GKXIs=;
        b=QDNM+Hk2a13qF2qLEauKP2XBSenuma5QWo37lpolyzpCzNjBuGzRnPHiQWjmRMT9dE
         1FfQo7z/DBERF7dbSyKYyEDZJcwXrPuLVw59QzyvKuUGh7rboTmmMLCHMsr7+9bVlDph
         uRkM6d9GQ4NXrS1EQG1FGa2vl20Gi5VT3ZJlA=
X-Forwarded-Encrypted: i=1; AJvYcCWUQvcMkvrifEJb9oBIBhlD7G77uN0ziu9yW5R5OiXI5cwgX1+dvQzWH4DtBbqT4ioieeXMC8cYRyDUNjAXoq8Q@lists.infradead.org
X-Received: by 2002:ac8:5949:0:b0:502:9b1f:ca3f with SMTP id d75a77b69052e-502a1f838camr62604141cf.56.1768600167091;
        Fri, 16 Jan 2026 13:49:27 -0800 (PST)
X-Received: by 2002:ac8:5949:0:b0:502:9b1f:ca3f with SMTP id d75a77b69052e-502a1f838camr62603981cf.56.1768600166662;
        Fri, 16 Jan 2026 13:49:26 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1ed1de6sm29437481cf.17.2026.01.16.13.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 13:49:25 -0800 (PST)
Message-ID: <bcb25d4c-1ce1-4b91-8950-66b3ef69deeb@broadcom.com>
Date: Fri, 16 Jan 2026 13:49:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] arm64: dts: broadcom: bcm2712: Move non simple-bus
 nodes to root level
To: bcm-kernel-feedback-list@broadcom.com, "Rob Herring (Arm)"
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
 <20260106-dt-dtbs-broadcom-fixes-v1-3-ba45874e4553@kernel.org>
 <20260108173330.3784137-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20260108173330.3784137-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_134930_183829_206FC444 
X-CRM114-Status: GOOD (  10.07  )
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

On 1/8/26 09:33, Florian Fainelli wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> On Tue, 06 Jan 2026 20:09:42 -0600, "Rob Herring (Arm)" <robh@kernel.org> wrote:
>> The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not be
>> under a 'simple-bus'.
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
> 
> Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
> --
> Florian

Also dropped.
-- 
Florian

