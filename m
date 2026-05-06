Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C600CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 18:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc35fNzFyPuxuc/CBMONA9M+RTBFlJ+zPVDNxFCN7Y4=; b=2WKz9X2yOzpIuUWuayRBZsBxwD
	Ocd4ZjkUrgG1C2lvCMuuaaOrv+11FN9drDM7IEN3nQTFsG4Fo70mviEVY8fVKNfPZGnveUJQCLQ6Y
	6EbhYYzWgEF8vDmacwGtfCpxk4/IlMuWDOD5f3YcB3CsV/tXeq9J32HBta/d2sUHS9vmGfaTr1WhW
	DFcMBEqktLmSXyQuvE2XVARuBVbBVZhhatV+rE3WhYGlMSl3G3ixWLUIMNGZy6ezjH9LThQoblrOX
	YFSIZYcHEma+dZ2/6DosrhrGeiYsEgA67186TqcdjX2bIr95bujTj5HjVc6GlzXaPjZKjIfyBPvde
	Y/91A0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgmu-00000001kQr-0izE;
	Wed, 06 May 2026 18:16:00 +0000
Received: from mail-oa1-x63.google.com ([2001:4860:4864:20::63])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgms-00000001kPJ-3YIR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 18:15:58 +0000
Received: by mail-oa1-x63.google.com with SMTP id 586e51a60fabf-42ff0576868so3142000fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 11:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091355; x=1778696155;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tc35fNzFyPuxuc/CBMONA9M+RTBFlJ+zPVDNxFCN7Y4=;
        b=a5CnKSJf8D+QYoFd66+bckBhY6IPxD6Z4qZhGeiDbFP3Jd9KZ6bRcpET5PDKNKh16j
         0ZklWTk+jVFqdB3LGv3TiYb03bAC/4FOSnf2jGoFBEJ8rLlHITfxxDT9/yRoNRSD8wMq
         pEoiA4CQ4uS4DZJB9NcF8PwR3kAayYyHRylHsyauzjw/Oj6F133LhyxgC/fmTiNxvU3p
         +ZtKz5pYy057QIG4IMhCdGg4BQr9EZyWf9Eqz/4kbONpAPe1E/rLFYGhB6uT78pmzXgS
         JHZGLcWt8vHteSbFpJ8XNL6/qHlc0+sh1xEgQdV3YEW3F4xbcWHPCQ7Dso9Uf7vN0bob
         Jydg==
X-Forwarded-Encrypted: i=1; AFNElJ97oOPtRNEIymws0qG3iDkL7gpbPxvc8+RX4JTrrhKBEAQDOl5QvOhZe5THTxsyjsud0okdlPD7WS4BC6GLdHKq@lists.infradead.org
X-Gm-Message-State: AOJu0YzLHakjOFh0NQEdaY4TIyJZjuogn66CvKt6ziqp/Oo4BSiRe03A
	Gxe50CBNXk5p8oKL2zwpIn+D95POIM/uYlo/TcU1ldsEUn2/5Rl4p8E8plNzJJPeG4u+DEr6zv5
	v2BMoacSK3yznH6Wv95HQgOW9XXSivvIEIUi1fozxfzGRNCav9g9+5dVj5Zoj22nlhKfhmVoNwO
	flm7XETm7RCqWCYU9bLjuuA/r5Dp+2dFd+tqQOQXIjSPXJpI4sDAV6eaMT4wfzd1WqTUziLgNn7
	YuzhspxH6iZ8judZMmRV6BDe7Kfo68uJ4Y=
X-Gm-Gg: AeBDietqoZizcC8AZTV8RCcrE7Ctw90XjcLnJe6+pHcTvq+R6yUP+SiqA3Qflh+5cz7
	6nGZg5ds74l8FFELKwkkUJqHMT5q8/sa3cRckd52Va6inGLs9AXMHC+NsyyRLlOwfhxVASYyiUI
	kKNcE9yCHC7WfEkPZYInFhqrqbI9qq7JduY0ZMFTw2mhG3wBod8EHo7kRuZ7tJ+BH2GpCC+AtJF
	LDBJsWXq/quoB9eGAp40BuW/ZrBOXuHB6j6Rw1g4CdLgMf+pWHUaM5CMu79IpIXoqCVZ8EKhd9+
	6HclRSprHnMSnxXNJorvJvsR3gzElyylIbZDaKn3I1XLryl4W7HsE/fbcyOBtEyi3lO74GXZn+s
	DplqWKY8KBWVLKhiOe5jjq5A4seClSu2Bjp9dVNAnEvA259Xhgblj13p4+vsJMQIv5bctAZdSlY
	36rxPYR3/ylcIc7QMV/nUE2ioohGVMyO6vIYNY53C/2WSnXs0h3S+F77LwJ43zOKY+pHH9uDmU
X-Received: by 2002:a05:6871:8901:b0:42f:d09d:1fc9 with SMTP id 586e51a60fabf-434f66a2ddcmr3048789fac.32.1778091355380;
        Wed, 06 May 2026 11:15:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-434549340f8sm1423758fac.4.2026.05.06.11.15.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2026 11:15:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f485961555so5346952eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 11:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1778091354; x=1778696154; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tc35fNzFyPuxuc/CBMONA9M+RTBFlJ+zPVDNxFCN7Y4=;
        b=efvcx8NpmjIkf8CYzr0ZWPjldXDpyUhEL2h25O/cUzbidg4K1oRhKh24e6LYs8zYqH
         45fKZe9fZeGPOXOKVYFduNC7duZhu/FOBOb0J9VjLKw/IcTihmuoxUYEUMqwVZUodcXZ
         jOyeayR+YcFHVcq5U2fRDM2vF6dzX5+BOa09U=
X-Forwarded-Encrypted: i=1; AFNElJ80sx+7rv6c8yZlHYiOP9X+4qykSVw8tx/4KWdEeXSgtiZcfJYE1eFusQGmCDu1+MeWAhZzyQsTsLYP5nf3VFdC@lists.infradead.org
X-Received: by 2002:a05:7301:3d1a:b0:2dd:6937:79b8 with SMTP id 5a478bee46e88-2f548159736mr2514696eec.5.1778091353774;
        Wed, 06 May 2026 11:15:53 -0700 (PDT)
X-Received: by 2002:a05:7301:3d1a:b0:2dd:6937:79b8 with SMTP id 5a478bee46e88-2f548159736mr2514665eec.5.1778091353038;
        Wed, 06 May 2026 11:15:53 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f57038b0a1sm4262270eec.28.2026.05.06.11.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:15:52 -0700 (PDT)
Message-ID: <83ceeae6-20e8-40a5-bc0b-6231d2118b6e@broadcom.com>
Date: Wed, 6 May 2026 11:15:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI: brcmstb: Assign pcie->gen from
 of_pci_get_max_link_speed()
To: Manivannan Sadhasivam <mani@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-pci@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, Jim Quinlan <jim2101024@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Hans Zhang <18255117159@163.com>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <mid:20260501202438.376033-1-florian.fainelli@broadcom.com>
 <20260506164537.103196-1-florian.fainelli@broadcom.com>
 <t3u7r2ee6gdkjceula2ctvgditgxibwxcpaejc7ekbgdjog3br@c6n6ztzsbhpu>
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
In-Reply-To: <t3u7r2ee6gdkjceula2ctvgditgxibwxcpaejc7ekbgdjog3br@c6n6ztzsbhpu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_111558_939069_CAEDD646 
X-CRM114-Status: GOOD (  11.76  )
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

On 5/6/26 10:08, Manivannan Sadhasivam wrote:
> On Wed, May 06, 2026 at 09:45:37AM -0700, Florian Fainelli wrote:
>> After commit 03f920936977 ("PCI: controller: Validate max-link-speed"),
>> pcie->gen stopped being assigned and as a result the established PCIe
>> link would stop supporting Gen3 speeds on 2712 since pcie->gen is used
>> to populate LnkCntl2 and LnkCap in brcm_pcie_set_gen().
>>
>> Whether the 'max-link-speed' property is not specified, or it exceeds
>> Gen3, resort to the HW defaults.
>>
>> Link: https://github.com/raspberrypi/linux/issues/7343
>> Reported-by: Dom Cobley <popcornmix@gmail.com>
>> Reported-by: Phil Elwell <phil@raspberrypi.com>
>> Fixes: 03f920936977 ("PCI: controller: Validate max-link-speed")
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> Since this is a 7.1 material:
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks!

> 
>> Change-Id: Ic5431469dd7a6c8b391f84f27119dad876256880
> 
> This Change-Id is irrelevant to upstream.

Should I resubmit or can it be stripped while applying?
-- 
Florian


