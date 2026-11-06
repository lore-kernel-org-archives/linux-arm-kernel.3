Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDA7606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qousp1hU;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tyhPt8PP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l/EtuhWrNppGiDVt+KKWYShvtLcO6NX4s7sOY4Stz8U=; b=qousp1hUGMYImayrCadJq+nLYu
	CKa1synRSJ/rkaBYi0+8wNYrh9Kl9v9g4QaNN8oo70yUXj/4WosRgiZCH7LHbOI1sPTvdFLS8hSBD
	eRdXP2vZCONUNleeHMQQ5kRztSLH+oONj/NGu0gSApJPL1IXmkYyeuVNTZHFYZvaObfwAipMpSQyp
	EoecB68Z9/y5pC0dbABza5SqolzW0iO6lLc/ELY2NGiaapoxV+9EETAMzdV7Ju8yXGJ2qcnzsb87j
	yTWmzhwNoSMWxPtPT1VRfXO1X5KCiXG373myqfM6rnXWL9gpf2/QNycZgwXUrDFZKGfr44Bq3SpcT
	iIAaz93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHbq-0000000C3ji-3YuI;
	Fri, 06 Nov 2026 10:55:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHbk-0000000C3hI-2Jlp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:55:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e10a70540so326440f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962543; x=1794567343; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/EtuhWrNppGiDVt+KKWYShvtLcO6NX4s7sOY4Stz8U=;
        b=tyhPt8PPG6TGQTJN1zdJ0YFkPwxuUuKrf2PXcW+ZP7e16puehNPfRMkryhQBtLzMeP
         SCq9jEUwcCw2UTKVbI/lOk4/1bndAhwx483o2z6KQnlFAJ3L+brj7iaRzlaXC4x8myYC
         dEZAQgjQ+FbB+keK8NWYz7wYp1civsAUgJWWooFxIXHUdBAkEOWAzzBUfeLLyz0H/7rj
         LJwYnj2Njz6PdWFJg3ZhpJ4YpS5Tv/U5tXbiweJmwk716bUENcbS4ogr2+dP6t/lxuSU
         eUFBRf7t8qJxsgVwWBu6S+tQP8wKIhXI/09iuBcgI+72Jedp60Jv2akvsxPEZOGGba6+
         1cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962543; x=1794567343;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/EtuhWrNppGiDVt+KKWYShvtLcO6NX4s7sOY4Stz8U=;
        b=p9ewktEVhwO53b+AnI48AqN/HO3lrBFadzZzt9fMbA2+UyLPZ3hBN5hZMLbxrqMmoJ
         lJsBx9ZNr+YYYBi2UjtcI3umkAtQfW3hEGDyLAIwJJho2++W736qcq8Se3xc/bEruJ3M
         Qkn3l+nNhwiYm8eS7KJU5QRH9jgWVAf2Wo6C/kyfTF4jfmtBx4EOIh67d4CWLDId1jmP
         J1rmo6fnouoYZ4sE+9wRNXTmxWlfctnq6gbBdkxqJ4rzaFxkzX4EywUugBcuKCBKTabJ
         9USWfaNQ6pwvMWa9imYuauYxdn05zbHgGcmUXVv7muSM8rOrsyQnxA8Ax6pK4zSXFRDj
         tcOA==
X-Forwarded-Encrypted: i=1; AL+hErE/TZx/rUo/vhD+WTQ4ie1EJA0VQJ2j3Bs88vor1yOELUBpWut6REilV6QXCSpiqvJBWBZdrdfS7HfOxPfTJFLp@lists.infradead.org
X-Gm-Message-State: APuU4Z/7yR8/K5emihi2Cp67B+jpobCZpAna8y3wd0DiwLOseS/fnm3X
	XIYdQHm1EsOLULr+AfA+wBnutgK6VQrtYDm+j26g1SS91BPMTLxJEFLsfnJi75W+yeM=
X-Gm-Gg: AYBFou2fl1NXmEMBp0ikBtJzCgpou4Cm0ur4VQ8YsPtNfsGQ+vPOo42OcFZDx6xAN1H
	7WUuU+R7CAtn3WtjBTtDCJ0St/44oR4IHqX6Iyexi0UWknfuWo4RzhuyechtVnGw+vGbq47TGqv
	tebON6kSrWOVKO8tQfylUPkTBRe/9Qu+KhGCMEG7LoQhItgGAcRXiiPVIEwGAISo3iw6FXoHTVe
	5wQmVlJFGoI8XXNFtxf12mWUFBI/bcJBPbCVpP5aafpZlAbtr5Yi3X2HraEN6k9R8AUe1Vckf3c
	iJy+StpkAnMByBHhSYRGpVRIin+Z/9gdNTvSei4kWLpuEjRAMTQuRhYoqBQh6/RQDRKLIsHrzif
	ryGQIoX42SiW+Pg+HZgoO642tm2kjajYJ0xUr1Mnq/Q9q+TmcoxiKog35Prj6D37jN/IkMZ43rE
	Q35XdXVHZP/4VFMhgIMzuDV04E5m3bzI+NNdGJ2aYV+9WpRkgLcr23JJynjPvC6l8ZGmMJTi0dU
	FFtprZO5VSYH6XMVWWr7k/y67cKqqDZByYT+0Yr2h9rIsN++xOQHXPOkFHpKStuVOHd9TIMyHpC
	HYymFuAWkPGFYJog6wh8OrnyaRlRL6kF65924K5qbUW5l07kScZ6YBtulc2AxS10QS5b4kjf5Fw
	66O7wRPDsBw7h3kPAzHXjGU3XCFwROQ==
X-Received: by 2002:a05:6000:4312:b0:48e:4300:c6d4 with SMTP id ffacd0b85a97d-492784552d7mr4914008f8f.53.1793962542588;
        Fri, 06 Nov 2026 02:55:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b79sm3100072f8f.20.2026.11.06.02.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:55:42 -0800 (PST)
Message-ID: <3018aa97-ba40-498b-8292-122476fbd3a5@linaro.org>
Date: Fri, 6 Nov 2026 11:55:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 09/10] arm64: dts: amlogic: meson-s4: add the AO CEC
 controller
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_025544_659781_6571BC5B 
X-CRM114-Status: GOOD (  12.63  )
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
> Add the AO_CEC_A controller and its pin group.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 155997649dc3..dd51e786d29d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -747,6 +747,14 @@ mux {
>   					};
>   				};
>   
> +				ao_cec_a_pins: ao-cec-a {
> +					mux {
> +						groups = "ao_cec_a";
> +						function = "ao_cec_a";
> +						bias-disable;
> +					};
> +				};
> +
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> @@ -970,6 +978,22 @@ sec_ao: ao-secure@10220 {
>   				amlogic,has-chip-id;
>   			};
>   
> +			cec_a: cec@44000 {
> +				compatible = "amlogic,meson-gx-ao-cec";
> +				reg = <0x0 0x44000 0x0 0x14>;
> +				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&clkc_periphs CLKID_CECA_32K_CLKOUT>;
> +				clock-names = "core";
> +				assigned-clocks = <&clkc_periphs CLKID_CECA_32K_DIV>,
> +						  <&clkc_periphs CLKID_CECA_32K_SEL_PRE>,
> +						  <&clkc_periphs CLKID_CECA_32K_SEL>;
> +				assigned-clock-parents = <0>,
> +							 <&clkc_periphs CLKID_CECA_32K_DIV>,
> +							 <&clkc_periphs CLKID_CECA_32K_SEL_PRE>;
> +				assigned-clock-rates = <32768>, <0>, <0>;
> +				status = "disabled";
> +			};
> +
>   			ir: ir@84040 {
>   				compatible = "amlogic,meson-s4-ir";
>   				reg = <0x0 0x84040 0x0 0x30>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

