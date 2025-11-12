Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FADCD3425
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wrx29DKjW4rdar6yi/cey8YXCTun3fpxTJW7hBR9gnw=; b=Zs7FG65RvKbeSRJpHqcShBk4NU
	bXhagyABfEKF68WFIlmsLfNFJRFt4k24NXsN6W13G05lPEBAq6roRL0BOdRm/np+BdYu8bHzn+lB7
	vzGVOpxl8kzUqh5/si2aA/5YfI+ItAF1YDz4hiYOgH6cUIE5YBuTGcF/9Nek6ydVQbCrl4g1tV8uU
	HKhFm0U4OQmjVXZClJ9XuNzFDi2ngNVcm7sQYWQ2k5m9o8k94eur+RFQRq4dRFFklvuVTaYUqJNNU
	ubfDjGM4X/3AlzsTy1zTFDlUZuPNeEBKEc+3bXEpshN5yRXx+7SR0tQsKTBnuM8l6VYXmFAU81PUB
	Cx3NyJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEWc-00000009EqC-26vA;
	Wed, 12 Nov 2025 17:20:54 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEWZ-00000009Eok-0JAg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1762968039; x=1763572839; i=wahrenst@gmx.net;
	bh=Wrx29DKjW4rdar6yi/cey8YXCTun3fpxTJW7hBR9gnw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fU7/glo/P4H31bPhZ46yWTLpc6PhhsSrVBBOC8kJ3T0SJBMVPdCRIAY7bPumLNwi
	 cDb0InzgD9jXK7F3xtBGm8IJqC0YFqdBkI6f4BPT/7z3s4O26FJqsVl/3KgoRA50n
	 eRvx2cnzQ0mEZNgJJWdkoXr33sIamyC9EjKPYmLfYK0C2gFGT6n369jhflT9lwWo7
	 bpSRegLMVjDAWTK7kjMqrOgtAFheKcUDyTRj/fPECkIDaAbs1zf0sH1wHaGUDozop
	 vfqaLkyUBdUuvsTYE9QHQ4liRKK81rUIKq+ZZkzWKQFkOSNTE7Zjt0lMizqkyGxGY
	 GD3L4HLkVGDGy06NhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.217.223]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHMZ-1w3bos2pC5-00ZqeF; Wed, 12
 Nov 2025 18:20:39 +0100
Message-ID: <cbb49407-5b66-409d-8a0b-260e50932156@gmx.net>
Date: Wed, 12 Nov 2025 18:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Fix V3D deferred probe timeout
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Mark Brown <broonie@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com, kernel-dev@igalia.com,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20251104174518.11783-1-wahrenst@gmx.net>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20251104174518.11783-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:a2pMjbOkYfQV2wYxjqCn/8iSoLKj9sadANzwXZuF1Jgj626gRZJ
 Mz9sWqvCB9tMUtSFqhBZnqoBln7k93EoJrjJdWhYIbyNkCLIC4LOtByIg9osLXZpxjVCDW6
 kmwx0ga4FLl4i82CG/IQKYnf7iEmfAliF8r5w+gJ0K+cUg4XMqbcob0GSjKd7ph0L7gd7+Q
 a/pLYDef6kWmHMvWa/Q7g==
UI-OutboundReport: notjunk:1;M01:P0:RT/SbWCujK4=;uAc8f4dDKmcesZ7vaYbsgXRJ/KU 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 eAC1QcOibmzNyALR8hIaPB+A8pBYe1spvAYsiV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_092051_475838_BCE66A2E 
X-CRM114-Status: GOOD (  17.90  )
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

Hi Mark,

Am 04.11.25 um 18:45 schrieb Stefan Wahren:
> The commit 4adc20ba95d4 ("ARM: dts: broadcom: rpi: Switch to V3D firmware
> clock") causes a regression in arm64 developer setups, which stores the
> kernel modules via NFS. Before this change the involved V3D clock provider
> was builtin, but after this DT change the clk-raspberrypi is responsible
> for V3D and for arm64/defconfig this driver is build as a kernel module.
> In case these kernel modules are provided via NFS this takes too long and
> the PM domain core give up before the clock driver could be loaded:
>
>    v3d fec00000.gpu: deferred probe timeout, ignoring dependency
>
> So resolve this issue by making this critical driver builtin.
>
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-kernel/9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk/
> Fixes: 4adc20ba95d4 ("ARM: dts: broadcom: rpi: Switch to V3D firmware clock")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
can you confirm, that this fixes the problem in your case?

Thanks
Stefan
> ---
>   arch/arm64/configs/defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e3a2d37bd104..1a48faad2473 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1341,7 +1341,7 @@ CONFIG_COMMON_CLK_RS9_PCIE=y
>   CONFIG_COMMON_CLK_VC3=y
>   CONFIG_COMMON_CLK_VC5=y
>   CONFIG_COMMON_CLK_BD718XX=m
> -CONFIG_CLK_RASPBERRYPI=m
> +CONFIG_CLK_RASPBERRYPI=y
>   CONFIG_CLK_IMX8MM=y
>   CONFIG_CLK_IMX8MN=y
>   CONFIG_CLK_IMX8MP=y


