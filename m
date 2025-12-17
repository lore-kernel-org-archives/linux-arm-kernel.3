Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AACDD637DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 00:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8Y5Nly6/2QcuWXLw650vy+bFUZ3dsDuqEwgOZmk9iA=; b=ARDlLcRbr8m9ZnroSy7Srevful
	2HK/ENNH/ehcyjv9zGNDf7qaumD3OYa/6+Ck9zg/MWPm11jNCExf/v88z3P2ln1GRXbrrUFmN74g3
	RQmdcw+4GKB0VSX4OhlXUnWTAgAGdH6GMSXbmcCHjxseDbySpltPOYmkzD9AXbc2kKt2sdVZy+epC
	vH47O3uXUSXDCJ8kVdSnJ0a+D6XwcWDZMVBd4frol1L1sZkFbBT+Wyf4JN7jqa0LHvgimKyPDBmY2
	H3d3SylOt6hafWe4kx9Pf08K6kPGqoT9dmmHC/XBiYBwOMT+yZCQNZqfGpxTFLYh3MFs1Y7KWwCip
	c0lktVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVf1E-00000005yIe-1myU;
	Wed, 17 Dec 2025 00:03:52 +0000
Received: from mail-pl1-x661.google.com ([2607:f8b0:4864:20::661])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVf1A-00000005yIA-3H66
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 00:03:50 +0000
Received: by mail-pl1-x661.google.com with SMTP id d9443c01a7336-2a0eaf55d58so269395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 16:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765929828; x=1766534628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q8Y5Nly6/2QcuWXLw650vy+bFUZ3dsDuqEwgOZmk9iA=;
        b=GkylBh+NqBgHOgxMn/fyb+cMQmXqljxaX1gmyxPxdgUg/OIZ5hwf8ayfEYgN7Ym0Rl
         kXpeWdseN+7zgQfkBkoxHrYf9yE0T9bZekS+OACwInMn1hAq1+QFE8q8uYo+Fz+nm2MK
         4BC6gN2zuqebfWeDoJCV8R792Isy9GMWBIqz/ZYXNKXbgrCwO9bXIizLpndhnNV3KtF1
         h6PKKUFYyARYmqXR6p/lBlSqH4EU3BriLpPG4Xzri/Lf+/o3lh1+ithiT8lsQpHMtRL0
         qxLAjFuzd26tO8tUgVkovMLBESsBNbboi+N4yy6q1C35v/5oRlIkdsVsH8O0yA77hM2s
         De7w==
X-Forwarded-Encrypted: i=1; AJvYcCW8e6iYNvBonJKbDQfL8zviqxPeWRdA1sf+LIVmkv3extNSwruHceRSF0fynWYG5chBKrJWY1H4edGhk8ouqAd+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2KEYVgH9Xl8uRqAl9yuI9EwPoki5Zk5OTGMCyT/DogzttCRkq
	klygTzwKp/dbb3uEEraJt6Qt8Pnyj7F5kWWFo6EmPP3GBD4qPuD+DwnjJErtRGYkueQwscKrbIK
	QDm/pDgLQo6+eGa7XT1b6H3NX+xH26c5Z43IcirZlkZkWWcMZy32DSv3gWak7v/S5ELg9J4meS+
	z19nCJ3/BLZgP96CW5/x2scs1l2I9rgYhJYZjqLKPJDtOWM90nQvdS/hLqYECQLgL8s04H2MWg7
	hk+VkD6Q4p/7JKAxL+W/cUwjzpL4ukxiPM=
X-Gm-Gg: AY/fxX70Ck9JdJ9Ll7aL0bEVvYN8StQm21iyE7j83yOYobYYDIiVWlLftFllLeeziad
	pAEdkNhsEqFtHTcHtrrlEqYZph+GO6keF6QAQ31WB5RvYA2m4E/g22tO54GxOTRhpsylhmhPUNt
	wlzOhkCJmS5kCNEaHNK3ssiI0YnAJ8VtxGo2ra+uo9cw3Hx2I4HlIDb58Ege6vqYGw0OwAEOhzF
	cgVjgul4YL7gCKw6q61WhCvN//GzYSnTiWi62JURgIheV/NVER+3RjivzSogu5bNn9kE9dEFHj0
	YcTrJXLgqJximRcvI0RjKaH03266XvtomGxwQYzJxHCq/AqcalsjasvoA/WRrz08ZNi5AbimGof
	UDWwrK9kEQAxZHHBzL8HZPBw3c/pIowS02Quu9SnmpHkp0No/JlGInypUXmdSaltVGP2QxEwS0z
	biJGhCyWZwAgNZ/n9taLLwKbFrVXbng8nHCyGKTEBzZMaHD+yIYQ==
X-Google-Smtp-Source: AGHT+IHv5cJfj1sGqjVi99j8GcS8yOenfySAR+wJ3Y2ur8+JDuyyGDKukR8Y4GTR4tnfmoFzBFBDfEoSoUcL
X-Received: by 2002:a17:903:24c:b0:2a1:5402:7617 with SMTP id d9443c01a7336-2a15402824bmr21730955ad.26.1765929827766;
        Tue, 16 Dec 2025 16:03:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a1022dda47sm8587055ad.57.2025.12.16.16.03.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Dec 2025 16:03:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ac34c4b41fso53595eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 16:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1765929826; x=1766534626; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8Y5Nly6/2QcuWXLw650vy+bFUZ3dsDuqEwgOZmk9iA=;
        b=CM7uinUQfJvIBXeVY/Jw7pmtwyKg6JM7bhIcyEWUROy6dPbhAjYepuP2XblFeEBbme
         RaOxhr72UIN76JVxVCi57Xrvo5+/pn+kB7/mwwg7MYq0Aem3w7gYtQGDvN+vlCbUvO8v
         BUDNJfoOW2JBTqk+nIfYdhSxdKn3Q8D5JWdHg=
X-Forwarded-Encrypted: i=1; AJvYcCX0/gs0HFGy6Zs/ZdEAlpnVwDLJi+r8ojaRC1oPHCi1dlja6lsBdoEFjFYm1xVahlNBWvZKuZfLI3DnIOexqtiJ@lists.infradead.org
X-Received: by 2002:a05:693c:8006:b0:2ab:f74a:6a63 with SMTP id 5a478bee46e88-2ac3119e045mr8038586eec.16.1765929826007;
        Tue, 16 Dec 2025 16:03:46 -0800 (PST)
X-Received: by 2002:a05:693c:8006:b0:2ab:f74a:6a63 with SMTP id 5a478bee46e88-2ac3119e045mr8038570eec.16.1765929825269;
        Tue, 16 Dec 2025 16:03:45 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f0546a1sm1821021eec.29.2025.12.16.16.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 16:03:44 -0800 (PST)
Message-ID: <822bdd19-276b-4868-b3e4-59a187bc7048@broadcom.com>
Date: Tue, 16 Dec 2025 16:03:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/1] Broadcom devicetree-arm64 changes for 6.19
To: Florian Fainelli <florian.fainelli@broadcom.com>, soc@kernel.org
Cc: Stanimir Varbanov <svarbanov@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20251216235649.633331-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20251216235649.633331-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_160348_831317_36C57071 
X-CRM114-Status: GOOD (  13.34  )
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

On 12/16/25 15:56, Florian Fainelli wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>    Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.19/devicetree-arm64
> 
> for you to fetch changes up to 37c3a91e9730e274fe2eca9703033ae0f154cb62:
> 
>    arm64: dts: broadcom: bcm2712: Add watchdog DT node (2025-11-05 10:28:29 -0800)
> 
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM64-based SoCs Device Tre updates
> for 6.19, please pull the following:
> 
> - Peter enables the random number generator on BCM2712
> 
> - Stanimir adds the watchdog Device Tree node for BCM2712
> 
> ----------------------------------------------------------------
> Peter Robinson (1):
>        arm64: dts: broadcom: bcm2712: Enable RNG
> 
> Stanimir Varbanov (1):
>        arm64: dts: broadcom: bcm2712: Add watchdog DT node
> 
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 

Apologies for sending this so late, after v6.19-rc1, these changes are 
somewhat minor, so please let me know if they can be accepted as late 
changes to the 6.19 merge window.

Thank you!
-- 
Florian


