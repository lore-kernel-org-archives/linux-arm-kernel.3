Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0453CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 18:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI+rhvxEBxqKNkYgkKodZ5I5aGcum/RfIbS5GB+RU9o=; b=VUz6v5n73VCgiwIbx6nuvu2ECl
	5DMWU3IdXJJy1AydcgQE4HKo5GesLO0mEYkiML3hg6pUT6OOlRX/KJ+qQx5OKmRimiy5s8969hi7D
	OI+cCcHMWJolc95Zgo9yAiDrEFJ6D1nJDKZxkHYXqxMUV1JOxuoVLL2z7VphDAG3684I9nFowI0rl
	3dpDs1zk5htHyHn+VICFNdZtH7/21WlE1PwXYeMzlHltyN3i3X2+1+KDDeuBIT6DifV2OdYJ5t47x
	CtZgTLzRP17BzLkBL8WzLzHQF6hp9KxX2s0dLjBspkrmVMFebHbA8Dr8dkPWhfk4zyK9in1JoeGsI
	AVKvaEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdcT-000000040Fv-2lIC;
	Wed, 22 Oct 2025 18:31:33 +0000
Received: from mail-yw1-x1163.google.com ([2607:f8b0:4864:20::1163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdcR-000000040Ek-0nx2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 18:31:32 +0000
Received: by mail-yw1-x1163.google.com with SMTP id 00721157ae682-783fa3af3bdso62855227b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 11:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761157889; x=1761762689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xI+rhvxEBxqKNkYgkKodZ5I5aGcum/RfIbS5GB+RU9o=;
        b=kFS4NtRAsbEwBumK2TBzXLYEcepxghGpneq83c57U63ynKYOZX+KR5OnQ8PQsgqhC2
         VG37u5xxh8ho6Tb1/801EG3Y0YkgHV5/4KfGxnoE4StilF1mtCLx1AflJgdClbwwjBG8
         3HGb3MRAvoI8nGPpeQlwXv2oJaspKL1MCKt/soOVVaFhUvXT1cCh+JTOOELy6p/bPo/K
         J8QjfUQ3gFvl1NwSHWuMSv9c/mhz/x4A0aoi61j6qvrlwYXeJ2q1f20gAn88Z4mCuB3I
         vlw7spbn8paofLI4OnjFFxsKmiGI6ZY2umpKldRF6oHxQL2ptFQjIB7T37c0X/hiJbXg
         ZRGA==
X-Forwarded-Encrypted: i=1; AJvYcCVvcL0Y+SMhYb5/1O1f8SPN08OlKoi0tBk0S/OBvzUj94gF52jBEw4mwXvtpLtAJnTsbswT0SaFBtG1lQ1l5Sn8@lists.infradead.org
X-Gm-Message-State: AOJu0YzwOYkKiRuseJfm4ERSgjyUXXbGWtBCEAkGcqtrB75ic2gW15Zs
	5bFi4G2vhjaCtFSfWNeEYxBTIBC+Y3Lx9PP13/NSrTOTLKKQs+sXvnf2zYt0OS0J3H9oIRggf5S
	/KiX2C2h7HWVxkzhlHht793surKqv3IePKJRVzMwLZJBPf0JDPWmotfxV9OCLwdFTGWdabOlcyc
	purwGFG1uc1UtJ5OjruereabbdchFd7asrBbaGnXmAE73EBbHJTHSE4FYQ+Uy35/joDQ844Ggmu
	RnVqAi/DuCurkFLma6UxOUrQJpodiLZoj4=
X-Gm-Gg: ASbGncuFj/YY710Dbc7imofUtSpR0WeUVA1tivMxgc2sXFJ9b3euJC75B6KYaKxkdG9
	itKes36X5uighOmjv0dqfKfgKDnzWBB1hCM+p3UaZXHDRmART5C4Yv9qNjSaJDdFZUXGP7vdK2E
	VITC7zqBKnd91yHjhZ6E3Nbq/eYKmxRzw2HK2POJ6+wCpltog1aWvEiYvNMIIxZDvrb6DapVyhE
	ImTvw1+0VL0OyjTjhzF962vlmBLl7QhieTu0tGbOBqgb7s6BdXJp2yEbCQyJkTnVbRWm1y671QG
	iyjMj4zmc3jgCUIU2ZOl4LPxXqXsqDpYulgcl1RJdAvIth5n37scqn8qbfe/Pr8cZp1CRb2qM1z
	oJQmgCMXoUt02+cunvdRBST3K33W8HtEWFzdsEd7/fq4z4fiu2HtFy5mxPkYFN+KHGLKUkjrHPT
	Lq/yA7l/Z3K3osPQ6RcL0XtAcglGIilacJN96LtAH2/g==
X-Google-Smtp-Source: AGHT+IGrkYJ1n+cabrgpCJ1QaCa4F3LzG+PP1HuxhP1PE6uvG6i3liPliJKNDJwsgKreN5H+7iL1mWhWARZm
X-Received: by 2002:a05:690c:6d86:b0:73c:d011:5769 with SMTP id 00721157ae682-7836d32682fmr201700747b3.52.1761157889157;
        Wed, 22 Oct 2025 11:31:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-124.dlp.protect.broadcom.com. [144.49.247.124])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-784674d641dsm10862747b3.24.2025.10.22.11.31.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Oct 2025 11:31:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290ab8f5af6so53585765ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761157888; x=1761762688; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xI+rhvxEBxqKNkYgkKodZ5I5aGcum/RfIbS5GB+RU9o=;
        b=ArbqA7QFiLqV6ggk16JAm1/nhBLg9/MI2/I9EhfjYlgkYZrgnNuB2XrbmJEv65j/j4
         UZpMnfxLiUfAmo/FGVtHmStYixOn5rVZa0sXSpL9kk1RSQpw7e3vF2V/t7tUEuQrfwzd
         P16CAejJEgZ8PpKyiMW/O9me/Rm1ZG7k0eIGQ=
X-Forwarded-Encrypted: i=1; AJvYcCWq/QIHwsJEl1+g7FTuy3da9IYHnh6CS2d8LDGQ5AxOo0IMpXuOoTWM2hkKjFVMINiy0QIupi7k0KVqGiOlnxvh@lists.infradead.org
X-Received: by 2002:a17:902:dac6:b0:25c:ae94:f49e with SMTP id d9443c01a7336-290ca30e40cmr257832385ad.37.1761157887704;
        Wed, 22 Oct 2025 11:31:27 -0700 (PDT)
X-Received: by 2002:a17:902:dac6:b0:25c:ae94:f49e with SMTP id d9443c01a7336-290ca30e40cmr257832015ad.37.1761157887301;
        Wed, 22 Oct 2025 11:31:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebccf3sm145602945ad.1.2025.10.22.11.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 11:31:25 -0700 (PDT)
Message-ID: <a6882bfa-866e-4079-b38a-ca2ed30609b9@broadcom.com>
Date: Wed, 22 Oct 2025 11:31:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: phy: add phy_may_wakeup()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
 <ad16837d-6a30-4b3d-ab9a-99e31523867f@bootlin.com>
 <aPkgeuOAX98aT-T7@shell.armlinux.org.uk>
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
In-Reply-To: <aPkgeuOAX98aT-T7@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_113131_312792_0341807D 
X-CRM114-Status: GOOD (  15.16  )
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

On 10/22/25 11:20, Russell King (Oracle) wrote:
> On Wed, Oct 22, 2025 at 03:43:20PM +0200, Maxime Chevallier wrote:
>> Hi Russell,
>>
>> That's not exactly what's happening, this suggest this is merely a
>> wrapper around device_may_wakeup().
>>
>> I don't think it's worth blocking the series though, but if you need to
>> respin maybe this could be reworded.
>>
>> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> I've updated the description as I think patch 4 needs a repost:
> 
> +/**
> + * phy_may_wakeup() - indicate whether PHY has wakeup enabled
> + * @phydev: The phy_device struct
> + *
> + * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
> + * setting if using the driver model, otherwise the legacy determination.
> + */
> +bool phy_may_wakeup(struct phy_device *phydev);
> +
> 
> Do you want me to still add your r-b?

Yes, I saw that comment, should have mentioned this applied to your 
revision. Thanks!
-- 
Florian


