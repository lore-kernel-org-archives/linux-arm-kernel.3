Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C28C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8+z4kiOtdTmn8miWX+XqbRCAv1t3K0Ial/sw+P7zoA=; b=FMSgyWyvHmqq/hF0E14USbPtU5
	eEREP5x38hEEjOgHsXsW3vTNjvzjcsnoq50dwcHid65liCPnfLworR3sRdjelYN44DZ2rMoLy4lVo
	v+z20QReQhUTu6vnuNB6gsQdn74FKV6CLFX2t/XtKfovRnYfqcHiouBvm9NY4v16Koz3NmhkXqUo6
	g7NZ6htn+65cbWHJh5ChdMvytgSACxmJYqSZpjcpd0+QtVx7nf5DDYxGxyrb1U/HMB24cVc1DTsw4
	YLe/bp9szNsTDZ8gIcqPIpNb3WR1Outq104aRFwvgE9UnYjH3VYJhgCOEAUor38dbU0HgN34JNmcu
	SOraeeKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DIK-00000000V40-3WaE;
	Thu, 03 Sep 2026 19:40:20 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DIH-00000000V3G-3DSk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:40:19 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-39927410578so278035a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788464417; x=1789069217;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p8+z4kiOtdTmn8miWX+XqbRCAv1t3K0Ial/sw+P7zoA=;
        b=qpqmzCBMy2+sNwmvx7g42yJsmTQcJl6sKBhmCBjks17G9O0KLUKcoYiXZES4u2H08/
         BJYKpUEyZ8ojV+l7OUbAt29c7PnpmPnaFmdoQ/10f4v91D2zIxk/MGERed2Id/xyXNFJ
         +zZuGio/jMBoehrfdUk+Cd3JJg7amdJ+5F4pVnc2opr2SloOHSr64VPag0A0IdbKLhdc
         cdlzmELuDSlE/K/r4igkN97mVYgOwmoVgK2fyxRzLYU9///JJly+D6Kj9YVshRy+Q9Tr
         M/W6gy97OFHh5De/lp2MHVtwgp9PkR+Cn6HLdO6IQUHv9U9WmNYsFehLtNN1DqzYpkia
         Xe8A==
X-Forwarded-Encrypted: i=1; AKwUvByL0YXguRzoVteQyjwt64CvoVqK2aJ0Qeg/l4OzwaOtjDa092MIHFKhIs82IwFzASGpBp74QzZcTeKdaLJ7xOOY@lists.infradead.org
X-Gm-Message-State: AFuF++kHbI69arObVUUMGuTXnVSUzlB+IUw97b2hIBMowRYTMvMQdGDZ
	CzGg8wV/Go/sfJTfSfC8LnIYFgRk+n54HINhA6IWMsa+6wP49YzqkCQzZCm8HekWSq0+mQ9LAqo
	SKEy0ZBtOZa3KSvAu35XmMRaQ+cNTdAyrXD4h9bsnhPmQ4BbbSAQivTKz5KwqSaFlxhq1YjVaIn
	dvIqy4JirQ3dmxBHHLKat42y4FMsbqRZHclKVOsqPjrIhWYgKa7inTdVDOSh1xnpRx4JM6jS+C8
	QWvaFYOr44ai7/FZv8CNkoCX9O2gfE5nsM=
X-Gm-Gg: AYBFou15mQ8lh4iLBPgFki43l/uRug0MvRDrap1fEM9FYbEAJMdM16eptXJlTQML3ku
	DVTzttj2RRdPdowBLlnDIKxflWEHweq3h7zZZexv++ssGgEfCnQgUhfsEPjmdfXJFpHMJi9o7ba
	a19dwVm9xoMBdbajIhdl953tlP0jsBLa4AhJTCKl+enSSH/FvkixdOWLdrshZM9I7wRI37xDIkV
	3xb9WCr2sHRdCBQlgWTeORhTv5ALu2nEBUSZaonMfMELM9NP48+HOcFh8oyDZVYO+huFlqEP25W
	BXqhumWlqnSUOpzTMLvkBubQLs0FhNZj0BcCo/PJFzym406R3ZS1r6iAK7K162OEEZpUubjip6V
	wE/NXQisBz5G7lNDmtvy5dgJZdYBCx9R3kzwi0QMjmI3BvyQA13gx1lqfPqtaVKPiorGno7Gqx7
	kXCLAiRYGQh2GpDxFKoUxRBOEx+e9P7Ji6Bgz0PIwy
X-Received: by 2002:a17:90b:394a:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39b2613150amr1237252a91.6.1788464416682;
        Thu, 03 Sep 2026 12:40:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b15caea34sm1456134a91.2.2026.09.03.12.40.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:40:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so232046a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788464415; x=1789069215; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8+z4kiOtdTmn8miWX+XqbRCAv1t3K0Ial/sw+P7zoA=;
        b=dZluhrlzLSHgJT68WRqDMeYYakCNdbZDUWE2ZGa9O0Sdmar7ApPfPRDom2N48SY//N
         ORP7+qvT2jl2RRuyG+TWXAijzHczW93HVvr7SWXTu+2piw8uVkrGwXuya+7u0JkSTLJr
         LtzlaJwQvUDjv68ApsDhSdBiTDyzEUaQ30u8I=
X-Forwarded-Encrypted: i=1; AKwUvBwcFXsgZhnd3e8KLkOhW/4vpkcwP6Cf4EoI3cdm0HEbsaIE14k2zZTPI4gzLkkcv66nNfhGJ53AlcpguMdlQ/vO@lists.infradead.org
X-Received: by 2002:a17:90a:e703:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39b2629926dmr1274551a91.24.1788464414675;
        Thu, 03 Sep 2026 12:40:14 -0700 (PDT)
X-Received: by 2002:a17:90a:e703:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39b2629926dmr1274468a91.24.1788464414183;
        Thu, 03 Sep 2026 12:40:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm1124198eec.20.2026.09.03.12.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:40:13 -0700 (PDT)
Message-ID: <ba2ef3fe-5be0-4e1b-a2bb-f0832fc4dd95@broadcom.com>
Date: Thu, 3 Sep 2026 12:40:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/vc4: Use the reset controller to recover from a
 GPU hang
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-3-896444373716@igalia.com>
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
In-Reply-To: <20260816-vc4-reset-control-v1-3-896444373716@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_124017_801904_4F070318 
X-CRM114-Status: GOOD (  14.50  )
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

On 8/16/26 07:05, Maíra Canal wrote:
> vc4_reset() recovers a hung GPU by dropping the runtime PM usage count to
> zero so that the power domain goes down, and then taking it again. Such an
> unconventional approach only works if the driver knows exactly how many
> references it holds, which is why vc4 wrapped every pm_runtime_get_sync()
> call in a private refcount and mutex.
> 
> Commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains
> under a new binding.") exposed a V3D reset line for exactly this reason,
> so that the block can be reset without power-cycling its domain, but the
> vc4 driver never picked it up. Use it now, which removes the need for the
> private refcount and leaves vc4_v3d_pm_get/put() as plain runtime PM
> wrappers.
> 
> The reset line is optional, to accommodate older device trees. Device
> trees that do not describe one still get the driver-side recovery in
> vc4_irq_reset(), but the hardware is left untouched. Two in-tree platforms
> use the VC4 V3D block: BCM2835 gains the resets property in the next
> commit, and Cygnus is no worse off than it was, as its V3D node has no
> power domain and the power-cycle only ever gated its clock.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

