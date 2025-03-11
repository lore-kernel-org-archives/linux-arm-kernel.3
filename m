Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvX1YUIUz+ljyteedbXCuuqtjAef6ss4iRRjFDfHrXQ=; b=PiCmr2a13/xifpNg4+W1I4gn86
	gtvsb0E0Svnub64jIHUK7YQ+bohCvCeFcqTOA3dp2MegEV6Dm5DxGXJbynjyIc9pUohugLYJa5pNb
	aTWtUeoqDeJzUuqn6Ny1zgscX5WM2iJOfke4wK4I/bFQR69eWIDcgwXdliHFFEUHOuisuAVkRIR25
	hSLAb02yWLbj715xsO3K+sv6hgiBRUdks2JMKFZJ0CBbINrLGX0Ph/hsxOgUpuWg+mPsZ9mXFxqcn
	RcT2YbduQDpQBovpuENCKWsCF00F+PjV5WW0MJY8fDjB10hT0cMi31LersmpFdeq+asWss+IfUQll
	S4FwteFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1qh-00000006Cfu-1Pqu;
	Tue, 11 Mar 2025 15:48:55 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1nw-00000006C7P-3udI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:46:07 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7273b0d4409so1217702a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741707963; x=1742312763; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TvX1YUIUz+ljyteedbXCuuqtjAef6ss4iRRjFDfHrXQ=;
        b=D13kNICVziJle+f092omo+OGsSKoosZJQCyHbq+DJAnwZadG3c05ZCWxuoB+tEeL8E
         1qQ3JUsaUG7zYmbR/qj2Jz0xeoGvLQKZ1vttMsOFsg/w+I2zOctTzBO+CQbek0/YKWio
         UUyy3JjoC+KQmUiO41OxMGaNl6gIAm1OlfF5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707963; x=1742312763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvX1YUIUz+ljyteedbXCuuqtjAef6ss4iRRjFDfHrXQ=;
        b=fjqYlRc5o5jbIlMQWj9G6eucR64GQmh8Fy5JbZ+EHR6iyn/C+zEyw9VEgGa6nIDsYI
         8PzQ2Sy9027v+joNu1/cC5o3Uxhf4FMxnyGAv7sRoE3q06mJT+wOdnYs9yNJH8TsnKgs
         N1IMgUCGDSZtdGbukmoNEjUfOlK/4MoypEwwbPvlTOH6JBStQpTZJp+UDOCoJJUHD0xz
         o/+qftV4j2oeS/K3IbnMnpW2y2oeFXPLmD28H33cPW/85YXdZmnx1tePPSGUFkDLZDrb
         DHoKgkc7IVgG8zqW0PXTYIiHOT2s5lv9ZEwXxlMTXb0FrwktC81wwyPx/vtkZEjrHxNx
         9A6A==
X-Forwarded-Encrypted: i=1; AJvYcCUi0DKZ5WlByPBkixtLQr/TtMUioh+NO1RxAkP6ECdsNC/k+ILuLgnPSFeHzrbOsrmqI6HozsSzljHQKqHUhb0o@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0GQw9b5cy4kbTX3crrH6T6G89wybJgKlWDEcV8mHhg2tHia00
	CQDnxaNiTe1RU1blFl+nqdGl6/7Fom02SqpnHqGBS/qN9ftEbEXQ6hMuNAifJg==
X-Gm-Gg: ASbGncsdEyjSwBzdfSJutRumAHRrXdZhECU2AftG5vsbKAXeRtxjWLK03qcz/Bmw3q0
	6CMW1sku8lOZLhz35SJOhoqnV29lqoBwtxPefuWnCRH/4m1w7WWIhOTVvAgMPQD+rxs84qToAQg
	vVxtGNLYM0KrJxiLq9oRvS9pDflPTCwbwBhHlByCW7WQ3bfdm3I3fFmZ6eoFfvLlO46fdVheEXR
	cwRxiP+dYHcVkXOGF6FYCxHDeJi+tJ+j+Z1MfClrhe+MJ6X6nE08dhTZzoOxLlIQYPqEqAXLHpT
	rDgHOxi4KLK4HSmihCQ4NUPxcDH+6Z4MeQTuP21zQAistN9IBbMcFFkDX/Tv5joRqoCEXY1Zniq
	HQQ4944sZ
X-Google-Smtp-Source: AGHT+IELjvN+XdLjKqh9jaffslYR98GQizJDSBHy2qffYsdvRDcijxUrqGkTRxSvndo2VK5SLo0wlg==
X-Received: by 2002:a05:6830:3897:b0:72b:9387:84b2 with SMTP id 46e09a7af769-72b938794c3mr3908943a34.27.1741707963471;
        Tue, 11 Mar 2025 08:46:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72a4634099esm1681482a34.61.2025.03.11.08.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 08:46:02 -0700 (PDT)
Message-ID: <aa4284fa-1f68-4c7e-8d58-1c5129adda27@broadcom.com>
Date: Tue, 11 Mar 2025 08:46:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-brcmstb: add cqhci suspend/resume to PM ops
To: Kamal Dasu <kamal.dasu@broadcom.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250311150136.46938-1-kamal.dasu@broadcom.com>
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
In-Reply-To: <20250311150136.46938-1-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_084605_009253_E430A804 
X-CRM114-Status: GOOD (  17.77  )
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

On 3/11/25 08:01, Kamal Dasu wrote:
> cqhci timeouts observed on brcmstb platforms during suspend:
>    ...
>    [  164.832853] mmc0: cqhci: timeout for tag 18
>    ...
> 
> Adding cqhci_suspend()/resume() calls to disable cqe
> in sdhci_brcmstb_suspend()/resume() respectively to fix
> CQE timeouts seen on PM suspend.
> 
> Fixes: d46ba2d17f90 ("mmc: sdhci-brcmstb: Add support for Command Queuing (CQE)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>   drivers/mmc/host/sdhci-brcmstb.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index 0ef4d578ade8..bf55a9185eb6 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -505,6 +505,12 @@ static int sdhci_brcmstb_suspend(struct device *dev)
>   	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);

Missing an int ret declaration here, otherwise that won't build.

>   
>   	clk_disable_unprepare(priv->base_clk);
> +	if (host->mmc->caps2 & MMC_CAP2_CQE) {
> +		ret = cqhci_suspend(host->mmc);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	return sdhci_pltfm_suspend(dev);
>   }
>   
> @@ -529,6 +535,9 @@ static int sdhci_brcmstb_resume(struct device *dev)
>   			ret = clk_set_rate(priv->base_clk, priv->base_freq_hz);
>   	}
>   
> +	if (host->mmc->caps2 & MMC_CAP2_CQE)
> +		ret = cqhci_resume(host->mmc);
> +
>   	return ret;
>   }
>   #endif


-- 
Florian

