Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C81C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3yiw9fGT8tcoZt18Mq7scIuD28H39S39adFgYTtqwc=; b=GBAORv78dk34TC3D8dSswEEcfs
	oy0Xg4+DRKQIZ8Oxbn2t2hcP+Ng/O1xug6wm3wrkco2aZT+Xz+W+SeGAB4/bHGATnIuJh9VJNvZ1g
	8Gs5Gu0/fCojv+06eAda/AAcW8lsOQBUfggjISTRl+566uLvPqMgQkpM5uhrlSbiGaGtrJzN1nJ7G
	eZALWjmzbz8Ga5Y3Vr3mA6dFganvdw1ClPoIjOsrTfX/PvBnHkCzUkSPJnEDrR82mc5XAvQ63qEUD
	RHJpd6F6BK0xDEAh4cAAVcm6Cc5nh01+C9RlTjuAq/vHu8owKiDkZr7/ii4qEd66sBxxOrCxbBoVB
	mrMidE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3uH-0000000EqQT-29aB;
	Tue, 07 Jul 2026 11:24:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3uF-0000000EqPo-1IWU;
	Tue, 07 Jul 2026 11:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783423441;
	bh=MNq3g0GFVF/h1p5eOlO9D0oZO//Tjm7KBHuMFBBripA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a04izbRncf2krS+ydY9IR1ojtF7rMi1XhRyL3Ln0TWJNeR+DcmnBnMtZG9J89H8xx
	 2KrUVOeBGOGItQiQkbAmzRVQlbV9YSmaEHd8jV4Hbmr6R3UxwW8JZRZ2t5iQG69H98
	 ZFZFXSS6/qNSPEPalaJxztRc6y2vtA9HKxmRtXPeMEieukHkLaFt9iZ3eZvTN7JREt
	 CHaf5SXRfB0jhNIEvFU+DlhJJneyX4HK5ml5P5Bvbja3yl118+lnwqx1X6380Ab1qC
	 mYmtxYdVbTpbnhGVIaPDQkjYrZvVpXbMMGv6BfZSKRWJDmScfPCHHOFAJes3cwvhco
	 FbpVCAiypBGaA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B8EEF17E0521;
	Tue, 07 Jul 2026 13:24:00 +0200 (CEST)
Message-ID: <94c10212-9c27-4875-8a88-78bfb67fb382@collabora.com>
Date: Tue, 7 Jul 2026 13:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260707104427.3409290-1-wenst@chromium.org>
 <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
 <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_042403_501187_78B63829 
X-CRM114-Status: GOOD (  24.01  )
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

On 7/7/26 13:08, Chen-Yu Tsai wrote:
> On Tue, Jul 7, 2026 at 7:05 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> On 7/7/26 12:44, Chen-Yu Tsai wrote:
>>> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
>>> DRAM.
>>>
>>> Add a device node for it and hook up all the supplies.
>>>
>>> This change requires a firmware fix for the SPMI bus to read back
>>> correctly. The required firmware version is 15842.175.0. This is
>>> included in ChromeOS releases R150-16700.22.0 (available in Beta
>>> channel as of writing or stable channel in mid-July) or
>>> R151-16721.0.0 and later.
>>>
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> This is a big problem then.
>>
>> I take it as if the firmware fix is not in place, probing the CPU power supplies
>> will fail, with all the consequences.
> 
> That's right.
> 
>> This means that with this, we're breaking all Geralt machines with older firmware,
>> which is not acceptable...
>>
>> ...so this needs a different solution, or strong reasons to make me understand that
>> I'm wrong, if I'm wrong.
> 
> We can drop the CPU supplies (they don't matter since cpufreq is hardware
> driven) and just add the regulators. How does that sound? If the firmware
> isn't updated, the PMIC will fail to probe, but since nothing is using it,
> the system will continue to work (with some annoying error messages).
> 

That'd be wrong, but less wrong than not having anything described...

...I wonder if, at this point, you could set the SPMI node to status = "fail" and
have the *new* firmware override that to "ok".

That's the only reasonable way to go forward, IMO.

Of course, avoid having the firmware adding the CPU supplies, because that would
be rather sketchy then. Just "if spmi status fail found, change to ok".

Cheers,
Angelo

> 
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> ---
>>>    .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 +++++++++++++++++++
>>>    1 file changed, 66 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> index f382f90c48f5..fea52c377d88 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> @@ -4,6 +4,8 @@
>>>     */
>>>    /dts-v1/;
>>>    #include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/spmi/spmi.h>
>>> +
>>>    #include "mt8188.dtsi"
>>>    #include "mt6359.dtsi"
>>>
>>> @@ -241,6 +243,14 @@ &cpu5 {
>>>        cpu-supply = <&mt6359_vcore_buck_reg>;
>>>    };
>>>
>>> +&cpu6 {
>>> +     cpu-supply = <&mt6319_buck1>;
>>> +};
>>> +
>>> +&cpu7 {
>>> +     cpu-supply = <&mt6319_buck1>;
>>> +};
>>> +
>>>    /*
>>>     * Geralt is the reference design and doesn't have target TDP.
>>>     * Ciri is (currently) the only device following Geralt, and its
>>> @@ -1156,6 +1166,14 @@ pins-bus {
>>>                };
>>>        };
>>>
>>> +     spmi_pins: spmi-pins {
>>> +             pins-bus {
>>> +                     pinmux = <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>,
>>> +                              <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
>>> +                     bias-disable;
>>> +             };
>>> +     };
>>> +
>>>        uart0_pins: uart0-pins {
>>>                pins-bus {
>>>                        pinmux = <PINMUX_GPIO31__FUNC_O_UTXD0>,
>>> @@ -1267,6 +1285,54 @@ &spi2 {
>>>        status = "okay";
>>>    };
>>>
>>> +&spmi {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&spmi_pins>;
>>> +     #address-cells = <2>;
>>> +     #size-cells = <0>;
>>> +     status = "okay";
>>> +
>>> +     pmic@6 {
>>> +             compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
>>> +             reg = <0x6 SPMI_USID>;
>>> +             pvdd1-supply = <&pp4200_s5>;
>>> +             pvdd2-supply = <&pp4200_s5>;
>>> +             pvdd3-supply = <&pp4200_s5>;
>>> +             pvdd4-supply = <&pp4200_s5>;
>>> +
>>> +             regulators {
>>> +                     mt6319_buck1: vbuck1 {
>>> +                                     regulator-name = "ppvar_dvdd_proc_bc";
>>> +                                     regulator-min-microvolt = <520000>;
>>> +                                     regulator-max-microvolt = <1155000>;
>>> +                                     regulator-enable-ramp-delay = <256>;
>>> +                                     regulator-allowed-modes = <0 1 2>;
>>> +                                     regulator-always-on;
>>> +                     };
>>> +
>>> +                     /* vbuck2 is ganged with vbuck1 */
>>> +
>>> +                     mt6319_buck3: vbuck3 {
>>> +                                     regulator-name = "pp1125_emi_vdd2";
>>> +                                     regulator-min-microvolt = <1060000>;
>>> +                                     regulator-max-microvolt = <1170000>;
>>> +                                     regulator-enable-ramp-delay = <256>;
>>> +                                     regulator-allowed-modes = <0 1 2>;
>>> +                                     regulator-always-on;
>>> +                     };
>>> +
>>> +                     mt6319_buck4: vbuck4 {
>>> +                                     regulator-name = "pp0600_emi_vddq";
>>> +                                     regulator-min-microvolt = <570000>;
>>> +                                     regulator-max-microvolt = <650000>;
>>> +                                     regulator-enable-ramp-delay = <256>;
>>> +                                     regulator-allowed-modes = <0 1 2>;
>>> +                                     regulator-always-on;
>>> +                     };
>>> +             };
>>> +     };
>>> +};
>>> +
>>>    &uart0 {
>>>        pinctrl-names = "default";
>>>        pinctrl-0 = <&uart0_pins>;
>>

