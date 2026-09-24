Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDDFC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 21:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skcWtpxGtZJwW4Q1vAThTtylvAwrMeApRCrXkDCWfgY=; b=uA49ak9Rmiom0jxZuPjAtwYLdN
	rk+WCMZcGKmHCO0N8wrgevBwy6pS8lMojxk0mSqwOMqh3i518d0b+99kRSYsjbZ2pjWuFKWHgYdOY
	aEav6Xeq5hKHH4b1lYlgdOysqb+cUAggNvwGgFE/poble4IjCHq49W6QeAecQIluXqnnbzsINluLQ
	s1/Ag2ypMf6wkr6Bm03R9ajHVP2kHTGgExA6nZqB99dWRwgVmmxdpKsFEG7Dnz7yGEMqQ3Nu4lLiP
	9CuKX6zV14Veat+hh6faU2gV35wV9pMk3hOhbZcqkhxOZMewxSbz9ncwT2P9bYtidDlJOYyUBO6wG
	GFRPD14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qkR-0000000CCl3-3dty;
	Thu, 24 Sep 2026 21:12:55 +0000
Received: from mail-oa1-x64.google.com ([2001:4860:4864:20::64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qkO-0000000CCj0-3hgr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 21:12:54 +0000
Received: by mail-oa1-x64.google.com with SMTP id 586e51a60fabf-48e201396baso101805fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 14:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284371; x=1790889171;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=skcWtpxGtZJwW4Q1vAThTtylvAwrMeApRCrXkDCWfgY=;
        b=KtLhthJ3u1wui+DwKZI0OT7f806vXfUxvkOyUVtOkOwG0YcgvAchIPjzv5rbPnih0n
         hsowWaO5dg+tG3qjjz06gdKcMVg2weYVbT7Zxd2mp5w103hNbtBhk4xBeK7sQttCqNMZ
         6s680Rwy47SraCZeCA4r72jP2pScG8xepNDFCTf8kw3+0t+Tlqsmz8DX9ILV+6X4I1JN
         i2ezoVzReSK0AYZHEIfjoMHkiTxYKTf18livqKkfRB8MfefhnrJ+ebLrZfisRYKJM1Hb
         VnbxVHHiYCjeXARVH4s8M/t1pjJjKC0PvgCqKlKUgpS6hmmw2mretagAjqKmHm6okQOz
         XXuw==
X-Forwarded-Encrypted: i=1; AKwUvBzdtf1ATEEjQhZxkoZl75M+GnUl9lM5PT7kG0wiZxVuktVXM8Q4gJAthRLgH2hOIgRDoBjFVHVh4tuGXlO4k5OU@lists.infradead.org
X-Gm-Message-State: AFuF++n4IgOjvbQQ9ir0O6u6+jT3bN35NJkKBQdpIc0KmgT0QvJ0pry/
	f3W37qa3DKeDCNK+MdbVqocfM7QCBDknxvL2yUQ4jEETJEMr6QAQwZdnYa0/3FcB6LedFHgwcKK
	5YZeHkBsXWOHHUfuwNQolmyevJ6S9H2GS9m9ztBawc/kcH4ibroiFkUCO+sAXarEA50JICYNIFN
	opPflcjrWUywWlkkMEZYSlEckMZhh/yL1df8hLx3njwLjHHR2eLDSLFTZQsnX2kkgT07jo+zvMO
	myNNyyiEFHGZByDstXF6yvyDgcWbMkerjw=
X-Gm-Gg: AYBFou3J27vMtPcz1+X/eSZuqUP3y70yWnk95l/rWpccohaL53JHaCA9oOhX2f254sh
	Ss6t435yfGKjAI0SrGjxld/vG2q4M/WDF9JJXeaioMBenDlzezeHP45w7+XAb116LlwMWR6aUxk
	RWLxzt/jd4YnJ5IdWezlTcJHoG+zxmf0WJe6Aac5U/kOMeK2Vz+KMP5u6sYbTgZN4NQQIqhdzE4
	IKAUeJSV/Hnpi4Y76RMTcDHd8WZMYY6Q4FfL0CIDifh9GVuUFpIqEguSIxsHuaQrtAVSLdNV4gB
	4RRCIPPN2nLHrBwjMawWxwEwqaYMKygx0XFsllpkRKBDdDDf2NhJJcFJ3IckR0jq/SGrMucyLxj
	67Zf8lrCczTocPs3WB0ogicLjH/GY3DqcTdRPrsj8PNswvL8jVe37u9WkN58YqH43sTMRtIzOhw
	jozZYKxR9EBHB8A0l8ScVrQ7WQl9kKZQSU9FP0xyCHYpk=
X-Received: by 2002:a05:6871:e00d:b0:45e:d1cd:5e80 with SMTP id 586e51a60fabf-491e4a3c430mr3857024fac.9.1790284371524;
        Thu, 24 Sep 2026 14:12:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4933074192dsm71015fac.0.2026.09.24.14.12.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Sep 2026 14:12:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso43720785a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 14:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790284370; x=1790889170; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skcWtpxGtZJwW4Q1vAThTtylvAwrMeApRCrXkDCWfgY=;
        b=d78l/HrMqIM8l83GrwV7pB3hQwpkQNABJFlsaBbkqOLDKbuYD+v726UPN5xtIWNCaa
         bry3asWarUBp7nlasmDXHTk+jYhq+L+1Ylu3ynO4tCtxXRQnyPTbcTNMAkqwZcr2V1Of
         YZ2HY7cJKdKbYrZtXPZzAEOsbkbuTixmUkd60=
X-Forwarded-Encrypted: i=1; AKwUvBxYWRb3mfp6o8aZPynoX3FcKbfoY9XptdEr2Oaluqj4zL0C3hMDmctnUomQ/gUFnih+qlvEvqhZLrI7l+HauX8T@lists.infradead.org
X-Received: by 2002:a05:620a:8389:b0:939:f8e9:5e19 with SMTP id af79cd13be357-93c43c2f3ecmr105806985a.1.1790284369791;
        Thu, 24 Sep 2026 14:12:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:939:f8e9:5e19 with SMTP id af79cd13be357-93c43c2f3ecmr105803685a.1.1790284369353;
        Thu, 24 Sep 2026 14:12:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448eb2a4sm25619685a.20.2026.09.24.14.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 14:12:48 -0700 (PDT)
Message-ID: <7eb8da6d-0c09-44d5-979c-fe0952b92018@broadcom.com>
Date: Thu, 24 Sep 2026 14:12:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] dt-bindings: display: brcm,bcm2835-hvs: Document
 iommus property
To: Daniel Drake <dan@reactivated.net>, "Joerg Roedel (AMD)"
 <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com,
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260924-bcm2712-iommu-submit-v6-0-7b3cace86973@reactivated.net>
 <20260924-bcm2712-iommu-submit-v6-3-7b3cace86973@reactivated.net>
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
In-Reply-To: <20260924-bcm2712-iommu-submit-v6-3-7b3cace86973@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_141252_983317_5D892670 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

On 9/24/26 14:10, Daniel Drake wrote:
> On BCM2712, the Hardware Video Scaler (HVS) is connected behind an IOMMU.
> Add the optional iommus property to allow describing this connection.
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

