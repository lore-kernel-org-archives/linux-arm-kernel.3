Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB20BC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 10:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gb9mM62YNa3M980jvsV0Wc3c2VWrJY0STu0zD6FpqT8=; b=B8EtmV45yG6c6Ch07CTE+m7tkA
	44p1r3fbyiBBhqbqGJPzAGFoCVjHxGuwJrRZWzCzRV5J/Ak3CSxWhp51aB5oIPg8AdinaGbmn4tS6
	Xe6LVAyxxC6lUZW4gNCe/ogDcgeQflTzr6N3FRjND+cnlZMR+KxWriEO4y0CQk+3PJthS0t6bSWBy
	kwhWF63DOMYh+vjuzpJhLRZhav8VhgCiz4jj2q8l5fFNRzPddabpSpEsYmwwLVNR51/eVY8yY+VEX
	y5ZFP+P3JJz3srk5EnrhTQBZbiI9uHOdLOMmBr1pbPMKbKACruUhW+/ElUvQNCu+JlAhdTb6ITIa8
	ME9E2R7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjHJ-0000000DnVa-2qSt;
	Tue, 11 Aug 2026 10:00:13 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjHF-0000000DnTj-4053
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 10:00:12 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1786442401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gb9mM62YNa3M980jvsV0Wc3c2VWrJY0STu0zD6FpqT8=;
	b=jVuhIJGPr2KT8VjXH4U3yJK1pu3vLLHRt1BQIVy9d9kQqYhLDZmifAp2f4x4PFL3WTQ2Np
	Jx76bQc4wLFA8wQ4ZaMnvmo8sP5mZIgVw8X2/46QiG2MOFxX0ftzoLwhI2JX84/NSEvMui
	8sZ83raoI40xnIlE3DQQLNSSaVoUg172Qi+fgmNv4nbUM3lIH5P5SAvtay0HJVwIzB9NCx
	5NpqSWL9WBs8aNy2WEzzSTdMDW52wLEni4OKKL2wRJI+480JDArORR28B9b9Fle0mZ4RBj
	3cK7qBDVH8WCs43qJu+YThfxjOz8xlkBiCh8sehzJazHWk/xhghUhcG6+jAS2Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 11:59:33 +0200
Message-Id: <DKM0YWWP935E.3K38J0LJL6AEE@cknow-tech.com>
Cc: "Heiko Stuebner" <heiko@sntech.de>, "Rob Herring" <robh@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Jonas Karlman" <jonas@kwiboo.xyz>, "Joachim
 Eastwood" <joachim.eastwood@gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable NPU on Radxa E52C
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Jimmy Hon" <honyuenkwun@gmail.com>, "Chukun Pan" <amadeus@jmu.edu.cn>
References: <20260810100000.2643814-1-amadeus@jmu.edu.cn>
 <CALWfF7K2t4nt05a4TugBjOQkaQK=M=+wDSeG26B33znyMMzhAQ@mail.gmail.com>
In-Reply-To: <CALWfF7K2t4nt05a4TugBjOQkaQK=M=+wDSeG26B33znyMMzhAQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_030010_522322_F49F0205 
X-CRM114-Status: GOOD (  13.72  )
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

On Tue Aug 11, 2026 at 6:39 AM CEST, Jimmy Hon wrote:
> On Mon, Aug 10, 2026 at 6:20=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> w=
rote:
>>
>> Like the RK3588, the RK3582 has NPUs. Enable the NPU cores and their
>> MMUs, and connect the regulators.
>>
>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>> ---
>>  .../boot/dts/rockchip/rk3582-radxa-e52c.dts   | 34 +++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/a=
rm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
>> index 854c118418eb..dd29a3ea7031 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
>> @@ -300,6 +300,10 @@ &pcie2x1l2 {
>>         status =3D "okay";
>>  };
>>
>> +&pd_npu {
>> +       domain-supply =3D <&vdd_npu_s0>;
>> +};
> Now that the power domain has control of the regulator. The regulator
> should have regulator-always-on removed, so it can be powered down.

Next to that, quoting a question that was raised earlier here:
https://lore.kernel.org/all/b9a5beb6-b701-430c-b667-44780736dd89@kwiboo.xyz=
/

"Why is boot-on kept?, NPU is likely not needed until OS has started.

With PD domain-supply the regulator should be enabled automatically, or
is there some other issue that requires boot firmware to enable this
regulator before OS is started?"

I do realize quite a few other boards have it too, but maybe they
shouldn't have it/them either?

Cheers,
  Diederik

