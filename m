Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB535C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 20:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nek8/ZvkBcwqsEpdKKDo1AmriorOCRUNaOmJzZVPf30=; b=xtBw7+uHwCNN3NZQGwGYToRPzp
	E8hddKxr8dNTynlZOOLVRzwmGNT6+dPRrImKnUcLHSKkQe/3w+hQBd6OG02BM194y34xRZzZPQzjy
	hVjfnmaezjZpBVJtc7DfzagIE7nvUNXKAl78C9lHwLcke5hjPmximqDSFK/0L98ZKRR/4nsXQ+GSC
	eFIQZ4Y4/+y6B8rRyfY5v6c/jO4qxvAHgTLU8Vd+3g75qfNDBuQN/J121QhtMhsXAQxiy6yOhmagq
	JxaOTFFmvKnMby9DvxzO5V9VpMyWaYtRvogA0EftSpULn2xbCYN5gpl4AKa/obQBVFAYyb77jmGSa
	fWkJePGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpu5X-0000000DZ6u-2TU6;
	Fri, 31 Jul 2026 20:44:15 +0000
Received: from mail-ot1-x362.google.com ([2607:f8b0:4864:20::362])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpu5V-0000000DZ6E-2ChW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 20:44:14 +0000
Received: by mail-ot1-x362.google.com with SMTP id 46e09a7af769-7ee125ec926so990618a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 13:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785530651; x=1786135451;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nek8/ZvkBcwqsEpdKKDo1AmriorOCRUNaOmJzZVPf30=;
        b=Cf2HWpsnwrTnJctE81xPo3hlH8Dg9jik8Vomyz+LHyUKUwclfsjTA9ruhhHPL5Qe4P
         /eQ4yhH1jd0NPT2Crwmi9uAMcwsLNzaOsPNtZ5pqbQ2IfGknvPYvpncfxsqy0w5fwQVW
         4pCgTZctW9IsLDdPzCHyFH64x9kdlm24LtX2DWSJyGDoJL2fJsXsqNChTL5uBgpRH11o
         THns2wFe1OjQHdIH0Hcuz1+JWDkJn3lPhnbscf3D0I/VauvSmbef1WfzTXtCVPb4U9zV
         nImpRjuzZ7VyOZisspBxNXks30ZKMTn7lCpuMs+wRTjVP2knXUitn6dhTm7MDtw37T5A
         lQZw==
X-Forwarded-Encrypted: i=1; AHgh+RoP0tLqX8HBQYoAEUr47bXryNVOr53vriHC7lRN3VhjLn+VLA7et6r6k9H8vjtPgkW76FYwk27tthTOr3KqoBYV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbp6rCJmJLQtG+dkPqkyxz+I1C7D2bGaT3jAoaLr51QEst8wFe
	+XmQriQziYnbFEdJ2moWRiNYXc7hkukpYPhLqkgw6KDq2p5a+3bz0z4uS6gw44XnIgDi2PPRsQM
	SxO6owyRoT2JAGOcqO5GhRnN6CnvoT7tsFEOy0ZL6qyePZHnjCUoLbDMeRZPpD+bi43/4R0PdAj
	TcWVX8EzRm9b89OY7IXNuV8floXYKIiPI1EMo0FBpSZG363S3aBlN3SyW27ZVZEsmlialApsqTt
	Uyxa0BfOVxJMQgIf/RnWX0hNmEq0ktrVDw=
X-Gm-Gg: AR+sD10T24AHw7t/x8PNFQv35zMtG7Ykj1nlD5RwAOs6iYNu3CPL41M2/kJecKDVL26
	1NIgCvBc2LZ6QN4SioNNN3QX7MSNIgYNyL0fbesxEYQzkj2ypTiuPYi+syu8WMLco767LwkS5Na
	Kb1BcfvYl8Fl7QAkR5/FjN+lPnjp6DJ7togCAh2PI1Fz2pKUthfZRuHKIM35qLak/JL94LSzuP1
	KxrheXYfZQPGrz74M+Bv4Z825AU5NM3ad6pJ/UScZKIM2ebc5mhOkZjOdNoI/hYIFGB4iBhhE9E
	13hHHBcTURproCoXgJ7LXxdt4XAWGodzgYUyg/Vx+YMUtQsaK4dKd9O6E5AcKYurLbYCIgvNC6s
	p/Om5opUOOuh/eIBle1F57uJXkas2SynwuDVQLDjWkiaaeXlQoZvhz9Sa/PrNrpXLpJ83fOBIYq
	sppNxMsL2rdSNgD4ca3xP5kOm2sOmUWU5w6l9972Xz
X-Received: by 2002:a05:6830:2647:b0:7dc:d967:63de with SMTP id 46e09a7af769-7f196c3f412mr2646058a34.3.1785530651007;
        Fri, 31 Jul 2026 13:44:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7f18ed2fe15sm133501a34.2.2026.07.31.13.44.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 13:44:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso1613253a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 13:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785530649; x=1786135449; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nek8/ZvkBcwqsEpdKKDo1AmriorOCRUNaOmJzZVPf30=;
        b=h7jOJ88XZGCXUm4ZjWth16+XJWKQtcb2UQ9t4JlJQToIGVwVnaSCrAnBz4jQySChu+
         MSOEQxI07k181ynzCKUk1PNwZ/orki4G3TbzfzSKZoFi6aFYRSO/Zsz7+1sDkynrb2Xh
         MZ+uM4CX944sShIawiB0nqMDUgZVZweU0ooFo=
X-Forwarded-Encrypted: i=1; AHgh+RoPPiMmGOBWBEV7Jjy5iFitogEqeQlbPmty7MsD96eqkBFY7oe6gPqhrwqNEARpYX/gOBS5Nr+6z0PpVblQ6H8Y@lists.infradead.org
X-Received: by 2002:a05:6a20:9f46:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c92a74cfa9mr1160611637.25.1785530649421;
        Fri, 31 Jul 2026 13:44:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f46:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c92a74cfa9mr1160592637.25.1785530649028;
        Fri, 31 Jul 2026 13:44:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb51asm9239344c88.9.2026.07.31.13.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 13:44:08 -0700 (PDT)
Message-ID: <d27d0ad7-687a-46f4-b6c6-f34f3232f1c3@broadcom.com>
Date: Fri, 31 Jul 2026 13:44:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: adjust display status
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250924085712.1040284-1-pbrobinson@gmail.com>
 <37220187-7369-4b20-8e00-0846ee0ee6fd@broadcom.com>
 <CALeDE9MfhU+hL-d1vruhCzN5vvb9LsR8YwDPOR1XmpLcygLbLQ@mail.gmail.com>
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
In-Reply-To: <CALeDE9MfhU+hL-d1vruhCzN5vvb9LsR8YwDPOR1XmpLcygLbLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_134413_565475_5BB96149 
X-CRM114-Status: GOOD (  10.64  )
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

On 7/31/26 11:51, Peter Robinson wrote:
> Hey Florian,
> 
> Not sure what happened to this, you said it was applied almost a year
> ago but now I dig I don't see it upstream.
> 
> Was there a problem, or did it just fall through the cracks? Should I resend it?

Looks like it fell through the cracks during a rebase, sorry about that. 
Would you mind resending it since it no longer applies cleanly? Thanks!
-- 
Florian

