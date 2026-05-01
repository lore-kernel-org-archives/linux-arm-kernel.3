Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713ABCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 22:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JiJdMx+KJquXdLD9tyzm4VKNrHA4z52kt6wPCreDaY=; b=UO6ZR7L0sElRJh1oSZMVT/SS/a
	tGvQDhKhYJ+OHlyDz7OElCLCeH/Dy8SNobtsJSmc0z6x6lCbY/PUKFFlxZShl3BapjSbLC3kSTgwl
	8rnJaGJl9XVo46l16FaU8j6aZfrd/7iBjIwTWcjvANa4INS3woeAxeNavvwrSZC5JfHyTwW4SG0Ze
	Ibdo5Bkce7GsFeDk509TgVC7gBOgJYsH4lzzpltx8piUqhuSagZPWFl4dMIWJUveUkCqLB+SW6PnF
	sdp8FVVzFfhWGpYPYLs876kK381fxqyxM6hZDnovwD54VcueJwL/lyMi6N+EW/ZJMWjmSjRCvqYPb
	oFD+NMtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvyx-00000007jsJ-2O9M;
	Fri, 01 May 2026 22:05:11 +0000
Received: from mail-yw1-x1163.google.com ([2607:f8b0:4864:20::1163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIvyu-00000007jrL-40Ta
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 22:05:10 +0000
Received: by mail-yw1-x1163.google.com with SMTP id 00721157ae682-7b23713eac9so25927957b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 15:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777673107; x=1778277907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0JiJdMx+KJquXdLD9tyzm4VKNrHA4z52kt6wPCreDaY=;
        b=rONoR1yJeT8LLspRCLeP/hRvniDVpxjkF/7eeSVL5yT136NxKQSlubodgEl1QxdW59
         qWoQXbabUhmyd5FXc/M7xvS/BpKunV+RU+Yqk22iPYIBnl0wJAMJ6h6sbS0GYMEwvzPQ
         keHcXBSEdQdsa8p1e1Nlc4T75RyI4cZKPARo2C1Pc99PXUGLkjvKeKH+zxbSjlZg08VJ
         4baKe9NYnK2R09HvQA39YuQKtpYVlWH+monB+aYxcBBH60AnDlmGsnzlQbsn99wElZJ7
         vU/CmRGfimmBMLcq+MVmT2c1BCxOH3kt5GvYrpFjGm4/6P63eyIi503sc+khtUCAH4rh
         1BsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TRoRWiujLLn2uuZA4pRDHFu7n1vnwq8UDjSYclEkwI8BlzXPilZ/dR9aKhxQDO34SsyldE0lMPaG0Lglpl8ri@lists.infradead.org
X-Gm-Message-State: AOJu0YyJRNocQvw9/RvihBv6kQ9vqJbPaRe2fslpsajg+//NARRABsmg
	QJojvGDsF1fxVVGD7Mf2drGTpViUpewGS9nzjoosmrvt2UEPPZUBCUXf8NqFeeKVe24+LwJgBw0
	CNSAdntP1MbO9rygK8lKiRhQ2+f7/WGLmF1hbAT3TsdZAu6WcblIiP7xMqlF557+P0Vc3f87wR9
	zvaxl+pcdZxCNG4MlSHwKDyFzub+evZz2IeRs13wOdA9JN+l+/aSUa2Hj1gSfI7hlKphosNxMTp
	34MYYntkqL85MMoUsEhQOAX5K/pF3eAvfQ=
X-Gm-Gg: AeBDieujtKBFu5TIRfcWhguDDrThr1ODJ6BmSfcFSKd4sjyZFJ/M/UPvFqh6SLZdZ6k
	fU0I86CyG+tgwbOKrIfstYWEigxXJWyAwCIfIBWnmcQ7VkYz9GRLvbvzJrX560/i+5vWg5wOW+g
	Y0/7Sze5XEqu+eW/ZiIG7aKso9XhIPnP+gd9h+R3LhxPXmNamD0aF4/Nd/V9VSth00QMSoDGY/u
	5kdZlsVbblzLWiiS7y6aLqFWoD1UbiGNOW51hNfFCRy66gjpaZxGawTjXjABR3Y7k8dTMMUkJeG
	/OSiMlOX9z+aYt8W6gweVa+zgp1z2c1r4L7XRDS0DyigFUXz0YVPoys1wzp+bOZh5d8vEEJEr5+
	uKyctWGzsom6fe7DAYuUOz33sk//PjLwi5dG33omO7p7hFzEbhq42sjRR57TGkU5yq0aKoymtc0
	UI0kZhnVyeGAvFbaxRkYRPdxOgFPHC6pttRUXzok8nRpe1Woe5LLpDTqK3YiE4b+dwBXWT6m2A
X-Received: by 2002:a05:690c:3393:b0:7b4:31cc:376d with SMTP id 00721157ae682-7bd77109d6amr12528087b3.39.1777673107230;
        Fri, 01 May 2026 15:05:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7bd66804bf9sm2189947b3.15.2026.05.01.15.05.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 May 2026 15:05:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so58201811cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 15:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777673106; x=1778277906; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0JiJdMx+KJquXdLD9tyzm4VKNrHA4z52kt6wPCreDaY=;
        b=RotbJ/y2V43RBWb8mVRa5UHo3rd3UcOFx3ZQYOv30X35GMeLhj3iU3RaFVftRNdGTs
         6Jz2vozZNvvTPj+0TINquGXZXC/USU/aufBLy7Of2YTzr3GbKwAAdBqunRkydlSbC8zi
         gjFLUXJAl/U1x6xD20omszmgJL6XBUAogTFAw=
X-Forwarded-Encrypted: i=1; AFNElJ8eQn0ZHPAZFxqABNx8SlVMKaZbgsj+veEe564TspzK6aZieBI42J/4SRyT2GFkwWrOaTLk2nWFXKNUgrzjQbbR@lists.infradead.org
X-Received: by 2002:ac8:57c9:0:b0:50f:b17d:7e53 with SMTP id d75a77b69052e-5104bf6baeamr15609491cf.47.1777673106394;
        Fri, 01 May 2026 15:05:06 -0700 (PDT)
X-Received: by 2002:ac8:57c9:0:b0:50f:b17d:7e53 with SMTP id d75a77b69052e-5104bf6baeamr15608871cf.47.1777673105862;
        Fri, 01 May 2026 15:05:05 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b5e8b4sm29282711cf.23.2026.05.01.15.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 15:05:04 -0700 (PDT)
Message-ID: <ef1c9256-7fed-4476-bf84-9dc46bca2232@broadcom.com>
Date: Fri, 1 May 2026 15:05:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: brcmstb: Assign pcie->gen from pcie_get_link_speed()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, Jim Quinlan <jim2101024@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Hans Zhang <18255117159@163.com>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260501220359.GA522578@bhelgaas>
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
In-Reply-To: <20260501220359.GA522578@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_150508_999071_FE6A9851 
X-CRM114-Status: GOOD (  10.55  )
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

On 5/1/26 15:03, Bjorn Helgaas wrote:
> On Fri, May 01, 2026 at 01:24:38PM -0700, Florian Fainelli wrote:
>> After commit 03f920936977 ("PCI: controller: Validate max-link-speed"),
>> pcie->gen stopped being assigned and as a result the established PCIe
>> link would stop supporting Gen3 speeds on 2712 since pcie->gen is used
>> to populate LnkCntl2 and LnkCap in brcm_pcie_set_gen().
>>
>> Link: https://github.com/raspberrypi/linux/issues/7343
>> Reported-by: Dom Cobley <popcornmix@gmail.com>
>> Reported-by: Phil Elwell <phil@raspberrypi.com>
>> Fixes: 03f920936977 ("PCI: controller: Validate max-link-speed")
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> Applied to pci/for-linus for v7.1, thanks, and sorry for the breakage.

I reviewed the original change and completely missed that, so no 
worries, the fault is mine to have missed it in the first place. Thanks 
for fast tracking this!
-- 
Florian

