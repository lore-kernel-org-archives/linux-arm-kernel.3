Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9527DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSw4iLWni+08K3Y2XPPthhXGT8z8eNuujhWRQ0NoO/Y=; b=Yb5beoDKP3D4sD6sivAg1bVCgs
	A49sd3krX0KOaN6PO6fqtYn+kijHxztySyx0+h2fVMhghKkR8BGWLB2DZ0utxnz18WxyGkW+uDFNy
	gpJWNEw649IURHlaK9Atd2pmA3oDwn+Ppg8yZcQh28R7lnQoS679F51gtLIcC0AQSgkBoGuSlcSsU
	tmLBN1TJ+l5QFl58/9GDQFgvP5idrQ/Jey1QDzx2M+GfmVZFQxMC2oTEcLYDS9W+/If6gqMDUaQ9P
	lwti4pC/PLIFb4Fz56WdiRsapDk8XWuLbJqExFTJG5g0MiNhO2K5G3iuES2NBtJcyE7FLwZkq4xlC
	32jzvfiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoU4-00000007q9F-2n0n;
	Fri, 15 May 2026 09:05:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoU2-00000007q8Y-2jgm
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 09:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uSw4iLWni+08K3Y2XPPthhXGT8z8eNuujhWRQ0NoO/Y=; b=q4bb8iM0bBMKxCfFzQP0sbrHvH
	MBeEkImw85pFVTU655xSNrBk/n9CByXhLQ/fuamcADa225Ypcb99gbXeu5GN28dcs1caaPHFAPNIe
	9bKieEMNJUwpXjkF5YHCbvDNKqa+cf0jMXwSFffUqE+8UNY7qsahFcFYTG7AIVIp0UtQKIRRKI+B6
	FHgDuEs1RShcbRkoFcEbSSwb1NXI2fGTcCiUSt6DNsuOFUwwULQO48JED0HIdwB6BJOsmDxV5OX6i
	F6uSvSmCvwCzNwVo4unthHhihSGD8YZFgf+NtAtrAtV/xd4G4AXcpPikxuFD0TwTziBz6PVLyjTQ/
	WyQTb4dw==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoTy-00000004hjB-3uSg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:05:25 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5aa0862dda1so1971349e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778835920; x=1779440720; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSw4iLWni+08K3Y2XPPthhXGT8z8eNuujhWRQ0NoO/Y=;
        b=DO8NfSmGdlBPNc1URoXjUuVaecjFeJ5nng0XomVdGzy15vrBIv9XHoin2eDetv8Itm
         narfVupagIobPXECzrtuI/GYZV5uGSzaqW+sbUiU4oO8llg/j8uhsPR3ErizkGwMIirB
         +AqzTeQmmZawmB3hXVzZIL32GUA7KhZQ9ecoCUHzF5ZJmGwg6K9kxxRqEumCyDnYnpZr
         jQNPCYEzH2BLenjT+tnVdkGxcjbpaMgEUxphzZhQvC/tRwme8fyqFFebxLTwKouSNS03
         HA+rNKJyVDNuWUsjg7OAFNKn3H4stkIOwAkC0KebMzoN/TdOBOwixnotImQ1VPoZkq91
         8McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835920; x=1779440720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSw4iLWni+08K3Y2XPPthhXGT8z8eNuujhWRQ0NoO/Y=;
        b=AET5OMZ4/YVgdSKBV0eQzlBs6cBFhK6qJs/Sd6quNE3HyLmlxN03nz604Prapy1pCx
         05GHHzTWKsaa7C79rZlSOFrtilNBEamZQXG13NJcL0IkQNU1lGqnNeISE+cRerfVQL4q
         3nhdKvK7rtN1ifkbTVt8Z9n52CzvPZGi77JzFTg9T971dti+Ai4tyeJbrPPp6vvj+j1g
         +D2fCpLfQKbP8ggeawE+hFW76gq+FHiVxT6S9z/oKeD3a22y8cvau8QVfZ2uCxGksLaw
         sU0vfFdn/+NIbTC+NHVviEGiVG4QCCI5gq1y5MF234HjmdRVFBo5YGhkC4QsPV/++U55
         wBwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ADqp9nHjWUeOE7oV0EEKRCmb/DX4OLoaKTp57+Fsza6o+MQl6Kc4qi75FqQTRMOrXPPY/AXsMRSOHmfNVFIy/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1X1KjHl9V3bGhuceWgPYF24IRVY8FW6x3V4/RyK0xge83Mosw
	f4AjLSe5CfqzESO5N4ec0f/VKymiBm2OwF3y6jK1Hf60S/S+T0yHhhb+6Dw7Jd3+Xi8=
X-Gm-Gg: Acq92OEYgwWostAFTxqAIU/uBAgO+HRDYgVJqCYUZ+DpsoqxlTt/BcOHzgAgUnt3DIf
	kZTPujoCw/G5FyDtZbLoW8sf1AYviCBAh5fvGv7sTr/GeBWoSNetDl3JzCZEwGvoQpfpggvmK5Y
	AZUmavHVwjkhn/kjJr5/ELynBdDsniFTXHLd0pCDBtAIWMNid3m6EGPTTkiNqAIw/O66HvnTLDd
	50o+T493a4fkbQRPLwwZ7z1AmAoYHn3PdNcMGDi1upln7aDPBfXJBoNRa21r3EaPL5DPcOBv1UD
	bde9rcBiQy3IehmhN6goPieZoykUm/os8zFeyd1AXlEOtWizx+4AqyG7SMaugR4Qa4R2lLPhEjf
	AmBkFOmYG386utam4kRt7PLBdF1WcMvl59zZirhrMJPhpW1yRsQmHm4wdEQ9thnEDNkaanDZmlK
	4j/xbYXxDFuvU24yKEd2Tx0XLtKLH1JsAl
X-Received: by 2002:a05:6512:3ba4:b0:5a8:6cbc:60f3 with SMTP id 2adb3069b0e04-5aa0e769d53mr851416e87.34.1778835919654;
        Fri, 15 May 2026 02:05:19 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm13447979f8f.33.2026.05.15.02.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:05:19 -0700 (PDT)
Message-ID: <e91af899-9ff2-456a-a54f-613b859260e7@linaro.org>
Date: Fri, 15 May 2026 12:05:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] firmware: samsung: acpm: Drop redundant _ops
 suffix in acpm_ops members
To: Lee Jones <lee@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, willmcvicker@google.com, jyescas@google.com,
 shin.son@samsung.com, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
 <20260420-acpm-tmu-v3-3-3dc8e93f0b26@linaro.org>
 <20260507120003.GG305027@google.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260507120003.GG305027@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_100523_394983_09B7AECE 
X-CRM114-Status: UNSURE (   7.47  )
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



On 5/7/26 3:00 PM, Lee Jones wrote:
> Acked-by: Lee Jones <lee@kernel.org>
Thanks, Lee!

The set evolved [1], but this particular patch was not changed.
I'm going to carry your Acked-by in the resend I'm going to do.

Cheers,
ta

Link: https://lore.kernel.org/linux-samsung-soc/CADrjBPqzKpcd9vuCmNUptCUPyPpPbHcc19-7kN-1c0RpW1e5DQ@mail.gmail.com/T/#mcce154a7e0c6cd1ca6cd5a1e37541ed7a85a84d4 [1]



