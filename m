Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EEB1061B18
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 18:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1E+3WVXMJwlqaN80KkJm7QShEoP0ecOMzlPB5qaAL4=; b=gAEcAWWEhXq/gy7uHceCndORol
	RW+yplMqwMB4CyLFoAkFtAEtO2Jzr7Cv8oBtsmI2juuq66k2m/11/ysqxim4fyDC+iRDZ6fH2jWvM
	OBPOw66jNcBnTHJ8kHQGhSxcR62vwuxP4ImF2tFhb2cAiHTSnNIpDRoH4SbCdFSbFRkCH9VgppszR
	wG40G+GhoPfWN0firLic265wJJzYOV0+D8nZL4eo8l9EXomsyN4+WmdzFhcDkfuKtpKF1Y82yiOMU
	bLbQBOJ3TRN58jrag1r3N+pXAyiNb5hRUUbV/NVhCgKXWt4iubQSNo9CesSQ5GDqlDROJ8fIpZP53
	qE93zoZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7HdV-0000000BkAF-3VMl;
	Mon, 30 Mar 2026 18:46:53 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7HdS-0000000Bk9a-2vsG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 18:46:51 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so1324620a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 11:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896410; x=1775501210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1E+3WVXMJwlqaN80KkJm7QShEoP0ecOMzlPB5qaAL4=;
        b=Bpy2dlwKn7PHYHQIEZj/B9zItYxm8pwf/StNb5RD5cWp6G6Jfv08k1H1q9SmMlTfmy
         k4p+bMDaEVmlUs6wFytEhlbIt6jFTddeKVWuVPNJAuqGii6Q9Ec/zINj/Mq2g/P6ct1H
         KIPwZTP8+fo4QuxgyHXsLfEYUR37Ys+FrFV3t3xI9rKhYbcIqDDegiGNmPVD1Nt/gGNw
         pWVMcDxkhC7YN8gBJ2qoFR+0VwCUcuW1hYw01LwLdnBWapYavSn0i4ygFIJyPrBxb3SU
         fsDifb8zR9+YP5Ni/UGtFd0N1wfoE5zeplv8/SgQBWhUpD3vlhdCHs91l1bANEW01cif
         n7zA==
X-Forwarded-Encrypted: i=1; AJvYcCVoufgHNIILq5FDE3cr9Ny52KG7vE0GBz0CoAyblfU7aZV+e/EgSmR4MGYH6IK7NrB7ufwkOYqIOqUnAzY8ts2U@lists.infradead.org
X-Gm-Message-State: AOJu0YzPQaZ0IU8YaIt0agao8szeDl28NRY8lOkVdugZNY/C/VGmag7o
	oXCchMDlpR+Bq6J6DrXcPMO9ZfQIHP+uDUZvEKO/P8UaDGKdLrY5iKU3kPZcqdZv7DlUmFT1mb/
	XaoHzKyXVz1rSpQ+/lWMsoMnWcQm8jzMUoRbdyPdm8egLrfDu5ZO/szYM00YA2qw8JRGf4Gj2P1
	RO6B1F6A46AjKk6v4ib1KM4jcrYlA04drXQ28zA4niSCWeJume5jkyHJa9gPGdhpU0yiYcpen77
	UhAR4/0wecfd1AdOHfHmUU78w53G5lSAV8=
X-Gm-Gg: ATEYQzwLg6LVMofAC5xB8B3NSuLjRUjQhuLv1koUQavWBt2EghIjiKmG7DFzVhII8D0
	4l0fIdQ1EgP0gukckezuWKZHEjUrIDQGJVIwjhBPjEcidZBsQv8Q3Ntf+FQ6BtoBDLZxbHwxdec
	SQOOSjkQQ0dpoTJkFiF70jq8eJxnc1z4FhVt8nvTyqdUSQE8Cd5rXmWzYUpUxmt+k+PiWocw+0D
	6pefa2h/2Mop8OVoMaGHam/4G/jnuAthKXVXAgNKg9DTi1NlomlhFcdqA68PMReqMVEo5feLMcr
	zldrtAdUhij3hzY5zeQxFHhjsR34X3RM1/3FwD37Q13UGpY60fZ9Yw60HIaWYxkeyZdp/pEdosC
	R/Oj0p+IFe9AiiWYs7U7mQQwLV0kmcSeoLD6wGpqZov7ZObWavB2ko8D1TiFPmrdfiBZ/wRIJ35
	+qZRw3RJ0NoLSUhLP711erBqxGoimieRix+NyTh0RuRmUJIfXdhwBbevsFYFjBAA==
X-Received: by 2002:a17:90b:1a8c:b0:35b:9aaf:21c2 with SMTP id 98e67ed59e1d1-35c3000d679mr11979238a91.13.1774896409668;
        Mon, 30 Mar 2026 11:46:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-35d9508bf40sm943348a91.8.2026.03.30.11.46.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:46:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b220c72bbso176722531cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 11:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774896408; x=1775501208; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M1E+3WVXMJwlqaN80KkJm7QShEoP0ecOMzlPB5qaAL4=;
        b=gZK7u+by+iiMf5aZ4HpYsZziPrpqfxPWWoeJDddZ+3EwKrqBJLa6f98u6W4Kvwjp56
         8pijNCnlqIA9Wh9xKC4cAh8vZbMX6hjwekwqHqsvXvrtbZPIAVNYwtk3OmYtpaNPLrnO
         JBq5Z+Xj4VW4A1pSYIZX8SeWNlFKVynhDdkXk=
X-Forwarded-Encrypted: i=1; AJvYcCU+j1Te2hnHspMAX9P/t4L6/E6tJkVuCGC1Vf1E7mqo8X8La6Cv+MfwBE3PkGxBYrlY7pI1+QePeCz2A0uGKeq4@lists.infradead.org
X-Received: by 2002:a05:622a:5591:b0:509:2618:cef1 with SMTP id d75a77b69052e-50ba38c8f89mr180654151cf.47.1774896408094;
        Mon, 30 Mar 2026 11:46:48 -0700 (PDT)
X-Received: by 2002:a05:622a:5591:b0:509:2618:cef1 with SMTP id d75a77b69052e-50ba38c8f89mr180653611cf.47.1774896407577;
        Mon, 30 Mar 2026 11:46:47 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2cccbc4sm75020471cf.13.2026.03.30.11.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:46:47 -0700 (PDT)
Message-ID: <189a2bcf-88f6-4038-99f9-af11a4e27990@broadcom.com>
Date: Mon, 30 Mar 2026 11:46:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] drm/v3d: Introduce Runtime Power Management
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260328-v3d-power-management-v8-0-94336830df5f@igalia.com>
 <20260328-v3d-power-management-v8-3-94336830df5f@igalia.com>
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
In-Reply-To: <20260328-v3d-power-management-v8-3-94336830df5f@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_114650_735958_67482C87 
X-CRM114-Status: GOOD (  12.59  )
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

On 3/28/26 11:52, Maíra Canal wrote:
> Commit 90a64adb0876 ("drm/v3d: Get rid of pm code") removed the last
> bits of power management code that V3D had, which were actually never
> hooked. Therefore, currently, the GPU clock is enabled during probe
> and only disabled when removing the driver.
> 
> Implement proper power management using the kernel's Runtime PM
> framework.
> 
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
[snip]

> +static void
> +v3d_suspend_sms(struct v3d_dev *v3d)
> +{
> +	if (v3d->ver < V3D_GEN_71)
> +		return;
> +
> +	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
> +
> +	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
> +				    V3D_SMS_STATE) == V3D_SMS_POWER_OFF_STATE), 100)) {
> +		drm_err(&v3d->drm, "Failed to power off SMS\n");
> +	}

We would certainly want to propagate any errors from wait_for() here to 
ensure that we built appropriately timeout and get a chance at debugging.

Same for v3d_resume_sms().
-- 
Florian

