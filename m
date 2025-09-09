Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1722FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEBL3qJvgSuPYBB2IE0AOyRPFYQUDIJrLl+44PVzXH8=; b=Np+onxsRusedGP+mHHWMlOaUC/
	11E+VQ0l7YF1hA0Py0oQtp6l+mTM7dTNiHNwrC2D/agVjm0nXdfqjOCg4De16o+MZDW4fIScJOPw0
	sUTpY60az2oLMnPQ0ZeTn9I+dvLGxaPLSSGVQmCOBELOnLxghg3s/JD0wK+egaqHFuTmTlSktbN3Q
	BAxqyc6UCm/8nSSEHksprcB67I0pUvcex72NLJl4MCL+XjRM7ldBTHSpvgLJNMXorFyjksIDVKFfU
	TVnoW0//Cx1OEAAdNTWMnVHImcwSCjK/X5Fy1IhhsgYNJHK4lYwMUN1DbGDDJGiG6+pPE8T3n1MWD
	9TvPgwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5qp-0000000ANaQ-0qUq;
	Tue, 09 Sep 2025 21:26:07 +0000
Received: from mail-yw1-x1161.google.com ([2607:f8b0:4864:20::1161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw5qm-0000000ANXp-07Ao
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:26:05 +0000
Received: by mail-yw1-x1161.google.com with SMTP id 00721157ae682-71d71bcab6fso57194697b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757453163; x=1758057963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wEBL3qJvgSuPYBB2IE0AOyRPFYQUDIJrLl+44PVzXH8=;
        b=dhOxE+N9zl83pUs7uVzUeGBcuQ4wTpnaSUKD90KqIdUBO9Ux5LyFQ1yHETgNxxNT9K
         zCUCQsbE2pirnpZE2NhwHwdTqP4JSQasPKBjCJmdww1XPBlbH72bfuD2cxDk03aEP8g1
         GcBDbmQS1N/Cs+BzZAGwqdfdjuuwh0eOEn8XCOTgdJcD1zbt3jktjlMUFrG146Tm1Gm2
         3QL5iv0PkzFWVwpEYQI2odtP9vpIkVWpgbAYdl+pCOiR3zXaxhT9R0rGwzsWXf/bu3PZ
         SSksGOifAnmde99k0fYYLb8FBNsqexWY8Rl9lmLiDgHws3h7M7Sg3eteA4fDuaUNLY0h
         Y3rg==
X-Forwarded-Encrypted: i=1; AJvYcCXh6P7yX+snwLUYWhBgWZUyEsnSbxE7Aq0sXyyC6SrFET3rjTsRChWGojSzyjEckLlgziffexOhq3Jwl+IQTXO7@lists.infradead.org
X-Gm-Message-State: AOJu0YyH0L2OiRC2QUCl6vLNlh0GkbHHHPGXvi7c6CE/S1fniX/kqUhS
	ST6gzbSzv+xoFsbHtZ1XihaR4ZmgyfMTRQ5NVvktbLD390oBe+owABwtMPsSkWhtLvwjXJZ/ESS
	GuJPrQcJHfkslj8d/RYzUY7pitQWYUgUj+2v6D0mp6ApbclMSsOmsn3x9OVr2SDkKnFoLc+kdTy
	tJNwQfK3QUpd5Xt6hVvf3p35uxYJfWkTpX/WTRPS3FVHltjXao79Izv72r+6BjQ5b7cboBwfqqh
	3tI79WgxihDFb6jODtVEdLXIejthXJZSfs=
X-Gm-Gg: ASbGncttwm1Ite4IqOKr9ZM1Xu++AdeM5zfRLLhc6j3UrJ+88BvJprtr3lmeZhYaUjD
	UNGNSMYH4wuP9ndg72mSrxYY8LRR35O5p4pxTrG8iEeLWyfDRYeoyYgtrRNYms187R6u9fo7SOY
	KCDQK637d3vg+RC+PEHrMXCr+ZDSoOXG9o5QGff3X9BYqnhbC65K2w0ejNhEfSVIENE3Rwj2fbQ
	nByA5f3iApfFiK05FGteo/vkLcT7PtgK6Q0pFJF9JyPNlNfCrZ9SjI60F7V6kBGrG5nZobvTrfj
	X7sQsSrtvQ5NFbr7Op63hp6Jxi64YLxKKWGLgqw+82p9GaMwnYuWcWvqMd3LOyEekce5JCiFpKs
	XLJ5Ybl3u77TPqgYI6pehdI0DYdUqP3lU0VASvYvRqST/LTBzwSRFV66a3RNSz9OQSFb1eB7k/9
	2yQEqQ
X-Google-Smtp-Source: AGHT+IGWtXpUnhDt58Qqwjl6Hx1vJztpwrjhGQwsEB40Va/5r6iKOpS4n8yhk6smjYRwHdJ0eZxrnWl/2dn1
X-Received: by 2002:a05:690c:74c7:b0:720:79a:b0cb with SMTP id 00721157ae682-727f368d5a6mr108423127b3.7.1757453162550;
        Tue, 09 Sep 2025 14:26:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-723a82c44a2sm17477167b3.2.2025.09.09.14.26.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Sep 2025 14:26:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b548b9a0220so368853a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757453161; x=1758057961; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wEBL3qJvgSuPYBB2IE0AOyRPFYQUDIJrLl+44PVzXH8=;
        b=JthP40B0xAQMLFWZc/PHzxnOT1My9/vQgr/b3dUo1/woewObwyg3Vf+nIx+wAczWb/
         NWEYxLhple77504MVRQ/SxyLNLDnxIz0ShKpbLUVFCW4MBBkfAwnAeVheNCC30YM+S7I
         y/bVD0Euk7M7fGrJWgE3A8AIeEClm3PLkjPRQ=
X-Forwarded-Encrypted: i=1; AJvYcCW5A4zr/AacYX8vaHSRKu3O0n+gbQEnZy+VJ4maVExIo+3IOYaDhHT+T4+eG1r8GjJMzmSbrTR1Kss0BpeRGNWc@lists.infradead.org
X-Received: by 2002:a17:902:f549:b0:24e:e5c9:ecfd with SMTP id d9443c01a7336-251728629c4mr169828345ad.42.1757453161387;
        Tue, 09 Sep 2025 14:26:01 -0700 (PDT)
X-Received: by 2002:a17:902:f549:b0:24e:e5c9:ecfd with SMTP id d9443c01a7336-251728629c4mr169828075ad.42.1757453161006;
        Tue, 09 Sep 2025 14:26:01 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dbb5efe61sm108217a91.18.2025.09.09.14.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 14:25:59 -0700 (PDT)
Message-ID: <f8e28893-2401-460d-8511-9b390e091b4c@broadcom.com>
Date: Tue, 9 Sep 2025 14:25:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 2/2] arm64: dts: broadcom: Enable USB devicetree
 entries for Rpi5
To: Andrea della Porta <andrea.porta@suse.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iivanov@suse.de, svarbanov@suse.de,
 mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>
References: <16d753cb4bf37beb5e9c6f0e03576cf13708f27d.1757065053.git.andrea.porta@suse.com>
 <c6b17f0f896b5cdd790fc10aeb2b76b71df9b58d.1757065053.git.andrea.porta@suse.com>
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
In-Reply-To: <c6b17f0f896b5cdd790fc10aeb2b76b71df9b58d.1757065053.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_142604_069347_E0D48F04 
X-CRM114-Status: UNSURE (   9.13  )
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

On 9/5/25 02:42, Andrea della Porta wrote:
> RaspberryPi 5 presents two USB 2.0 and two USB 3.0 ports.
> 
> Configure and enable the USB nodes in the devicetree.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Applied to devicetree-arm64/next, thanks!
-- 
Florian

