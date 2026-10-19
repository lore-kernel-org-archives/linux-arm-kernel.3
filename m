Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gb8Aue/f;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L6urBHG8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=; b=gb8Aue/fgvjhVR2amFWNnidc/W
	fcaJFmGNU2bBp9hu+YQ4WcjbkW2r92ZkA9S2BxMGH1wbOvK85KkbOSRejX1ZT9oeCecQR7gv/35+z
	z7Z1pLKqALQsvgNTS6D58sP9eWB0nztsy5ygFF/fVqHiXxBiHUuQUx0LXaZkqntGpYdfELqO7+GXC
	adjV2vtx1uXvmJSWJKv0qcrVNJ2IGRG44D09NzUcj8VWVU0ql3NFJ1Io1r3GMf1RIDM7i7GRqO0vS
	cSwUPT19rrzPa10MwB0PjfbG8C25FDngbSA1iDqYFNrSRlnFtrXngujpBM5lePD7w99SYLGh1zdU3
	8lQkvU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqI5-00000007ybx-19QU;
	Mon, 19 Oct 2026 16:32:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqI3-00000007ybR-1Au9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:32:48 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e011d370dso1919710f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792427565; x=1793032365; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=;
        b=L6urBHG8eqGknObvi5NIl9F8u2ekf2nUivg8Ku7+I14H8EJ6cjTt7n/RSicMVuSkCq
         omipE18NkcTkcGBXjDjvyDNSD2lvdT8uXYnpk8ohrzG86Cz8f40QtAmRNLICpqTtPrLn
         vY809WoEgy4iT1macEwG7qC4Xz3Zv8b/52WQAiOpUUAuahRtpMhZSSXTsYszzHDm6QNt
         /hwzcOBW4IbGDsH9M0uIIeX+PlFFqI0ahG0GD6i8liNMwtX0D1KgHrSpn91vAwXR0RXY
         Sm1KyvRybOBM8dn5Uh0mXXrm5gXsSE5kjxZCAfU2HuQAoqMVFOb0J1seZ1oL723zdpUM
         ljhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427565; x=1793032365;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWj6P+5N+9+xj86kghtIJTrYQUXSGty1irTiTrrFBnA=;
        b=xhZvww53XQEcr91waJ/P4rjdj/I8XlRH3YfOYIDmqo8fV1T+DTyB9zWTh7Hwx8ehns
         XxPaaQuJYYeDd3aTf9FrJytlQYJirVy2svHbKcxaNeLR3jPks3xEIqHo68xs8nSLoq1d
         jIIisMzPwkdymZIkIU6S6zR0dmU/veX/KkwWGsxFAwBMCaimnTh0cz7/tRRkeLi7ydPZ
         7DuNrPYA52ijGLDMKkOiP9olLIUXkVKj41EtanqUFS+/SxI+qx/kOKrdpvk+TIIjMZjb
         N9sFg7xYFb8DA6Ex7dsMEUGnLZXOHmpGSBEM1M4RD+d1i7FpLr0SlBh+SQHnpBkY7G2v
         VOuA==
X-Forwarded-Encrypted: i=1; AKwUvBy9tzmz7PzSXIGOUXMfDtFgmuT8DUgLAskD0KLE2nUWAshsh9JElJu37EKYz1E1D/VFr/3lzB/qwi3Mb6rmBWSJ@lists.infradead.org
X-Gm-Message-State: AFq9FYKf1y6ICD4WvLNmlEzTnn7sGwwIOo9kfz4+XRs9oorIW8/VpQXf
	9c+Ow/GikL5fr7OyCIX2k6VDS5a+D9ODWF5iKulggdGE+xWwhzYYqQLxjBiy57PJCAYtrtzmEkg
	ioRe0jmE=
X-Gm-Gg: AYBFou3xdz2AgZChff0ptAYkOQgZHJjSqkW1CvJnODL6Ukslg6e6zGfhqFi505cSYao
	uBXF7co4POrt+Bo0jN98I3cYYlaG3i5qhu6wh+F7Bmo6Uba8yRVBWysE8uSw/CZThIES2QF69zN
	PMLqFfi/2nPJL0MuP/YbXSDbIR26lMinUoKkFax1AevoOs/j6GtkDg7UdBqtgzCRr39BD54ePxU
	+tmJTahOepMcCu4MKxbbLIjIZfV6OyB0a+rpZQwdvmhSdlmE6rkkpCdw2nQkfpzRKr7WsrdL9s0
	y4IseAg143qaD8xazb8wUMOS3PJU6e5Hq8oJvt7/BU62UWIca62KZZPGypfb6jcxteNkxIqK5g/
	+E1wmBJAjKn2yRc6hpf4N7RSDFfnT7Q1vABpwAkZNk1y7bKyZRNojlErMBVXku+3W6HjubQdief
	x38Bk1K9PX/WHz8GFozr39rmMjssEJVVYb2uDSVEVWkUgV98t2xCz7ABp/VW+M9PLX1ikSxFXSI
	iIgBthwcZOSQa3DBLjleqI7qjxCT/w2pTB3r+LpftyREXVH6vHWrnzggLIEnQ==
X-Received: by 2002:a05:600c:3b13:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a1d75ad08amr209137105e9.4.1792427565319;
        Mon, 19 Oct 2026 09:32:45 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:eb0:c501:2c4e:44f:2449:8978? ([2a0a:ef40:eb0:c501:2c4e:44f:2449:8978])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm3538555e9.8.2026.10.19.09.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:32:44 -0700 (PDT)
Message-ID: <ee975969-e310-4950-af09-f57fb423a9f5@linaro.org>
Date: Mon, 19 Oct 2026 17:32:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] ARM: dts: omap: dm816x: Update USB node
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Ettore Chimenti <ettore.chimenti@linaro.org>,
 Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
 <20261017083957.7c2696f5@kemnade.info>
 <8a8313f1-d525-45d3-9044-b5f7a00b256d@linaro.org>
 <20261019154503.2111a89c@kemnade.info>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20261019154503.2111a89c@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_093247_371566_C15081FD 
X-CRM114-Status: GOOD (  18.95  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/10/2026 14:45, Andreas Kemnade wrote:
> On Mon, 19 Oct 2026 10:36:37 +0100
> Andrew Goodbody <andrew.goodbody@linaro.org> wrote:
> 
>> On 17/10/2026 07:39, Andreas Kemnade wrote:
>>> On Fri, 16 Oct 2026 16:41:21 +0200
>>> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
>>>    
>>>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>>>
>>>> USB node was not working correctly with DMA enabled as the supporting
>>>> code had been updated without updating this SoC's device tree. Bring the
>>>> device tree more up to date so that it works with DMA enabled.
>>>>
>>>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>>> ---
>>>>    arch/arm/boot/dts/ti/omap/dm816x.dtsi | 41 +++++++++++++++++++++--------------
>>>>    1 file changed, 25 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> index 7f3ef3a00ab8..5be9efc60785 100644
>>>> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
>>>> @@ -574,18 +574,27 @@ uart3: serial@48024000 {
>>>>    		};
>>>>    
>>>>    		/* NOTE: USB needs a transceiver driver for phys to work */
>>>> -		usb: usb_otg_hs@47401000 {
>>>> -			compatible = "ti,am33xx-usb";
>>>> -			reg = <0x47401000 0x400000>;
>>>> -			ranges;
>>>> +		usb: target-module@47400000 {
>>>> +			compatible = "ti,sysc-omap4", "ti,sysc";
>>>> +			ti,hwmods = "usb_otg_hs";
>>>
>>> Why do we still need this? It is depcrecated.
>>>
>>> Regards,
>>> Andreas
>>
>> Without that line we get the following on boot and USB does not work
>>
>> [    0.110148] omap_hwmod: usb_otg_hs: no dt node
> 
> It is somewhat odd to use both ti-sysc and hwmod. It looks like a
> half conversion.
> 
> For an example how usb_otg_hs was converted to ti-sysc for omap3, look at
> 42a79edd4a3dc1bb8e89fd2849f9e8e1e1c13977...v6.1-rc1
> 
> It has no hwmod stuff left.
> 
> Regards,
> Andreas

Thank you. That was the pointer I needed to sort this out.

Andrew

