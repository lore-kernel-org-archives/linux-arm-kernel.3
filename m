Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67D6CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6g+XCuA2ZoLfUqXFlcoNx1Oae85JVvQnsRhb0x3YAZQ=; b=d14rpLckMF6wUXouiWLwM26p5G
	rsDTxAnOcXZPsI1DRchITI7/um6JrCn3b7i+KgnlsSyW5EESkEg02/mxvcw+A0fP7ivtXG7zlT94b
	qEmFmouQnXJefoFFbPtaphlMMsxvT4v2KmXebNsMP5bm8JJJOr6U2fGRyUGpEOM8zG26XEisiaaB4
	l4xd7tad+ewJAyEgoiPYgNj7vXLgi3SRpY+oy1FUPl/3s2UyTjf6D4B2sHGkHXG335ZSmKW/B973n
	Dx+X7I25uiKhWVa1TyYXqvX/EPdY/craSWlnP6iWVqMJrhVvlSJOA2uhRhh6GNhO6g8ilMYH0YSYY
	RwEzPREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CO4-00000002aZd-3l3v;
	Tue, 07 Oct 2025 18:26:12 +0000
Received: from mail-vk1-xa62.google.com ([2607:f8b0:4864:20::a62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CO1-00000002aYd-0qaP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:26:11 +0000
Received: by mail-vk1-xa62.google.com with SMTP id 71dfb90a1353d-54a7bf06edfso4422785e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759861568; x=1760466368;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6g+XCuA2ZoLfUqXFlcoNx1Oae85JVvQnsRhb0x3YAZQ=;
        b=SN2qzLfVOhmKBMsJhRS3U6UIkQS4s3+GWv70tbDynm/z6nKKij6bJYcBHPiwfq+Goh
         2PyfbZ04fyI6fI505bOId5woZVH0bavKb3F9HiBYyFrHdhUABJlb3wa35M+9xSguvqpd
         ieKUFcFKAdPsU2YuhCwuD51siHMeCYl4zsdl5Kz7WPS2gbcEpn9cSM3qDNhgfx5GnywM
         igpYB8jdXYiT3IauODmrmpx5koWSv7D7QunJwsn7sSVknNu0pTa8YU3c1uW7+uD+Jpcp
         wXxGM4HZmXi9MHsvKV/e2PqFvZzPS9b0IZgGTiQLhNr6JqU5hg4o4TuDvWB5u3HKF7Jm
         PJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCW8Cu5RzG/RPugDyngcBIwb3wVco3a8ljo9Oo7nY0xnCqutfTvrFK6ABUg6u1qOp1Kxz0LsyjxQyrpJ+V5QHDXq@lists.infradead.org
X-Gm-Message-State: AOJu0YzTc4r8ZVFK3taUEMvU9ma4SCMeuDOiE64obaAv18U9RJCN9Swj
	JTdlp30uCd+NuZHUcmurFyGFtLTROs9qlXm7/ODAzF0/qMMVm3FbL+KsdM78g6qg7FRpo9/sUOB
	IBkcGQDXqtSRahkN02KRRghcJGTIe/ZadEDyUxTEThjmrKW2k8HeuPw+Tls7yE2h5/Kx6d6SNq+
	Ob1J4IDbMqdGffZHizTqDJbhWd96YCGbY9qnK7Xf7LFAPft3gNlBb72lGCpybB2quHHJkQbPZrw
	LjyB1rtke1pWvEMA1k6yoNK3j91uUZm2ts=
X-Gm-Gg: ASbGncvNsnJGCtD6Ywm/qaSmXtpqmdnxRUmhgJ0X6ZodJPmvBtOt6o0T6FTahab6JAv
	gjCMbF7Jk+dpgRoyV5LhFwhN1iisg492yPI/SXtp1uaRDyu7FqOvRUlskgviLflmKfj493lwEvI
	kO9iU9WbcdS0R2KeyhG4PPXAOdpin9jDyYaCJgHUtireDcrsxZGqiiwjBRKbqLwvYXzr0NrApRJ
	/ndeE6b3NB+Qkv6bd0BEA2w4Y1TPjTefBMtt+r3zSpMp+Bg/9CpR6TZd5sE2tabu1fvVmNec1op
	gYolWgb+iGPffMThCxUk7CZdwTEB3bBw4el1JFt0rGCYKfI5sO4xRHlAmG5/M3cY6Vlz7il/Egr
	Si8ubhEcsQ8QPsaG/VeY71d4lAhfD39i+Ye8+oH/DqHqg7WiD2fG/tkPFa/5SwxP/kaGNUaRfY3
	oaGKH9rP4kq7Er
X-Google-Smtp-Source: AGHT+IG1wujW7JXiq+K33BTyz+Gcuzajenj7atswmSS08jtXvaRU1237rIV8fGyi3ivz+aEdOVwv3CI52ACG
X-Received: by 2002:a05:6122:6597:b0:54a:9fc0:40ab with SMTP id 71dfb90a1353d-554b8a82a0bmr342939e0c.2.1759861567881;
        Tue, 07 Oct 2025 11:26:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-126.dlp.protect.broadcom.com. [144.49.247.126])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5523cf13fbesm1706495e0c.1.2025.10.07.11.26.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Oct 2025 11:26:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26983c4d708so56935075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759861567; x=1760466367; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6g+XCuA2ZoLfUqXFlcoNx1Oae85JVvQnsRhb0x3YAZQ=;
        b=KABXE4LYmAo7mggd8utITEzNaeXQVN0hAr7HtKZz5TH1yhL9hXYqkqkBvmUqH38y8U
         SLewxYOhNmE2d4KYVBQuNE+Hnu5VkJSlZpYNWqtKFsh55drJz3ZKNp3ZV5PbSQeFRJgY
         k93UW1h/AkOxfZjcYtkzYFfCS/vfsVFukKFbE=
X-Forwarded-Encrypted: i=1; AJvYcCUktjQRO9dYzLHsVHqMEJxdo2xFKT/V38BgBqblV04BsVYAgIrsrQVTHMIVrbsSWm/moHQnAywiBu+pPcCjkjcS@lists.infradead.org
X-Received: by 2002:a17:903:37c7:b0:27c:3a0f:f066 with SMTP id d9443c01a7336-290272af173mr6676845ad.22.1759861566815;
        Tue, 07 Oct 2025 11:26:06 -0700 (PDT)
X-Received: by 2002:a17:903:37c7:b0:27c:3a0f:f066 with SMTP id d9443c01a7336-290272af173mr6676655ad.22.1759861566388;
        Tue, 07 Oct 2025 11:26:06 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d564csm171830275ad.98.2025.10.07.11.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 11:26:04 -0700 (PDT)
Message-ID: <69e38689-4779-49df-9ec4-e26391493e72@broadcom.com>
Date: Tue, 7 Oct 2025 11:26:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: Enable RNG
To: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250927075643.716179-1-pbrobinson@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20250927075643.716179-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_112609_247572_4F49DB07 
X-CRM114-Status: GOOD (  10.61  )
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



On 9/27/2025 12:56 AM, Peter Robinson wrote:
> The RNG is the same IP as in the bcm2711 so add the
> device tree block to enable the device.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Applied to 
https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
-- 
Florian



