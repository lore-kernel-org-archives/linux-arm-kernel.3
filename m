Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B091CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 22:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tN8WzZ9GEpKaJgdfC1znVVrhhkhAJwlw/zZ1qhYY7To=; b=OpDxxLFzntTHU2fWqG3yuNz8n4
	0TqzFr40vBp2TLzmVWCt7JCWvrxhPN9kQBT489ycHQij05qYg635YcSwmC0qg7I3sFLLEF4Yckz0h
	niOsfZ2tGx2H3Ws18zuY+Ajkjmkcdfq7jD9gZG0E16s3g/3L35/F5sDWUWIE6rlrwW9LVkjCcyNCj
	8N610khWwlqYAeFMQff4HKgA+LkdBuFKy1RvTqWF4fZYr0KO4z0rKTSDE8JD8yM0ic7fP+QYTuqRZ
	Vurbdb2bA/Tj2sT5XNdVYsbZfAGLbb4YMyMPKtxIYULI1TTxeYqh2Ky9IW4EYPQ4GyMTG/daHaHs8
	DI4k7ybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGPOE-0000000Cg4c-1ZCL;
	Tue, 04 Nov 2025 22:20:34 +0000
Received: from mail-qv1-xf61.google.com ([2607:f8b0:4864:20::f61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGPOA-0000000Cg3p-3DAH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 22:20:32 +0000
Received: by mail-qv1-xf61.google.com with SMTP id 6a1803df08f44-87bb66dd224so61270386d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 14:20:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762294829; x=1762899629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tN8WzZ9GEpKaJgdfC1znVVrhhkhAJwlw/zZ1qhYY7To=;
        b=dSd3OftPJ+JmqfUGeYJo+ZDSYs8qZ83cFKYv0/dODd9EF9aMmeNXsMb/tQV11nnZDO
         oPRqNY3soyFeCShBuqBNsP4g1ZLihsrUJt6tLngj2mspzcqYUIudhI1Mq7bvF9U3rnZc
         ZX8Za2GTQiL4/LYVqU11KD4lajyvDwNXcOvqB5K2vym/UpFieYojHboP4p9S/sZ8ZEpy
         Oq/Nxqo7t0pNHRcv1kQGfdDsLZcYRfpHV3gqU6h31HhTgfjHkDytyq/pOCuB8++S8I5m
         XTNg8M392XXRlrUBipi5JLuldNw+/9qsJX0Z1NvdpEMd7Wj3SlZ4xuHJwLou1wtsBR/g
         b9gg==
X-Forwarded-Encrypted: i=1; AJvYcCURg85fekK78B5DgXoPqVmgphVZ8oMEwvolStM8do6TCzy1/cnXYPQCbRaYT5QbwRgN+lJCw5vBxQkA3a5ZMWGQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl556xYyVx0ZnWX5JqP/MY9m4bJu6TvG4cfcWq3y7CJvPU4HPS
	hNTJNNYHZAizNeXRJFSFSI6T5sxw0kAuj+UsTNp0L85wCqpQ2tGWVtR+ZQ8UOSqPdN6OZs2sIf6
	GrAb7QR8pss0nkn/2Mz/hf+0tGld/Zssv1iIX+5E8wxGpX8HwtNPGr0txYKq4VDshC5+m1UP1lc
	X/0FcDAVskQp32f53g6apzdAn5lSHVOOntCGDLCY9IIjWni+oGOUBk9iu4ZCA9P+fAPL+SwO13Q
	kwAeRVEryTexjk1vrjWmUrHGrkZW8mrbxY=
X-Gm-Gg: ASbGnctDWlvUFAZKv19T7UYpQio5vq09ey5sAQH9q6ngc0G9ZeRgyqOR1e/+tjymwPw
	uU+ift0tQICiKoiKXZjw2OhZIVWsRpV+sskYHpC5RIk0P4ZQL3mGp9Hui8aoEhg1ETGq2Krx548
	veOTmb3XLPe+IvH/JnVDqLpfz8LY7S47iaT6gFCpUFeBIYAoPAYaaprA/4JFiC9Kg2xITcXN2O7
	ilz++kx9+gFa9aLdxG9YSNHBIq86TeHdgEZBFdJ4SD9Zc6CGi29m2ebBGIpWN9Sjib3dSJn4YuG
	tC6EDFyJvwE9faqfMP37xwfNfXRZLjH+l0TIkz27KHtDUrnw1PArz9PMfyCDIMFhtCt9KZ5K3ba
	mWsYt3n5+4givhfYgg1ZVXl8O1j95XjtNCq0K70imkzgJYiuneszcVu2u5Ci+9eJYUjRjl0mTC6
	C/huKOtlxO8VSWXJO3bkHom4d+nI5d0TEkmdVcBwQVow==
X-Google-Smtp-Source: AGHT+IH7YTu7Pan1YWKaLVknu/TcCobX3elNjr5yCqcuuN5xHC0eBo37gCmQQJlK+J/Kt9whGDkPioHPmXIS
X-Received: by 2002:a05:6214:4001:b0:806:7173:3af5 with SMTP id 6a1803df08f44-880711923fcmr15573276d6.55.1762294828743;
        Tue, 04 Nov 2025 14:20:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-88060dd56a4sm3676456d6.14.2025.11.04.14.20.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Nov 2025 14:20:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf4540bb6so163347901cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 14:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1762294828; x=1762899628; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tN8WzZ9GEpKaJgdfC1znVVrhhkhAJwlw/zZ1qhYY7To=;
        b=FVVBUt0ashdq20rP3Hq3Dsv/cl2bGILtFj2uQwtgdg1ccj4IuJcIZt7EVue13LPSvm
         AB89I/eo7/xxGi04yWtEiXY/3MAUKbMIArBWvAN6mUv7xyJvFQZavQwKHCRS89aX7ivS
         P65FQmlVxCffkF3rkYCJYykwxtQDm8fm5zY7g=
X-Forwarded-Encrypted: i=1; AJvYcCUpvD1+T8MbV3ej+9C6HgiAaERRii00hjdTNRJi73ZUTj/cO9gO3xjsWWNNGgPuSI+biMC1EAnalB7bVPIaiujr@lists.infradead.org
X-Received: by 2002:a05:622a:47:b0:4e8:ae94:7560 with SMTP id d75a77b69052e-4ed7264c433mr13277361cf.83.1762294828035;
        Tue, 04 Nov 2025 14:20:28 -0800 (PST)
X-Received: by 2002:a05:622a:47:b0:4e8:ae94:7560 with SMTP id d75a77b69052e-4ed7264c433mr13277101cf.83.1762294827619;
        Tue, 04 Nov 2025 14:20:27 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed5fc3c8dbsm24129701cf.36.2025.11.04.14.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 14:20:26 -0800 (PST)
Message-ID: <3e538ec1-37f6-416c-bc04-6f21a4d31748@broadcom.com>
Date: Tue, 4 Nov 2025 14:20:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: bcm: rpi: Mark ISP clock as critical
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251028-rpi-isp-clk-v1-1-2a54fecb495c@ideasonboard.com>
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
In-Reply-To: <20251028-rpi-isp-clk-v1-1-2a54fecb495c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_142030_820600_4F5AC2A0 
X-CRM114-Status: GOOD (  17.80  )
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

On 10/28/25 04:46, Jai Luthra wrote:
> The ISP clock should also be marked critical to prevent the clock
> framework from disabling it on boot, which can lead to bus lockups when
> the kernel tries to submit buffers to the VC4 ISP firmware.

The commit message suggests that the driver that interfaces with the VC4 
ISP firmware is not ensuring that the clock remains enabled for the 
duration of the transactions. That would be a driver bug, would not it?

> 
> Link: https://github.com/raspberrypi/linux/issues/7100
> Fixes: 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off when preparing/unpreparing")
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index 1a9162f0ae31e330c46f6eafdd00350599b0eede..dcc3ae5fb91650b042d52f02499922786b43afde 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -151,6 +151,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>   	[RPI_FIRMWARE_ISP_CLK_ID] = {
>   		.export = true,
>   		.minimize = true,
> +		.flags = CLK_IS_CRITICAL,
>   	},
>   	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
>   		.export = true,
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251028-rpi-isp-clk-eb5c48346e51
> 
> Best regards,


-- 
Florian

