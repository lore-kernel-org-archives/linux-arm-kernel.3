Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0997F45A08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iL/wDueDK81KpWFHQVyT1E8fZaVKqccWK3qJorveH0=; b=OQcjEbdoxxMkw82MZfr/7wRTdp
	63dZVmpOI5YAG8YDvv2Z4VJXodho1lJ/hSFpU1ayuj2DQF0NrLXeBNBw1KL4fTGIEBfleg9CGd8M+
	hmqhkKrym7CItAJnPFOvX3Q6bxXYeIM3XC1HtJurYfo883jkws+XEBgCTYmoJs2lMptqvSftHoAM5
	7lYi6MOI0FliCSdTG+e8L6ju5sCpk84TnFTXcWm7k49Kjq21NfNZ1v4ET+EhqvRLL50W/5cKlHgBI
	C1YbRrzHwHBav71a4ain4Dtdb+VQ80tddFPZsKwO1W0S4HS+bbfNNDtD6lmMF+YLPU0IOJWR4B6qg
	SHGnd8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFSS-0000000CbJ0-19yR;
	Fri, 10 Apr 2026 17:15:52 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFSP-0000000CbID-0i7l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 17:15:50 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so1520000a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 10:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775841347; x=1776446147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2iL/wDueDK81KpWFHQVyT1E8fZaVKqccWK3qJorveH0=;
        b=Cxnc/FReYSJQbmhHmW0RI6CRrc1qvhyTjeKDqyYJaHeCZafANsLwKmuF+XDdoiMx/3
         rXy547RG/9e881ykZmzuImPZdmCJi74Bqn//WyLniWwTWI0uk9Ivtxv9jpC5F9XsffCR
         eAJZRbfcxyL042y1k23jliByd21eJSfQro/OU9h/qLpRBsoO7jrothgtVodZ1dFQorZZ
         ghTDEYyStS6OXlb7tPTdx6yAGrcBs+9gZY3eq0j4TuZ8txvjx4qqM1B9WEDxNKfPI6lo
         sgch/sTJARGJ50RWX4A9FguFuZFHRaLVOaMYaG3l09UpaSP5tuJ/3WnCn67hWuvtaDse
         sJvg==
X-Forwarded-Encrypted: i=1; AJvYcCWl9LkRIQXRCACZTGASO4Ap5mCMxRdrPANKHvvuGlhsO8lZvwm0FL2QSFU2DJvigEXC3EJin7sZ0pYzGwQzpt4n@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyrj36JiTpiMQ4hyDuSlhjo+zYnYW64ChrO2UMWhJe+MB0SljV
	ccQBM/PlM2rDSOd44c6gEyLaxj1K5uqbn7Wy7BQszNm0NLUR9YjKphnRs1OkGwyMTvCZQPqe/d5
	2ImloEp+QJ6VAkr489EPET2efiPG6OCJU90i34ck4ZEcrzEVPktLWoyAky5PPSlneujEezOz5N8
	aoAbwdnGqh0NiTzYEjejUOF2fMYoIKGvVfeTrOJNobJdSx/DBpmC3eb2jNdng9AYXvgsaxHfoMu
	PSu1h7rokzIMnHeXt/xKxYcnovatsHXbCk=
X-Gm-Gg: AeBDietEv9/EA7ttp7h4utyyFDUnTiVgFCFKODEl7uIUfNh+vSILU6+SFe2nTPyvWRR
	NIc/eeYa+hzgJOFXuPvMX4/wU36x+Mh3Av2gjbiFuPPZql/ZCPTa4BYCTCPGrc4PrxUOnPPgGRm
	qXbKp3gmo4oY6B2iKvQGR+252GAmnvE3jELzIcPgfVxYSPnKE7jnJT9QYkCIcJ3JtKBJTK7NCkH
	0cjUXwkSzME7DRDs2qtOc6dBh/L46LInL5AZM9VJyYl05ZakdajDvx0RjOKHHryfavwgp1RkoR2
	N57yNmLRBNEpqN8KYlDVSLjm0XxNQpCtk/fIvwvA18UAzdQbCUMQCES5lrVCxSM8lnc/9RJAGjo
	s5kQApLk664Q5poBgglJgj/JYjYPKpWpsx2FAXRWgToAPssNLvCDuybFKh3CBIbvS+CNLP398TL
	voB3P5nMxojkFDtfx4OyN6iNz+m2M+8YDzjL55xODEqZnxxLHaBMHFUac2HJ+/Pg==
X-Received: by 2002:a17:90b:184d:b0:35b:a418:698c with SMTP id 98e67ed59e1d1-35e4277386dmr4053299a91.12.1775841347056;
        Fri, 10 Apr 2026 10:15:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-24.dlp.protect.broadcom.com. [144.49.247.24])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-35e4139bf28sm324592a91.6.2026.04.10.10.15.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Apr 2026 10:15:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so2555927eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1775841345; x=1776446145; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2iL/wDueDK81KpWFHQVyT1E8fZaVKqccWK3qJorveH0=;
        b=W6tfwgpmGZVNwbkVMlusZzPwJX1sgzyWYrUF94Um+2BinMSCFdCm1JfU33GOlSCrVB
         JRatm7hSDOgB5Pk9s5xttNobLCxg0mTjX8KqrUPjOinaDOMAD197HfDw2ZZ4/aSy6lkQ
         N30ls3g5iH5xNneVOoQuUy3kZe4SMS4fOmRJw=
X-Forwarded-Encrypted: i=1; AJvYcCWlSI5xAxw8A6U5el5Up1k4RBneyio1j1w0BhXaKG9KpvEstLF37Uju4wtv6eF91Uv6b9PfE3ywCiv/StaYIDBq@lists.infradead.org
X-Received: by 2002:a05:693c:310c:b0:2c0:dc7e:ed17 with SMTP id 5a478bee46e88-2d5876a072amr2394242eec.10.1775841345115;
        Fri, 10 Apr 2026 10:15:45 -0700 (PDT)
X-Received: by 2002:a05:693c:310c:b0:2c0:dc7e:ed17 with SMTP id 5a478bee46e88-2d5876a072amr2394213eec.10.1775841344476;
        Fri, 10 Apr 2026 10:15:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d7d2esm4859615eec.20.2026.04.10.10.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 10:15:42 -0700 (PDT)
Message-ID: <d07def49-d18d-4248-bd97-908856d2359e@broadcom.com>
Date: Fri, 10 Apr 2026 10:15:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: raspberrypi: Change dependency to ARCH_BCM2835
 and COMPILE_TEST
To: Chen-Yu Tsai <wenst@chromium.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260408081150.1710717-1-wenst@chromium.org>
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
In-Reply-To: <20260408081150.1710717-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_101549_236378_B4629BC3 
X-CRM114-Status: GOOD (  19.33  )
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

On 4/8/26 01:11, Chen-Yu Tsai wrote:
> The Raspberry Pi firmware driver has no compile dependencies on the
> BCM2835 mailbox driver. It's just a indirect runtime dependency: the
> driver only works on a Raspberry Pi.
> 
> Change the dependency from BCM2835_MBOX to ARCH_BCM2835. Also allow
> compile tests. This allows drivers that have build time dependencies
> on this firmware driver to be compile tested as well.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

No objection, however I think this should also have:

	default ARCH_BRCM2835

because without the firmware driver there is effectively nothing that 
works. See this patch series:

https://lists.infradead.org/pipermail/linux-arm-kernel/2024-May/927679.html

> ---
>   drivers/firmware/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index bbd2155d8483..f99d27c1f6a4 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -114,7 +114,7 @@ config ISCSI_IBFT
>   
>   config RASPBERRYPI_FIRMWARE
>   	tristate "Raspberry Pi Firmware Driver"
> -	depends on BCM2835_MBOX
> +	depends on ARCH_BCM2835 || COMPILE_TEST
>   	help
>   	  This option enables support for communicating with the firmware on the
>   	  Raspberry Pi.


-- 
Florian

