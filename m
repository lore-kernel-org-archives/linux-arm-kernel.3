Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36320606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YqMt/6KF;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f/uXcEf+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WGZXSsiRoZs5M7Tq/hSmEqWmQ4g9AUNQW2RxywPyv0U=; b=YqMt/6KFt7eoA8D43bQkmIZ9f+
	swlS8Q0Vgoc41d6JoVbcztmAtTIti+G/y7/5znXIGbuZBi8tOlEq0wer19V/D9I4siL+0Ll9YFhyf
	SaAxOgF8PS42ZYqDRD6tZvXSLREO9QOPH31CV7uyaMkWao6IXBy/EbKJ5LgGgPsCkpqqyidUPh6yT
	JMsAi295GGiSmm836+WKWdmssIgG9DfSvDG779yVXNbkOMviAGOiOnbzZb4ahlaNSXYdkqmmLTJ95
	mJgSdwLsUqn/oaREGQX4sybuuJBWpiOwe82DypwRAdT9os/xfLOrq6BchNfQVAHSAcF5Ztdm/BMQ8
	iRQgPq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHaC-0000000C30v-41wj;
	Fri, 06 Nov 2026 10:54:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHaA-0000000C2yx-1OBS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:54:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49d05d51553so2774295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 02:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962444; x=1794567244; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGZXSsiRoZs5M7Tq/hSmEqWmQ4g9AUNQW2RxywPyv0U=;
        b=f/uXcEf+35YGvAKMzbYmxoycRVGR5zt8b53Zx9WGwrbXScj8UdBcVI7UW2Fxn//q3a
         0qOplklVj65HWUBFkj0YS8GMNL3BRvTffom9gxRCMX6dRy5bjEoSPxUYMt4pauyzD8mF
         uPr0jkBOA6A0Goxgn1OWqhZpguj+c5eNV4FxB0YT1dNjAKorVf7GpvKIb1y/EYQma8TC
         Fw3F4ZP2TIdsK7JkUuwMAU+gHSGwB35DmQ9fCisP6oaXddruyZLBjV9mBcduwVEiFBNo
         YoDYqfbSFNeQHNSn4lVG0cUtgP967gWpPT8wa6iFGyJA7YXmAbP3J97aOgDVUnFRJP9E
         86iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962444; x=1794567244;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGZXSsiRoZs5M7Tq/hSmEqWmQ4g9AUNQW2RxywPyv0U=;
        b=Gf/a8B4bQNfTbXi5ey682ADLezv9XakkXMYLmhmuWPciDYSrXJ5DN91gmZXyjkM4QK
         WAwmOlKpBjnIo5hJ4sy/igNWvyqpLSGIL9rmJb/khP5aOpN4hmLpI/hpzUtwKAyiSu5u
         Wud+63WvfRbq7pebdP8F3Z3JyA7frNwtzqepv/Z15OvkkL6OTUeyH0YZ+jpe9IfJS4au
         zG16IhzDlH+PUlh38VxXa4tlWcLVM0fDA2RyIWIu972WK9eMzxmxYiTMmwbXKE9j7uvD
         RVNLcdnvWgSHWRGmhQYysVJswkpKQbqE1F1DMTQOb2RnWP1hzGVxmtgwVohXJ8AZyfTO
         41BQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj8/MouwKb3qqUbY3i6XzmM026Run3YbfZoHXhh5RF4KgSSu3rnALoiw+ECWL6hOUDJ+x8LVDEDOEhvn56D1j2@lists.infradead.org
X-Gm-Message-State: APuU4Z+/4hQmM8jT8+WGLtv8UQjCm8+E3ZkKAEwtw+FLHSrwzT5WMsYW
	PfJLiNHebbWiEwUjmWfUhY2UcId87m5GkPjf8KirDQ4jB7F9GK3aPdK9RG9leeUuycU=
X-Gm-Gg: AYBFou0+hs+qYFazC70+7ofTULuGQm4VZE8Z3rwUCHB0JnbgskWzk2QZTPmkqjnFnxP
	PeiCHx/mz6So7wCJ7ZQ/sggVNlyfN/alAoS3UxVGzuToAqaQBI5Wrc2YX1+FvDJepcuvFBm7E65
	meJfF+1P9s+kq0yuIpCdCjvzhNbqtghtuy4n73o2bwnZ7zXBwHNe7A2ZjQ4wgK7jwpWSKjh/Htd
	9xLbxrFZpM2bnQbvJzj87Iky1mTZyEfTSZHp8v3WWXUmNG+iFjb1LTe5iQWKBcP1OGSfrPUEyo2
	iTEoYwa4xWYsQcKtn3TvhXpvtOWYyrKnlfKPzGQoPDEnuJITZcmOU1+lOptAWkT+0bPQpbXhUks
	Ca3cOTNhGFm17OSSKzHG2fhoIGAQ6rVSpcBdMkVHHn8eDHMPXGU3rf28fpDePwpiwPkjpSnzi5s
	xSZlovThF4E6DUSgf9aZGt0QSvo+M4RuPbzHBZIFumwplSo9bCqPVEHxw4H0twLXkMC9HkmnfHa
	p0XOXEJYSt8QzRAnlRj5ju49qF/cW9CGSnVih+n9D1GvDdw88JX5doRVNChkhwuRxUVzK/AIf4Q
	zE7i+dd3oAcKDr99T+UKwJ9Wd1iOIGBTUjYEN263Cy08k8YzllQEIeVXxXizkXwO2+8LzjGDLX7
	poD/WEOJy
X-Received: by 2002:a05:600c:8b33:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4b6e0edffd5mr33716705e9.35.1793962444315;
        Fri, 06 Nov 2026 02:54:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4932901d9c9sm2031660f8f.59.2026.11.06.02.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:54:04 -0800 (PST)
Message-ID: <608dd5f2-4136-4f3e-8546-2242f43cfbaf@linaro.org>
Date: Fri, 6 Nov 2026 11:54:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 03/10] arm64: dts: amlogic: meson-s4: add the PSCI CPU
 idle state
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-4-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-4-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_025406_408048_D4713320 
X-CRM114-Status: GOOD (  17.49  )
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
> The firmware implements PSCI 1.0 without OS-initiated mode. Add the
> core power-down state the vendor kernel uses (power state 0x10000).
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 675db02a8d5e..57270fbfb4a7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -22,6 +22,7 @@ cpu0: cpu@0 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -36,6 +37,7 @@ cpu1: cpu@1 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x1>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -50,6 +52,7 @@ cpu2: cpu@2 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x2>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -64,6 +67,7 @@ cpu3: cpu@3 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x3>;
>   			enable-method = "psci";
> +			cpu-idle-states = <&cpu_sleep>;
>   			d-cache-line-size = <64>;
>   			d-cache-size = <0x8000>;
>   			d-cache-sets = <128>;
> @@ -82,6 +86,26 @@ l2: l2-cache0 {
>   			cache-line-size = <64>;
>   			cache-sets = <1024>;
>   		};
> +
> +		/*
> +		 * The firmware reports PSCI 1.0 without OSI, so the platform
> +		 * itself decides how deep to go and the kernel only has this
> +		 * one core state to offer. The suspend parameter is in the
> +		 * original format - bit 16 asks for a power down at affinity
> +		 * level 0 - and matches what the vendor kernel passes.
> +		 */

Drop this comment and move it to the commit message

> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_sleep: cpu-sleep {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x00010000>;
> +				local-timer-stop;
> +				entry-latency-us = <4000>;
> +				exit-latency-us = <5000>;
> +				min-residency-us = <10000>;
> +			};
> +		};
>   	};
>   
>   	timer {

With that:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

