Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCC1606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F3r61HtW;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eP7c8Qq/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RHBl9u4PW6S73EDeR1NNdDwKss/rh1D+3K5dZAbhGGY=; b=F3r61HtWTob2sL0qDN9XWv1F7k
	+NzXgmM+k3pEo+GYxmgGdzrjI7YbGSAYV6pe0HId9DRnUgtiiK/oofi+lIazrJ5pNkStggT98rBGJ
	1iS4jnxeGNIPcX7KaymCZLNk09uYADGLdKez8kIHxxKDwdWQrDQ+Z3inCsjLHdQRX7dEscw9in8+X
	7lqUMnLxuIb9X2dG3AtZx5yZsL+Tj3lSkt2boo9B+Jto5fm+jHIlstuCgVixHbVDC7XS3sDt7aVAi
	LSB61h9yrQ9iA1ycneH58rOKFeICviYbGHVhlQhbuapmLwflKd1k50lV3pbH5Yx3kkVr+mDYww5US
	Yl8ZaIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAG7-00000001dlE-21QR;
	Tue, 03 Nov 2026 08:52:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAG5-00000001dkd-1OCM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:52:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso31436985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793695963; x=1794300763; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHBl9u4PW6S73EDeR1NNdDwKss/rh1D+3K5dZAbhGGY=;
        b=eP7c8Qq/7geWV/AC3zAe/P+Qm1wyuKgRBaB8VSS6xwsDRPe0wlE2udr9O+RPMb2MpG
         XvEdT90fvt2xVzsU/dm6GDra+nNFSdmCoA0++5gul71LItE3Bh9n317cR7DvktjiZinA
         aeaaNYCgyubo+31quD2qezr6xKYeohY+2aLhCmnWi55bsgvgKyKKt6N8+atVFC5r5kQR
         GTNigDudMaksVyuVgzL2YMFy8ZVqdATWCCGfevsqvDfIkbUN4/zfHbdngSHk6oPdpzPk
         NsoaZCW7B1YWZU1kht4OBL7ZdaDID9/IDc7imB4vu2F8dUsh4y074olbWAcTk/419BxA
         hIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695963; x=1794300763;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RHBl9u4PW6S73EDeR1NNdDwKss/rh1D+3K5dZAbhGGY=;
        b=OSWTrEtiMplxC7bk+B+lkHHIeDHuB1+qYOat19BsG237WFNmVUgtLoocwnzNcWjDW7
         J8TD0q9XSN10IamZD16Iy4fke0fCLxdGTM4Inmb3yFSlHjuaOBFmxy66sxw5KJCAmCTU
         JK0RM9ylMyWTVzhTAYHgivniNGcSYn+NZW8TBbHlRhznw7NPBJ/0A5z0RIkpfVR6kyv6
         KY25oXNHytK+HLfHUfuIaluJmtc2d2/oHQ6bf2z6qIhKFhd1z3UHK3W3L8+ZDoIuQ7CX
         1EkYoFBmOfy1ZixDEpk2uBMlvoNYu4D1ULoiOkPTMqdQ2PTn4/YYAvYKXioxLLgNP4es
         lOFw==
X-Forwarded-Encrypted: i=1; AKwUvBweIxYf5ABDqEF7XjZ+HZP3RvBO46lX/WUZJDP0Q1wVYlyK0YF96rMf4k6GVqWiCXyUMfG3uQAonQ1IEY22M38j@lists.infradead.org
X-Gm-Message-State: APuU4Z+AXiKd/mYZ4pBp36S7rFPJBlurSJP0XXtDrnx3MMxQFknDPhpT
	xBLluZ3Vz6da5vy7o4EqKOIfVVikD6mopzpG5ZaZV94Of8FxCToRH1PtCi7cfpJHqGU=
X-Gm-Gg: AYBFou06aP0ag1XvZ9MJGpmbeAp1niQSBti13qI05KXlP2paNu53jUQm4xGJWeYVGfH
	sltTektPKL1NZVgUriZrUftLZOIjepp/UDlPzhSTgyy3KB/mpS6RV+NSq9fkTUaraRoPwYH8hs8
	PixnwzBb7tTQGtJPD0NiJ0/1Wk62oOzmoSjSAS20n1bjGKZ3R+M6hLRa3sKA3CUat8RAO/0JC8n
	dRLgcfg+CrWp8zvQqrHKH/WbwD+gZgfW1D7dtoa4daKJ00qWpaL5D0+uxEOG59997vfQ290MbCR
	PNpCHLnfDslHYrzUdc2dKMnYNL7vGpHLxyHM8d2UOGtvPLt52XI402P/hgwJeBBaab4xrba/2Hf
	ar0lsKZ0aS1RYlr+gep1nkP/AdTAkJkEk5t/hZ/BuZeE3bEIb7Sa4hSg19rgf8NpO0Y+4MGJ//3
	6Q4EDboIl2hiXH4jYDvyqxyNMnl5n8qu7KIHB2a4XYB22SPxhURNqJLNsrt4ATiQHq4vjJmZtmj
	CEhD+0Yrrpb+xKtgzYd1yuFvSz+PzJ+yX9OEDqMn0c6sMvMnD/EJAUtwj2dbowgqSc21n2qV/xe
	LX5UOF14/k0CrVqEDpnraFsqjbmhvdDX9o6HIS9Y8SpDQO1GL5y3Ye0RKQhibkTOa6fofmqoy6q
	kdktNCik=
X-Received: by 2002:a05:600c:6216:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4ac1737c533mr271366495e9.9.1793695963059;
        Tue, 03 Nov 2026 00:52:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a8c6a9e0sm43117295e9.6.2026.11.03.00.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:52:42 -0800 (PST)
Message-ID: <3736bdc3-0f1e-49a9-9559-5a3b7383848b@linaro.org>
Date: Tue, 3 Nov 2026 09:52:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan
 tachometer
To: Igor Velkov <iav@iav.lv>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
 <20261102-ping-fan-1@iav.lv>
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
In-Reply-To: <20261102-ping-fan-1@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_005245_395621_35436B25 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/26 19:20, Igor Velkov wrote:
> Hi Neil,
> 
> Gentle ping: this has your Reviewed-by from Oct 7, but I don't see
> it in for-next. Could you pick it up for v7.5?

Yes

Neil

