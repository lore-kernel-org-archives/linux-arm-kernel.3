Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AE0CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 20:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVS6LiUU36AQl8NmfGBhHoZlr4o5V+sFm0sfdWcZXDg=; b=q/Aw6TJVYk92wxhehwoyTx7OXw
	EDWArVJpAYB77TC3Vx041OW6AcC3yXQwGlnP9qnS7B6JYd0oCpZoleYWQfFw+PUZ+jVDTKbyyhjcP
	4O/V4Pc0fhJHbF2NYEWtD2GVfgUZQtWIHBV1GbD8O/qq8Z3jSUKDyjllhQ4mzgbyA1Ejhco/y4zLa
	TMVRGh5DSoyXuX87KSV8QfoIAlxDecfRcul2YsGIEAHaLrkEg3tidZV3KaO9FSoe1WQiNgaxsvFMU
	hPR+kowsjIkkCv61P/WT/p8tfTC5/ygyc4NC2TfJyB96Wgm+z4yDPdZWNFYKMV6cdrNuv3tcUYcHj
	amlkZnmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7FN-0000000CiAU-3vMN;
	Sun, 26 Oct 2025 20:21:49 +0000
Received: from mail-ua1-x962.google.com ([2607:f8b0:4864:20::962])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7FL-0000000Ci9S-17Tq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 20:21:48 +0000
Received: by mail-ua1-x962.google.com with SMTP id a1e0cc1a2514c-932f654eaaeso2949771241.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 13:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761510106; x=1762114906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVS6LiUU36AQl8NmfGBhHoZlr4o5V+sFm0sfdWcZXDg=;
        b=fnjJGdvAAf07EBonf8Fm8QCninwvxPnEtKC7EEyP1CjEnzQx5T8akl1U5ZTsejuXHc
         R07dlAmsYFcUFh4lP0fCJIvKCLUJ9/Qg4tQM9CathN9nRs3anRlYI90LxELMFmv6k1Go
         Wgj7tyLiDH7Yv5ysxkq2b2lj8/RUdmtH3fiB+R9jEXG72k8Q5r7/qbqU7gsYve0UZKBj
         E/sD8lduSAo9bM32MbOLeRB+B8iFUc0IhOzDSBizZibW3l5sqafSxKb36e3xaLDKbekB
         Ot3qyOcCSofeiEhBu4clMJtNvghrBF4T2CNY14Pu1WjVZI6gSfK5bphlew/8IPtvfAb+
         ttkw==
X-Forwarded-Encrypted: i=1; AJvYcCUc61nIy30VbollKy4V8/V0aLEFOGj89v0/XEV7mlPHIqtLGE67l6nrFmb3yiIZNyBIjDN9thFDmAoT0PxNu5NC@lists.infradead.org
X-Gm-Message-State: AOJu0YzHj+sKTk45oBk6llKjiKcc+UCq438AqWfZr/HdfbjflOQ3BuWG
	KU3GHQ91N/mJ0So+MKxlzT5+VlOqsRLk2esBjMsn0N5qBpzHz6URtQsEbX7u8P3O3YXcsUetkyD
	9UlaYcsHiIwehmRGZ31d3g7xg9TXJoGxyIvX3ZBU+DV9l+jDNVD9C7k3SfpRkdJg+OdFqYJ31iy
	8DI0THwt1pD9qStc5oDDOq3noCM/MvwdLOigrO7dpclJCS3PVTn3FZYTH7ET8lRbmv3A9EbnatV
	UPZpkqO1+wr6spWAvFlARqaV4AVyXpAoJM=
X-Gm-Gg: ASbGncueVjsVjN857rcDFTVaR6bJkfLBW/8zQ7rVjCePnC18rpMSV20d9WbPju5JZUA
	u1MsK1Bnz576TR8p++e6RAWMI2wpBoChAEmHbBrXzz9yoiVgbxM1hcP8z5Q1V0vh5EnjsGwzKL9
	aMpgB3oGbHBSRF3ZkFlB3bg84QrQcG9KsDJJsajSRzyjB/kIfvXl6zPEj3jGkvPwLKYtvINzvvP
	RRe1GiK+ozHs+3wplPCOHgfmzOPVG8ON1X7CYhB05nfPWYGVjV5Ytjps1rOk2psXSgmNCCf+8k0
	gZOhvRZGbQ728S5hvUeCeepjyn3XFbJHjb8Xat1BgNkufmDfEPdilDAIUBmbCCxAtkoUVmdI5M2
	lxk5j0QzhvYGSX7NsnZC5MPyzTwCGQ5VolscaHPZZ1AHYNBdWLHh2YD8SmMkVQsz96IaMbCrMEJ
	nys5ubs/iuKJ98/RzWnxqwNNEMvh3gjVaUOAsDn0c=
X-Google-Smtp-Source: AGHT+IGq5bDNoUnZerW/Qqp6os5Cx7a1blJxHn0X6kRoTQ0uUrJyoOpSLICgLEGQvlt9MYadonmbAK+cq5bX
X-Received: by 2002:a05:6122:8b15:b0:557:c38b:4dbd with SMTP id 71dfb90a1353d-557cf08e2ebmr2542546e0c.9.1761510105926;
        Sun, 26 Oct 2025 13:21:45 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-72.dlp.protect.broadcom.com. [144.49.247.72])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-557ddb541d0sm644236e0c.7.2025.10.26.13.21.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Oct 2025 13:21:45 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a27ade1e73so2507268b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 13:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761510104; x=1762114904; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVS6LiUU36AQl8NmfGBhHoZlr4o5V+sFm0sfdWcZXDg=;
        b=cl7FFYBKqCgHRVfWaNKB007YTliuCc87LRJ95H6HdvzuviRMRpTGD5aVaO8RELKitx
         JoHbEd/Euy6AvoBYrcp0K0BeF6FFo/+Nuwthx50Jl+K62rehQcNnV/GYJ8xmNdtfCp/F
         MWM/G9BYFkvGz+qSFr5pI0W832JpR6G09SA3c=
X-Forwarded-Encrypted: i=1; AJvYcCWLwpusQgCKZ7Oq4hdvn6214TKnDkDtS1AlQMoCL2j0TLkvetYdD4HHs5oZ/NIBbmVfzyOLv0lsTy614GNbX0B0@lists.infradead.org
X-Received: by 2002:a05:6a20:734e:b0:341:2fea:6b5 with SMTP id adf61e73a8af0-3412fea07ffmr6653466637.20.1761510104286;
        Sun, 26 Oct 2025 13:21:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:734e:b0:341:2fea:6b5 with SMTP id adf61e73a8af0-3412fea07ffmr6653436637.20.1761510103855;
        Sun, 26 Oct 2025 13:21:43 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049290sm5593723b3a.34.2025.10.26.13.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 13:21:42 -0700 (PDT)
Message-ID: <88c3c5a1-1b51-4b08-8b01-803659e9b1a0@broadcom.com>
Date: Sun, 26 Oct 2025 13:21:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: broadcom: bcm2712: Add watchdog DT node
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-pm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Willow Cunningham <willow.e.cunningham@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, Saenz Julienne <nsaenz@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250917063233.1270-1-svarbanov@suse.de>
 <20250917063233.1270-5-svarbanov@suse.de>
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
In-Reply-To: <20250917063233.1270-5-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_132147_313093_59CBBD7C 
X-CRM114-Status: GOOD (  13.65  )
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



On 9/16/2025 11:32 PM, Stanimir Varbanov wrote:
> Add watchdog device-tree node for bcm2712 SoC.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index 0a9212d3106f..3094a8e69f35 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -243,6 +243,15 @@ uart10: serial@7d001000 {
>   			status = "disabled";
>   		};
>   
> +		pm: watchdog@7d200000 {
> +			compatible = "brcm,bcm2712-pm", "brcm,bcm2835-pm-wdt";
> +			reg = <0x7d200000 0x308>;

The register actually spans up to offset 0x600, so the register size 
would be 0x604 here.
-- 
Florian


