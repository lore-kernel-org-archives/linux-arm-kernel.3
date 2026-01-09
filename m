Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12149D232CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 02:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtzZ96Fs0FxeUrUvuO6Tpqlup0fsxdHQlmZgiRttQVc=; b=sqRCsoCU0/Y9Fakb4CjvikM4Ly
	Cjt2uRnO+NnT+opNN4uBQ8EqHHyXsv5X5BeJOF8Pmmg0twrpjXD0B0XuL6kERHSHvdKXfEs5ObgW/
	858yX6HD5ayzGvKv0VkcXr/BdhGMgYlz3Jyeeaf1kaChD53ROpIlZrsi7HpiMcz4Set7/aMb/sm9x
	EnsoFXowiiXx+QzPJTES7KZKlSraTjwQGQeYyPvwhU+k0zGnscEdZ0AJqL+/YKA7B1WU4nyUjRyTB
	GN1ESP2hhIw4f2+eyr1dhE3ukaJBOmKj/w5PAs3IPe0aBHaJiPCIGix1/lb6nCGw+2JT/MLLWKW3P
	hRQr/o1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve25f-000000017hy-0tJ0;
	Fri, 09 Jan 2026 02:19:03 +0000
Received: from mail-pl1-x663.google.com ([2607:f8b0:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve25c-000000017hW-1KDn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 02:19:01 +0000
Received: by mail-pl1-x663.google.com with SMTP id d9443c01a7336-2a12ebe4b74so38522885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 18:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767925139; x=1768529939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WtzZ96Fs0FxeUrUvuO6Tpqlup0fsxdHQlmZgiRttQVc=;
        b=xTAXod5OS5x5yUJ1AxC3ycvM7670Uf9pyYXzfA3guaJPhxJ4M6vvppqGXQtfodIXVb
         gJ9ArlCRjtbW2MZTf23by1C5JMWDHERzZQS/9FFVipHgqJpczGClBghfDK2G045gviME
         IyL2zF3n5H45Ot4u+NThMaEtt0tZm01l6wvg3SltO38qy4RRaQCUGX+vf2sujj/ktsyI
         QS1u2PuuA7WAd0llwuOaaVoRSzMIIAjiN9AL9PYpQM4gVFe+/UpcY1/zp80Bj+/fahvO
         YUl43h1EWtA/fYKMjsa1RQpk6i2yAGcZ7dw4ixzEM7m2Hz+doH02KyYKSkuTfpp0du6R
         /+dg==
X-Forwarded-Encrypted: i=1; AJvYcCUxt4H1G+KwHU1NX22N3rJa8fgP5ZUhnVokhyFRhP7pDoqd7ZSSQDXYYKg4e57PmhtJNvFvxZ6NYFH3z94b2+du@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4jBDmXCOxHjRLysKOsHdf/zBP1kGiQnrmV33DcJRg2OFJKXM8
	fn0foK5bWnyLsmfUAzjZuzF670A548uAFpOh88wuNOqMf4KEdeZCsxvk0DcDNnXCJnKPrdnxYPO
	fxG6di7eUPWH+N7Hq7nB17c1Dym1EoPuNSkHQpnnXHKX/NcHKiRL4YvH8yy+IMi33zeU8O3In/1
	pUeRDeZE7VcLtdxbAAhZ5bFL33XYqV0ZGux1tPsG9NNu9YriDMoM2hkDYhSw1lGFub7bhLppI8Q
	FmngOZ1XW6xnLV7wYO7mjdWWsL8Xl6ptX4=
X-Gm-Gg: AY/fxX4MsnoSC30wqE2ZgM2DjS9bGDpQAnW2S9lGNJZ3s6+e08PVxaGjTBX/W8aVnOM
	nrUx5xnK/VjHJzIGov7YQxBr10pTTUdmJL6heKFlVO1JSOdh0UyOtSOIygktiQSG7O33//R5+AY
	QBBSu00otJeWozyPy0wtpSlChxJ9gy9SiHL1vzpwp9HIBCigYpGzcReR3tObUtVhAkRXz+ub3uv
	cRBFkgcK82q+9yhHXzBjVzGWFHydqqQc/z/8klQMRLU9ay3JyJ7BVi43PUJSzoRKdyVVr8Z95Gf
	nk9W62LpzvWGKv/wL/m8HOeVTS6IucAyKLxmF8tpfWxotNEr2B7C0z7aR10l6C1pvGW5XODU76Z
	prqUAdsExkj+xbYhEZzztepIRrLO1hczA6gX2h5Swamrr0C7oMv1iItsLuBvQUhIH63/BBpmlDP
	H5WmbsmTQIR02YS9a5KtkyGFnwqbAP9UC010f0qPOmMvrr+kEJeOyv
X-Google-Smtp-Source: AGHT+IFNrWWYZQjMIth+Cz6FPKJbNwPHSR/CJj9vRKb4DlgCJk9a9Cz7eJHfw+uHDQBxRaKih5hKp4C0NyzA
X-Received: by 2002:a17:902:ea10:b0:29f:f91:35ee with SMTP id d9443c01a7336-2a3ee49a149mr79972365ad.43.1767925139394;
        Thu, 08 Jan 2026 18:18:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a3e3c493besm11181485ad.18.2026.01.08.18.18.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jan 2026 18:18:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ac3019faadso1550826eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 18:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767925138; x=1768529938; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WtzZ96Fs0FxeUrUvuO6Tpqlup0fsxdHQlmZgiRttQVc=;
        b=IOm7XfC71CxwmOSiUwDH9RiOmH7rAyAR8VKyXnWoOINWTU7k2J7YXMxBW3wlHpYjz3
         n9m0YyjWfB9a7H29oOLXhgZl+Jy0q/PfazpDSCXcGO12bO9SJTL8nIBMnO/SPakbbS5M
         HzAqk7O102NT5gvceB5/YvvgKE/P05NLBhajM=
X-Forwarded-Encrypted: i=1; AJvYcCXgFcm+nrnP+IqP9eOeRC3smO1vmDSiFa9hqSif+3sWBgzycy7580znVzpwz5Vz0WO3TQRm7vd1qKEDCo+z4jdN@lists.infradead.org
X-Received: by 2002:a05:7301:3f99:b0:2a4:3592:cf75 with SMTP id 5a478bee46e88-2b17d2959a3mr6296940eec.25.1767925137651;
        Thu, 08 Jan 2026 18:18:57 -0800 (PST)
X-Received: by 2002:a05:7301:3f99:b0:2a4:3592:cf75 with SMTP id 5a478bee46e88-2b17d2959a3mr6296917eec.25.1767925137135;
        Thu, 08 Jan 2026 18:18:57 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078cddasm10073775eec.22.2026.01.08.18.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 18:18:56 -0800 (PST)
Message-ID: <2472bd6e-9afb-402f-9bfb-3c364fd38da1@broadcom.com>
Date: Thu, 8 Jan 2026 18:18:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm4906-netgear-r8000p: Drop
 unnecessary "ranges" in partition node
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260108231558.1422454-2-robh@kernel.org>
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
In-Reply-To: <20260108231558.1422454-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_181900_516428_D8D96CF5 
X-CRM114-Status: UNSURE (   9.60  )
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



On 1/8/2026 3:15 PM, Rob Herring (Arm) wrote:
> "ranges" is only valid for MMIO addresses as it is used for translating
> addresses to CPU address. Even if a partial translation was supported,
> the DT is incorrect here as the nvmem-layout node would also need
> "ranges". So drop "ranges" and the associated cell size properties.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied to 
https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
-- 
Florian


