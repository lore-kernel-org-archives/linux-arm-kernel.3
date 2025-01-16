Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A86EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1eC8jTgRa9jR/QCiz12cEtsU5ben9yxUiqKNuKHS+U=; b=XqQkMfvNgx0NE/hMJjR+pzgVKw
	PoSitywTVMZJrrPHMQV5kqOAprtXovhOLy8IP9bodH0DepBZZOs3BPRah6p8GSuR/EBcj/Q/8MWeQ
	xhangOX9bhdQYOHfnGnz8NBKCmjIkWUK38wQjVAKIKAa8EoTGWl89wpoobvagqZ8huwd3134FSFf4
	BGP+vWOhlXNrfoEjTBa7P57KPR16KkGcimnsjS6vgR0KvE92cHMBll0z68Pqg7pgeLxhxublLqWVQ
	DBhDXe/YtOAsyHOoooKrWEAdaNOOyO7lXQZEkt6TfAQ9yM8a+5OxOg1CWkTSSriL/fv9wkrshyuwt
	uwOrAvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVI4-0000000FrHp-1ivf;
	Thu, 16 Jan 2025 19:12:28 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVGn-0000000Fr7p-25If;
	Thu, 16 Jan 2025 19:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1737054664; x=1737659464; i=wahrenst@gmx.net;
	bh=N1eC8jTgRa9jR/QCiz12cEtsU5ben9yxUiqKNuKHS+U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Jeq96ebhhBQa6AppRKrzFBXG9YaqNn6U3w9SbnvkcADSA3H9BcDEiYKKF8ycrSqB
	 xcEstPw/AQc1PBdfl320G5JDO/UrbSEw9722G/URyKhmk+W4pJABvEPgNcPg8XT2y
	 Cu/ma9ZisuNwP6Jtr7cXDr9FoSwF/cpsUSJr4BafUcWSAwhNNDxSfmWvzDH5YHJRY
	 8IfYUYkV37MvsYjIFimBroppNWtV6xCg4k25CduvzgbCn9bQLdFOxDKWLvt0YyeJ7
	 kWFa7xEoybTMapOKybkJ5out1V+WqJozLGpCEW03avyG2RpcQIA8m9qYtbFXyQVhK
	 kUN4vBcB4pjFwaidhw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sDq-1tdRDm0KRu-009bzy; Thu, 16
 Jan 2025 20:11:04 +0100
Message-ID: <974a3030-0531-4c4d-9769-af752ae4898d@gmx.net>
Date: Thu, 16 Jan 2025 20:11:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: bcm: rpi: Add additional clocks for 2712.
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dom Cobley <popcornmix@gmail.com>, Maxime Ripard <mripard@kernel.org>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
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
In-Reply-To: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6RNUf+eDtjlnJmhngNCkFCFn842o4kyJXXt/UlbzXTMKHtytULK
 SbrEUOEztK26OwiXaLvT/d1AQCA/hINJjFYW+YpYSOQ8pMMpCEqbjmN36Y+c/77gK/BM0l6
 JnIe4+0uEWYWPJ5fOP7+eXJdgRkwHv9rXOy3o+gUf5v+Ds57VWjnfC1SNou8WxGygc6c9zv
 Bce7HwqguqFBDK+M15jTA==
UI-OutboundReport: notjunk:1;M01:P0:BEwxxuq7ENc=;D4NT6+FtqKhNoCaYyeI0kTJraqq
 m77/1KCRMueMtnoFDHaMlzz6klxdadKxicVxLkVK44zRMrMpG7XH49heS3P8igVufnqfHjABf
 pe28M/3RANTNCS7IhzGu6QZmqAqex9sNtojRiKXUTpC+hrmsJ1xRrml6DgnDqwXsSN+ayDjl5
 LehW6X7jwy3nt25T1xkNlrCsd8TKRwNqxKEZF+eJkDps2d0yWY3jyDcCokqcCSyLv54QR+nxZ
 7itLR3jJSAb3vDoel7umJDLxT9iF8r5sY+5BafKq2XsLz7ZAgfVry5TfTW0PW5/PfEhRjKPPj
 EQiqlTYAmpedr6QFbcRy6Rt2PAFYDAmqV6VfSdXj845CCmXcxGYp+vKmhbjeBRGm18HQgY4Mw
 kBlNuCQ+6WUQMpQLWvZzpWkKMUwlnxJKDzTqHntkXw/khiVHTU09vYenRhssmoO2QfS1CHfxk
 tRZpeNYVfgwB3DJe5V5t7JYkN9obxNvYNan5xKUcAITUBpYY4kmBsXLPWa57CtCnkfLqcKiHR
 TEjtl8AonjrfRrP3G/ZMlR0ql+i0pI8foJIgP/0vzYXwinCSLixo7T1PNWSQduIq8lNR90tsj
 dA5PkwIhXLrWzHCrXeLxYPpkuRfJSPj3+LlYzhhEwo6/UgITx99ER+Z5x5DG5DRLVhKGwHLO8
 ZIZajiIm3/NF3y4P7HiHjV1kP63I8CLhQV2kkOV8DdNBjqM9HSrotGmB/ZQfRGF/JFob9TiHQ
 Xud19zZ88xEb0mD1LU56Sqc8zAcG8AlebrfZyu6JPEdaaxczterKYwF3Yy22FK+0zkjnEJgvD
 pQpIekeSgcrBi97ob/99ppmTdDyIkmJfDnQ0uwn44WPGqi2r/mqMpphap8mctnuj2jaTWydz5
 Mg08w2u/HKu3DP8vo5Gk+camOkaSCI1b9Xr9d60ulYFwdGVMxWF5kFhQerJJYejJwcLm1yI7J
 pbeQtKXeB3FvUvbi4V5A/V8rl0WklHpm3uMkF9Bk0ZI7+5Xq0KE2tYYGs5j8pThVtD2d1Zgph
 v7r/4+zHkxxjTUxYQ+X3N1L79KUjZng9VBv0xDd0rAsxEfvBMf9Cw8LYNL8vCyKuCL2EPYcqD
 /YIismjvRcjmvuOYkpHUDQR6171au8oQ5ErXZ3ACiDS7U41xqYYKIr+QcCJ6lzOaBqXUC+FGU
 7CnbEp8dfAH+pamP1RJIoVQlUvrP7uLHkvKgKixbWlCKCo2HLBf9sPewrbz2Bu2A=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_111109_912132_59D5ABBB 
X-CRM114-Status: GOOD (  16.09  )
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

Am 16.01.25 um 17:24 schrieb Dave Stevenson:
> These patches were Acked by Stephen as patches 30-34 of
> https://lore.kernel.org/all/20241023-drm-vc4-2712-support-v1-0-1cc2d5594=
907@raspberrypi.com/
> with v2 at
> https://lore.kernel.org/all/20241025-drm-vc4-2712-support-v2-0-35efa83c8=
fc0@raspberrypi.com/
>
> I'm a newbie on kernel processes and where the patches should be merged.
>
> I'd asked Stephen on the v1 thread as to what needed to happen to get
> them merged, and he asked me to resend the clk patches for the next merg=
e
> window.
> I must confess to it having slipped my mind, but resending them now to
> hopefully be merged in time.
from my understanding, not all of these patches are specific to BCM2712
(Raspberry Pi 5).

Could you please clarify (no need to send a new version)?

Best regards
>
> Thanks.
>    Dave
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> Dom Cobley (3):
>        clk: bcm: rpi: Add ISP to exported clocks
>        clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
>        clk: bcm: rpi: Enable minimize for all firmware clocks
>
> Maxime Ripard (2):
>        clk: bcm: rpi: Create helper to retrieve private data
>        clk: bcm: rpi: Add disp clock
>
>   drivers/clk/bcm/clk-raspberrypi.c          | 33 ++++++++++++++++++++++=
=2D-------
>   include/soc/bcm2835/raspberrypi-firmware.h |  1 +
>   2 files changed, 25 insertions(+), 9 deletions(-)
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20250115-bcm2712-clk-updates-98a47f32116d
>
> Best regards,


