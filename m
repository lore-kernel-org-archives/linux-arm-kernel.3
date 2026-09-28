Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9722ACA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuQw+B0kSq5FJU56nD6/IW5lKXSJDgEpfGuGLprZ8a4=; b=VzcH3ItaoQN47R9PEnRtiF/7ET
	kPvV+DXTB96XLad+JCB80DkUclFjrdd49ln1xS5Qu8DhhmhRPm37qPHc/oda1n1j1L4o95w6RlJp2
	xByEvcFWgMtORZeqd2XXCsYBjyH5mzdC2mBjVMSHBucVi6s1wurD3wz5jz4xbiNcStobQypzFSAXe
	S0gnOEPL5kH+m94u3lCWp+R7TxK9A6YVqVRUAaG6rpTiPR1uD7IDcVAdvcPWvOzvfqJmDtsH6r/LG
	qokZZkwBbn7i85Qoy9QdZOM/nB1Mg/9dCPl3cAtaLBgCZzzvhN+mHfnrTclkuGNj2sI2mTQEwi+2T
	4VDZYiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG41-00000001JiE-06rb;
	Mon, 28 Sep 2026 18:26:57 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG3x-00000001Jh8-2hh0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 18:26:54 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-3a0e8165edcso1218208a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 11:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790620013; x=1791224813;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FuQw+B0kSq5FJU56nD6/IW5lKXSJDgEpfGuGLprZ8a4=;
        b=YuhOpS0ba1c9OPemLqPU3u0MtVSc6ITqTlvdH3E/seu3MYduZkv260e+q7tv8vrnuR
         3xd7R5tJA8lsQjFDKqjCSO4ckB1wI72oc26EMv9lQ1J1LcfwhoQ53VGkkrrbK0oXrG/Q
         wanWRAF+FkRldCRCCxkEqRbEBOQ4V0J8+wRkpZV3Q04F0xrnE0QupQusoBizTliWVQBZ
         /KYn4x5l974KtPOCaGizHveplyCWTgtLfW6B/mkFJ/VZzMPxGrsMcb8nD46siv/kgpM4
         qFceuSY0IsayHYaDDzYhrSX0hrotlz7ySg+0LPKrFDtB/gjCcYBfMHbFqvxdnx3SLDPp
         hSGA==
X-Forwarded-Encrypted: i=1; AKwUvBzyw0c2SVEXHUM/FAeCuW6cluvHIv9y8IKByP6mJ2pvHvT3fmDelBXz/Z62WuT0B74Je5NohufxCdQHgCxSEBrD@lists.infradead.org
X-Gm-Message-State: AFq9FYJtMBYk/jzmBv4E15ShsPTwPsXgD1pWpVaDzDeCAmFBty2YQHgg
	YKZfb30oQY8/9CkT5HnQrin7ADWGUkBPZPqwqiJlQ/vjrNQo+hiSlCDc8oMa61C/OvOk5nHZjkb
	RD670o7hi6nbRdL7rvx0Aas9Kshi8zK0LugArXLr/cmGjQqv1dQSd5HiV8qrVtyJ/Nky/0sx9C5
	Bc+kOsoF1HHlp+NP2D/oaDTZsFLZrtRwmaui0IhsvPBeS6nUQjimMzdATPnAyA32gph5vGSUHUd
	fVHuDK2pP+ne1krrL10hM8w2n8QoLDm6JQ=
X-Gm-Gg: AYBFou3dLHl1qlSVCy4sFDbuKytObx3sebNAnzgCUpuqk4JXOgh7qBihY+oKhEeJKyZ
	EZWMiH9ywSogkb5E5sSmhJduQ3dnJBylEncksE34Oas3qZf8lWVM4OMXNrTfUPc/a2VpSy67j3k
	p9elMqpkG0VhVz61c7uk/mdTLr4RUZrHULBLj3BQqL8ec+1wVhu0RNA3+1dU6LI4Ch6rgEFTjBP
	pjmSBtoueFIgiXtPeggnp1Ei9F4IMQwB/HeTfIwB2m0/0bNFwao4E+BfWZXIm8wPYZHZBQqx/rF
	1KWbkgMOhy4ofHleYcZjr04E5JPUuowKBiC64YaU0ES0bRF/YErI9MuzjdCn3MN1BuMeHcCVE6f
	Bj6dD5rgFKrYYHd7CdcP/9wlfQlblXbhfZ86UvD9oVtyRvv1qE1Gef5AGl7OSrC3+GAPgYh7lYo
	SFJzTK8o6+94bT0a6vPlQVuT929cOQjYLih7C/3cr1
X-Received: by 2002:a17:90a:d40b:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-3a0bb573f4amr9170058a91.15.1790620012655;
        Mon, 28 Sep 2026 11:26:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a497e9ab17sm218976a91.3.2026.09.28.11.26.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 11:26:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bfb2da664so971120585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 11:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790620011; x=1791224811; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuQw+B0kSq5FJU56nD6/IW5lKXSJDgEpfGuGLprZ8a4=;
        b=alYtHpQShrsMhQtd4MmkAKqkbLCOka/nHUJtLB2WnJ9NqFk/VStomZu4w5zqy1bPUW
         fZGvEP1K0WaxI42ypnhWoX/OMP7+q0Yy2qzY4Nlje9GqtVnooL/5OhZbr2WQSgj6tmKC
         n2iIbxaN4KCeH6rr9kJWfltSzpt3UQJ6KwxPI=
X-Forwarded-Encrypted: i=1; AKwUvBxL4pUIblLG+onWx5wy+nrk1+7QuvzYg4u1dCdrsTLp1e/SAOtZn9DgmGfgO8sUU+DnJPRg4Ida6Iwf/w5DRVhs@lists.infradead.org
X-Received: by 2002:a05:620a:7117:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c474ff392mr2182136685a.46.1790620011082;
        Mon, 28 Sep 2026 11:26:51 -0700 (PDT)
X-Received: by 2002:a05:620a:7117:b0:93c:2c15:e51d with SMTP id af79cd13be357-93c474ff392mr2182130685a.46.1790620010447;
        Mon, 28 Sep 2026 11:26:50 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c8147c4desm205669385a.39.2026.09.28.11.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 11:26:49 -0700 (PDT)
Message-ID: <6b61fc5d-1f4c-4634-8d61-2f090f0f7c3d@broadcom.com>
Date: Mon, 28 Sep 2026 11:26:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] Add support for Broadcom BCM2712 IOMMU driver
 (Raspberry Pi 5)
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, dan@reactivated.net
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nick.hollinghurst@raspberrypi.com, james.quinlan@broadcom.com,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260927-bcm2712-iommu-submit-v7-0-dfa2b975cbc9@reactivated.net>
 <arojDdPH1o2ckB5x@8bytes.org>
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
In-Reply-To: <arojDdPH1o2ckB5x@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_112653_704266_DE10EA57 
X-CRM114-Status: GOOD (  10.02  )
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

On 9/28/26 01:19, Joerg Roedel (AMD) wrote:
> On Sun, Sep 27, 2026 at 02:08:59PM +0100, Daniel Drake via B4 Relay wrote:
>> Daniel Drake (6):
>>        iommu_pt: Fix test_pgsize_boundary() failure on narrow-OA formats
>>        dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
>>        dt-bindings: display: brcm,bcm2835-hvs: Document iommus property
>>        iommu/generic_pt: Add Broadcom BCM2712 page table format
>>        iommu: Add Broadcom BCM2712 IOMMU driver
>>        arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes
> 
> Applied patches 1-5, thanks.

And applied patch 6 to devicetree-arm64/next, thanks!
-- 
Florian

