Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1965ED5E12F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 11:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/RIYF42PliwHGA1qVUEQXCAnRxr5/CBto7gLpiJw+8=; b=3zRg0eypsUkgcqxVeXkZ3zj9iQ
	eCZxG45ApfQ2/7YNGFaQWUoWq2HnAjd9ywqjZa/amKxWNUraT230AxyUbFrtgeq2PGHAQ6Nhu+aIU
	bjBZ3kOL4340KAIJW2RUCccYXEkGOzdFmonJ+34rP7OTNnQ9A3T2BXwhcMZJa0hqniomol5jsaJwF
	sLLEgJsK0IrmBDperQxc53PVK0AhhQDHMeW+c6mYRluKzyxAsdHgsuxZcJGdKnbM7CyDSHRWNypt7
	hMph3FnloI9RVhSzcisDk3qoYU2/Ib1DN7ZtpkU2wY05Mp8Of7nUWM8PGfeQzO2CMInt14wOQ80lZ
	pWh73v5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NHp-0000000AMbP-19zg;
	Fri, 08 Nov 2024 11:36:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Mfy-0000000AETV-0yKf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 Nov 2024 10:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=s/RIYF42PliwHGA1qVUEQXCAnRxr5/CBto7gLpiJw+8=; b=LtHZHIINGAa8AZnMUdQcpuPT7J
	7wgvZf75WrM7QxSznFbjApf8DwgRwF4m0XZu89xGeo+qWJWzJ4xizt9IIH2WY+/1KkFoCcZilyPIQ
	n4/kA0BV6zf12PxRmNYFNkuBbCgVrth3StzimHPOUFgFmoC9ifkJaQUmGKSmN3TKxwEpsx8K4Q8J4
	r1Alr9anRtCHHtOlO2YikNYn2vFkXdaGRdctzZyftYSXoPd8KzzmCuaZdCrx+JRe5lTQow2XZnSBe
	OIYZG4uhJLOSo85BmY4DxwK2OK6q1uqHwCvvTWw8+5pdhG934O0BQ+KrC9Sb3H945xpIOIu5lfC8G
	qzsF+UTQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Mfs-0000000CI2r-3Msj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 10:57:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43155a6c3a6so1573135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 02:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731063425; x=1731668225; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s/RIYF42PliwHGA1qVUEQXCAnRxr5/CBto7gLpiJw+8=;
        b=v43qS7JCa3280S5fJsKGojE0oJa0WTkbSKgwsKNilKP5Hq2DCjjW5gYCi3/OiCZ6vt
         8NUB5lbS91g6udZVMIFwcyvlumUg3PZbf6u1umtHUMrC3C1KRXOR//Mz/fyKzX7OY+w+
         FxzEX0G3jCLgTi0fhj/1MmFv/yMat+p6M3uAc/N4z3+pRnefCZIreASNYzp9zHhZzSQ3
         eW0+04Njud4s30zYpHHgPh1fIYF19vsXLN9SB4izi128B3LWpRg6TCS9UvKvl31LGOTp
         0CySAYbWR0/rvN9DQRjm7PtpDn3r43Ic2R4CB+ArAqr8qEBcIM0rqXtS3uaSRpdK2xVE
         7lHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063425; x=1731668225;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/RIYF42PliwHGA1qVUEQXCAnRxr5/CBto7gLpiJw+8=;
        b=D770UDJWnNC6RwtsPqxMHllkLUlhH1aP5SBbdS7k5MOC5gzPB06ATvxtFogX+ETZYP
         P/F9ymbPxC18AZ4nVba4fxacvDB/aB+FgvE6FMcXN0lWEodEZptYrhO4uLt08+hoUc1g
         CCvL0Ye9qW04RnWZLc6R9HiL6TWHmZHhnCWeN2rwVtBHvWkFWkKNbcM+IYEcKtIGJwrm
         od8gmp8ouVCzcuNGCtzI6UEE/OrFr+OsADm50px/8JZF5RBEhabUSHKD+O4iNZztcsDs
         MTRN0XuwzwePYfOygV8sFfg0xMWH3hxYhqT/Revye5eK1oMhwv0Gu5j3bPiOrjJdVrw4
         ehqA==
X-Forwarded-Encrypted: i=1; AJvYcCVz/de50MW04Tqg9Sy8hhjOlOvbOPcVuMOPHNlVApH0sN5KEvzyfigFW241tBnOZ43JfvwJ21bLF9iiGUIfxl3C@lists.infradead.org
X-Gm-Message-State: AOJu0YzeEzLLUnp2XS6LY/HC2+QGFr+DdTa3Fg3eifKfgSP4iuuMJ4hs
	CbBtYYkqesDL616/C7V69ClD8l/JtgZibDFc2xrG9jNq2ULSc7LRUOnDLAIfIOE=
X-Google-Smtp-Source: AGHT+IHzTPtzAeto07ORHmIqBfM5KujibrddQ8vU/CpyMoxHdFz5x//E0oZXPSRhiV5jWsYQDBlf9g==
X-Received: by 2002:a05:6000:2a2:b0:378:955f:d47d with SMTP id ffacd0b85a97d-381f1822854mr910421f8f.11.1731063425301;
        Fri, 08 Nov 2024 02:57:05 -0800 (PST)
Received: from [172.16.24.83] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda03e8asm4224169f8f.90.2024.11.08.02.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 02:57:04 -0800 (PST)
Message-ID: <3ed7ac41-1f07-4711-a816-7dcf06f4cda4@linaro.org>
Date: Fri, 8 Nov 2024 11:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: Add Blaize BLZP1600 SoC family
To: Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>,
 James Cowgill <james.cowgill@blaize.com>,
 Matt Redfearn <matthew.redfearn@blaize.com>,
 Neil Jones <neil.jones@blaize.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "olof@lixom.net" <olof@lixom.net>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "hvilleneuve@dimonoff.com" <hvilleneuve@dimonoff.com>,
 "andre.przywara@arm.com" <andre.przywara@arm.com>,
 "rafal@milecki.pl" <rafal@milecki.pl>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "nm@ti.com" <nm@ti.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "johan+linaro@kernel.org" <johan+linaro@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20241108103120.9955-1-nikolaos.pasaloukos@blaize.com>
 <20241108103120.9955-4-nikolaos.pasaloukos@blaize.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241108103120.9955-4-nikolaos.pasaloukos@blaize.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_105709_627740_14084BFF 
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

On 08/11/2024 11:31, Niko Pasaloukos wrote:
> Add ARCH_BLAIZE_BLZP1600 SoC family to the arm64 architecture.
> 
> Resolves: PESW-2604
> Checkpatch: ignore

NAK.

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> 
> Reviewed-by: James Cowgill <james.cowgill@blaize.com>
> Reviewed-by: Matt Redfearn <matt.redfearn@blaize.com>
> Reviewed-by: Neil Jones <neil.jones@blaize.com>

Are these real reviews?

Best regards,
Krzysztof


