Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7463AF419B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfUdp5yiGeveHx7awmwIX27sfdsCI3XlgjXD1amRh8Q=; b=KaIkBwAA+B1mhJkX7CtT+8n4mP
	/bl79EAx6tVOqOTdmuN3Ic5fnoEyUpMvfad7XzDLZZxKkIITFn2neqX8NznnaQYrtqMaE8Quyucax
	/ojWMSKVoqSJzfi9Diw0gzYIp83XSCfsOQObSwKQ/clptLGVBGjtg3jlo7sgAA486dL7xHpiYefsJ
	Rq/OIut4WVHybiIxneZ2g+hX+lwYffTKfgw3/RS9XDTEJ9fHytbX1+kgRmFH74HEqx+FMO/MqBke1
	kn80ur0P1fkOXOLDrz4iIE3/IAoaKkq+bmcUSaikNjcChE1cyYaaAM/0miZ0fn7rp7Bn2tCQJd6lD
	rPAdPzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0YI-00000001CW7-1zlI;
	Wed, 15 Apr 2026 13:45:10 +0000
Received: from 8.mo511.mail-out.ovh.net ([46.105.79.208])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0YD-00000001CVH-1rJc;
	Wed, 15 Apr 2026 13:45:08 +0000
Received: from ex.mail.ovh.net (unknown [10.111.174.125])
	by mo511.mail-out.ovh.net (Postfix) with SMTP id 4fwj7Y1kr5z9snQ;
	Wed, 15 Apr 2026 13:44:57 +0000 (UTC)
Message-ID: <451d2cc8-d15e-47f6-be4e-515f9be62f9b@aliel.fr>
Date: Wed, 15 Apr 2026 15:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/3] arm64: dts: amlogic: t7: Add uart_c pinctrl pins
 group
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
References: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
 <20260415-add-bluetooth-t7-vim4-v1-1-0ba0746cc1d6@aliel.fr>
 <956625df-0a80-4d0e-9bb7-8071d5797748@amlogic.com>
Content-Language: en-US
In-Reply-To: <956625df-0a80-4d0e-9bb7-8071d5797748@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [92.91.227.71]
X-ClientProxiedBy: CAS12.indiv.local (172.16.1.12) To DAG11EX2.indiv.local
 (172.16.2.112)
DKIM-Signature: v=1; a=rsa-sha256; d=aliel.fr; s=ovhex24454-selector1;
 c=relaxed/relaxed; t=1776260697; h=from:to:subject:date;
 bh=nXLEFR5ld0gmkhDZoJbppfO88OloAWVZCcUgrZTTpMs=;
 b=na+26WtfbGcCpipes2h38G9UemzYZH1/SVn5Lmb6XQwN5o2uB1iJAOUX8iU1R5V23jtCoGb91ZX1JqSgsNWadzZGAllXPnO0rwDjt0Z85MUnbObnQZpEU9u+e/nDtBlXeOJz09YqNqGbvKN3Li2mVOqxfhe88O8o9Mg9FuCQmtBPI+C1f8TK7wrZzS0lcVSAg7eEd6odXrIX0FFx43UfyCfPo+ITag4keLPX49NVRvJWqr/MpOl6nQJkKRKQ0+mcxbeF4miBrL7f2g93xYkxIe9ZHuT7/n4azyhU+UleABqsH/pDSFzwKlmspzWkXKDiYz5Gyztzun8w2cCYgYvRTw==
x-ovh-tracer-id: 10833971856656240110
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTF18bDFAC26Re3D/Quk/G2rv+fn1qEiTVJFd9A+lSh7lBclNoacWW6YyCzDY45eYv9KdsbYaW5wjpUkUFKkwhYtTDxn6xhgwPBnj8brLw3zfxZQkGokQuuvRgPYIy76QikIcN4cX0Ky2Ovmw80U7tpMOqpfGAulivI09vMONPaFTUIoRFDGWDzk6JdoeKmkOru6dRFXxpxj6cov/ntGBKVkn24Vws8jLuECq0+TbR2BjsfnNHwGyV0xxcuxOn7OlJSyZhmMJvxzAzOh+pQhNShyGh9nzQcM1NZEzJC/YxHn8Itu9fLdeF5h2eM9XQWuZyVLrPIitzsmwEbSMF3V4VkKLnXRHEWlQWl3F9bE0AVfBKH8VJPFv1It67F0Gwmt3Oe4TooOEbsu8bO9WJtrHEQXNPaW6gOiIH3Dhqu81Nb8RmYtgINQacbnfyYaYNoWLUJXV8EQoSepmREUHqVobR43XWLyrCpr8cVLh4PPfoZhO01nu2LTPlOVgzJ58+57CzQmsvM+ysKMKyBvBzAJrdr03QK7eQKDJNyoTFTOJ0ouAXVm6MaMvdeP64F73otWmiS9h2+c/N7St+4QCCuIq8LONTx26ibK8xqY4gzkhbTHTBgLDIUDza1kaCanMXK3ievGYHIM3ntiMYQYyQgwNKaUT7Hsc360I6cQCXOABh8cPQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_064505_808166_C21524BA 
X-CRM114-Status: UNSURE (   7.60  )
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

Hello Xianwei,

On 4/15/26 1:28 PM, Xianwei Zhao wrote:
>=20
>=20
> On 2026/4/15 19:16, Ronald Claveau wrote:
>> Add the pin multiplexing configuration for UART C (TX, RX, CTS, RTS)
>> in the T7 SoC pinctrl node, required to route the UART C signals
>> through the correct pads before enabling the controller.
>>
>> Signed-off-by: Ronald Claveau<linux-kernel-dev@aliel.fr>
>> ---
>> =C2=A0 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++++
>> =C2=A0 1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/
>> boot/dts/amlogic/amlogic-t7.dtsi
>> index 7fe72c94ed623..531931cc1437c 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -553,6 +553,18 @@ mux {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bias-pul=
l-up;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart_c_pins: uart_c {
> node name=C2=A0 uart-c

I will change this, thank you for reminding me.

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mux {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 groups =3D "uart_=
c_tx",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "uart_c_rx",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "uart_c_cts",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "uart_c_rts";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bias-pull-up;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output-high;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 function =3D "uar=
t_c";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gp=
io_intc: interrupt-controller@4080 {


--=20
Best regards,
Ronald

