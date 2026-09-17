Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531D8C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxPZVE1iSWk/YnSJluT38WV/TFUzwOd3jUqgVOgD/J4=; b=jjXJ+dUriQbaUONyk7qoMrAsYP
	S2HE8q0gsHeVPELkD0Dvx/TymSk+6p6r/2MaC1pXTpdfs+f82iztn8/hj2fAxfnfYqbboaF7Dalji
	rBBDI85MQdtAjmyzWW3dV3nk3J9wsmPdgmUFLSctwwRmUlQF87NxqgyQ56RkfD8EUf1pa2t0vmXrw
	pEmBiyJuJbktE7/wRqWJoIQpUF0fRoaY+zpCfPe2FKCI5iKibLq0nxeydG3r1qbEB0bVftUKEYwdn
	qYdCvUHC7JSt4PtnInMOC+vKOv55AZVgRpLpKIwBuz4gZDT4QSevaePMBgkPlTbdm8HZ0qH2H8Jbp
	j6EXDfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FUr-0000000C1kj-2i2G;
	Thu, 17 Sep 2026 17:02:05 +0000
Received: from mail-pf1-x462.google.com ([2607:f8b0:4864:20::462])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FUo-0000000C1jY-1ak7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:02:04 +0000
Received: by mail-pf1-x462.google.com with SMTP id d2e1a72fcca58-862815e2683so178209b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664521; x=1790269321;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gxPZVE1iSWk/YnSJluT38WV/TFUzwOd3jUqgVOgD/J4=;
        b=Huboy7dT/96mP9DPxxAVKmkfMvkcUMn4CS/n7IITiM0rASeFKqqGOebIkUvpSLW57j
         uY7ZVANNk8EAQnddDZZ/kFZpMQel9FKgnO7CVTHgHcEEnc1rUgQQKzrF4elzA27sm3s+
         cY6X/IFV9pKWvWWJo4UKrA9ApRPf0K5ghUlA0jLlOS8893iMfdcZ35FLnF+YRkj91/rj
         QdN7TkNq6BfNETgkUMfayBKyT1mwnkF64Ru7OnWEdCsaOQOPpKC3CSaUcPVA5agLRQBj
         SMWhoSZ6KyM4eraN2PdMbCVzOWYXn4T3Wz3g2W1ix9lcu5AHJKVrh83GNCnNQhukPQu/
         A81A==
X-Forwarded-Encrypted: i=1; AKwUvBwgNzgSRNiHaW6ewtC+s/Mt+v4JZVeh9BdY54x8pIOzou07g/ic7+fgSLDxKjljbwyNb1yymAvd+Y6e0AOjP51r@lists.infradead.org
X-Gm-Message-State: AFuF++mGWGe8kDITwGHx69q4+LwzmSmiYq5e24fsH3Gi09hapF9Tyl0m
	0l+yUo2I7PX1djyk8ljmJ9Q/R8FKyUgG4rVhWyw6fS3fN5xF1OHzzo+Uz8KwuEGRXShv8PdKVjp
	55z13KAwW7ej12Ais50P9fwCtlfgLdD3TZFHOL80wvM30nd89P+gH3Shi2+28ZgwKrexT8Za7RM
	du+SqfxZrXL2D7awiUQh6HAg700/q1kAyd+jZm44PzV+mBqwh4mzscFeG9TxIPJompJF6d8Hpq7
	/8K6RskOvtg6RiOtVaWzftOYPAD20WRdlw=
X-Gm-Gg: AYBFou0oO1GQiRS5OF5hdTGUxuXogyQeraE4eDABNmHlxkGopXCn6uCq3LpRyH668uL
	hzN0jUkSCguio+iTSN+c7Y8xe3kGDc5+keVnu5dDUs3CwL2wdNS6EtdoEPWmlT0Xx4TpgTmaxBS
	ouV0V48YolU2KjOV86LxAdvS6OmWeUnrzEfsH15h2CF2POqF/I5QuG/+n3u+n5/KI00I4MN6sz1
	Y1x7XK6yuzLpJoRzzU8X77XPo7JEabeBozd/kIQ+cxY7ApxAruWuhhtYEDfschW+28XL4XnExun
	7Cul5qEAWW6A/wI17RvpnDpKBeJXVByVT25ESbAiHuLZUNTG3TFHAY0aQ1liaIp37JQqhkBj2nL
	dEpOUUAyJ0x9gWmo3zEF15pvYTrMdAAuXX4c9MWdM9co0mBtwJqyIfd5PuB7wnkcp8JybFGKkk3
	X9IILJ3vK+i4IKPQOqHgm4v3/0AdNofA1mBYkdJwPv
X-Received: by 2002:a05:6a20:7349:b0:3d0:cc29:ff63 with SMTP id adf61e73a8af0-3dd5f4a85c9mr17102802637.12.1789664521247;
        Thu, 17 Sep 2026 10:02:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-98.dlp.protect.broadcom.com. [144.49.247.98])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc50ad01c80sm2785766a12.8.2026.09.17.10.02.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:02:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-87088f3b83dso1511306b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789664519; x=1790269319; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxPZVE1iSWk/YnSJluT38WV/TFUzwOd3jUqgVOgD/J4=;
        b=hBQ6tQ6xSbQm9s1VPXgwe3Jry+LbfjiuuP8SGxl5JlElc8kwZf2VO7Pf5crQNbyWPv
         RYxwanB4wdmJ8AWcbwz1lsKfnc2VWH4MLVpD/4vUfmGlyrMn/hvT+0A5W0EAPRl0uYFP
         +j+BUl1Hm2Oo3x+1OSZGGAk80GXfULKtFFq2Q=
X-Forwarded-Encrypted: i=1; AKwUvByQEV9ACQJkVphrFpH1D5GEErd9Wv+aOfnHtKzGdFN7glp1xIj/asziW0bMjgEfgbLpXGTwqwKP2MsYO1CMBVmn@lists.infradead.org
X-Received: by 2002:a05:6a00:bd0e:b0:868:e6d3:fc18 with SMTP id d2e1a72fcca58-8723878af11mr14585795b3a.15.1789664519370;
        Thu, 17 Sep 2026 10:01:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd0e:b0:868:e6d3:fc18 with SMTP id d2e1a72fcca58-8723878af11mr14585750b3a.15.1789664518960;
        Thu, 17 Sep 2026 10:01:58 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201735415sm3213840b3a.42.2026.09.17.10.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 10:01:58 -0700 (PDT)
Message-ID: <e8ea945c-97a9-40ce-be06-896a701d8ac9@broadcom.com>
Date: Thu, 17 Sep 2026 10:01:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] PCI: brcmstb: Declare and assign quirk
 EARLY_PERST_ASSERT
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-10-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-10-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_100202_417808_D23863C2 
X-CRM114-Status: UNSURE (   5.93  )
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

On 9/11/26 16:35, Jim Quinlan wrote:
> Declare and assign a quirk where PERST# must be asserted prior to an
> internal bus being turned on.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

