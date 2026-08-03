Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EE7C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 02:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBpvBewXJUAUQskEE9gVJKiIy2xHWWYPydLmxFZvPhA=; b=s5m1h+AiaLrp8Z5KO9I6cM6Mh5
	MXiOCmQFVkxjG5sD7fFx3XYKiSDM5+GU1iDlWVPefxJrwqVNW2XOk9r00VpzmQI3CoOuLdUcLf+Tj
	y2WtWCjlgASfnebBkfXVfoKfVyrKZcfzyZ8cNI641F+Pq+KBcRTxTa90KFpJLgHD6e4mcOJ4aM+nR
	uwdVI4XYHzB2DzkfEoAuUExIAWw2zr4nxOU4Rn5z/zUjkaR5GamkCUF199kOwPwZhtW9PDG5ulW+S
	7EvwCnRfKu9ac7BquAa4c5OzYmsk+0GsApZr50b5Y9gFvd0Rmg5H8ofDnZZLnnwH16zDgZdHYF0+K
	R+brx4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqi4J-0000000GBRS-47Nc;
	Mon, 03 Aug 2026 02:06:19 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqi4H-0000000GBR7-3ZsH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 02:06:19 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2786308a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 19:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785722776; x=1786327576; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBpvBewXJUAUQskEE9gVJKiIy2xHWWYPydLmxFZvPhA=;
        b=b6EolB7jvfzBKXw5zZ22PNfiigIS1y9YoeNsvGyRiV+cOGxZXlY01mx4HUi0x4UCQO
         hmullLCRlQ6zP/wP4We8IYZbRQkS/ChsZfaVYQZQ0HZ3H58kNd+8Py5D2T5dI1/WZoSn
         taGACFmpaOeD4CvhBO0Gx1O8x2Uy5CzXXvQGwTHAA+p8lp2qHfHuDQXkpcZYbT5V3a1G
         JRfEW4zaetBVKPRvEtjUc42iNqjkGm8ifVTluOmKr1yWKTSt9237vdPHXEnK3RuZQBZx
         mJCo1CT6z+phT4I6yx2BiDpNnpcqjBT+Yy7LSsmx29wk1Qa6TTNWiCvQfzbARsA6S8MH
         rDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785722776; x=1786327576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBpvBewXJUAUQskEE9gVJKiIy2xHWWYPydLmxFZvPhA=;
        b=WPlpPhacd2gg36jhrB3pU+1Wn18P6/M1wVktZpMlwIe42a2dzDezyT+l/CsOflVyuc
         k9TnXj52b0imXqBg4xuzJLrlAY4pxriICEX8kI/XQ0hlZVxEAZJA9yImzIzpupU0B9Mm
         9FPWuwgZb+U4DlSWNr3/gfpahjLrawicUGIN+JciLHo4MU+79LECWVmgv9PPIG/FN7XO
         Tv36j4tvfSDrtYRpnikCKWc99Wg0RIVayboXctbq8t8gtqM3n5CSbx2DtdZ6Im0vDekr
         60HXlq5qjri0GDFJ5sWrXYYIyCbSAzxHvSmYN6FQcFqZ7v2OUk345+zz2njwS+226jvE
         SAlQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzAKDbTC/TaGP6/CWvNY3ootUZUAmNIYOp0h87kqjML2Ww9rxqrKXcjQjPEsBAIdNnsa85DEQJyM1bOzExTR9o@lists.infradead.org
X-Gm-Message-State: AOJu0YxYpzmrrsJ2oyLgYJxSKwwQGe9ye5LhQuISLbvEb+SWRT3YSy+G
	bGWZVR3W6Bu01afPJFMw31DZAMLCm3M7yD2wAvA02UTJX3llEEiT0xVa
X-Gm-Gg: AR+sD10JoGkUVWbedbr2icGB6y7j1LW0yZ7Be/SESKezeNUksoAVjQ9IzgYVG8pRCaB
	nb+LbwuN33/I+wN2PuG4a/VAqyMNogteMycyJzYSjPWOmYvAs0WoXUarJ7yxHtLoC7l8XshQZ4Z
	sNhwnL6a8I0PDkO3UQNbBpfdxYhRWQmlsBoLwdGfWFYuFFVlX7Fx8jil3/9gioOJnnVqZjrsS9X
	IJOh64218LDZ1cGMCLZ7M4AY6a/+M1mP4sS4daE9sUpASx8JYgwqo+N1QCaKRJS+uOzpYkbKWlW
	9uUKR2R3sTBKlyB+5iQiL6PDLZVUMyr+gZNsormwwZUlNVgxqfXZlITH+U+VWSeAPuTRVQ+t1Kg
	5UM9/tbRAuPNFtneJmam0i63DtiBdOwTfpfQUXSjcGtADxiMG9E1qUsqwLPcQQfma8PC5PWPqPz
	+K/H0syDw7hstQDMUHm58a1bpK/xBn1bllqRUu9u9/x7PTMhOJrM1+YJUd6AO4DMUGTIQfJ5SyP
	94qggtrDXVZwu9WmupLKYxABsrRxq2/yo5lGOAx
X-Received: by 2002:a17:90a:c104:b0:38f:c8f6:4ab4 with SMTP id 98e67ed59e1d1-38fc8f64da1mr3417332a91.41.1785722776096;
        Sun, 02 Aug 2026 19:06:16 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2e0f409sm3199716a91.4.2026.08.02.19.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 19:06:15 -0700 (PDT)
Message-ID: <222f1bd8-e680-4a45-a7b3-d6e8b653c2a8@gmail.com>
Date: Mon, 3 Aug 2026 10:06:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton
 MA35D1 QSPI
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cwweng@nuvoton.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260731023818.1626075-1-cwweng.linux@gmail.com>
 <20260731023818.1626075-2-cwweng.linux@gmail.com>
 <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_190617_914924_FABD9F4F 
X-CRM114-Status: GOOD (  10.98  )
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


Mark Brown 於 2026/8/1 上午 04:28 寫道:
> On Fri, Jul 31, 2026 at 10:38:17AM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a devicetree binding for the Quad SPI controller found in
>> Nuvoton MA35D1 SoCs.
> This leaves the generic binding's support for GPIO chip selects enabled
> but the driver doesn't set use_gpio_descriptors so they don't actually
> work.  Either the binding or the driver needs an update.  Otherwise
> things seem mostly OK so I'll apply, please send an incremental patch
> for this.

Hi Mark,

Thanks for pointing this out and for applying the series.

The current driver only supports the controller's native chip selects, 
so I will send an incremental binding patch to disallow the cs-gpios 
property.

Best regards,
Chi-Wen


