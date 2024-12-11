Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA415E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 17:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zimhx757dBpdou4rx5e/nznxFtFPCTlQ5e0cfAPltok=; b=oEKdPK/8mB8zBpzBRlxgcmhi3Y
	F8U7wChnoxRCCiCCYC+FXyx5B8sRIHlPzHZQer95zs+yHd7VuEQjc40uSpkV41EsG1yomJZQaM1tQ
	5tQhpe7nnBdQMIpHIG4PUgxYiXoZneRgADTl3kJ/+20kOW8Gq44bMOwfce6wDoN190blvclZ+phjv
	IgdIXHHW6BO4/z0QWAKdmU9rfmwS4FPMmdykJxQu2uSFxA8765kArzTNgaY15Y/EATIMox10OJwUt
	lACH1rtkWvnGqFLLwe7zr0+/7mfh6SkFijxeJ7QfksgwsbYroYAi2mwVMIqGbaEiRe9ZIbOetY14H
	ggG9KM1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQ8A-0000000FYOl-15xs;
	Wed, 11 Dec 2024 17:04:10 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQ75-0000000FYHO-3yUX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 17:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1733936570; x=1734541370; i=markus.elfring@web.de;
	bh=Zimhx757dBpdou4rx5e/nznxFtFPCTlQ5e0cfAPltok=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RdMyoz9eUZV2u2QP6TtHVlbxRX7Np0GES+H6/KySyHfaC8IPfC8VU/cnHw6Ttdre
	 /qCa8ZfXH/AuDcXbq0/EG9Tp1cF8mvoMcs+pNiynz+gYUfULgUQ26hoWeRz+fLHp1
	 xFtgRoKplGlz7nWNDEmIzcnmWF+9oFI4aeHnn/Ph1miaURYn5xzuoBxTJsKglXfVd
	 LshfLZeAU7ek9WOBG98d/allmPpTdQhpsMDzXDAvdOVImzNtS6rVlJq0CT5GoXfrt
	 Ffzd0UB0JkjDF2LYLDftYO/H+FWHdgTpJa21OS0AmCRsclOa8XsG2Z2AqfrNmufUo
	 3GYN/Bot79balvrHGw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.70.80]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MC0LJ-1tSske3A8j-00DtHC; Wed, 11
 Dec 2024 18:02:49 +0100
Message-ID: <384bdbaf-15f1-4cad-8f77-371ccb67d952@web.de>
Date: Wed, 11 Dec 2024 18:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, s32@nxp.com,
 Bartosz Golaszewski <brgl@bgdev.pl>, Chester Lin <chester62515@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jacky Bai
 <ping.bai@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20241113101124.1279648-7-andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v6 6/7] pinctrl: s32cc: implement GPIO functionality
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241113101124.1279648-7-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sYQziQhyPbFUeFB9qpQjC6BoEwbQQIqiifnylPG79vzwLT8YREC
 A5NTtxja5YTyknXGZ2YbsK1H/54rERWQj4ZjfGj8XSAYu5Fb9eyv67oSNno6v9VPWpl3wGH
 TC9pQEdGJcQDSsYFNXJm8ngnb8oVIdklg9juHxF+KmtYp7UF2qombbq7aViWfgL9Ji4JojI
 EOMaWZM3Ldv4Ni/sqgIIA==
UI-OutboundReport: notjunk:1;M01:P0:617lA9KtZ9o=;vwRcCXhOTow4Tuj093fIRYxDfzv
 +31Ku9YUBk+3CZcb5aER9J8US1M96LJoDe/sIzZZe/+OREAQFBzj5J5rFy1CooigjMKH/8puL
 y8D+620xRZ8nUYx/FBc2LRTnIiS4h0NLIZtP8GdesDO7QrYVUk/NkTCSIVvUGHMmyQtI4RPx7
 r2uGAkLf9bhD2M1cLwpinEa1oJXfSovNd83I6F5FJ+OwjAN+9Ngrj6x9a2DAx01Fbi8W19kwe
 /auZh6waGlJ7A27sGRQWqONgNDqaGsSoVsaaUxCvCr2fRUe4k7PxT9parDka1V4ZWszOWwXUC
 AfsUarEEOvUBKZSRHSWUgiUAijk/Ob4mn6v3DUeKshlzKl+dkl4OqjAkslsfdXYVunesg6ni/
 a9FNoOeHUmUcMiVadi3j6nWNbqTWZKyFcFA42SU2e2alpXxw9f4ydv//KjZaPZhOxpnnYC8s5
 ngjUnx8Gqsb9KQNt7HMM8TdlEonu9dwzV2s8Bu3iz3HvlM6CxpeCEJaMrOVCL8TSDv5z2GGC0
 X1F1+RfDxelTYC+Ao+RTIgl9CznKd9h77mBYDETNboKiMfEkNkDPDh2B/yzF83/c4SJmpcTtM
 z3ARWdhaX80G1n0GwyywRPM105YkzfTRLPHDC/Qc/Cgpu5U3eiCcfzGOTUCB+vDXwI5fywvqS
 CIGs0bmWOfMp11eTJBHuq6iT8dMkYiSb6zRpnIUD1Dl3DlMXTtqzYWNpQpR0uQAOVC5f5tgIC
 K5TUjegnrZLUXImkJuM/U5q2kMTh67GUwVqdKWlLIKvlPI1XXslHsS1OT9mFT6j+FffNLRp47
 LsR07I7vCq5ZFCMDswbO4DQDvgYAkIwX/TVReSRp+8qXwiesLsFcTgurf+LGLif5wVVA1ZXtE
 cPuw8za8im31VYPukx+YHH27WvabRREf6QW+97BigVupAsD+VoxGEObQ2q9KR2KDf3v+aZE7+
 DLziBNAJCCNpITwlU/6o7GvTjYVl1Gp3HH3QWpnoj5wDRwbd6r+RbEk9RIgjBQ77vWP8uX9O5
 7p7FB04FsptB92N/0F/3/F5pMzjUts8YVdq2LNElX7bCFL7omrRkKZDf24f/Kd9ZLM3RCxrmO
 NXxlJN/uI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_090304_342838_94729C6C 
X-CRM114-Status: UNSURE (   6.84  )
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

=E2=80=A6
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
=E2=80=A6
> +static void s32_gpio_free(struct gpio_chip *gc, unsigned int gpio)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
> +
> +	list_for_each_entry_safe(gpio_pin, tmp, &ipctl->gpio_configs, list) {
=E2=80=A6
> +	}
> +
> +unlock:
> +	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
> +}

How do you think about to apply another call =E2=80=9Cscoped_guard(spinloc=
k_irqsave, &ipctl->gpio_configs_lock)=E2=80=9D here?

Regards,
Markus

