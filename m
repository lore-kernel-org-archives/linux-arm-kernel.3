Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00818E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 07:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mp3/qUQXLESraR4kRpn8DKp75/AqUs49Ij3IlmcsjIg=; b=Y60bVkoIcQGiQTSpex9GhM0Akp
	oUUiqAZkJg3O29dHXoeHXLUwg8GBAstyGuMJEl+fGGlk4pbHtLVsoBsRFMjfl7lxf8n0gObbDaX42
	bxz6mJj+QgWBZSiTKlPMptfVHFlYtSx7xJuHZfY7naFEjLE0qJrwU20ZKgubytwp3OtAYGjNXflXb
	ILvJxo3qwl5YNamDnrAsGuKbDLA9PRxt4bynKEEncekiZwimQFYP/dDIDEbFzHwFEko7XvO3p/fYf
	KP4ula+N0gjELDGTpPKwYkC0YvnOHixNnpX+9CBxgdsAjQWLSecDg7y5KKfJFZc6C0ZDIQ7fj8JHq
	zDSZ8pRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEUA-00000004Bdj-3pvK;
	Mon, 13 Jan 2025 07:03:42 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXESw-00000004BYb-0iB4;
	Mon, 13 Jan 2025 07:02:27 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaf60d85238so740327266b.0;
        Sun, 12 Jan 2025 23:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736751744; x=1737356544; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mp3/qUQXLESraR4kRpn8DKp75/AqUs49Ij3IlmcsjIg=;
        b=JTz1zVea4HCY9zp9My03Wqc9rvrXYCyqsKhYDK+OHQrRCmKhpOTWXOxz3EqeHrvFnz
         dh/jSV/VK8rL/kkJZwJW2REX8ahmvdZua1Kwh6LjV6IQT/+5A2Hcy6ZcbXGTDRQ4R5F5
         FI0leqAo6ymag7mq/pK7uVm4EALtDHrY90UxIIRWai5JzNRlyzMgxwG4XJ3kdayUe3mf
         MAVMYemQbYxIxIn6sqGNobV5yGbaWr3LOUanimAKSHnh21IaziCcNtl0Nikf5mrWwNA4
         Y11BC7fvU+OVmZpNdx4hB3FueT1us8BYkTDIKMxI/C84LoMSWEP91C6My5B+bO5hzA1b
         MczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736751744; x=1737356544;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mp3/qUQXLESraR4kRpn8DKp75/AqUs49Ij3IlmcsjIg=;
        b=pdTwhBf/xKPaq3HKEUx+Yt4dcxLAmVvUnG5qcXNAaOh1K1qHc4PEwGIn2UDSiS53nl
         oNGBn/DykYLH7mt1TWL3sahqgYATJcXwTOXxkrhR75Uj2jfQ/XgBFq/9dNnMGYvuRqgJ
         KKIZgklVldxiIVpNljsvB7Fll/41vQ47cpShfbTutXsnTjjFDi+0h1hvYTv8FSbfCtJg
         MFqKUTE2n2gi/1Q346tLPvVZuD6GlTGZ4htj4X+l+hgXZeshatqRUhm/vYnb5cWH1xdr
         8A8RFc5PO92JthhsLG6CBilCZzkmYXnrxEj9du4Nb6aqOMvH+f/+iHhhZ/p5JFoXDSef
         oAQA==
X-Forwarded-Encrypted: i=1; AJvYcCU9YN8xINeTD5kdytCXSi1yY9iGYn6ftKZm150RFDoINb11pzjdd2NP1AqjrSpOZoH75NpthxHi0GzIMQU=@lists.infradead.org, AJvYcCWp9qGuCyVnNS0HaFKQOWXCkX3KgJqdVheE7/Riyt+BZYSk+GflgyMW4FA/zrwBhijRExCfUx/qN7R1@lists.infradead.org, AJvYcCXOn1fFh3UBUaqbWLJyEcj/mOVsSYrfCi7UyhiqNFBM+how/G4v1JA1+/8x+4biZD4OXeIg5UgzELP/d0nImJfl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9iG/Wemkm3/pWrH2lxUpeQA5EWwMOXHZ9zyE02VY0sR09vQlm
	a1GURQZMIs7zPcd88F5rMbp8oD8+8H7zGjInR4J1hkqSqB2sqixa
X-Gm-Gg: ASbGnctYV0EgsDISL6/buiwp2ZeUbxkvniuw6RMe8YNxngxWZjPgZrAQfb23Bj28GpG
	PawhjLo/3PfoR4ttu+22y3qq87/9WdzkHrvj7rxKqbLEIHsRj3pQlDHWZB2GkvyxM/6C9YK0nHR
	EDfx7F5KW2WGJbMRFRzAmSCgeQuBzef21hyjZdUAv2y2h+yXjaa3OvtaIuzTr7VWyWpsDco2zNt
	Kcwg9IviQ5DjxwdM780NMUEX9vaACt4XcrNs8bKUhF9QUrRDvxfoiV+YRTyFzbngjM4OX3rI7bS
	nkq06XEQ9H7gQNVupH7JwlYP
X-Google-Smtp-Source: AGHT+IEdbQkU8UjVmzUUdbYKBPe34Hd3H6alrK+lAeP3uFioAdztQzne4JSDv6lfgqNHpEvaeL0MQQ==
X-Received: by 2002:a17:907:94c2:b0:aa6:824c:4ae5 with SMTP id a640c23a62f3a-ab2abc9f6e0mr1698225066b.56.1736751743583;
        Sun, 12 Jan 2025 23:02:23 -0800 (PST)
Received: from smtpclient.apple (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060bccsm455865966b.22.2025.01.12.23.02.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jan 2025 23:02:23 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH 06/12] dt-bindings: clk: sunxi-ng: add V853 CCU
 clock/reset
From: =?utf-8?B?QW5kcsOhcyBTemVtesWR?= <szemzo.andras@gmail.com>
In-Reply-To: <tttj7va4hzpqugah4rhm2u5kganuix5iy7373h62b3rgfwvdbt@53vexrsfmskk>
Date: Mon, 13 Jan 2025 08:02:11 +0100
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E7DD6AE5-833C-41AC-8B7F-2772BEB065EF@gmail.com>
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-7-szemzo.andras@gmail.com>
 <tttj7va4hzpqugah4rhm2u5kganuix5iy7373h62b3rgfwvdbt@53vexrsfmskk>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_230226_212576_9ADE6C4B 
X-CRM114-Status: GOOD (  15.44  )
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

Thanks for your comments for the whole series!
Not everything is clear for me yet, but I=E2=80=99ll clarify with sunxi =
community, and
fix it based on your suggestions.

> On 11 Jan 2025, at 11:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>=20
> On Fri, Jan 10, 2025 at 01:39:17PM +0100, Andras Szemzo wrote:
>> As the device tree needs the clock/reset indices, add them to DT =
binding
>> headers.
>>=20
>> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
>> ---
>> include/dt-bindings/clock/sun8i-v853-ccu.h   | 132 =
+++++++++++++++++++
>=20
> Please use full compatible as filename.
>=20
>> include/dt-bindings/clock/sun8i-v853-r-ccu.h |  16 +++
>> include/dt-bindings/reset/sun8i-v853-ccu.h   |  62 +++++++++
>> include/dt-bindings/reset/sun8i-v853-r-ccu.h |  14 ++
>> 4 files changed, 224 insertions(+)
>> create mode 100644 include/dt-bindings/clock/sun8i-v853-ccu.h
>> create mode 100644 include/dt-bindings/clock/sun8i-v853-r-ccu.h
>> create mode 100644 include/dt-bindings/reset/sun8i-v853-ccu.h
>> create mode 100644 include/dt-bindings/reset/sun8i-v853-r-ccu.h
>>=20
>> diff --git a/include/dt-bindings/clock/sun8i-v853-ccu.h =
b/include/dt-bindings/clock/sun8i-v853-ccu.h
>> new file mode 100644
>> index 000000000000..a405b982f914
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/sun8i-v853-ccu.h
>> @@ -0,0 +1,132 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>=20
> BTW, also checkpatch warns about this...
>=20
> Best regards,
> Krzysztof
>=20


