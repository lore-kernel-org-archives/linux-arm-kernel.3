Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8F9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P6y66O1Q;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dmvpcZ6z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zEG/GVHCLQPnI88SpC5VPZ3TgR9urVz0hXrc0LNloI0=; b=P6y66O1QmPEcP7FLGEFAGejAN9
	gMfWlbK5KX+W4XXwos4EUTiT3e8t3kvgeoBydAuOH4P/k/sohJq4aLM6GKqFMMxgZ45U8Z29+Z3mP
	UP8UBPXLKm51GYq1e0eUuIA+Y3y8wNf4Y8h2+2gTBFUKwrZw+SP6dV7EXR//ui8O9BUjvR9lmBodm
	Uam3uzVeyKE7s63wDqMLJvzXgILHQe27NZ5jSWHOmLsumoW/TPw078TbogipsUKTUTbob6MiRCTqi
	WttQZy9FD19CcnK6fKwROAn5eRX8rqmCX32n0wqb+RxvG4t/nA1hdb36eY3SPfKIa6ivYRzRhLyRT
	t82LwfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9ck-0000000FkAo-3Mn4;
	Fri, 23 Oct 2026 07:23:34 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9ci-0000000Fk9j-2BaT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:23:33 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48b042c0759so341560f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792740210; x=1793345010; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEG/GVHCLQPnI88SpC5VPZ3TgR9urVz0hXrc0LNloI0=;
        b=dmvpcZ6zpbtpFd09DTL67OaoFtGL8oTYUc/4hAhMesJMUywrpG+lrtubVDBRyfpRl3
         vJZHIi+uwP9TDq3AgSfcOv1A3iRhBImKlCUt524Q2hJzRMbzUfM7cH/F3B0dETn59h39
         3LKNBmdGcK4CMq7o03ghRosiogQnXWXdo4KrIpCtiF+DQCefxVZql3TmxPlXYeH8NdAK
         LQ8z6i/YwoFvGmGVOpkQ4khlga1UwMv5SjHHLdU9AWZQMSUL7Kid0j1sR3+AaDetDMI1
         Rsk5H+XgfsKhcQjimpFuDJ530v/SlIRq7QagQrdlpPodI7DSfPgwjpizRL64SBHfRM2y
         /VXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740210; x=1793345010;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEG/GVHCLQPnI88SpC5VPZ3TgR9urVz0hXrc0LNloI0=;
        b=zQDLBxAhe2ev/3vFEi0u2lMmwrJuLJczqiExsWxRE4L55ep5zTsCtmRMkBjt8SIyo3
         JExAxqInIWRmq8ubol9FJMbeMjhoOnHVo0iMv/vLfu497nl8sSJnUrUndM5cV2u10H5K
         WT7FoDqXAMRG9EIxyVqWMF7a34V1cG2IlprrkKsToQ02ItyixCi7QCcUC+rrCegw4/cA
         J+ArnzfoQEn09TeNqL7uHpnrUbJFokoarqFO0S0tQ0JduPSEvVCw2e4hON/mjoBStDBK
         ZX04PaaPLmaKwDXJk42pJikHslMPvd1IKESeIVRsV/db+xZtjb5LlB+o/zyEb66tdTEt
         fHlg==
X-Gm-Message-State: AFq9FYKG8wuMPSMLo+QnGVC550SKWgI6zv1BkKP6+TVCXuTP3hCRNvR6
	aZyXM3UfYhDeqj2ddxQbFIlRJ5mBr9Fg1KbPrOrH4+aIFxLLf0CHWvPwwgZfDgx0q7U=
X-Gm-Gg: AYBFou1GRKsyAQj3Ja4ZdPJTshBOv/zYsVWw3TXUX6JWbUrjB2CWh6dAXTo31B17JNZ
	wt7uG+mYwdAIGasfXOGKrcExgfsOyQ6YT8I3hhdqtLvhrKDfOmz3fY0ZSDiFquhsJ/sJ49PTB1s
	6QTNxxkgN1uwf4T6DCYfPzFXbufKUDW3Dhe6fgqW3q7GzPh5w7P1YpwGPXvcIF9QBjA2VdIhn+W
	1JvALHHd5qIGS+5AlKQyYU5pjjxsINQyyFdjLftlX8aH1D/hkMGkPL0nlmnEhEHX754ZTYrQ0+d
	VSuyuqwYfjIj+4Yjh8tC92PzcDbJeZ+HonXiSuBxmBicxqzLkXU5YHs1n9rODq+mrQjLoDtM8Sx
	L4+EId5KSo/6F5Jk3f4FvAbpBM3C0B3acWRrh9tCyaCeFIBhj+jiQN3CubCcACik++pTYXymo90
	8THbRUAJZmtpbMyNOKgnxZ4zevpLziEyqZ08V75evnTT2GyBVcy7K5YV+fngMoIGSj+ZiiOGNAx
	eo/UXWzZ/cq31xISpw3ijexG1r0z9gRevowlyS8eMil2ajzs7sIGXr89X2r4pb3Z/0Vc2LNbSOw
	eHzhAQK4ls3J3I8MEXZqcjLJtjL04eLXeXA=
X-Received: by 2002:a05:6000:40d9:b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-48e3858b5f3mr1960195f8f.13.1792740210407;
        Fri, 23 Oct 2026 00:23:30 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:1c53:498d:36f3:7085? ([2a01:cb1c:fcf:4600:1c53:498d:36f3:7085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edce4fsm3456370f8f.6.2026.10.23.00.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 00:23:29 -0700 (PDT)
Message-ID: <3bf32179-dd0d-411c-af37-54d50eb7986e@linaro.org>
Date: Fri, 23 Oct 2026 09:23:28 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] Fix and complete the GIC description of Amlogic S7
 and S7D
To: Carlo Caione <ccaione@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_002332_609939_D6BE0F30 
X-CRM114-Status: GOOD (  13.41  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 20:30, Carlo Caione wrote:
> The S7 and S7D device trees describe only the first 256 bytes of the
> GIC-400 CPU interface, which spans 8 KiB, and leave out its virtual
> interface control (GICH) and virtual CPU interface (GICV) regions.
> 
> With the short CPU interface, the GIC driver disables the split priority
> drop and deactivation mode and warns at boot (patches 1 and 2). Without
> GICH and GICV, it cannot hand the GIC over to KVM (patches 3 and 4). It
> needs the split mode for that too, so KVM gets its in-kernel vGIC only
> with the whole series.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
> Carlo Caione (4):
>        arm64: dts: amlogic: s7: fix the GIC CPU interface region size
>        arm64: dts: amlogic: s7d: fix the GIC CPU interface region size
>        arm64: dts: amlogic: s7: describe the GIC virtualization regions
>        arm64: dts: amlogic: s7d: describe the GIC virtualization regions
> 
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi  | 4 +++-
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> ---
> base-commit: 8610d31587e139380db9cb8708f4263833b482d0
> change-id: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36
> 
> Best regards,
> --
> Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

