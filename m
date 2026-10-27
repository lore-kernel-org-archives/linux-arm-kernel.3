Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808D4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S+Lf76J1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CXza558X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Txz3OjJcCusHpkz1mnsFRsjrPbuP5hB0e5979S9csEw=; b=S+Lf76J166ZuL1
	/ChL2LG1E5Zhb1PbjWebdvlbg9GZevGbgoNPPHuQYxVc74CvEKu4TUgfhlqRJshhETHUUtaTLkjKc
	f+qQeCOvTaeu353v+Vply38ENDvQw47U1165lWwuJTQgC8H0rEAdon92RMAxRY/N/4izaV3M+4tnP
	rrD/wy1q51boPCT9/zIWzewomJXEIpCpACxQRiv5BEv6XYGX8/gDcAPW1ojUHD+bPSGNruKvcIdLD
	glykGNaFEqkvDruLHXhvFZfjOw8UjuM3VvzA23445Iij/RK2g6wmcn5wvnV1V+6tZxfdjUV9vWY29
	tpvUAi9hOqMB9QZnp8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeK9-00000004I1E-1XzC;
	Tue, 27 Oct 2026 10:22:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeK5-00000004I0F-33Gy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 10:22:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so22034015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 03:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793096547; x=1793701347; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Txz3OjJcCusHpkz1mnsFRsjrPbuP5hB0e5979S9csEw=;
        b=CXza558XwHaD6oFW1tyte4+cdnwvJ5nSXl6pGDvaxuvcO8/DQLdjRc7KNB38awFnAx
         2TVJmoIjfngrC5DpRF7v1/cKYs3BNcytLfSu8loo91ZkYWvjc3Z4IwE967ZW/amyGfI4
         dWzyTaYH7aEDcQGva1bML3VXRXlRiuJccJfHn5ChFhSgpnYMPy5DGVTM7dBpSHPucHVu
         kc3quf3fnDFc9Ln99MacqymXifI+2EgVs3Xtu+XTQ200cBq/OsKE4uK32zTyr5M9qFZH
         LABuJ8tNPNO2Hr+EHUneOk3prWhaRtvejego7KQX3hna3scoGr/814qYWhxaphZ34eSw
         Qh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096547; x=1793701347;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Txz3OjJcCusHpkz1mnsFRsjrPbuP5hB0e5979S9csEw=;
        b=QOlbqNqSBs1c9QYZYeN1LptVM+eyZ/mXluddDMBGjjjJTmPeS4MvHn285uHnjUnbME
         dnu/DghCxwpgSBHCbamu3NRSrrrIvv0r1quXZEHiXTw6G7XNEhQDFRRfs7V7u+zb7eGH
         8D2/Uny9iAiPEVC4R5n9tCby+HImXWMX+l2h1gYWtKkP0znMowrE1DNfAbFfiH4gt7li
         b1EwNDllYcDTAVQskHf51Uam2pvOic40ETcQIdb+vBe+u4+GPg53Zwkz7AaASB+9MeGv
         u001r4gcvJJO9kgn9ne0yQDk2ST6iHY6y611kU6jln2MFoyxZIgQmwbMqqgHr7Ij6Z75
         Nfdw==
X-Forwarded-Encrypted: i=1; AKwUvBwztnnc7gEPxKv5Npd8Hwd4NR+o+UER2yj48enstUz5uNvlG/r3mlaL6EkHUapRn49aNyRMqXv34btPbJrAMIbN@lists.infradead.org
X-Gm-Message-State: AFq9FYJDjKZj2zbOc0WljsSO1pZrFyT+9ULjlkx1fNyAvxpUQGaqv3fG
	HeLL1TseUM2q5Wydk4dTsdhusXWCf8cfLN947prQud9Ro507RAmgFc7p
X-Gm-Gg: AYBFou3O5BjRKO4oinPEYvJSxtEvWyH1DvFl5ZdUaVqDHSbT+SgENSunnkRiRpn+/o9
	/CXOXbTJRbU1dxcBnVmKL/r3AfCeK+bUOs5psnq/1Hp/fY4ow/nwDTrhprMZ5CFP+av8FiAIrnf
	V7KQN0DS9UDScjnfIdfIxiBAPvu6/+Hd6qcHI7kNB/fmP1c7BUhgxMp7+AQltN3eWAdoDo68xk+
	q6duEdP2GbCNfWqUPwSdI+I6JW5y/DpEqqGGXkfhhKt011k/v5Bh/i5QhII/u3cVT8Fm7JN7/FM
	ftl+6QicqHU5O8AtYcGwZEWusjNB/QqP+0OjzPxA4jOS3LnoyQXBv9+RBzr4ChkBmnSxaGzdFRx
	UD/MwzWECGyY1+zJG4TxacFLqMDLiyNv3OLEiRPNumwDWQZTJ1M71cdvrT3eKXMokkbRrtRnA66
	5gYhzjH4rVx5ddawFlq7YQSKTbBACJ95adTlzqnyZ7Wk/DRJ8XYzCMM5c/Xgb5icMgip44y3rhy
	6q+Ce98cPsKiy5hrOrEcNrGWr1L/Ubmr6DYOUShzFZ10zZiUE0ky1/V4KVrTAL/kSr/6V7wGDkx
	qeoU2HtKIg==
X-Received: by 2002:a05:600c:4e12:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a35ac3f7bdmr182539685e9.3.1793096547086;
        Tue, 27 Oct 2026 03:22:27 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm20023565f8f.37.2026.10.27.03.22.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:22:25 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
Date: Tue, 27 Oct 2026 14:22:09 +0400
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 christian.koever-draxl@student.uibk.ac.at,
 neil.armstrong@linaro.org,
 sboyd@kernel.org,
 bmasney+clk@redhat.com,
 khilman@baylibre.com,
 martin.blumenstingl@googlemail.com,
 rafael@kernel.org,
 robh@kernel.org,
 krzk+dt@kernel.org,
 conor+dt@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org,
 =?utf-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
To: Chuan Liu <chuan.liu686@gmail.com>
X-Mailer: Apple Mail (2.3864.700.51.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_032229_798070_3E059005 
X-CRM114-Status: GOOD (  22.86  )
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
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> On 27 Oct 2026, at 1:26=E2=80=AFpm, Chuan Liu <chuan.liu686@gmail.com> =
wrote:
>=20
> Hi Viresh, Christian,
>    Could you please hold off for now on the patches adding cpufreq =
driver support on S4? There are still two issues that need to be =
resolved first:
>  - The clock driver currently does not support setting the CPU clock.
>  - The CPU regulator needs some time to stabilize after the voltage is =
changed. Without a proper delay, the CPU clock frequency may be raised =
before the regulator voltage has actually reached the target value, =
which can hang the system. The S4 CPU regulator handling currently lacks =
the logic to wait for the regulator voltage to settle, so this part =
needs to be completed first.
>=20
> We are currently working on submitting our own cpufreq driver. We are =
considering how to address the issues above, taking into account the =
hardware characteristics of previous SoCs and evaluating factors such as =
the transition latency. S4 will be covered by that work (as well as SoCs =
from S4 onward, such as C3, T7, ..., A9). So please give us some time.

Please don=E2=80=99t top-post, keep inline threading!

FWIW, the recent bindings/clock/driver work I=E2=80=99ve done for S4 is =
here:

https://github.com/chewitt/linux/commits/amlogic-7.3.y

My speed-bin driver is based on earlier work from Martin Blumenstingl:

=
https://github.com/chewitt/linux/commit/77e12d4d584d6a8bbd93304bbd4e9bbbb6=
ee159a

Setting a ramp-delay was the key to opp transition stability:

=
https://github.com/chewitt/linux/commit/ca7a99e86e23677c7b5af887e6f3b3c8ce=
3470d2

CH.
also a Christian, to confuse people :)

> On 10/26/2026 4:59 PM, Viresh Kumar wrote:
>> On 26-10-26, 09:57, Jerome Brunet wrote:
>>> On lun. 26 oct. 2026 at 11:00, Viresh Kumar =
<viresh.kumar@linaro.org> wrote:
>>>=20
>>>> On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at =
wrote:
>>>>> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>>>>>=20
>>>>> Every S4 speed bin runs the same CPU frequencies but needs its own
>>>>> voltage curve, and the bin can only be read through the secure =
monitor.
>>>>>=20
>>>>> Read the bin from the firmware, select the matching
>>>>> "opp-microvolt-speed<bin>" property for all CPUs, then register
>>>>> cpufreq-dt. Bins outside the known range fall back to bin 0, which
>>>>> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver =
binds
>>>>> on the SoC compatible and needs no node of its own, and S4 is =
added to
>>>>> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created =
after
>>>>> the bin has been applied.
>>>>>=20
>>>>> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl =
<ckoever@outlook.de>
>>>>> ---
>>>>>  MAINTAINERS                          |   1 +
>>>>>  drivers/cpufreq/Kconfig.arm          |  14 ++
>>>>>  drivers/cpufreq/Makefile             |   1 +
>>>>>  drivers/cpufreq/amlogic-cpufreq.c    | 184 =
+++++++++++++++++++++++++++
>>>>>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
>>>>>  5 files changed, 202 insertions(+)
>>>>>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
>>>>=20
>>>> Is it safe to apply just this one ? I can take this via the PM tree =
then.
>>>=20
>>> I would advise to wait a little for Amlogic to chime in.
>> Sure, I wasn't going to wait for the maintainers to respond anyway.
>=20
> --=20
> Best regards,
> Chuan
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic



