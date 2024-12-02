Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97742D7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6AbZeNaZ6bTE249nttA7aUaHmMUAtPIQUa4jnYv9dg=; b=hiwSd6DaUXswrFeYJwPtfHLfBx
	Qy75VgOtmDhgboEhbSa+HZN+o8s+d7Xy1727hpnq8LqHIAQ7COiOLFE8grsSHIVtB7KtqMM+3s59d
	K0kzobD1Q9qcIALjgLWS/RVVy7OBXKTDA8G1HOlF33FJ6YjNeIvaDrwwroFTrZEFtCQxstSbnCULA
	vUYk1bllYdcqlcTvI4nhQlVmEuyOo1fYJGv2BdC2rpzoc7zkaF7iKrQ46SPAWZFaHUvzCyG31sNh3
	fla8J8GEvmH6yyt98epbfYMgwK5f+nONtuahjGG9LHv7ELslIsX/rZ+NoNWZYqFqVwD7r8XyYdol1
	nZGkMo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8eU-00000006iUF-1FZX;
	Mon, 02 Dec 2024 15:47:58 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8cn-00000006i1E-40p1;
	Mon, 02 Dec 2024 15:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733154355; x=1733759155; i=wahrenst@gmx.net;
	bh=S6AbZeNaZ6bTE249nttA7aUaHmMUAtPIQUa4jnYv9dg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MRPqzPUxvHdhDzn6BrdRf9grvVpT8loh0TtvRFigS/N98YMO1eGNg2fMgFa1dSMq
	 A6rbPAVQpkNh4opLucf/B62DtGd/jC7ZcbLP+KbiKZskMu2fA6wCez3Uw36yldNU6
	 xqw432FV8UqXo21pJtc6yzUJYboQdW2gLJmFMOdTQ0GPqua7Bx6HAubqoWlA0Vrdl
	 g4O/yXL5s/2BjEKL4dWmN+/2kyxxx+PH0S17cHZb2N48A3SZHfiNfmP1houYEQuEP
	 yLo3hILr2K31IMW/wWJ6IRqSjJkbR51Z2IPUj5XS0qVbvRTUV3Ro2uwUWecOnMRR7
	 e4CU2AzcVntMm0yiZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJVHU-1syHO72DwO-00LIU9; Mon, 02
 Dec 2024 16:45:55 +0100
Message-ID: <31d19aae-e2d2-4219-abe1-10516c42befe@gmx.net>
Date: Mon, 2 Dec 2024 16:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: gpio: brcmstb: add gpio-line-name
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-gpio@vger.kernel.org
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-3-fac67cc2f98a@raspberrypi.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-3-fac67cc2f98a@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IOMHa3ZcSMqatNTk+ufT5/RmKhqFiwzBeWyjcIAIec/+E8wlQQC
 fdKZZK9TLuHh1jL1hDr4uBSd7nS/U5aDZZXZGyDz4LM1c9B7zrueEd8FSeezrohk31PE2Ao
 kKWLjdrAAAN6ZIjGLWWXIzaRkfq57UuXqprcF0rbPF9DTt7UrdPhwz4zmOiMbtqMFSEu5rx
 h1u1Qozkm5XfeKRDKaH+w==
UI-OutboundReport: notjunk:1;M01:P0:ArgobiVFoHY=;i5fh4paZoVkp5qjDIySZTSIapOP
 L7gJtxwiztdtk86rYcuduxH+osuuESVmiV89rg7PrCpE8vVfLgYAoj+htWE2bgwEJ7BkvNC9F
 xYhcb6QFIky4cTsN1RaAB3dexZ3fK/p/uo16OfnhqKMkFzu9Q1+0l8rT6jp4Id2XROEpRnyUY
 QQi+N28duCW9gzvHwldDlAlJvrElZRvGtqDZGYzHJrln0zeUfVP82t1UJTaRoODibhzE642O3
 wqX4ggf/+QVbcbtMSoryU1RAVXlenFa6paCaCkyylC1AljpyFkTsJ9Ue6qKyH1D26NqjoETOo
 RF0Ky2fsAcQKxmg9IyzC88/69hxUxO4PL+SDoMUSpcDak6lgngvdhoge9dQ4HHCBwOavx5mAM
 W4yUBiKYJqXv6sxnm1cmCyVEy2YtNRXoI0HT65XeXu7THGIdKqoQcPI9HjSKnQslf5faGyESj
 Q3kEDNYOZ9jmUlVDXrKfRJZ6uzFMjW2WDka3AyRWc9+yQ3krpHDdeGjnPI4at5yRUu/R/Lk+S
 Osv3zlNNwx1a7tRs4DiU6bPcP2RFk19+oEEPChPwPVc1UvCRnzBagB8PFReV9j20OaAgVG9NJ
 187DPQdiomDkE/yjplISD8km/cI9WZixQ3+afgMscNuAjqKBsnV5+7gKDvZsvlS/lXOvLnBSD
 OwBUIgZfMp8whoIryacYaQiJLuIu4cAMcNxIo/pOrGzdZ5MgnJJPy05XChz4q2uiRBn6tFchE
 rHW0SQZxwl6JIXeSymrp6wHivbnco8pxhP9bRcVt2FhkRFvMNPxGcOMsb5fLzd0ZZLoFOg45/
 z/rSwz3UXEtDgcggdgYU40LxDztxQkpEdmt1rBItTNmSf0f94BB+7VVU21dzA03+jaekZyTGP
 YAknUnwpXcurCo9GJG5ST2pn3tzC2+RyXXsr3klzJyCVAlkwlZbnMug7HKXcfiPWaPkGPsDhG
 QiSLAEWPxysBdU8lRb/ARji75WJqVV4GdYR996jOYP34CgN5aXqgbZVMfpuoj9u6HkiBUEo2V
 Jn8JmYeHpoJ+QgzPR2uTk1UQ5ud66S7WQN0iQuHHoBlCvaCZ8skO0qzFTkdWGGxYcP/oO1A2z
 tEH+w4eM6q17dL9vVwB3u4yEtMGqP8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074614_278329_4D6E46A3 
X-CRM114-Status: GOOD (  12.80  )
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

Hi Dave,

Am 02.12.24 um 15:31 schrieb Dave Stevenson:
> Support comes from gpiolib, so permit it through the binding.
Sorry for the nitpicking, but gpiolib is a software part of Linux and we
should describe the hardware here.

Best regards
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>   Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.ya=
ml b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
> index f096f286da19..086d016df6ef 100644
> --- a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
> @@ -64,6 +64,8 @@ properties:
>
>     gpio-ranges: true
>
> +  gpio-line-names: true
> +
>     wakeup-source:
>       type: boolean
>       description: >
>


