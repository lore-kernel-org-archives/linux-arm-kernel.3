Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D2606AB41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eQDmDdcI;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=K3yi/n+a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aQ9LiTLbh2uxFCSppkL9rHsktv+7lwK3tJuZ2euHX10=; b=eQDmDdcIkj5bs0
	Rb74oNOqe1E6jT2kiBTsoQNvwAgsb/rB7zzols3H+sD4N0OrmfJrcS6/qeFHN6A1cfo965ve1hOhC
	14jYOOUJ8fOMh/6bOm13AisUFfpxMgvpH02vrrtIaJP1zzGCfv86BliynYEIPR0VoQrQoYLE2ZzBL
	Hap5yXRJSjwJ+Lct39M6kAc4F2OeuhbrnihIX103N6EJge5e/7NLsIE+oMUtwsbaViWntZbKhYN21
	74J8CoTmBn5N/kcf4cNo3q/T5gALcLDolTCtnkikAM2fxTIR+rBVBxiCSzbOOJ/pDDmOsMV3iHJyA
	nHeA3lIOtGcP0y/pKq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwiJ-0000000EamZ-45Du;
	Thu, 22 Oct 2026 17:36:28 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwiG-0000000Eal3-2due
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:36:26 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so46387a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690583; x=1793295383;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aQ9LiTLbh2uxFCSppkL9rHsktv+7lwK3tJuZ2euHX10=;
        b=HUO239LiC415XmZAYn0OsAeBog2NzNBmNZnhinVvLayOhJxbNw6pgF3t37fcJD3C1V
         a9zy4i1XhEbFIhBMiL1oJcN047n4acN6NUUhoRyjn1s1JuR5+MiiGe0k38WOpGVPwwZQ
         AKuKwSRy+yKrzpOepwU8xVBWchJbxakLxvNhOgJoEqBm9UB0TewBhR6N4tOfRsIyBSuC
         Vy7VG1aHADAaQ8KVDEdS+ST9YxZcQyAvum42aoNoHlgybnSYBErhb/pSu3MPx1ZyJJZc
         x9D7PHotfUxJ0H2jP4OMJ2XhGYdPHPuxJEiZNhUOGDzHfNBi3QTtbwpL4kbBFJd3Hquh
         Kbhg==
X-Forwarded-Encrypted: i=1; AKwUvBzGtSAVHHvHWA7wp1DayuQH4BwN9/cWOA1FG+UeykftW8/RwK2Mqst19HdOr6ez8l/rw4ZLhnmphJ6m+DQs0Q7L@lists.infradead.org
X-Gm-Message-State: AFq9FYJTFUx0P/6c5B3b2mNzWVwldL6t1DIfet9UwVIzrGWo6hXvGEOQ
	myRiwXuL36/bnFYdPPFHsuQ/Vcb8HTbCAOogdkq2Xm3hnQPQi15Ttsak2iWe12wBgabdIFXiq4D
	cpEjF4zpDIPMT2E8SWj0/uUv0vEdMp1+/Qoh109ddWyPSLUsormFl3Uhplq5T25I3NmLRtxP4YF
	qv88uMlr6mHALtaTJvIfqYoVwUd1DsdwtawTTBzQiYVFKwvq5U//Ubo6RzWzy04Mio9+XclKtf4
	yEKwHKXHyWhVMJKTgM5Zbfx9qdQQg9/rF0=
X-Gm-Gg: AYBFou2yr6RGWEzCW9+Lse4awXlHSpUd0D5qc6cxGMBm6oSON2h9z+kfOO8GylNFayc
	x51+q5S7P2L4A6+5gMcwt8L54J+PZ8ltc3tpC1LG7rIq+vkJHZT9njlyKtfxzl279bGzeGmSxUy
	6J2RwPvimGfJJbn49i1T93WgfB6kdvz2/zPlsbBFy6BGx4vhFVpEfOehmLquBxPhT/8l5BjlYHB
	UMbAUD2MsB/nJgo+EN1FQfksVDPAW40a/4hqow9gbHYsOE2xoYPxru8w01YWisozUL4OCVIF+nK
	ecK/37lRkTB757dhmSkB5g7hGuM34F3BeuFN4UBdBDEjuNCfclaJT8qLnpNLLaBTODURV6np9b+
	eSPArCjK/M+OPwfmFt3eMosh43tDGNcPFqnVnHyyVpbHWEXoTnT8MrBc2/ncCeQ+Jk9lpYDNVDj
	Kw08OqyPfmu5tOS0fLgen2pbp2NaCWc3RzNHzTCTgIYWw=
X-Received: by 2002:a17:90b:4b03:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ad86e9eb76mr4935800a91.14.1792690582511;
        Thu, 22 Oct 2026 10:36:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ada47f18a2sm2417478a91.0.2026.10.22.10.36.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:36:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88c768886a6so83402b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792690580; x=1793295380; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQ9LiTLbh2uxFCSppkL9rHsktv+7lwK3tJuZ2euHX10=;
        b=K3yi/n+axFqO8GygHFn/J4B79jPrg8I6ujGN1RXuZ0dpGDZy29jhkDpO0nUgSX2sZC
         ZWU9a4ywz2agzjyuaHdpXEi+Aza3Fcyob+2H/bXPaj84BJBO92UBdRVcgYjyF8KBl2YO
         nLNd+Q7BihMRN2ycqRtdo2rxIlHmW4yZnfRZE=
X-Forwarded-Encrypted: i=1; AKwUvByAm81EfJc1B1rooJZUYDdSsUO8/s85E7DN3arFifOX8+imzNmrplOwnn0XWOe8h8iKC3exKGziyhJFLypcXRK2@lists.infradead.org
X-Received: by 2002:a05:6a00:2d16:b0:89f:7ac5:9d54 with SMTP id d2e1a72fcca58-8a089d0736amr5427165b3a.17.1792690580592;
        Thu, 22 Oct 2026 10:36:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d16:b0:89f:7ac5:9d54 with SMTP id d2e1a72fcca58-8a089d0736amr5427131b3a.17.1792690580106;
        Thu, 22 Oct 2026 10:36:20 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b4292sm2389220b3a.20.2026.10.22.10.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:36:19 -0700 (PDT)
Message-ID: <84bf86db-618b-4387-bef7-5cc02078c99e@broadcom.com>
Date: Thu, 22 Oct 2026 10:36:17 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ata: ahci_brcm: Initialize the NSP interface clock
 and reset
To: Damien Le Moal <dlemoal@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261021165555.652102-1-florian.fainelli@broadcom.com>
 <20261021165555.652102-4-florian.fainelli@broadcom.com>
 <79a81f1d-2964-4b2a-80d1-64e01c202468@kernel.org>
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
In-Reply-To: <79a81f1d-2964-4b2a-80d1-64e01c202468@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_103624_688753_60857CB3 
X-CRM114-Status: GOOD (  22.52  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 23:50, Damien Le Moal wrote:
> On 2026/10/21 18:55, Florian Fainelli wrote:
>> The NSP probe path assumes firmware has enabled the SATA IDM interface
>> clock and released the core reset. The downstream iProc config_AHCI()
>> sequence explicitly performs both operations before accessing AHCI.
>> Without that setup, a cold boot can access an inactive controller.
>>
>> Map the optional NSP IDM register region and enable the interface clock
>> before releasing reset, retaining the downstream settling intervals.
>> Perform the sequence at probe and resume before reconfiguring SATA.
>>
>> Keep the resource optional so older device trees continue to rely on
>> firmware initialization.
>>
>> Fixes: 3ee2e6dcaa35 ("ata: ahci_brcm: Add support for Broadcom NSP SoC")
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   drivers/ata/ahci_brcm.c | 34 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
>> index 29be74fedcf0..2ed60806b671 100644
>> --- a/drivers/ata/ahci_brcm.c
>> +++ b/drivers/ata/ahci_brcm.c
>> @@ -6,7 +6,9 @@
>>    */
>>   
>>   #include <linux/ahci_platform.h>
>> +#include <linux/bcma/bcma_regs.h>
>>   #include <linux/compiler.h>
>> +#include <linux/delay.h>
>>   #include <linux/device.h>
>>   #include <linux/init.h>
>>   #include <linux/interrupt.h>
>> @@ -83,6 +85,7 @@ enum brcm_ahci_quirks {
>>   struct brcm_ahci_priv {
>>   	struct device *dev;
>>   	void __iomem *top_ctrl;
>> +	void __iomem *idm;
>>   	u32 port_mask;
>>   	u32 quirks;
>>   	enum brcm_ahci_version version;
>> @@ -230,6 +233,25 @@ static u32 brcm_ahci_get_portmask(struct ahci_host_priv *hpriv,
>>   	return impl;
>>   }
>>   
>> +static void brcm_sata_init_idm(struct brcm_ahci_priv *priv)
>> +{
>> +	u32 data;
>> +
>> +	if (!priv->idm)
>> +		return;
>> +
>> +	/* Enable the interface clock before taking the SATA core out of reset. */
> 
> Long line. Please split before 80 chars.
> 
>> +	data = readl(priv->idm + BCMA_IOCTL);
>> +	writel(data | BCMA_IOCTL_CLK, priv->idm + BCMA_IOCTL);
>> +	readl(priv->idm + BCMA_IOCTL);
>> +	usleep_range(1000, 2000);
>> +
>> +	data = readl(priv->idm + BCMA_RESET_CTL);
>> +	writel(data & ~BCMA_RESET_CTL_RESET, priv->idm + BCMA_RESET_CTL);
>> +	readl(priv->idm + BCMA_RESET_CTL);
>> +	usleep_range(1000, 2000);
>> +}
>> +
>>   static void brcm_sata_init(struct brcm_ahci_priv *priv)
>>   {
>>   	void __iomem *ctrl = priv->top_ctrl + SATA_TOP_CTRL_BUS_CTRL;
>> @@ -369,6 +391,8 @@ static int __maybe_unused brcm_ahci_resume(struct device *dev)
>>   	struct brcm_ahci_priv *priv = hpriv->plat_data;
>>   	int ret = 0;
>>   
>> +	brcm_sata_init_idm(priv);
>> +
>>   	ret = reset_control_deassert(priv->rcdev_ahci);
>>   	if (ret)
>>   		return ret;
>> @@ -453,6 +477,14 @@ static int brcm_ahci_probe(struct platform_device *pdev)
>>   	priv->version = (unsigned long)of_id->data;
>>   	priv->dev = dev;
>>   
>> +	/* Older NSP device trees rely on firmware to initialize the IDM. */
>> +	if (priv->version == BRCM_SATA_NSP &&
>> +	    platform_get_resource_byname(pdev, IORESOURCE_MEM, "idm")) {
>> +		priv->idm = devm_platform_ioremap_resource_byname(pdev, "idm");
>> +		if (IS_ERR(priv->idm))
>> +			return PTR_ERR(priv->idm);
>> +	}
>> +
>>   	priv->top_ctrl = devm_platform_ioremap_resource_byname(pdev, "top-ctrl");
>>   	if (IS_ERR(priv->top_ctrl))
>>   		return PTR_ERR(priv->top_ctrl);
>> @@ -493,6 +525,8 @@ static int brcm_ahci_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	brcm_sata_init_idm(priv);
> 
> Here, this is called *before* the clocks are enabled, but in brcm_ahci_resume(),
> brcm_sata_init() -> brcm_sata_init_idm(() is called *after* the clocks are
> enabled. Does this matter?

The NSP platform does not support suspend/resume but the consistency 
should be preserved, logically this should be just like during 
initialization, thanks!
-- 
Florian

