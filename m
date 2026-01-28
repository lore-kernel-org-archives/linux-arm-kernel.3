Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B08D46BFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 21:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDDLJdqPk1Zlja9ZPS9PNMGzgyrH9rkUy74PKjqCyw4=; b=cNvxqaqxRKDM2VuHOWZyJ7jJ+y
	gSByGLMgMlOXatZqGA1jCDf6gvWQBWUTpNFao5qwAH1F9+Gbcm5L/iSNpEBWydnhlDnE/+0vs2CRx
	lFWQLDyF98IZFCN+UV7BqI9M5vJ4nJydFxlS6qBW7dDtyo87hoQXIpUXHn/ljC4qUh7Cj2S4S5SHA
	9CiKF/3mAJ9+kyHX/b4IIaPEPMYMd2F+DY2pkhFIk5odkeKnAtbKnlnIFejpgh7Yq75x9ZZwv0fI9
	/PtzhKWL46HVlDnMJ0E9C/sdInEiFRWfp5pOolr6iQObKVIhf+XQfpWfbWPLj4GdqJGoOznQ1yMzQ
	IcpXFbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlClJ-0000000Gosf-3JQn;
	Wed, 28 Jan 2026 21:07:41 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlClG-0000000Gos6-0FV7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 21:07:40 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-2a7b23dd036so1053165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 13:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769634456; x=1770239256;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yDDLJdqPk1Zlja9ZPS9PNMGzgyrH9rkUy74PKjqCyw4=;
        b=d886uYMUIuS6ibfnMINblmXguqyl7pU6Av/V00spqjJY93QTOmJuzkw1mY1OHkhuCC
         17FbKwgHYzPk9/GOd0GezHIOUykok6DmZVZLPfCbgI+uQcA7Es7sqW8xYAz+nQmXG43J
         h+inY5YhfEO0yBJzhAIcQnw2deEOFdygSRaVUS9mxj4Q/+eRUadGkB4RyTvBOdS0ikLe
         UOxl35lDJF3p2wyWgBsOEvH8GpipX0sfMFt1nn8ok1cD/rgWjEhldRavtfA4owaXgV1U
         sp5G62WM9f0WD4gal7xCSLl4679tS8aUtGFCQyTlwV5U8tagTB5n8Ky4VdCGCy5+cm5e
         N0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCX73Xfa1/yOVDHAJYwulCAP35Cp2mU+xwAn1QiZkKUbKgSr03c479kqiVE9OODokho2cpbfoNo+gKqrJ9AtuHRR@lists.infradead.org
X-Gm-Message-State: AOJu0YwukGfd7HmXO/Y+bjbdtJPqOjFmV0ZYvfZbQ+GmOPRsN3hBpp3i
	4w2Fd2/SydeaS931THZr7NsZvMl7Y/YWYZJmP7TeC5JNmdsIk60EUOr+aCaCwR+5LHwtM/cgURW
	gr8bXPwKgaIP3XTq9tB0CvXnJjwTyE661cvFXQkPyupHrHA0Wh97eFxC3MCdk/gZf/mt5WQYBPd
	ZgTnhaAuWauF3NDjErK0sH8PTT3uXi8QyZc97lna7+pzHYEqLorXRjmsGp3tSRNNZhOSrhBSBJQ
	zzBN+LrlnlTNHMM3b7jKHGqaW9mnMBnVCY=
X-Gm-Gg: AZuq6aLZ1MAy7TgJo24U1b2ihJyf7LpD8KGq+ngYsU7upFSSaMmjf8MhvlGHEDwrhV3
	AFkgU8/mZtTOvbKjygBLTZeS1Ayw480d7EGeerZJMqkAQLX6fIRja1HpKHs+bOOBG4Uc2Rgoa5k
	OVLK8eCAS2gVIoyfJTgZdPlufHaROvrplJW4MAqDW83mBwGUbhipaX8UEei3zeZYhsWAUThTshl
	aIn/gHbH8ADDr4E0XOHdm51ITGKDJSWcE3Ouqfz5H6kLh8D3sZM5eJK2PlKjBsqa0GiCjM11kZy
	OSUO0TUi0fq+l1nUsW64at8IfYPWtlc39g7YEqg0//SXTT6+QPcpq7TOraVMKDs/UMWC62GpIUI
	1mXMpxzPXt2XJ//M4/KTl/ND4Vv/cOgW1UgNJmEdVTxzumLx3GzOLIEMi46PU3xfI7hyv6bBAII
	G9Qe9oGDTvS8KoGLuuPUMVdyTbGImRDLU6+U3Ohnrrd4PyO/tkLg==
X-Received: by 2002:a17:903:ac7:b0:2a0:c1e4:e25 with SMTP id d9443c01a7336-2a870e8d1e3mr64472675ad.54.1769634456541;
        Wed, 28 Jan 2026 13:07:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a88b3eeec9sm4288405ad.12.2026.01.28.13.07.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Jan 2026 13:07:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12339eea50bso1504837c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 13:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769634455; x=1770239255; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yDDLJdqPk1Zlja9ZPS9PNMGzgyrH9rkUy74PKjqCyw4=;
        b=f1rj3j1xhnJG66coTfM9LX/z7UO2oLV1vM/0T2AB4dCC7FJukL3q1YgZnII1P+GiPg
         AyHk5jw7AUQ7UzwM2QEtgd7z7UroQ5sBCrm0Vr1xoG8B7uMG6Lx0SQgPx5BQmGjg8Tym
         ooPTamTjcHlT7UXxH8sAHtnCy/V1tjGXFF4q4=
X-Forwarded-Encrypted: i=1; AJvYcCVPpBI1tTGavNWy0PEH9dxtOvX9qfAb3VhOFMScs3AL3aDr7c3ae0PtkgnVDzN70iSXK4RyNOyOt8JM4sWgPDT2@lists.infradead.org
X-Received: by 2002:a05:7022:791:b0:124:9faf:4dd with SMTP id a92af1059eb24-124a012b15fmr3536824c88.47.1769634454880;
        Wed, 28 Jan 2026 13:07:34 -0800 (PST)
X-Received: by 2002:a05:7022:791:b0:124:9faf:4dd with SMTP id a92af1059eb24-124a012b15fmr3536799c88.47.1769634454395;
        Wed, 28 Jan 2026 13:07:34 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f789sm3869245c88.6.2026.01.28.13.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 13:07:33 -0800 (PST)
Message-ID: <ad644270-4236-4a71-b301-b912b0cd49f3@broadcom.com>
Date: Wed, 28 Jan 2026 13:07:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: ns2-svk: fix AT25 EEPROM node and
 properties
To: Lee Yongjun <jun85566@gmail.com>, rjui@broadcom.com,
 sbranden@broadcom.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260122161823.105404-1-jun85566@gmail.com>
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
In-Reply-To: <20260122161823.105404-1-jun85566@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_130738_207759_00C57962 
X-CRM114-Status: GOOD (  12.63  )
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

On 1/22/26 08:18, Lee Yongjun wrote:
> The AT25 EEPROM node on the Northstar 2 SVK board used legacy vendor
> properties and a non-standard node name, which triggers dtbs_check
> warnings.
> 
> Update the node to follow the dt-schema by:
> - Renaming the node from at25@0 to eeprom@0.
> - Replacing deprecated "at25,byte-len" with "size".
> - Replacing deprecated "at25,page-size" with "pagesize".
> - Replacing deprecated "at25,addr-mode" with "address-width".
> 
> For "address-width", the legacy value <2> corresponds to the EE_ADDR2
> flag in the driver (include/linux/spi/eeprom.h), which is explicitly
> defined as 16-bit addressing. Therefore, <16> is the technically
> accurate value that preserves the existing hardware behavior while
> satisfying the at25.yaml schema requirements.
> 
> Signed-off-by: Lee Yongjun <jun85566@gmail.com>

Thanks for your patch, however I have something from Rob already queued up:

https://lore.kernel.org/r/20260106-dt-dtbs-broadcom-fixes-v1-9-ba45874e4553@kernel.org

You could re-submit the portion of your patch that renames the node?
-- 
Florian

