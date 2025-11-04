Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F20CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 22:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lnl8n3Jcqh1zlq/2kwTqrdOA4/uuLInlKNkJl72nXWc=; b=weebiPZwP1Pl0dFwGPSTi4vUyb
	28n0nUynHqPvPD62OUSV+7evPJlL0ZVuhqwNMZaFsjQ1FROnMRF1smqAAr8o3Lhz5/bkceH2FCUpU
	bkr71lPEiyNVkdcuql9UOtgtSrs/sMz6POaEQrPjS75FB6RFjIR6J5JCv42KAHzW7aokTJtbW4gWR
	WAKEWsJYEyj80K2ASYzV6V5rxY5Q6ETbnb91Y7RYwJ4ZkMq/7m85jj1loqCoO6Pr4vm6OELfuLmUI
	4sXO4IaTzJHzuKnQ8t7R+cQ6PnvX7UuPnj8DOx1RiQl3ZLWvI3Vj8vHnNjopn/fq/8U1eidkzuODO
	MrEdhI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGPOl-0000000Cg96-1UMt;
	Tue, 04 Nov 2025 22:21:07 +0000
Received: from mail-oi1-x265.google.com ([2607:f8b0:4864:20::265])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGPOi-0000000Cg8f-2YL9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 22:21:06 +0000
Received: by mail-oi1-x265.google.com with SMTP id 5614622812f47-44f7be0adcfso2339249b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 14:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762294863; x=1762899663;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lnl8n3Jcqh1zlq/2kwTqrdOA4/uuLInlKNkJl72nXWc=;
        b=NHQ8gBJiCNLcGloO4wKvPSc+0AgOF29fXb3PTrLL5EmeT3Q0TKyUU+c1T7cV0NGZx8
         fEI4XVIx1Go7VqvSKoeQd8ShTSJ3NSA2ZydfTAzdHo6a5GCK2ENvPNC5TriiukPmaiq/
         czzp0AmfFzaC/E/noZ/P57cA2TcOuq7YNLysGVOU01lKcw2DzMC8cH8aG4NNcAqawSoV
         h8LDa0yydF9jY/zd0KVI1DCjmwCycdosQ1gfabCqBYItcrI6vZtEQ+8tS0unDIcVEYy4
         OGAm22H/MSTe6ZNn+farOAVefNo5912pb3JNSkjcYEBmnlXZMS4nWzPVjiOFvU3NZo1O
         QsSw==
X-Forwarded-Encrypted: i=1; AJvYcCV8mPlMvFedcjwBFDfWaNvRQUsDAlb3yQXUy2eP+q5v9DNyZaof/hbbC+Hdhf7ZDWpNXfLkZ3eozJVp5CL1TIVw@lists.infradead.org
X-Gm-Message-State: AOJu0YxeVeBpvMB1mDyH17GTgFNGSMrQZTPLyYWHqyHvUlm1ds9tLRPt
	nrINL550pRsgTT3gvYr8ChOrxVE7MqOL4vZnPJfWmhdhSObgQ5pCyc83JTDJTRkYlWfzuinkA8U
	2yUfz+8xeh5Fkzhy4h5awI+YjfU8dOuyL0ssXdqZuvM15X89gkDayKQaRpWP9BLtyIdPsKxwYT5
	SAhaII3NWvpQzNFbeqddkV8R773dWjkORNfUEE01yPZvBttY7PavpmuNJNm5j9mzPCvsC81j9QL
	9OKajsAMGfgXx66ckFyPLqi35jkiAFFCRLjcw==
X-Gm-Gg: ASbGncs0midPE/GXqIFjDldwKsClK1DDdhjalBqxprdcPAOX2oU1ZJsxEsN5UO5cCRE
	9z84BIsSZmwAgHqM2Vvj8eMEuig4s3Ry7aU4fHnkyQU4Msb6RMesphD5Tmz8Nu8scAHOpzAlFYq
	TNhY27Xqswvx4ABs+Ga8gKMzJrhJQGHkV3mcfDzxPLzObdkpuuObiX0RMhpTAq209mUNttyPut+
	WpcBPxSsuKq0BZbjqYY2qTbN7ymIkDLOmyv6Fhf5paohiec+rqyfRi7jBWo8sSCmxizR2nbXJoc
	RhZ7FAh30s60es3zO9IrZKPCuAbBmN0I9AbB3XakJZui8J29XXSIk865UkKHQu4x2CfEeCDIxyx
	vA5CGhzLu8S4Tj8yfsOTT+ZkLiRjxKc3pySqbwj8SvvRwjzkR0KKpiedWZzTaqbkLMvU/FEK/TZ
	v/zymfGbMjW//p201mVeNYpqh0Ydk2c0vXqqNsIxLM9A==
X-Google-Smtp-Source: AGHT+IGGXythP+tEKfLImQRf6eU3vzuRqiQyhbaITIxEwwVpPhgzGtV3hvfKLBnkpG0Qckem7YVb6MnRy5FH
X-Received: by 2002:a05:6808:318c:b0:44f:6d6e:2836 with SMTP id 5614622812f47-44fed34342bmr354907b6e.23.1762294863506;
        Tue, 04 Nov 2025 14:21:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-3e12bd04cb3sm150121fac.18.2025.11.04.14.21.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Nov 2025 14:21:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eba120950fso147645031cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 14:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1762294862; x=1762899662; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lnl8n3Jcqh1zlq/2kwTqrdOA4/uuLInlKNkJl72nXWc=;
        b=LTHnYhZ9N3cbfFJYoyHRTLqGDVxtOvewJIurHafl5Zq5K7BAK8oRRnnpK/5J8BtbaL
         Npz3Pn28MjXFV3JKuSwNRsDbWBtfPXoOShqcpnfNpwBCYpMafxoEXoQ+YjUy3VqxR6ZG
         DZjJZydikGjZ+dysmcYL/elfM8mEv4m6NxEBE=
X-Forwarded-Encrypted: i=1; AJvYcCXLVM8Iv1QERmNvMCXlXi87/Y9+uzvI/KtQjAHNOgjGomCpuJh1iSMyf07vc1RwHKsM89beDR/pRVW54YencqkC@lists.infradead.org
X-Received: by 2002:ac8:5acc:0:b0:4ec:b599:2879 with SMTP id d75a77b69052e-4ed7260440cmr14729111cf.66.1762294862614;
        Tue, 04 Nov 2025 14:21:02 -0800 (PST)
X-Received: by 2002:ac8:5acc:0:b0:4ec:b599:2879 with SMTP id d75a77b69052e-4ed7260440cmr14728731cf.66.1762294862153;
        Tue, 04 Nov 2025 14:21:02 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed5fbe0115sm26194261cf.18.2025.11.04.14.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 14:21:00 -0800 (PST)
Message-ID: <55c23802-e545-4e88-9814-8d24fd24815c@broadcom.com>
Date: Tue, 4 Nov 2025 14:20:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Fix V3D deferred probe timeout
To: Stefan Wahren <wahrenst@gmx.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: bcm-kernel-feedback-list@broadcom.com, kernel-dev@igalia.com,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>
References: <20251104174518.11783-1-wahrenst@gmx.net>
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
In-Reply-To: <20251104174518.11783-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_142104_664937_4B9A4334 
X-CRM114-Status: GOOD (  12.60  )
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

On 11/4/25 09:45, Stefan Wahren wrote:
> The commit 4adc20ba95d4 ("ARM: dts: broadcom: rpi: Switch to V3D firmware
> clock") causes a regression in arm64 developer setups, which stores the
> kernel modules via NFS. Before this change the involved V3D clock provider
> was builtin, but after this DT change the clk-raspberrypi is responsible
> for V3D and for arm64/defconfig this driver is build as a kernel module.
> In case these kernel modules are provided via NFS this takes too long and
> the PM domain core give up before the clock driver could be loaded:
> 
>    v3d fec00000.gpu: deferred probe timeout, ignoring dependency
> 
> So resolve this issue by making this critical driver builtin.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-kernel/9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk/
> Fixes: 4adc20ba95d4 ("ARM: dts: broadcom: rpi: Switch to V3D firmware clock")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied, thanks Stefan!
-- 
Florian

