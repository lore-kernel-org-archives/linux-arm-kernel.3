Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B55FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQTe5PQLHfMGykdWvW9p6zXGCaA0hCvjKNx0WDmkIQE=; b=X0dpg+f0SfoPamF0S9nlMa+vT9
	rH38m2Tz/I9ZzPHhiwgSGmJHnYmc7WipJw8/JqlWNemUtWQFSxli0DZOcj72y6dqSSnit7m8mrbtG
	+n8Wa/2wnuwCVkEhxPzq8QByVwEAxim3go/8j+khlrQVxU+73zHSTgt9Q6le+3BxhXFqnf6WM1rCU
	B9/LdeyrEYuOh+ra84tv2BY0aLFANOzHmgtMPu+obGKDWrPRM8R9HLznl+nC7rpIMO+qY5wwT+5VB
	zSB/8G5Tyyk14mxgqXmhjT1dzOEnf9hXZ7HYPhZKTMJxcifwfFBU3oRgIhpkKys8dKjr90+9QRE4j
	e8Ptwl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXYw-00000000ik9-1Fw4;
	Mon, 10 Feb 2025 17:27:14 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXHz-00000000f2M-15yc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 17:09:44 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3f3b2a18d8dso859789b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 09:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739207382; x=1739812182; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lQTe5PQLHfMGykdWvW9p6zXGCaA0hCvjKNx0WDmkIQE=;
        b=JqbsaRngcmN1ysjFH85kA4kA3Hx7fdVE8LgWdukZgJZ84170SXceoyZGiSRhVmXReQ
         qMmowU0IBgApug5wMWSrRkyP3CtcEaSjRGk1yseh9YvEcwmaqfVhjQhH50GZQjErMsNh
         Arz0EU/qlFCORivUpm64whTpsX/xM4l78jY3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207382; x=1739812182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQTe5PQLHfMGykdWvW9p6zXGCaA0hCvjKNx0WDmkIQE=;
        b=GNZ8Iul+/ALfDz5ptueQXEK2fGLq5R5sSacdf5FcmANiyhXsaz1bK2dIemSVGFzs9r
         5kUwVO1fvOt4/F8Gtx+f2yCLOYcsocSetqEPtpv0hgglesO7y9th9AiIR/IOL0sYSc6h
         scGUiYJlH3CdTqhUXdx10Eyo0u1OvAJLCcRrVg3LjDNAo02KskVd6aokDCI/RmvekTyq
         4UnNM5fboht6GS2Wl1b87mpdP9C3Q6XZJpp2Gi/i/2isKSGMzc6cZNqXSf3yXso7+5l+
         Ok8La/VE+q6GLKzngSjluIHn9aKAcLFKOny1bqmFWgxIK0iU+7NS9g/pOmb/t1w11R3o
         Ijog==
X-Forwarded-Encrypted: i=1; AJvYcCUK1lgia1yUzAaFJARiVqw8fEjr2IK7ijtuxhI0mUL6fyg6Hyp2eqaEHI7J/R7tsixLcAhilgtJBI0+HdD8mg5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwwAeYLeGNwGb4mm/o15sAUt6dcZcrrmyFMg6VBc3bYOn74lF//
	UuTM7sOEgWFwcWFpSPF5dk9K77sP6bkmuvkgQAzpUQJNzCUSp26SLbQ24dLgj1vS1tXSA9UPauA
	=
X-Gm-Gg: ASbGnctdHQneWb2U3lXInDv44Rn3av5b20IgB4YvtF8N0NXrA3poI0n9UygVPjkJEUm
	+QWelEUUhVS/s1qyKMwdvpEHMfZGaiU9ZHFx2iq3h1CL4kOa0ZmO/EEeEXczqBWaD8UI9ybuSfw
	HclUi5JVbBfw02y0XRrLzeuXtw8pnQrIqUBjwqZWNhiSsPx/TW6D5SMMK+XXEME+vFalTdFHty3
	N0hDEVbcssJycZXnc38MNJHPU8HbM4AqGRVjB3GCPBkWfG2OXxOs2KpP6Avg7lT6KYsqYoueVRU
	lE86pLCU4/tGVXX3n8nPW1Rr1rcjbZXPb5a3uP15Y8L/6Q5q0WqMvUk=
X-Google-Smtp-Source: AGHT+IGbMkAByqSoYHlkURXBou8gZYgAclNItaKhRl1qDrIPhmwpsCzeK4N/g1CfrnsNmEvAMtwCiA==
X-Received: by 2002:a05:6808:22a3:b0:3f3:b3d0:bf32 with SMTP id 5614622812f47-3f3b3d0c139mr3218894b6e.36.1739207381608;
        Mon, 10 Feb 2025 09:09:41 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389fb517fsm2382709b6e.33.2025.02.10.09.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:09:40 -0800 (PST)
Message-ID: <115a59e1-75b2-4d09-bbf9-50dfcd2b62dd@broadcom.com>
Date: Mon, 10 Feb 2025 09:09:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support
To: Ulf Hansson <ulf.hansson@linaro.org>, Kamal Dasu
 <kamal.dasu@broadcom.com>, Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 adrian.hunter@intel.com, linux-mmc@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
References: <20250206220940.10553-1-kamal.dasu@broadcom.com>
 <CAPDyKFq1ZbP4c9ECfM1SY+MEopf+dC19w9PkqXaUjevf=bPjcw@mail.gmail.com>
Content-Language: en-US
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
In-Reply-To: <CAPDyKFq1ZbP4c9ECfM1SY+MEopf+dC19w9PkqXaUjevf=bPjcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_090943_356966_DDF935EF 
X-CRM114-Status: GOOD (  24.69  )
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

On 2/10/25 05:21, Ulf Hansson wrote:
> + Jens
> 
> On Thu, 6 Feb 2025 at 23:09, Kamal Dasu <kamal.dasu@broadcom.com> wrote:
>>
>> This patch set adds support for Broadcom TZOS to read and write to RPMB
>> partition using synchronized access to the controller hardware.
>> To achieve this Linux OS and the secure TZOS make use of:
>> - shared hardware semaphore register
>> - a set of SDIO shared work registers and
>> - IPI interrupt registers
>> The sdio shared work registers indicates next in queue to access the controller
>> and current agent in the queue. The currently running OS that needs access to
>> the controller puts itself in its slot of work register and if its next in line
>> it can try to grab the hardware semaphore and complete its mmc requests.
>> Next agent queue state is changed under the hardware semaphore lock before it
>> release it by looking at work slot register. send and receive IPI interrupts
>> between linux and secure world are used to indicatecompletion of transaction to
>> the waiting OS. TZOS has its own RPMB driver which accesses partition when it
>> wants to read/write RPMB frames. Current implementation assumes Linux and TZOS
>> as the two work agents.
> 
> We recently added an in-kernel interface/subsystem for RPMB
> (drivers/misc/rpmb-core.c). The optee driver (drivers/tee/*) uses it
> ro read/write frames and route them for the secure OS.
> 
> When the mmc subsystem probes the eMMC card, it registers it as an
> RPMB device via the new RPMB subsystem. In this way, it allows
> consumers (as the optee driver) to read/write to/from it.

Yes we are quite familiar with this subsystem and the many iterations 
that were proposed before it eventually landed upstream. At the time the 
hardware was designed, we were not sure of the direction that the 
generic RPMB subsystem would take so we decided to add the semaphore, 
scratch registers and interrupt generation capability so we would not be 
dependent upon such a subsystem. We also had other factors playing into 
designing it the way it is, such as allowing for N participants, 
including another processor/firmware.

> 
>>
>> Change required adding two core mmc_host_ops request_start() and request_done()
>> to let the host controller driver know when a mmc request starts and ends so
>> that the access can be synchronized. This has been tested with both the sdhci
>> and cqhci access. Currently these ops are implemented by the sdhci-brcmstb
>> controller dirver to acquire and release the hardware semaphore before and
>> after access. This change to the mmc/core driver does not have any impact to
>> existing controller drivers.
> 
> It seems to me that this isn't needed at all, assuming we have an
> in-kernel tee driver that can route the RPMB frames, but maybe I don't
> fully understand the use case.

The proposed scheme here scales to an arbitrary number of agents in the 
system. Our immediate use case is for both Linux and a Trusted OS (not 
OP-TEE based BTW) to share the eMMC controller, but we also accounted 
for a third agent which is a power management micro controller firmware 
to be able to participate in the scheme and occasionally make its own 
eMMC operations.
-- 
Florian

