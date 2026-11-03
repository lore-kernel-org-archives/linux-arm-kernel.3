Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D66606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tht0d/nd;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iiW0RAEc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0jyamYHXzSg2ziaLDwiS5/5BeZM4xaO8pbQEHrQdYGE=; b=Tht0d/ndfXg+m/GLevgizaYGp0
	h73/5WCDCbo4K8wfRpr8cJdVb4sgnENaYcgaONb4j2TnBZw1vbdo+3RpZN296SSx/+kVEbIRwuCYY
	UwuScqQPHaN+RC2uKEXSj3CRESmhq1OEc0YqGS/nNdF8QfzuPo23ds6JJ0UXUqxhhVqy/REyiaDGu
	ZhmrWMNK5ZT9OA880ln29NnenDBsww+kTnVuGbZl+6GRZoiQHwwYq3GRGA8jIFASrIGpceLZwsjHe
	AXHYX73N15JPXJuK7IJaoGTYt8qrSZCpReU2iReD7L+49wJVJGaNIMwHVSIjuQmzus0ZX5/bA3DdC
	XrNX2uQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAJR-00000001eZA-3HFW;
	Tue, 03 Nov 2026 08:56:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAJN-00000001eWW-1gxj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:56:12 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3351637f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696167; x=1794300967; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jyamYHXzSg2ziaLDwiS5/5BeZM4xaO8pbQEHrQdYGE=;
        b=iiW0RAEcZYPw0AdhAvbSNZrNPaoNqlMbzmstN3Gry7ZxzWlr8g11kZp5SbCXdnXGsi
         2EIAkAFCMvCylk6LhrgLtM5LYXkoEt4hdYCPaWnqE2hAAuu2jejWGmbSkn+Ww+3AQZaU
         HThPrcK1Hjl4FkDxQuHhPyEFiG2ldOoULi7vgiORh0ciYDRuF01Ea9jcT1vj6dfT/Yke
         z26vt+txSJFh1tWWFk6TKfS6y08Kqgml52HkcutH9CK6M89pK2gIvgQOSA5ibKKyclwA
         m5zfTUeg9R5bztcBWs+O0QbVAyMPBstNFqHkX+Tzrl0ZcjAQRpBppERo4YBEhkEl+vOa
         75Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696167; x=1794300967;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jyamYHXzSg2ziaLDwiS5/5BeZM4xaO8pbQEHrQdYGE=;
        b=ut2IKZEt9INzyO4URxL9JQcukoHkgU/+VGsSLQoelX7lANe1mUVQ3XmN6fR33QlS2W
         8+Tme6PONWCZ6RyLIXi/9G5BvsYV27zhA2t46YSnU3+RVnQxT1olXe+71VZfbw3QZSeY
         kFwcbW2AmJ64A26hlpcKSDnzy6KT5BlB4OY2YXeY783axTyNZBq6hvqtAhedcvRABQ/n
         mNYVqFo10aXRxumoxOPq/Msf6hlI3vRcuc38e4KyY0jxi02whAaTpMt7XSg9wo/0e87v
         t0GyU4CySyM1GQ1LikmNzPd5JxOokRIfJ2GSQxQdQoFDQxHhzMkHrdTy3EbWV9dtPilt
         8GpQ==
X-Gm-Message-State: APuU4Z97GoAyLwlp6b6Z5sj7+0d/dEMD4TQsWgp/TLdyEVwXOjrU2gFU
	1/SevosTab/y9xm+w2sWnVNfP5t3BZCw08UE4mzwgrGA1W23ZOxqUcH4ALZnzfWU18Q=
X-Gm-Gg: AYBFou020CHQ2JlX4lLHkGCUzK64+nzQhA/X2qm1ZXEGTX3f26syJKBORpXAV9qWpjY
	j/1E4OOFIVVudBqwAV7pZijZzZqdVy3X4sCWlxw2MvmNvhiG1ERwISGBZUx96I6YuB57SzGKWgi
	kVVGYB5UiqiQl1s4Qnn8afuIBgFh4SGctZtwpO/Iv7f+6CK1M/gvnm8TqMBRJZIbjf3O2SJmvCH
	dSS0CoiHcqRLYySh/aTn4X+phgqy60u+la3dgSxkoWzL/Ol9Imwq1xNL1Zb+aioq/f7POjjrNwn
	Hz95XvMLS0cFS2bGTIFi24NBWDUFG1u5yUDal+IElg+kj4wHZ5OMMXrexBN5B0K3zlmy4lakCKg
	cXXQ9gkwfGosWO6FugqG+RKFaECA+iU+BFpcIKVbk830Cp43tLtdj8UZk4V27XrVIUBjUEQGqQk
	MgHCaaS0Q0rmF4KPRZayWIlPwuwiHcP8oucgPF2pkWvs4lsAV3epYk3idZs6nsFa4VQXumPrBeo
	+71KCIz0dYEqdwzdeCDTUf3fiyriyU5M1wifA++ZuHGauCiR4XKCOmdH+txK/Wwd5goV6X0NTRU
	ynyAklGTJCCVcQuptJVhKZRdG5ThAxqmgTABlq7NHk+VNAevQnp0HOteF7zPfG4QsO+cIfvNRga
	BddY+qptf
X-Received: by 2002:a05:6000:2504:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-48e6e500979mr30641989f8f.24.1793696167199;
        Tue, 03 Nov 2026 00:56:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e88876946sm4998576f8f.5.2026.11.03.00.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:56:06 -0800 (PST)
Message-ID: <c1c38ee8-5a7c-4b08-89c1-e1e27a2043d1@linaro.org>
Date: Tue, 3 Nov 2026 09:56:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] phy: amlogic: meson-g12a-usb2: add S4 support
To: christian.koever-draxl@student.uibk.ac.at, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, vkoul@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_005609_715153_CC3D72D2 
X-CRM114-Status: GOOD (  16.57  )
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

On 10/25/26 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The S4 USB2 PHY is the A1 design with different analog trims and an
> extra disconnect threshold; without its PMA update bit the host sees no
> root ports. Add a compatible and the S4 settings from the vendor driver.
> 
> Tested: both host ports enumerate keyboards, mice, hubs and storage.
> 
> Tool use (Documentation/process/generated-content.rst):
> This work was done with the help of an AI coding assistant, Claude
> (Anthropic), used through Claude Code over many sessions. It did a large
> part of the hands-on work: it read the vendor kernel and the firmware
> interfaces, probed registers on the board, drafted the code and the
> changelogs, and ran the builds, checkpatch, dt_binding_check and the
> tests on the hardware. I directed the work, reviewed every change and
> the final patches, and take responsibility for them. There is no single
> prompt to quote; the sessions were of the form "find out why X fails on
> this board, fix it, test it on the box".
> 
> Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
> vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.
> 
> Christian Stefan Kövér-Draxl (2):
>    dt-bindings: phy: amlogic,g12a-usb2-phy: add S4 compatible
>    phy: amlogic: meson-g12a-usb2: add S4 support
> 
>   .../bindings/phy/amlogic,g12a-usb2-phy.yaml   |  1 +
>   drivers/phy/amlogic/phy-meson-g12a-usb2.c     | 65 ++++++++++++++-----
>   2 files changed, 49 insertions(+), 17 deletions(-)
> 
> 
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

