Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD210C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 23:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0OARD0PLF4mIwzcACpuZC6ushW9KkulR8L/wcLq6TE=; b=jZBddBTRS2ExWWBjoro9MRd71/
	IykNfKYw4kfooIFBos78J9L7+5pWYtCy1E/G019sWB5neHvG2huLWm+jCDgp5ANy/8svQdZq34ZRD
	m2NcwRWlkuw4McWYFpai3J4e6EAfrYxe9HLy1QSbwqelkxvMRa4wrJD8Mesua8QLx+kqGop1oVlbE
	K06y9dPfjSfYyGIeysLnF92pcmAaO2DHbI+JZN2y4BeUt1Gr86VITDjEpkXYJM7Jt0Sz0QR+W5aXu
	New8meHWNtvlkhChkDb2xFKgqAWsdReCY/V/frKz6T/Fc4ON1qc6lnxr2jKLRv3k58hzDLAtPkxDb
	X6jE8ASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zXP-0000000AICf-3JOF;
	Wed, 16 Sep 2026 23:59:39 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zXM-0000000AIBx-42u9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 23:59:38 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso95706a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603175; x=1790207975;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V0OARD0PLF4mIwzcACpuZC6ushW9KkulR8L/wcLq6TE=;
        b=1uoUPocASGlNHGneveo9B4XxJttp/U6IMNlYixdbxnW2vzEK1eXCIUYWxz6FISmJfs
         sOZyvXYy/MK33bbZjFHdAE9EVzU0Dyewdy91aOlOX4tqPI3DtWffMc+x9PTOfrHHi0z9
         S2ARERltQR8fHIP8q8spvuNbGMDANVEZcHzRcygu9jyzSvnbCqZgxsB1LSgV61P2pw7O
         ZmPp1KcNpKZ2txcTCqzJJGAX2mzfrcsVikuVl2UgbFCIywu7RO7rpxVvhF0dZ5/4MrHW
         sFHo/HUqAW/ZASPGRFzW7ZZgebpUsryBIdPB9Bx0nRw/sMqNtuX0+Ewv5QLshN8Z65NX
         VS/g==
X-Forwarded-Encrypted: i=1; AKwUvBw+gDy45AADapt4PFm7DXPj0eq/87Xmt4gm+43J7NCFM9lH8p321s3fzgWAnHEhz3zfhYdY7Glw622gmqnAn7Lc@lists.infradead.org
X-Gm-Message-State: AFuF++mvvJTx2Tf6SJ+gXfatZKDYFKzee5x6QXitptfJ/YBVy7/FAgTk
	8Ijqt/fZEEuRv85498soUQUvRpVgy0oiUahxTl3AWyroD0n4mK+Wc60HgBzuBn1J3cBLqC2GWKS
	jqB8LIcDjmwM5pdfQdMUlZEzArNSeDJCKYyTD7XiemO3kXH/ktsOE87pdd7Otpd4erqsLfA0e40
	MYPMWGOo+HwaCvESLBg1Nf4XncuOQ5fWgMx3pI7lwVWsZ1KX1MwdKpmf4SoqTyzmYujxU6c/y3x
	nouZN1VALeLqBzfNIZT71zq0vibb9vSagY=
X-Gm-Gg: AYBFou20uFUIgy6X/CKq7pq/XF/ms901CIVklIJmVkVU3rLjC8mDJlZvHb4pXYy2tIv
	NJPGTY5jreZGK08CJR8X0C+fJGeADuOHoV+dwzB4HJ+BJQ97d3S7FLy2IFEUk/NPIsU31YHLXBP
	X7GNEEP26pCjqJZ2HO7kyYbhQ1RvDE5fjCFysSQC4jvEYrO8/Cjmwv632znI8l+fNSHsIXYPhHW
	RehOPFukBz/GQXHx2vcRlc3o85h6vNc1fpNj2Qz0Th5Ou9In2P5S5d6dR9eEDc1jW1l24J9whvb
	ISw5oCcxCU6+JB9KvCTsF1dAWP2iYbJLr9imK9xqzIzDaexeMcv5ovvkniTiWksOxJPE57PCNL6
	J4dU4Sk0J/7y2T6RFydES6StmZRVzuhP8QjznN1nZQWS22wGg51LDgTmEK/BtJHwUyQ2ydxFDJI
	//AVYvNlPKhsrksVz+OFj2PD6d5BLIClwqvTH3rajQ
X-Received: by 2002:a17:90b:3c06:b0:39d:fcee:8d10 with SMTP id 98e67ed59e1d1-39e1e48f686mr10987126a91.16.1789603174780;
        Wed, 16 Sep 2026 16:59:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e362c64b6sm527666a91.8.2026.09.16.16.59.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 16:59:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso188085a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 16:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789603173; x=1790207973; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0OARD0PLF4mIwzcACpuZC6ushW9KkulR8L/wcLq6TE=;
        b=Sw//kIld7Rwg1Hmb2fEjqj+PBiQbEPfgv0Kn7gcuZ0VYqIs5qn6zFTm+srGDxpE/gq
         LTamzV0h7LbMdbaaCgNTOy/Tb3oh3Ct+Zv9EYYmSjXSneRpDSeSH28WqSMkn3226DyoZ
         kqRG/PdgyXeqoWZMtBxR22EBqX+1eS1VYlcbQ=
X-Forwarded-Encrypted: i=1; AKwUvBwEFNldpWbrZLpLtZRRJeEINCU4hwNsXmwFN1AF1YJ566nAieh7KQoRLeLyctT7LAk4VtuFS+/5c66/kA3WPo/O@lists.infradead.org
X-Received: by 2002:a05:6a20:e212:b0:3cd:7ba2:e669 with SMTP id adf61e73a8af0-3dd5f45d85bmr11067016637.10.1789603172973;
        Wed, 16 Sep 2026 16:59:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:e212:b0:3cd:7ba2:e669 with SMTP id adf61e73a8af0-3dd5f45d85bmr11066949637.10.1789603172424;
        Wed, 16 Sep 2026 16:59:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm11074324eec.9.2026.09.16.16.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 16:59:31 -0700 (PDT)
Message-ID: <9a741390-503b-403d-a34d-d4919edf1d8c@broadcom.com>
Date: Wed, 16 Sep 2026 16:59:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] PCI: brcmstb: Remove redundant const specifier for
 struct fields
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
 <20260911233541.1650895-2-james.quinlan@broadcom.com>
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
In-Reply-To: <20260911233541.1650895-2-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_165937_053361_3C825AAE 
X-CRM114-Status: UNSURE (   7.01  )
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
> All of the variables using this particular structure are declared as const.
> There is no reason to declare its individual fields as being const.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

