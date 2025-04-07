Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F01C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pB3YyC3lg92dsQDu2Vh7F7+riGLIxr8jqmJlW8qtJFw=; b=MXxUyGDmsVNylYxb3p+mAJJFtm
	71rkh6O7YTxcjMsY//g9cxvmuGhhubE2BFxDIBCwCiZo3PNgZ6mcAyo4dLIcuscb9mHVUEwlLMNJw
	D3xHnR/8G6a29PkdP0xGc7+6z0+a5ERSVrmIGUcPXiauY8HGlXan0G1EizSVX2jWBCFwPEsfZgE8I
	AXa0ZQpNx9BQJCqxyAb5J5rRV+9laIW6WnqwakeU32iuer0Lkh6rg4w30Me/b4zFMZ64+vgfQLxHE
	Ayv8WdwweKhTDO3y2OfcSI4Ksery03royzb3ATZ4aV2+8m16b/6JVsmxFp0HWUb+fQNBMf49ZwpV7
	EwXzSe2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vXG-00000002FzJ-33ny;
	Mon, 07 Apr 2025 23:05:46 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vVV-00000002Fo6-3xr4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 23:03:59 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6e8f254b875so49081756d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 16:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744067036; x=1744671836; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pB3YyC3lg92dsQDu2Vh7F7+riGLIxr8jqmJlW8qtJFw=;
        b=E6VkZYwFJ+nGRuhdSJK4O7YcBJKwZ/gpKws/X1JPTN20cNdnnUup593Dwgtv3/ED1Q
         vD9d6uWrVsD5ztdXCqsZZaDW+fEbv11UqFmiMSTqPdknYqYfyto0IetmRfS67Whl1Zly
         YjS8q6S4CoeuQ441JuVkD7LERc5+Q5Elai5NWpujy9moDMqVG1MnEcE63lriKTbrdxtT
         PGTNd+qNvq7jNhYPWJBteq80o9sM9RQwo2vbZmJo6xmzZz1XB5LlNxNqtGXQCcEansaO
         WvuO/w5aNTT0UuYtagEnQzCePvcsDXWCDfr03+/UcRRDqRWnIeMIAxkGgM7yx5XAdkNk
         MeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744067036; x=1744671836;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pB3YyC3lg92dsQDu2Vh7F7+riGLIxr8jqmJlW8qtJFw=;
        b=aOSyXiQ3gR3f5EgcKSHcAIUFMzfoW8eWnJkNUxmBb1jYPxKRVqa0a5qKX2oPhnN9HK
         7gJjUa8JWCFcFg4n65CE1MW6dziBwYrya+OLHlEFJ6JQFiRlVEJIDG0txGCSSZ7ulkaP
         zmGEEI5AqXluQjO1rYXY3O2alVLbu8lgdY5Zj+D9+89PENT5sT7xrgxj4cm56EBGUkxF
         VfdgB4Hm4OqDsSAv87LZ9ikznLB1RnQhJ1IA3sgh9T8mfZvL80Cep4VS14TxxIjsyMeQ
         Fv/aTp5Egl9SEftbhLW3QUiEoo//I1ODp5R1UvqBiGaV7x7EQS+rpPG8u7J9gzvV+1pW
         8Ikw==
X-Forwarded-Encrypted: i=1; AJvYcCXeKwistGMBHS8Oh8hMk08PPEtgngKXV64bm6d6IPtRWiCbidjgnl2bhUjhN7J8/XwD8vL9xMSZ5TvTXPpAr9ro@lists.infradead.org
X-Gm-Message-State: AOJu0YxC9IRGz1EELABrEomnzN1JCAIZT3hU0Ixi5pO6368tUthzHchx
	cFmzW8ABRsossK5d4sOKMmXfX46YOSMpAHBD7A0RyZaX7J5Ef7rj
X-Gm-Gg: ASbGncvdtQJOTEDmrtBrJBaDryZlu0smQ+IJB+4a9pxBRMgNDI3Tl1YVKhBc7qvgf6H
	bqYaOrxvudPe0peRckrk/s5UaL1d9E3j7HxDlus2H+OGXBE6eCmq8E/AsqH3LYJlW9+6C+5wVAH
	TrfgRmHXnF7VzWR7Am6oG4G7XYZ2T4RJCNR0O2FJ8m7raP5NP6mlaPeaUqP5nkOVQ2zxYIqgOL2
	KKZ2SzN6dNq1iVgDQfSa+wwd8xkOjso8ZDUiuUaDBLW3wVeSb+ujkGr0ufVNO+ASc6o59GSQC+c
	KLbC+PxCpKXjyVjaWEAQAXVITKKqTTaQm1gcz2eMuT6qww==
X-Google-Smtp-Source: AGHT+IGRh6q4nlQ8y3Y9jq1CRRkrjO0aDfKO5qHIs+ZCmg9yhyOY7oHV+KQAoWlwYDMWk9ci68IKrQ==
X-Received: by 2002:ad4:5e8c:0:b0:6e8:ebfa:42f9 with SMTP id 6a1803df08f44-6f0b7412fc3mr169437916d6.16.1744067036291;
        Mon, 07 Apr 2025 16:03:56 -0700 (PDT)
Received: from [192.168.38.58] ([24.35.8.11])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138d68sm64577546d6.75.2025.04.07.16.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 16:03:55 -0700 (PDT)
Message-ID: <c62e514b-08ef-4887-bc8e-fc77bcf3b0fa@gmail.com>
Date: Mon, 7 Apr 2025 19:03:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Benno Lossin <benno.lossin@proton.me>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: chrisi.schrefl@gmail.com, Jamie.Cunliffe@arm.com, a.hindborg@kernel.org,
 alex.gaynor@gmail.com, aliceryhl@google.com, andrew@lunn.ch,
 ardb@kernel.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org,
 stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
References: <D90J8JOGEBWI.4P0BAZG2R4G7@proton.me>
Content-Language: en-US
From: Manish Shakya <msh.shakya@gmail.com>
In-Reply-To: <D90J8JOGEBWI.4P0BAZG2R4G7@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_160357_989007_4588BC69 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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



On 4/7/25 12:04 PM, Benno Lossin wrote:
> I suspect that most of the people sadly don't read the description.
>
I must admit I didn't read the description. I was trying to get as much 
as info. Since it was my first time building kernel with rust support.

