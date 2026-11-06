Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D407C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=240GMQHn;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ym2465ik
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=296xUxU8tn6mPRnshqQK79RjtnZgHDOcCRgt0Ddd2s8=; b=240GMQHns3xoe6bts0K/Nk1/rG
	o4Ob5+hix0VLMpEg3/PaRmyLLKbIBsYb/mN5rFhF2gnuiAjFGvSmV11+S1Ku9X/Hvb8mj4v5jHYi7
	qht/VE8CwbanrLYepTvQuSChcTV/F19Kq23ta8Kfp5wbYgyt/4M2dPLZzPKbMYszodyuTyEZ7eTQe
	skoVKXFGGngouw85W4+ml+lOfw7U3gzpajQpAhIlvugyclfYNIjzeYcWNM+ZHp+To8b88Lv2PmcxI
	bNwW5u6/ft0d+oFPAQZWtqQqpoIKHuoLKYHHzkHBH2XbwHhOdyEDu+++9EkI89bn/KbG+CTGv0ic3
	hWOjq4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHbP-0000000C3YK-2e6j;
	Fri, 06 Nov 2026 10:55:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHb9-0000000C3Ux-1RS2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:55:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso4347615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 02:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962505; x=1794567305; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=296xUxU8tn6mPRnshqQK79RjtnZgHDOcCRgt0Ddd2s8=;
        b=ym2465ikYZHM4EGU2rSvoID3FDMvrX1uzvJvqb5JxPNEvA5evcF5T/UK12O2XdqEzf
         rDAXjZo+JtBDDdag5dCZzsdIv/PRHSLBh8ykb8ppA+Fk2hk7UFJ0/ype6NPbDj3wgKmU
         y/ms7Ca7fnUJDyn7ud586HcROdLgb/xZIS6bMDK3UxgxSpb7E/kkX/fMzMLiU9j8ycFN
         Nc+t80HXG0+hXyo7L88Euy6ygrGvWFH9wgC3qCcWFQVfYkVVzuKqhSlnIHLCo5D5oi01
         v97na2pFvT1X0d7vdhWtknZoOtlqzVWUq+Wse7Beq896DDSOGzxqIkuDGm438zzzvWGa
         VmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962505; x=1794567305;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=296xUxU8tn6mPRnshqQK79RjtnZgHDOcCRgt0Ddd2s8=;
        b=sxKOBiQ8xkRGTdBP0Kty/eSE7M8XkU+jcsoUJeNI13imhDZuvl6tH/ewD1FUoGEy/T
         ai0Fuaq3h6ts/MWlgK8NsRG2lx+hCD/oOyAy5xdTHPowPsbSDCMW/0WsgRHI9XEkmS9I
         1IdL4wtRXqkIc0XADMQD5bMi9apAIETi+62DT+C00p7jNoSWke3xyUEdpHt9gAFUpmNG
         bvq6nlusRyMhvDhSM26PztzBQL6reeLE8JEpL2z722/FjaVRq2tvXFldoyDtPs5BHyqj
         ztwvIBFBrGbxbLEaxb9cGlW6hgckOBBylo93cG+lxENnEBomv37Q8HOIxkmpZw78YFyG
         XHyA==
X-Forwarded-Encrypted: i=1; AKwUvBwlfbTL9rLzr2FSI3OIKrLmFOvQVe/xL92VRRyG0sr203Dgolanx0247tUGlbFJQSUvhzMNhfbjP8AEfn1qnXno@lists.infradead.org
X-Gm-Message-State: APuU4Z/HImaO5mY+7yKesHKv74lXqVNEB9DMHAePQ5Ul9oJk/oXfbwY5
	8L4J+Qxh1n4e3ZZJ2D3CagCJCtvEKR5NFxnhQJ0ERoSpXda4yw5R6VOrKzyRR9ko/L0=
X-Gm-Gg: AYBFou12p/MtUKnkzF0j88kZaMzc4Rn+6ZvGe34h9WD7djmvkfP5bakynPAAVLIMMlS
	DNRTYLDo+8apuvtUOF0trKFnRDuul/N8dPjK4kSvWs11gyRd93OZ2gSwkCd0SRmVFJrcDHx5iGn
	g3M48NqonToNB/6P3DMpigBO3RI/5TXcj4IBJ4h8dPpgzVc4Qk26k0pi+9REsZKe9g44K0hMjcL
	he8HHUP9jChJmeNjtVwHVHh1OAg2sl7LnVV8BStwtK7m1HHqQanTWV4UawmkGgtSI4MLpUV5K0/
	E3LSpAc8c13lQJPVyd4KzHG+EwA48sto2GSmbQ2Nu4swQ2k8pTHHv8O0flJcAjmgSSM0sR8dNDf
	cMbQvXK4/WtW5URWpD7IC36f1LX+VpeMtrs/igiAlo11J5pA21VHHXmSo6LKvdrYjDUwsGhL5Dg
	TTfxgCnw8VDT2ZrZnSGLz+MCg0gAVq/509KQ/utm8Z8Cq4ssCsIeFcB9cBxBXBqUijNKkQ+Hsnp
	Y0thGwpaJ8CofLPtm9f3z0jVmsLBVnukbqkAvRGDemolYe04PgF+KodW3ee5jCJWqNREMrUjdO/
	g844FBz3PXLoTP2UV1Qmg6kP9LeuyFoCr8mUsW6vbSW9rshQPe7OCaJmtrIWj2QKXYYekGG7aPj
	HsI4gP7A=
X-Received: by 2002:a05:600c:1914:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4b6de788f5bmr33245395e9.11.1793962505296;
        Fri, 06 Nov 2026 02:55:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm46157125e9.2.2026.11.06.02.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:55:05 -0800 (PST)
Message-ID: <d089bf43-5037-4ed6-93a5-c067ad1483b1@linaro.org>
Date: Fri, 6 Nov 2026 11:55:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 08/10] arm64: dts: amlogic: meson-s4: add the USB host
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_025511_056389_37D26A2D 
X-CRM114-Status: GOOD (  13.07  )
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
> Add the two USB2 PHYs and the USB glue with its xHCI host controller.
> The S4 has no USB3 PHY, so the host runs USB2 only.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 45 +++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 8bbd70e52a29..155997649dc3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -770,6 +770,26 @@ cpu_temp: temperature-sensor@20000 {
>   				amlogic,secure-monitor = <&sm 1>;
>   			};
>   
> +			usb2_phy0: phy@3c000 {
> +				compatible = "amlogic,s4-usb2-phy";
> +				reg = <0x0 0x3c000 0x0 0x2000>;
> +				clocks = <&xtal>;
> +				clock-names = "xtal";
> +				resets = <&reset RESET_USBPHY20>;
> +				reset-names = "phy";
> +				#phy-cells = <0>;
> +			};
> +
> +			usb2_phy1: phy@3e000 {
> +				compatible = "amlogic,s4-usb2-phy";
> +				reg = <0x0 0x3e000 0x0 0x2000>;
> +				clocks = <&xtal>;
> +				clock-names = "xtal";
> +				resets = <&reset RESET_USBPHY21>;
> +				reset-names = "phy";
> +				#phy-cells = <0>;
> +			};
> +
>   			eth_phy: mdio-multiplexer@28000 {
>   				compatible = "amlogic,g12a-mdio-mux";
>   				reg = <0x0 0x28000 0x0 0xa4>;
> @@ -988,6 +1008,31 @@ mdio0: mdio {
>   			};
>   		};
>   
> +		usb: usb@fe03a000 {
> +			compatible = "amlogic,meson-s4-usb-ctrl",
> +				     "amlogic,meson-g12a-usb-ctrl";
> +			reg = <0x0 0xfe03a000 0x0 0xa0>;
> +			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			clocks = <&clkc_periphs CLKID_USB>;
> +			resets = <&reset RESET_USBCTRL>;
> +			power-domains = <&pwrc PWRC_S4_USB_COMB_ID>;
> +			dr_mode = "host";
> +			phys = <&usb2_phy0>, <&usb2_phy1>;
> +			phy-names = "usb2-phy0", "usb2-phy1";
> +			status = "disabled";
> +
> +			crg_xhci: usb@fde00000 {
> +				compatible = "generic-xhci";
> +				reg = <0x0 0xfde00000 0x0 0x100000>;
> +				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_USB1_TO_DDR>;
> +				status = "okay";

Drop status

> +			};
> +		};
> +
>   		uart_a: serial@fe078000 {
>   			compatible = "amlogic,meson-s4-uart",
>   				     "amlogic,meson-ao-uart";

With that:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

