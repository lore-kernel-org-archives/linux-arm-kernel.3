Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED0C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 03:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pILQVS8q;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFoV2cD/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=; b=pILQVS8qjCaBjv
	pu3o651BZwk0jqR20Gqnsmlpdf+pmlrzCzrLb2DLXUUwFohNmEBsaWSPPUMGC1elI88QEjKfk3JBE
	2MXSS3MByT9YLwP33s59i30Sjo0sr0VL4ju2iIhIQn6L47RJZ7QZAFdQ6GrAqeFXCAyhXpS/BvaZu
	ErRhdpyfo/7D8berur94toHhHF1La3IGhvdhxYo/eGSXgRcfmaY70oiUtxSgYR3kFSMUjR2upkFIL
	s7kGU2FQ0cY61+3k5EnRgyapt7EWkccGhsKAuQG3dR4WTwir85rJzybhfosgF0xrznU4XyM+3u85/
	Jpir9DmFzSsfZDl60bbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNifT-0000000FRkf-0Q6j;
	Mon, 02 Nov 2026 03:25:07 +0000
Received: from mail-oo2-x08.google.com ([2607:f8b0:4864:31::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNifQ-0000000FRjT-1gCC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 03:25:05 +0000
Received: by mail-oo2-x08.google.com with SMTP id 006d021491bc7-6debc457754so1346280eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 19:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589902; x=1794194702; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=;
        b=qFoV2cD/exSvx78BA7JgjvC6hVn/KO1puLe4h+Rcv2Ww35vx7dSBkbL3MnVFB37jtX
         iog0DPEXiAa+fTfd24Om2pcopP1rVoq3MqhWahnPLpSBHulQyegx1hSDzjERpZBzrL5f
         u8SAIQUZC+CvyVfGhZL8Lp2UxdS9r7HLeahtZOEhf4nt0fy7Drhr0hnSnNXttq+I/Jy7
         xITFKVECjjXgeIcyU4HrEYeGsJdMLQOmbdm0pEId2Xi1nGKorVHGh6OyI8VOjWTDAk7A
         CQRTQIM+i4glsPcKVzkd0CzPwPa7buCyHgdqm4LBfeUC3zVwuyNeYEJCUcxj5IpLwLSV
         YJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589902; x=1794194702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0E9J9e3u2hpIBhyJEtBBeasR/W1HfV4YhtxW7rdlBNc=;
        b=IlRxZXnSn/qWVSWbU4zwR2zfzoYeQS0b1fI7vHhFHWzLlsJ0J3aN0yXDi52TLQig6N
         iFPS+baP2y//b7TcKCIO3aUKquS/3TeU+IXCD4q6yx5AtTuJWMPK+XpeLnRkp1wyC1Hs
         q7Avmcm2Fp60ZqgAqxMB+71YgUhDj5iKKFxmjtMy+NUMQbwGIGuncfN9SCB6xe8YJet3
         DMKtvzmvx1RiKkCT2VxEgR9RYSzOT0hHKEQ8C1twTxuGS8mvW55m4enGfcr+jM372ULJ
         UmE9DQfZZFrXt6lW9qSpIUBI/7Ej1Ey7E8FBftA1pDocRsHm8b5eNSDPvaYMOUZv8MJD
         4eKA==
X-Forwarded-Encrypted: i=1; AKwUvBz3MPJYj8L4U4Lb/XMqszZ3/JjhrPd3jakh8sfIEuoNpr0DW0Xyr9Li6DCLXWMU8RT7MUCuitbM8b69NCM9HzMW@lists.infradead.org
X-Gm-Message-State: AFq9FYKPxcmjYnT0dbvUNA6WcDaekXX5V1Rd48R1p1ou2AmKOFHfiOA4
	IiKtdmetHktcohrigY8I0hrzjzWCZ4FRCJYDygfNMYiIFuMABVVuBv/n
X-Gm-Gg: AYBFou3UGKvWis7gorObeo5JWohGcmwJx4M3WaFizx8XlF9A+2+bT3t2QCxzLGEFZOQ
	OXObBH/y/X52VWITegxQgLqHQElq5fOvlMQIF/dZxKGGGj8Wg/rY/TF1IujBoaoUD6qFcsJZVpX
	1lID4FscEHYHtvWd+hB5GvqB+Ug/YErhnf7irs5+voHU+R6z9EFgW52ZpdNYxp4EQ9KtYOxGRkb
	Z4OqHdTYobhnvV09XH7EYcpU+N4X//jP+DMIJnjn/I3bpcjbTJ5IvPydMvmK8NM0OEJql7iZzfC
	ZyFPH6xNpY429KArQAQCwgU6oQPPWugeaK7bDAOt6//oXxEj1LhdZQIiuRciPTMs6nCWeX9kb57
	BRmXSbLbsju/cVsfs7NEvA+3Yun2zdo5wtSGkgeE/9Z5Ls5KhOJIJLcG5N53zu1nYtNiHYDVEp/
	48xrVZm+rY6RghrMaLXRga3s0EylnqHwdy2905Zq3gd9iVERKFwqvadeMvzkeDS/lD7cgW0RQxP
	egJQ+NZSSpF0RMleLPB0lkZ6Y3CeHMdHpH/GFfiPwT639WIXvQQux3w3aeaH3CcgLqWBJdzrMRE
	0jiUJ2UHDgXyYARb26IX5xdI+6ab0F2HTOxU9+MGkNAO
X-Received: by 2002:a05:6820:168a:b0:6f3:6cf9:f182 with SMTP id 006d021491bc7-714f2480119mr5364303eaf.50.1793589901912;
        Sun, 01 Nov 2026 19:25:01 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d35499153sm8255830a34.9.2026.11.01.19.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 19:25:00 -0800 (PST)
Message-ID: <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>
Date: Sun, 1 Nov 2026 21:24:58 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the
 MT8173 keypad
To: Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_192504_447816_EBF27806 
X-CRM114-Status: UNSURE (   8.74  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Dmitry,

Gentle ping on this one. It has an ack from Rob and reviews from Mattijr 
and AngeloGioacchino. The device tree for the Amazon Fire HD 10 (2017) 
that I'm posting for 7.5 uses it for the volume keys. The patch should 
apply to input/next with a three-way merge. I can resend it rebased if 
that's easier.

Thank you, best regards,

Ryan Brue

