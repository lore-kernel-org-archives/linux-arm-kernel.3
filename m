Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8E0CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 20:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFedfW1nrd9LLLC/eei09ZbrjgG2pkrICFzK2gctJpQ=; b=kNrk7nhJUEvsgh4WC/GclZrk7T
	gb3CncarQFG/fheRhQTCL22vcYpS1lsQ6FxS1p2FLeQvUBl190zdhoWO7OxHVKTyx0nSzHRE6v8ar
	hC11zyrp1BwNfkpzwc/XQ93/QI136sQeEjRKRjgbX7h2rvEbP3ghUxZHIskba/lVlN/OU0dhy5oKQ
	2F3CLYU9UusXNkB1c6T/9/Gp+Ev0i4jVGnIlFnpRmii6vKRUkEnxW+HanQmbo7r0GioMiD9zruJQ9
	pQwZ4HavnB+3VMEyUMU/Fo3Nw8VsnGt+02qjlrqX8/+I6E4JfLLdbjXR069PR4g+LUWokveoYF0er
	a/1uesMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbOO3-000000048rb-0zv8;
	Sun, 21 Jun 2026 20:03:23 +0000
Received: from mail-dy1-x1362.google.com ([2607:f8b0:4864:20::1362])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbONy-000000048qb-46fk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 20:03:22 +0000
Received: by mail-dy1-x1362.google.com with SMTP id 5a478bee46e88-30bcdf8232fso8046847eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 13:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782072197; x=1782676997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hFedfW1nrd9LLLC/eei09ZbrjgG2pkrICFzK2gctJpQ=;
        b=Tndjox3wGTMrFGXc7Gu+lkzENkw4GOJI62xGRSCLpvsh+vf9kj6f/cH6P2STT3rk59
         mZVhDZV9nU0xATf7Lm1VjMP4l3BRZS0h84U8HgkAf3QGaopSP6+7H4sTE0P6g2r8BwcF
         qwAo711ycFdbeCcE3EA/3rg8HQTECKlnocsI1zroSMH4YHFYxAxdlkApE676PhrlvKuR
         GD6PjJlrI0XH6uAkrLL8xB5PbhFhBo7X0YX29OQliMoMk/9obWN6Ni1k00Fs8K9aVILI
         IOZpbZRzySYocoz++5K6pDJGp6PSSKMpaBxW8m3vtRtSp6VFNesng+L+x8xfEVrPVTxn
         DPNg==
X-Forwarded-Encrypted: i=1; AHgh+RpsLSNoriwqp3PXSm0yzCEhBOupYeisGrRuujn3O1jt40nRgHVxg3130FQuHkx/dKeAiG69FRJVpJ6AtuOnJvch@lists.infradead.org
X-Gm-Message-State: AOJu0Yx11/CQPcgqWzzUJa+wr4U1048WmJ7ZY1vjG60UJRDN5dxfeoNA
	i8rz9L1nJAqjq30P0GRZt/LRS9reWg372fBlbHwdBMtXx+Ho/y6UvevTuhFLqR14NKgC6zYAZJs
	TtvJINP0IbMuZwJ2hDLWczlhNbJx5ORpScuV859TBz1XzzbO2P1doOFvSjEn3xn7q7dAtf8uq1d
	S41FhXOrFu8ScYIaHtPKkpQMvR0LT/jY4DshjgWvv+DFFFtADJiNcB7m0brVsTm1Tks0MH7wuRk
	2G5PBTRqfwNikXoeQRHnnO5cd8etMO6xVLx6A==
X-Gm-Gg: AfdE7ck4l4vRN/a5o8I0R4Zi9Ongn+bC/Ujymxdc6ACG7IV0oO5P9yrVRBUGeo8QaoO
	UEDuENofUooqzBJbK0Njcy32yM3DXOdqw7DDEy/pVKoe9mQC+ponwR43lLXV6VBZH3hhmtigb3j
	W6PEoMSC9CSJaavEhbYODG1AwwJ5Ll7W6tkF/7kt5Xbj31fxa91/pnCDcz876VhANXNTa5fWkGE
	bAYp3FqMT/l3AlO60SyfagoqtH4CDRx1rzSeWVh6MdqWCN5gPPgDiMqoiyteYITfrUN5Wrijp0R
	ss9gcmhEAwPSguVi3bmxSNj01mGGVP5+vmIYVPWE/XJLW3XB5cGtbdPW9Sr1tHcp1HbR52pw8bv
	86TLldJy1lifsre6+KWeEOeBhu8qkoeFJwhzFoPkwpeFnGsxM4RKVMoIpFlAQUdlt7wVB9OTnu5
	CYsWp3/epUd0pQ7dCWyiy1rDbN3XatMkf1Qwwve3rytU19I1x3ANk=
X-Received: by 2002:a05:7301:4b16:b0:304:eaa8:11ea with SMTP id 5a478bee46e88-30c0709e27fmr8623962eec.34.1782072196775;
        Sun, 21 Jun 2026 13:03:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-30c1be65ef6sm401611eec.13.2026.06.21.13.03.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jun 2026 13:03:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4923d2f0dedso13338995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 13:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782072194; x=1782676994; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hFedfW1nrd9LLLC/eei09ZbrjgG2pkrICFzK2gctJpQ=;
        b=bNcfBa5ajzoyn83lEjAOg8zeOavA+He4nnJa+32Fpi9NC56ZlxBmx0+19dZlCLxDax
         zVE0PD/yCe0U9SRGtWX+VFoHpbXo+ySze4Zvfbz+jm5SMKCekzlyg2F6SpTmWCdCcE+d
         JIJgyH04i1//XeO8njIStQ1G4Zez9OjF+0iNk=
X-Forwarded-Encrypted: i=1; AFNElJ8woeiGHrU0ntw0GjvA9nMQS1AOom98b6rnV4kRMgTC8rV00xzhGXU3+SgWOWtTHglT9JcUMtjjnOHFEZ8vM3bQ@lists.infradead.org
X-Received: by 2002:a05:600c:4f43:b0:491:89c2:5aca with SMTP id 5b1f17b1804b1-49242592576mr160876315e9.30.1782072194192;
        Sun, 21 Jun 2026 13:03:14 -0700 (PDT)
X-Received: by 2002:a05:600c:4f43:b0:491:89c2:5aca with SMTP id 5b1f17b1804b1-49242592576mr160876045e9.30.1782072193724;
        Sun, 21 Jun 2026 13:03:13 -0700 (PDT)
Received: from [10.225.97.41] (aerospot-mask5-183-2-inet.hub-one.net. [149.232.183.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924594f8fasm148093855e9.0.2026.06.21.13.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 13:03:13 -0700 (PDT)
Message-ID: <223cd514-41b3-45b9-8617-b54d379d5091@broadcom.com>
Date: Sun, 21 Jun 2026 21:03:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional EL2
 virtual timer
To: Marc Zyngier <maz@kernel.org>, Daniel Drake <dan@reactivated.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com, andrea.porta@suse.com
References: <20260619204832.586079-1-dan@reactivated.net>
 <878q898ulx.wl-maz@kernel.org>
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
In-Reply-To: <878q898ulx.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_130319_060246_3DD8441E 
X-CRM114-Status: GOOD (  26.07  )
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



On 6/20/2026 9:49 AM, Marc Zyngier wrote:
> Hi Daniel,
> 
> Thanks for posting this.
> 
> On Fri, 19 Jun 2026 21:48:32 +0100,
> Daniel Drake <dan@reactivated.net> wrote:
>>
>> Commit d87773de9efe1 ("clocksource/drivers/arm_arch_timer: Default to
>> EL2 virtual timer when running VHE") causes boot to hang on
>> Raspberry Pi 5. The newly-selected EL2 virtual timer does not generate
>> any interrupts, even though the GIC_DIST_ENABLE_SET flag has been
>> confirmed set via readback.
>>
>> The reasons for this failure are unknown, however it is likely that
>> this timer was never tested. Raspberry Pi's original devicetree did
> 
> The timer is part of the CPU, and there are enough A76 implementations
> around to prove that it actually works. The same can be said for the
> GIC400 this is (supposedly) attached to.
 > >> not include this timer interrupt; it was only introduced via a
>> suggestion[1] made in code review as part of the upstreaming process.
>> (Current RPi firmware versions do include this timer, but only because
>> they rebased on top of the upstreamed devicetree starting with
>> Linux 6.12)
>>
>> Until more is known about this non-firing timer interrupt, remove
>> the devicetree entry to enable RPi5 devices to boot.
> 
> I'd like to understand the reason why the timer interrupt isn't being
> delivered *before* we paper over it, and not the other way
> around. Each of the CPUs definitely have an EL2 virtual timer, the GIC
> has a per-CPU interrupt, but somehow the two don't seem to be linked.
> 
> Since DT is supposed to describe the HW, I'd expect someone from
> Broadcom or RPi to shine a light on this issue. Integration mistakes
> happen, and we work around them (see the handful of Samsung SoCs where
> the timer interrupt was simply not wired). But we absolutely need to
> know what we are dealing with beforehand.
> 
> Finally, just hacking the DT is not enough. Assuming that the timer is
> indeed unusable, we need to cope with the fact that there are DTs
> describing it in the wild, as nobody should be forced to upgrade their
> DT in lockstep with the kernel. For that, you'd also need something
> like the patch below (untested, and in need of a proper commit
> message, which I expect the SoC vendor to provide).

Daniel, do you happen to know which 2712 SoC revision you have, whether 
this is a C0 or D0 stepping?

We have an internal bug tracker item pertaining exactly to the virtual 
timer interrupt connection however it affected a sister chip (77122) and 
not 2712 AFAICT, now checking with the design team whether the same 
happened on 2712.

Thanks!
-- 
Florian


