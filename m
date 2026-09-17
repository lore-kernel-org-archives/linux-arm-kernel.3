Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D73EC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 00:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnYsw47RhsCpAUpS/1U4sBUyj70+B1dKJy3nD1W6Sig=; b=MEN0BJcpkQAUFsD47WwwOQVVBO
	vATjHjFuvxXqh2UEf4Ep0nVJochFGXMqLE9xtgCwoCtsBiUEyKyhZbGh8OXfg/jx55CfZZe4w8ac0
	sHCnchQ0agDmKTBMplTm78vEptgi8NL4Hxgtex1m8kmGJGb1H3ONkhSYQCFPGgon9LkcsytuZaPa4
	28Wjj6UJnz0JBdWDyS3uPYYteOy5SrDbrkkLUEpA9eXzZL5eZZMi3RnZ94aZQF9Z1lrM4u6M/CLW0
	HeUThxpaSh6YqP3gXa3zt/EUp5ULMr1CUglDL2oVDuV3v/DpSecrBpH7OV9X1pnVgGNiOsHXvLAHq
	ePe2LZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zZg-0000000AIcC-0S8E;
	Thu, 17 Sep 2026 00:02:00 +0000
Received: from mail-qv1-xf62.google.com ([2607:f8b0:4864:20::f62])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zZV-0000000AIYc-2T4h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 00:01:51 +0000
Received: by mail-qv1-xf62.google.com with SMTP id 6a1803df08f44-90ccb6102a1so599496d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603308; x=1790208108;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rnYsw47RhsCpAUpS/1U4sBUyj70+B1dKJy3nD1W6Sig=;
        b=gP5YHSnNZddAg6fDVaLi58GF4/uiI4sMlI4ZdPZt/SAp7nUwo36UqzhvTPrwhRwIDm
         kZetik4ATFPpvc7Wobw2r6ebNTt1f4uCzUpI/uzyFVUNUn1sMy1L8tLtNw9C2vhr5hbv
         cjhupElRaSvWItF3NrX5jWSEXlQnDy6I1AqrJbpm8kt2j88OcaKhnmZGoTX8NlHaI/1G
         7jVx+XQzZxKSYw0Ytbz/tnxW4qQIKGtAqYe5Sob8x6nmJNTU1pxWeyJFF/HiwTnihx+c
         DJ9r4zu28v54JIw1vzFGpRN03kQfK+UGyBmRyhU8eSWFo7MkrSd40faJzQOXKmGhA1rE
         Zc0A==
X-Forwarded-Encrypted: i=1; AKwUvBzwakxEDIUtEp0+Zki3KAvS940WXhXPKCOoRRUnIN1KHlb8FAle2tTcGEYNmkJNzLlHRRF/iUXNiPI3gJDdmbXV@lists.infradead.org
X-Gm-Message-State: AFuF++lOM91CXE8QjpqevwCgSTZdeqdnTWYElMb1QWKtjxekiJCt/7fB
	GlSahrc/7zhkzPYB7FxamjQ2ssJ0CKOrMIMk+/fvdP/gpPRpjrypBtYy6MwhxKzePDRVZHWGVgG
	oYibmEs6mFpW8ojJu8BjVXmDmY9wKEqtKuNPq4IiZXQrC6IlggF9MBidu4L55jUD0yaJTCiBffc
	BuxyAZ81iQ+iFKCvWuHfxMM5y8dJ0S7IaQqrAxwRJX3XcXl8tyNQ+Vcu1goZfYsohu3Wrjaz+g1
	FqRg+3kE7elraGqzUSaniipHjZMeo8SYyc=
X-Gm-Gg: AYBFou1RQoYe3MAOjcLJJlNWiZeZqn28khYOrbsnOEnSDJOSBp06+nmoCV4pGrITv1O
	yXcGCIUvq100oyey8/H91hGTG3ZwfDwtI1LGhSKlx+KT/eqeeAIAwxzWowF88ONllVtSqDCcYs5
	uBJR2Wt/yVw6NyVW5QsPxtO8HO7D3WM+OEBgs6OW0p/dCIpdXjcOcdFaSUyzdBnP7JlQXdKaQ+b
	a+EEEtuRXxu2lQdIhszv9dgSxDX+85BWQOSuN4i2duFjMuV5DxGZ5W48TNeN9gxn2hmjuTKsKIf
	g25M9bsuijNla02ZoMRihSBrs2mAfBZHiMDRB9Bjei0wKZ8A9CJgJW7KuMoKk0laVf5xY/bxFMk
	FQhu/J2q8Lh48MfJIuQg5l5vVfLVsIsEvKgCfnVdgVgXrOKWcyHX+0DJo5Gr90g9x3ONMMgBzVU
	51UDh/Zme/4LYk4Od4MF0hqQy5zN22zYF1JDAunRUx
X-Received: by 2002:a05:6a21:3986:b0:3c3:8d86:9855 with SMTP id adf61e73a8af0-3dd5f454cc0mr10508405637.7.1789603255294;
        Wed, 16 Sep 2026 17:00:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc50abc1222sm1943406a12.3.2026.09.16.17.00.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:00:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso346803a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603253; x=1790208053; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnYsw47RhsCpAUpS/1U4sBUyj70+B1dKJy3nD1W6Sig=;
        b=dy+6UIjCXImnuWPDL66XhbKozUFkCw0IB7L8AqPn3sd1bXn1TJyHDDAukv2snOLQ6p
         3Wg1YvMmL/zf/i29dHYpRSFyucW0DphSPhNCc6G8CMeQ5KPLzb4r2jjyDHUpn1qrQ5p1
         SXGaGl2pYJKvTnkBnQAvlsSOG9tmMkVJ0jOlE=
X-Forwarded-Encrypted: i=1; AKwUvByPz/ouEKVS5EopM4bviJPy9jjXwj58eyjREQTDeBaWb6fKmHLL2GnLPVGOi/HFpVuN/S8b94hjt2sgOL/87byN@lists.infradead.org
X-Received: by 2002:a17:90b:510a:b0:39e:423:bb8f with SMTP id 98e67ed59e1d1-39e1e24fa7amr14368862a91.1.1789603253334;
        Wed, 16 Sep 2026 17:00:53 -0700 (PDT)
X-Received: by 2002:a17:90b:510a:b0:39e:423:bb8f with SMTP id 98e67ed59e1d1-39e1e24fa7amr14368771a91.1.1789603252848;
        Wed, 16 Sep 2026 17:00:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm21263234eec.23.2026.09.16.17.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:00:52 -0700 (PDT)
Message-ID: <f93d3063-956b-432d-a106-7b0e092d8ef5@broadcom.com>
Date: Wed, 16 Sep 2026 17:00:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] PCI: brcmstb: Add Broadcom quirks macro
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
 <20260911233541.1650895-4-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-4-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_170149_632796_8F50A902 
X-CRM114-Status: UNSURE (   6.49  )
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
> Introduce a 'BQUIRK()' macro to shorten the calculation of a specific
> quirk's value.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

