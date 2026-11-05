Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD261606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rn0SrADH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gsNTSpda
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JN0h7SeXPERjAEMznolQ48k3OWsfixBRlrh/PkvU79k=; b=Rn0SrADHpOZJmi
	X01JhPtoZvZQSp3SwntOAK5JP6IvZ6/bdfCsF+UKJ3Ol39XCnhp0gpLNP6DPcIPp2H5Et8uP71RGB
	uA3lOcPvWzesvFpwRzUlH6gc9OEh+69KELaFnLrGvqEHQEY3+Jv6u5I6qeSrPy5LUTc+dFFkrdbK1
	RRgaLIz3dA0ADyoAzgQ7x98/CKcylxMlz8OOiJUiu7A5pr/bUJkWzd3rP5dnEOBbN36mqtd1tjuPi
	6dnrkaYX91Za/HBGP02+X7BDyUv/MRaFyyBUwPideSyTMPA8z0lmDj+TdOmp5ZGn2zPzrJQEOGfg6
	v6QDZM/LnoB5pxStiEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvHy-00000008Yy1-3vRw;
	Thu, 05 Nov 2026 11:05:51 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvHw-00000008YxS-0ET9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:05:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso818709a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876746; x=1794481546; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JN0h7SeXPERjAEMznolQ48k3OWsfixBRlrh/PkvU79k=;
        b=gsNTSpdad18BA3dkxEP813aJV2Llhg+RkH48dYiKouC88SCpuexOSrAe4YDey1ql+G
         MlepVmkFy53fwls4NJ35/O8Nlth3bILKqjz4vMX8SwY8ZYdCBPaFyqoRPenMol4M3Vhm
         z56Lk1g0cZyBILrLCq2pmErVHI3TqAogIRdi4jbo2/C3quTd+7UxbkQR8+nX4g5gN9Br
         QWudb5rUrVnilL2uITdKM3Vn2k9Kdsq7BdAHi6wLDKkCZyJXhWAx1//SyiUKCshXGpvs
         2XV1JwAWeOLlLKQ5Pgl76cMdqvckwB7arpLRqPWgpoD6hmQGdgLEwMjOlXuVFXNIl/fy
         eG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876746; x=1794481546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JN0h7SeXPERjAEMznolQ48k3OWsfixBRlrh/PkvU79k=;
        b=bhGISsepr5f1W0b0vs55agHs3RXHUBmzV6A9iqRw1X4PDDABgw5frfB5/ALe223Xt5
         02GY0NlFFa6QQepjJ9dFJ3ZiO1jZ0QFG4LF7eAx9yLeI4USpKYWiQpi0o7XHxoN9+8nJ
         9YmANOSAYpmPOby0wG9VevEhZmuiEssPGOvytaDC5oTcpfg1LXCg/oa63QKqq+mbWfpP
         x33cLkhJnLPZET2gh3i8NQAPHYMlF2pxW7FjePfyW1GnoGFMBm1Yha486hukPJhdmg0m
         q7ngBSgSVJpw4Ca4i4HmpPIuw7NHjXqxhS4MWgWjYDPSlqTEbbN8SZ3MryWgLH32qsBq
         9uLA==
X-Forwarded-Encrypted: i=1; AKwUvBwfys3jYGQXBCL1dyUPUTwdwGW0bK3SD86KQKhsDUfC+qcCZmdPpV+nBXG5UTEcjEw0XDBdO4+rDYE3Rcn2ZL+V@lists.infradead.org
X-Gm-Message-State: APuU4Z/FUIdwqtg3BsCwFmv80IGpUkmaRiU8dGXyYprlx+Olnzy0Dtnj
	qFYGIVy62MTk1F2OUihFIYjQ8+wFsPzRmLJanUXDJuzgV7aNmYfJ7kwm
X-Gm-Gg: AYBFou2JwTfb6nOMhhQbcGLlR6mqNMHYtmGYXXfPqF+Sy3t5nePhyUgw4K36IN64XW7
	Ebehdion3X1+KJgJ/sBKEufv1pMJQesKdmFZYcSCtWIKJ3sa6j5Ff+6SklhVLoCG4TdyjnHOSGl
	K1AMQKzX3RNPmKZ9fUgyeBAF92jc3dc5QOhRmWLFVM5ytocGgKESnr2o9g6znoVKPoKAc8B0DUm
	D8xHw48SmDy5EYe80kO1nM4p8gnCYDZhxuK2ykIzGGWsUgPsZWq+0ywi0Vo33ad9IIfk1yMuFfm
	0F0QUJJNfUxvz9E2qOOBrY7abLj2wfbr0OGE9CcGecGGHi7qJRb4K1lMuRxhi/ytnlHA5AdhdZF
	c8LdTOaZxZYEIMVfTBdcJHyaKA+MirzGQa8C/RRobBhc1P5lqvq0VO73+lCOMMvCt2Z945EfY6P
	oGrNil7HmguyCMVAcHCtEs0NJcvKcyOJQaAIlmVbuOtMZDOqceqjppYR9D8xq72WDwblSBJC7Og
	FFffGcIBYwVybIi5nGRtk1l4qIK4I9lgxAIIA8xbXxLpPc/kSky87WmRsnY1A1b+gPWvk3BEKOy
	40ovl7kN3huXi4NFDiG5pIwkOblRwkbiFUjWSnxDG9qKEWLJi8vnk+nkd85+3o+LxQ8ukOY1WRf
	/hxo=
X-Received: by 2002:a17:90b:4a84:b0:3b0:97bc:62d with SMTP id 98e67ed59e1d1-3b097bc076emr4500305a91.32.1793876746390;
        Thu, 05 Nov 2026 03:05:46 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31aa128sm3474817a91.11.2026.11.05.03.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:05:45 -0800 (PST)
Message-ID: <67823831-cb47-42e4-8af0-1331a3f73ef5@gmail.com>
Date: Thu, 5 Nov 2026 19:05:42 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20261104091136.151269-1-cwweng.linux@gmail.com>
 <20261104091136.151269-3-cwweng.linux@gmail.com>
 <ausb-YqIJM0mI65Y@ashevche-desk.local>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <ausb-YqIJM0mI65Y@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030548_098186_A9270600 
X-CRM114-Status: UNSURE (   6.39  )
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


 > Repeats what __clk_is_enabled() provides.

I would prefer to keep the local flag here. It tracks this driver's
clk_prepare_enable()/clk_disable_unprepare() balance, while
__clk_is_enabled() reports the clock core/hardware state. For a shared
clock, it may still return true after this driver has disabled its own
clock reference.

The flag is also used to avoid EADC MMIO accesses after this driver has
disabled the clock during suspend.

Thanks,
Chi-Wen



