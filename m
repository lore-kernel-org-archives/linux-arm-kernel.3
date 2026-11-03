Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39E8606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xqSEsweN;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UpBMU24K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r+6KD6EavPTxoIx3RdmJF2dsNsMGEPhiTBNUEhG2xw0=; b=xqSEsweNI1Lj1I7FokX1e2itZT
	egzei4dwixEseeOVSgYfhGt1P5z6C14Ow3NA7LaBAop9s3QSw77Umu6txF4jHDjL196BbTpTyARYw
	IsZ2Uu+tCYEaMEQaqh+AcgtkjGPk4MKx/n2kYtwY/Gj1ZYftJbDp4Jy0whkvsOTv4xw8IBbSSJM2N
	SiGFfR/d63p+7NO6sqbxeKhJZuID5OtUAtjpAMIVQTz/fN7PfEZ7llV1f8l4iUH0u2BNoz8/3lgCQ
	q0tQHL8MrNwC7LX/OBHWgeStncj130p6gsASnJYBqGeJVRoWuUaQXE0WEZ126uaU0rDybYfZKIPzK
	w1MAl6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAVr-00000001hOo-3RXw;
	Tue, 03 Nov 2026 09:09:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAVp-00000001hNn-02Vl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:09:02 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c5358fc28so3161993f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696939; x=1794301739; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+6KD6EavPTxoIx3RdmJF2dsNsMGEPhiTBNUEhG2xw0=;
        b=UpBMU24KJPV/fam7Ak2epnrfQkfrcLCm9H4nkEMwrzOq7DxG/m/pTocZjkpTeilR7i
         fbp6Zds9hwZnXZFxC+vuhLNGHAoB331+YOc9Qqq70urP7+mDta4Mxfp0YK9XuVe6OksV
         qUtamM41isUWYZzMMOMbNuW/UBochWpAP5EkrdU8dPdZ8Cxeucaf0068uGcM+OIj99nb
         JljCE9uGlO5ErjPpYzBbNJoVBYXx1TviU9ycPKSOuIUzuUhXW9XDXTe7S4oW6KdMCWgB
         d/Fe5KVy/YjKgpquq3z7iZeh/GaQo+S15nT0rvXHp4OgPBeWJhmxTUhjLTJkUdLSHsyW
         zMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696939; x=1794301739;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+6KD6EavPTxoIx3RdmJF2dsNsMGEPhiTBNUEhG2xw0=;
        b=blg+ye4zJgy8csqVf/mkZs5orDic8j1wi78Ozr1MRyq39tzbekE4eeKDyKySDFCkPD
         LTl6rx5Mja9Tf+TgWz60uz+7v/O4Lza+MzyxK0bLH1NZef+jhE9wA3zcNTs5Bv1DwK4F
         JU6E+mOlF7EeOJ2c4++MFOALPwOaL+CreMG2UUq4FKVKHMBi+nXx0Vp/PnEgaOuQH+JK
         wByvrIftYoine3DMWzvxejT3cS0t17gM2rK7ENTzN6WuiVx+5SljyQW8uW62dk0knawb
         dWcB0qktkLoA79qnr5dT2t0/Z0L17Z+lNpU/Oo9auSej6iCSMMkwlgQ51ulT46VEh94p
         FBUA==
X-Gm-Message-State: APuU4Z/APbrKIij0+SJ/5vAZ/V5S5++qsQr5K87ZnW5QoiLuEpAsDut7
	Mglr+ZTnuIvBC7VA7qhZxV9a/oGOkPA1IbqqfFfqKHGfX683kj6V7yiwMdqY4wnGevY=
X-Gm-Gg: AYBFou08GbIC0246s8s9H/mKUidgrcMJF3iDxqszrSJXts9dbdMHNE/O5OPVfiHuvW4
	hYkM9w7YoGh7OUbZkdTubjyvh2zBr1zeusec9b5l5v6LyEfYt52lbvr3Myf8w7EqxnjyDagSIOF
	stQNiTQC4r7niO07IYj95bHehdgPXVufOEZmaEaVPXR+mCyfczqN+ZK1Az94eeO2mQ4UfTo7ujw
	W9zUQIcQ9TBg0h0gW44Vnj/YhzMhmvlmIXqAgnwJwYhb2Kabg2gG0ceJM7NUkGrbRCDSI/aTZP5
	qmqg851Howd4cE5XIHIe22fbeq1AP7fhg6kJRHaUcypVwPgR5i8MtyhWozoYpoibRuaf8Ax1c1e
	nn/vuAvXCz5/v5cUJdlLbRDY1Fd7LeV+De83sPn9HEsae54/Ndy1kToXdMW5Qg4E0cSduJCa/1k
	52ntcaxjX7CYBe78CCAgGjC1V7EMQ89U9C3VhXdaBfT0IdfottbL+iStm6zKF9kYxlJubiYPsiu
	CxeU8g616NkMHoI/DG2bgfKEwKff+vEParwwlq6uJCc7tkfA6KCjXHSlgaosCIwh6SGs3hN7ZZM
	npFHKlQZoNHdH65vs619z17hvP6Kqq8vxXmlqrJutbDSgZLuTxQDa9ZGQ5ybKJ+/ink3GVxAjui
	kRSnzvXwv
X-Received: by 2002:a05:6000:2213:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48e6e3042d5mr27695053f8f.45.1793696938764;
        Tue, 03 Nov 2026 01:08:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fbba47a32sm717115f8f.1.2026.11.03.01.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:08:58 -0800 (PST)
Message-ID: <054d99f5-3364-48c8-a5ba-ca2faf745179@linaro.org>
Date: Tue, 3 Nov 2026 10:08:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: amlogic: clk-measure: Fix AXG HIFI PLL name
To: jian.hu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
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
In-Reply-To: <20261027-fix_axg-v1-1-741388f1e851@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_010901_074678_47C90612 
X-CRM114-Status: GOOD (  16.03  )
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

On 10/27/26 09:43, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> AXG does not have a GP1 PLL. Clock measurement ID 5 corresponds
> to the HIFI PLL, but it is incorrectly named "gp1_pll".
> 
> Rename it to "hifi_pll" to match the actual hardware.
> 
> Fixes: 19e0bde7bf6a ("soc: amlogic: clk-measure: add axg and g12a support")
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 33767f0bc67c..c1ffa2537464 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -182,7 +182,7 @@ static const struct meson_msr_id clk_msr_axg[] = {
>   	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>   	CLK_MSR_ID(3, "a53_ring_osc"),
>   	CLK_MSR_ID(4, "gp0_pll"),
> -	CLK_MSR_ID(5, "gp1_pll"),
> +	CLK_MSR_ID(5, "hifi_pll"),
>   	CLK_MSR_ID(7, "clk81"),
>   	CLK_MSR_ID(9, "encl"),
>   	CLK_MSR_ID(17, "sys_pll_div16"),
> 
> ---
> base-commit: a848d72aab71e19ea78180f2502ad7d12818723f
> change-id: 20261027-fix_axg-9a1226dd4f1d
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

