Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D4EC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 00:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQeOLmt0vKFgnNb5WK93uDhGtWcqwPO2Yivyo/lj/+E=; b=AazPD9lux1JHs5frJT3PnbFoNF
	KLf+O50Pa/I0BGklw6BE08aYHd7hj210gm8vuuK38RcWCmu4/HEg4jql9v+rQQaPDZzczDNQc3qU0
	HmLFVqhR0RG99gDlZkuGmdcrjZX44LNeUz2TYhV9UDEiBHztmrV9U6TN+ccNHClQHzOzfc7ceXumk
	dx5sivk+y6RfxYGUHVWXO3Vt1A+t/KE0Yy5+Fza005Jsf0wG9lMjLFbuww8T6Xgp5tILC2U7EJcg+
	w3zw6ywWjVoV33N4qxb7QYXe2zqUDgrsp2CBGuCyUTR5Gi1t/TSbNYPFUg8igtcBMTEdcL8TbEmD7
	V8ZbROCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZJKm-000000037X5-1Udy;
	Sun, 19 Jan 2025 00:38:36 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZJJU-000000037RG-1uNs;
	Sun, 19 Jan 2025 00:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1737247014; x=1737851814; i=wahrenst@gmx.net;
	bh=QQeOLmt0vKFgnNb5WK93uDhGtWcqwPO2Yivyo/lj/+E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Dj2IBDBjpSHo/k6yfDsvYs/lSEz9bbng7of6IyE6bGn0hdEoSFcJpyWFf9+5PpMq
	 XpBknT5j0qj9KFtdUxLp43Gocig7GcZj12d05EPbuOIqqffrw6VoUehTyDaCbKV1R
	 Y2r0PRaoBtZuK3WN8+rw0rBWXHF1+KlT5wohEFVGM1VxeBefuEVMlRBe5R1ZGe8ae
	 +yO6ZZ9dgmtO0iFrKUKmukxA9twv2hdMKcgUPKdMHV8K5XOH/MJm9Udg67Gd3DeQf
	 CDBHI4u+RHjU6hUJs4MFgGV5ra0al6wchbDz0nK2i/tydaIgtsW7BfheIfqgbtHcV
	 NGYeoeUW3x5kK64xHg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsJ5-1tHVlx1QQR-015xDC; Sun, 19
 Jan 2025 01:36:54 +0100
Message-ID: <808a325f-81bc-4f5d-8c07-fa255ef2d25a@gmx.net>
Date: Sun, 19 Jan 2025 01:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert v6.2-rc1 and later "ARM: dts: bcm2835-rpi: Use
 firmware clocks for display"
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 stable@vger.kernel.org
References: <cb9e10dfb4f50207e33ddac16794ee6b806744da.1737217627.git.hns@goldelico.com>
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
In-Reply-To: <cb9e10dfb4f50207e33ddac16794ee6b806744da.1737217627.git.hns@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yBn+2i4VZk7CtBetjY0K7FS0g1A6jQXZ+D1aePttNbM3MAP2Zuo
 xCB+bsKZI5fQyenRpy9moR3Wh8XIIIFBWW3ejXsHWzkHHyt8XDzCkg9Rxk+3T+0xpC0QuKH
 O0a5ahA0sHH0HQpa11WLLolGGHNiNJQwKyTYsCC7HDdOZsqdxpyWkNwmGP09VakGVAHsorp
 6+N5OzWL2qrfhI4TADBmA==
UI-OutboundReport: notjunk:1;M01:P0:JFu1LOedMYY=;6O0P/bjrcaaOi7pZ1x6JZtHSnun
 kFVmt6fjK+ivRcfhPwlghpZ/A7O/8MjHKOyTwl7GAneGiTYPaQLoz2p9OKqMlt/4p3BU/5to3
 YPUOD06aJ4kmCKyYTOnZMqXbLfHfmLueyXc0VUYAVybp/pIbLIhLDTseaqJ5o9lnSIbg//D7A
 J+tmwMUBMyavVBtdZeT5dMbsEW0E27ejnttGdCQZc+JBHLrTw8lkuF5ILokqJRPs3VZmyTz1z
 4ZDfAUnG46mnnNG8AnI5atqQgueshehe8mtnacr/TCgJVQNahc5AiaN29B3F/X9O0ZWV+MZhE
 BC3+HCIOzoYSWMQ/BfxrwFrs6yEmZOH11kUekgvfd2QIkIT+vrwN6EpsLCDlpO8q2L1dKkQIz
 cIemr1pm6SLN/Ag9ueqtrdWakrg8SGoBjrFOpi73nbBldoGidmoqOt8CxFA8Asj72mWmdUQq+
 o3Pf4XSVQ4NGyn3MpF2G1gxuaCG/ZqzAJT/jBHfcz+fXmF2+6mR/twjgaSpZZ9l3EHcK04Hzu
 AbPjqyGVA7/ay+f78lBggPXt6Q97Wd1aVXnrdTO1XgdV5zysjMBseiNpxm76LsSKZBkvuA2gO
 Us9Sr8Gles/8SnsFkaX3hFI5TjXsDHJb9FwuywpWfDSR0OAMnGFkGRRbP7T0CsICN4wV7LHhg
 2fBFW1kd2wY/2cXC8a5L3JS845Rz7j8yWRvHQyYzJjCC7no/buFwDEpu34ByKcsJO+KrK71af
 wOZ5+/WyTaPKj4kCP9vXQObUoad2Tcp61agRvxBjiQNBYIIQAaNkwz6pl1reKQFco3fZjC6ud
 sEUL52zbw2YBhFL3M5TyElPn3P2m4pzX6L1xZKo3QMwVt/eDiwWBgQsyJjw2czcW/lEgXo2my
 NJZfqs0V6xfDhg1Xx12qzd73+fyz74jXOXc6VV/8Fcn1HxYLcFbm6xkoFPscwVS5tUC1r9dbc
 lUZML0pKF5dnDFSDSNKQIYQleTImxxiZ+oFcC8zW2o1NfoycZsQb0rEWnVuSBBjNqrUyeU1mr
 SfN9RGxMF6kaKwBdIMbwbuEj7vlDptkdUYgbHKKVNRobTq/yRnz5Zoi1nSDbgnKADxAlARUCE
 ggbXh+j39Z7IUfkcMWwXSMYxorV64dtmHqToTKV8Y4Ygh/+/JwE3LEtjtbNbpG368fMBW9Y+9
 z1yYHMS1JDu6i0oBVkEVCnzj4ztpyqaM+B7A4Cy8uyg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_163716_794943_EEC825B6 
X-CRM114-Status: UNSURE (   8.15  )
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

Hi,

Am 18.01.25 um 17:27 schrieb H. Nikolaus Schaller:
> This reverts commit 27ab05e1b7e5c5ec9b4f658e1b2464c0908298a6.
>
> I tried to upgrade a RasPi 3B+ with Waveshare 7inch HDMI LCD
> from 6.1.y to 6.6.y but found that the display is broken with
> this log message:
>
> [   17.776315] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_drm_unregist=
er [vc4])
> [   17.784034] platform 3f806000.vec: deferred probe pending
>
> Some tests revealed that while 6.1.y works, 6.2-rc1 is already broken bu=
t all
> newer kernels as well. And a bisect did lead me to this patch.
I=C2=A0successfully tested every Kernel release until Linux 6.13-rc with t=
he
Raspberry Pi 3B+, so i prefer to step back and analyze this issue further.

What kernel config do you use ?
What is the value of CONFIG_CLK_RASPBERRYPI ?

Best regards

