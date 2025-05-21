Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC38C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKrhmqIiWOmOlpaJasryOxvv+AyK40z7gGjfp/7LQO4=; b=CoiSpTa1OF6p62Ex2ZetK9qjnd
	v7AU8aukjGIb9a6VVzVFkWL4VuZ2E7MSsihbr2K7282VPsiBlfCqWo1SHEGOy4eXfmetvCNIAyqcd
	CJ6aBF/Sq1o6cbRz19PMx4p+lBbw5vG8dHgYQDgObJ0m2I4IPrFuQu+PS+gV6Xt0qPTEYS9BVFQoq
	0S97wEPe3KYZK8DWqjNcz/BUmQtlUR96UrX2TfHD/yA1PCu2ucaz4+ImemsiNafzC0O/gVOaLeM9T
	LUzdHdrsMvRsWcl1I6LwR2Tfs5b034xEfMXPncyF2TwBg2QBpO+KA7dAqKKlGnv1VGywzSYoqFqe0
	8oB9c7Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHf2n-0000000FBlF-3N6U;
	Wed, 21 May 2025 08:43:21 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHf00-0000000FBFg-3EH3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 08:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747816805; x=1748421605; i=wahrenst@gmx.net;
	bh=xKrhmqIiWOmOlpaJasryOxvv+AyK40z7gGjfp/7LQO4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=d5f9fZPHew8XRi21cvmOsB6f1oB/9SWXu/fKQ+cY99+nYm8qavN1WfU7pHhRm9nR
	 AfbeK0ZPeocADjRKhXNf+/TSu9To6sfULg+MIc8iXE1zC0VA2NJbdj6NGq3F/PlJY
	 j4K8XjAdGsLoyc/ZQ2KiXpWOeZwRACZYEFr9Opw03kbpP5ab+RQ0ah7j6MXxbxj3k
	 qWBErawVep0xkk+L0mYhPxVQ9w9CJub4IcS7AvVvZbTvBrXtbRwn0+E1gfZ/idwgu
	 ZtfPHGEIwPucypbh5WshTJrPj047DXlcN2wiLJ4Lj9zwQbnIT8ZYIRSW2t4Ic7Ae2
	 0N7Zke3IQwzQBja6CQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC34h-1u5KeH3sYn-00CwUd; Wed, 21
 May 2025 10:40:05 +0200
Message-ID: <81fd4ffd-5f1d-47fa-a50c-e0643ee2787e@gmx.net>
Date: Wed, 21 May 2025 10:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ARM: dts: add ngpios for vf610 compatible gpio
 controllers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Haibo Chen <haibo.chen@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, peng.fan@nxp.com,
 conor@kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com>
 <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
 <f0017caf-8fd7-4046-ab7c-71c6560b7a95@gmx.net>
 <CACRpkda1OKXnma11wKTrBsO_AAXrifVK8RDCKmufdHXBMmtMbQ@mail.gmail.com>
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
In-Reply-To: <CACRpkda1OKXnma11wKTrBsO_AAXrifVK8RDCKmufdHXBMmtMbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uFUFDJdhW4swt/TD+jo8LPeuiKlQ8k4OGhLbj4Ydgc9rvkIN7g3
 fQE6wAxK+PTLtDVHt9zeryR8kMl9GV1wA0vG5PEfDhZJ8DASqrlmd3wD2o7KYJlkPYNu6xo
 cqqkm9y4WGd09Ixx8CwrjpYgxaN7PST+ZXSqTnZNntOsNEvfCKSfpioTUD8mXfUSWghNmSV
 420WAPbyCtYiOs5sqHpLw==
UI-OutboundReport: notjunk:1;M01:P0:dscK6y2rpac=;PnLHkn4xxCMDPZ3Gw6LtJVSdcf4
 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
 O7TgvjpokwI5o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_014029_098120_5124E855 
X-CRM114-Status: GOOD (  14.95  )
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

Am 21.05.25 um 00:14 schrieb Linus Walleij:
> On Tue, May 20, 2025 at 12:54=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net=
> wrote:
>
>> sorry for asking this dumb question: why do we need the redundant ngpio
>> property in case there is already gpio-ranges defined? AFAIU the last
>> cell already contains the necessary information. Or do I missed somethi=
ng?
> Not all GPIOs on a gpio controller have to be present in
> a range.
>
> The ranges can be multiple and have holes in them.
>
> The ranges are also optional.
>
> The fact that this DTS file, for this SoC and on this controller
> happens to have a range mapped right over all of the pins
> is merely a coinicidence and not a general rule of any kind,
> it just apophenia playing games on us.
Thanks for clarification
>
> Yours,
> Linus Walleij
>


