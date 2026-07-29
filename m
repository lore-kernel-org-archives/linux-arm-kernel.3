Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B78C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nej5rDE9D8Ou8TET/t/E6sIPHZFBGYU+Isgtq9cqzkQ=; b=qWAj5jXOMEPu0Pd2l8N5VR+vBI
	hUm9oLExo8YGf38KjauUxm9aceQ7Y1NzJAjt9LxqNPcKhT8szaaOpZ14bIq0PTXsqMObR/mRRbwip
	Xwfb9sBKk/XZBS4K08LLWGeQ8qNbowwXY0PLff9E+OMexnwS6j0+TViUq00tIxg8RfQMBlABdfKtu
	VyFC+FLesRvGJC5VEVN1gFJxhpvRZQUtPi8ohK2hEP/bPVeTz6xfwxK4Up6ExYQxED1pRoAhV/Js+
	oN/6utBn6u4NnOZRxU33xeNjd290Ew2RPhA+E6CVjwH5Dpl9iz7CEwFPeMAj/LMW1i9Et3mdp/azE
	ZRwz+Fhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp831-00000008hQ9-0vy9;
	Wed, 29 Jul 2026 17:26:27 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp82y-00000008hPI-0Tzn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:26:25 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5516D9D7AF;
	Wed, 29 Jul 2026 19:26:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwPuHWlpuxWt; Wed, 29 Jul 2026 19:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785345980; bh=nMjFaRoJNGnbz+t5zveKj4iOLSf/Wb8jM6TD9XURS+Q=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=PsV07BatffL5jN3ImqbbcQv+gur5q/xysu6e5JICwMI9lxzOvSI9sCAnqiZDA7QVT
	 mPkbxMsSjpCE8PgzaamveMgcSu2pGBcQKiFCQK7lhxICTjuLPMlXX7f+DuERrWhB/I
	 WU3KR30ZAnEVnwMIboFqSPZuXmYqka4DutprVZ42NCi7g8w+oN0W04f2Ly1ul5fQW2
	 I5Fzs5skSlgupEx4jRX5z7+UHcjONQATcj1ui0fLwuIOnVhzw8TNino8U05W6LfFMT
	 3r9wNwBcZ1YhChkCUgdA+NRVCb7VyWBV39o7avsjXGKfHUerm4lBc8vIRNsLzeQtUF
	 yfKpi6wGkGD+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 22:56:07 +0530
Message-Id: <DKB8BQP42BAT.3TZICIQBS85Z3@disroot.org>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: iio: proximity: add Sharp GP2AP070S
 proximity sensor
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Joshua Crofts" <joshua.crofts1@gmail.com>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
 <20260723-gp2ap070s-v1-1-b8ca3a4c10dd@disroot.org>
 <20260723234751.5ff138bd@systembl0wer>
In-Reply-To: <20260723234751.5ff138bd@systembl0wer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_102624_581107_7499468B 
X-CRM114-Status: GOOD (  11.33  )
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

On 2026-07-23 23:47 +02:00, Joshua Crofts wrote:
> On Thu, 23 Jul 2026 22:58:33 +0530
> Kaustabh Chakraborty <kauschluss@disroot.org> wrote:
>
>> The GP2AP070S is a proximity sensor designed and manufactured by Sharp
>> Corporation. Unlike the other GP2AP* schemas, this is strictly a
>> proximity sensor and NOT an ambient light sensor.
>>=20
>> For power supplies, it expects two voltage supplies, one for core and
>> other for driving the infrared LED which is used to measure proximity
>> distance.
>>=20
>> This chip has been used in production mobile devices such as the Samsung
>> Galaxy J6.
>>=20
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>
> ...
>
>> +  vdd-supply:
>> +    description: Voltage supply for the internal circuitry
>> +
>> +  vled-supply:
>> +    description: Voltage supply for the IR LED
>> +
>> +  proximity-near-level: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>
> vdd-supply and vled-supply are definitely required.

Only marking vdd-supply as required as some chips are able to draw LED
power from vdd-supply instead of its own regulator.

