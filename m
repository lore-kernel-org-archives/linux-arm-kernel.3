Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B49B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vKASOudi;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DfDlWLXg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h6kLZ8i6rJjG0cT28y1NGxwCKUSmKTnRbGESAnsD4Hw=; b=vKASOudiWKwoDelsATiPvspyWr
	V4gHKLL/ZAlWh5xB3hBnUy2XwC2GODAfq2L1vewooDiEvHUZU5S5BdtG3IsnaESKmA1KtREo8HgdN
	3MLYpC7zsOn3C1hRqDhLn2Vy0XI91sL2qQE5O6QgK0JEg8LZOOYhMtTqjum1Dwg8ez0Ijix1qu3pc
	PiRBr9h0LdzfPMAZq9tGRQxqttxISA2ypgYSG4ZNKQNeiE9u1NSaeez/EKiK28X3SBHis6DLH60v+
	9J3zPcn0w3ItPZ+UhFKDl4j4bLa/0X0Ru1/V/DI+oyg4wrR1XMkLh7Utc9AZlk4HQK0gSTF4HoBOk
	djFHuFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHZA-0000000C2WU-3tZB;
	Fri, 06 Nov 2026 10:53:04 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHZ3-0000000C2SN-2LZ9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:53:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4922523d1afso300715f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 02:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962376; x=1794567176; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6kLZ8i6rJjG0cT28y1NGxwCKUSmKTnRbGESAnsD4Hw=;
        b=DfDlWLXgcFs266cdVJb8qH6zKDj55yWP7dBOPuU8EhRyRYfPIaD1j0g+uEHETDoOCl
         HxhfadvCpVbo4pnVflyVGe01sb2Li8CwVJXeNs0Gh07RBMSBACi8BEc8oDyjymG2vqc0
         SApkAjsEGytriH4hW3EzcjRUQGXEGDYXTpgRVC2yNzi5EhS+6GdG42mvabig8GKPdTZN
         fWjSZd9P1yzw3Lzd806uKUYuFBNz6FmuMJjhv0FJ27FVh1tFmNlXCs0iGLU5gzWubc/v
         rCebOqnqmHoNiiqKwArXOrFHoz6/L/iv/S/o3xnx2WAswOcpVCK2Br4FaXpWj4Bwu3Ug
         Cytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962376; x=1794567176;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6kLZ8i6rJjG0cT28y1NGxwCKUSmKTnRbGESAnsD4Hw=;
        b=SIvzSKzAR6skDlLRJ/cmIxw2hYNM9fhBa0KYR5N+MPUCEH9MWxWndfHmYNCL5qZSj7
         hsrm+NLbJ/9cOHIa5BBET8g9HCH1KiV/J6K+GhpHMaIqCszpJvO+H3DAIZSSb+zQ27KC
         XSKCKCpSRKhwRkk79J9McsgXtnuv6KvsLOwonQfzsAWXmcsjR8681zqgdFsGjp2zD/UE
         UVjM8Huye3DL06g3USM8PUVF3ArNl/EzcmXT5FNHgytdaHnsoPzqi3hh8Lgpn5q7mgLa
         bIcGnXRozJ7UNp7ojPXx8eLOs61fiWPy/9f+XW3lp6RpllJEhA2lWyq/TTHbov8VKeND
         bMAQ==
X-Forwarded-Encrypted: i=1; AL+hErGfxSSRGTMH8Wkha21RJWsDkOWWmr1P7HejLsIaprt6Slgv5tGVW0espTUU24DRKZVa99DqlwnBPhY8OgZvBv10@lists.infradead.org
X-Gm-Message-State: APuU4Z9SLYQLuaCvV/drZMPaNQ3pt68fNHmlJDAaVbjd3/dYBGK2p0P2
	yjrE/NqnRnWUMKlVIX8WQS14O60NVZc+S4yC/o/HkXcqT7aAk0Hk6Zd69v8Sho/IkQo=
X-Gm-Gg: AYBFou0azhougmrhXouVaFB0ASqPIXFwjZd2kOaQrzuBaDPSS07Ab++l+8tn1B9Towq
	LuzHunzDg//ktbi5XwE2Xh7RqwwEwE9b9BtZN6ncSaZJdn3XfVp5kQuzofPkJTd5PIAKJ/CvppX
	o7XId+YFDKuqqRXRrg3PxA7raYsMlXCExyZsyMOLARuIeEujNZZZwsHedv3g07Y8qJ0asi0+KMi
	WC0TKeGdf1BpzrVhPRX/BL0DQpBByg8rVueq4o4aPG+d17Fw9auWoqyGuqCG5m3ZJZhOrwo3kop
	8Ow18stivmdDOGbBRMuZ0rR8mY3521i1mWTpQqCndTQKbei7tse3ru2iSGFkTufOISTFJ69vM1O
	yvRFLQqQZh4sDuFgubd+PxBFnD0hGeE0jMtb0hXpFnqf31ZyPeWPOy7s3Y+oWq+BgNDVYBSfKIZ
	xI4QLKOx+BE43U92xDGNk6XuIv29/L8TpWA4qPLro865rWEcfG6HjVTXc6E9ovKZ1xCgcde1FSX
	X0chWa7g7JxOS5f27pnPlDi5DDfWyMtGAIK+G9ALIRQ2FPy/8L7m/45HP2Dp/WCn8Oq4UFrtKUa
	8dq9uIrdBOP5125KHCHSschOoUhAFa4gWUddY+mJwW/s/jhRVCcBuEdTqXHdscZ4Qb4+CkVItq1
	JvVab2zY=
X-Received: by 2002:a05:6000:4a06:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-49278a136fbmr4487405f8f.51.1793962375440;
        Fri, 06 Nov 2026 02:52:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492fc80e017sm2563298f8f.34.2026.11.06.02.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:52:55 -0800 (PST)
Message-ID: <cd5c6354-58c2-4e41-b7b5-af1e2910be57@linaro.org>
Date: Fri, 6 Nov 2026 11:52:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 02/10] arm64: dts: amlogic: meson-s4: describe the CPU
 caches
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-3-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-3-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_025257_645502_B7699432 
X-CRM114-Status: GOOD (  13.93  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/6/26 11:46, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> Describe the per-core L1 caches and the shared 512 KiB L2 cache, with
> the geometry the cores report in CCSIDR_EL1 on an S905W2.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 38 +++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 2a6fbd530836..675db02a8d5e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -22,6 +22,13 @@ cpu0: cpu@0 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -29,6 +36,13 @@ cpu1: cpu@1 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x1>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -36,6 +50,13 @@ cpu2: cpu@2 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x2>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -43,6 +64,23 @@ cpu3: cpu@3 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x3>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		/* Geometry as CCSIDR_EL1 reports it on S905W2. */
> +		l2: l2-cache0 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x80000>; /* L2. 512 KB */
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
>   		};
>   	};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

