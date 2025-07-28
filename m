Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32358C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CoB5tasYH7GrZPehMHvuHgB7MplGLckmtYJLeYrDXq4=; b=Ptva7xeBxDK0I0QakiNLXtqHWj
	Rk9KpwvgB7ifNOfLLlu1xVVao3RhHHxcbr4ZUj6tMsTC1USOPMuvFZvp5G5AvmGYI49SNY4OUsKY0
	JwbJ81T28+jtVkROHhGDcGXWD1SoDdxJNzvDDjvaloyZhUzUz4pgThGGVxKViI1RO0SED7Al5Dlnk
	NAVXZyJD7/wNM3VSzQd8oy8rpQlInC/il7mctTh5tv8QPdGpcPz6ItyECu+Xchl6b6GmnQ+V1bync
	87qlYNvDjEzp3JKNApg1mOiyrN8icop4GXGOT9zn7qVWU1NRfDku3VXtONrAoeeO9d/gbTBMNuBGq
	c9dzbbFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS8y-0000000FAL1-0plo;
	Mon, 28 Jul 2025 18:00:12 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRxR-0000000F8J5-2356
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1753724896;
 bh=CoB5tasYH7GrZPehMHvuHgB7MplGLckmtYJLeYrDXq4=;
 b=hkZLzsLqyazrdXtSVHlqKkgLlWIdgR6nPrJ7kBxwYa/shm7QqvReY5GwpSxmpK48jBZrj5rEK
 WTQ5QVdBId2h9fVO7Gcn63pC75LKYe94cONB4FOdZ1Kh7SCaYWM1+HqLD0XtTHb2Xqt+6q6LUku
 /Cv36s18Wszpl1oKgvm3zCBPfCnC72Atdw8jiPqAtvB0HNbkIT1jdT0WwfLPQMHtZeVoceUq5BK
 XSISPv9/+0MFC9RHXGU3jocyDXazaJAtmttNWjvDvbLCkZBQyZ7y5a/NxSjX3Qjvmw2jNAGiv11
 tGtK5wvj8HX69UIifr3xMAMp0V4SBx/Ds0Axywn+zXMA==
X-Forward-Email-ID: 6887b7c8351ec66b15a2df24
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.8
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5bdd0009-589f-49bc-914f-62e5dc4469e9@kwiboo.se>
Date: Mon, 28 Jul 2025 19:47:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add RTL8367RB-VB switch to
 Radxa E24C
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alsi@bang-olufsen.dk, andrew@lunn.ch, conor+dt@kernel.org,
 davem@davemloft.net, devicetree@vger.kernel.org, edumazet@google.com,
 heiko@sntech.de, krzk+dt@kernel.org, kuba@kernel.org,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, olteanv@gmail.com, pabeni@redhat.com,
 robh@kernel.org, ziyao@disroot.org
References: <20250727180305.381483-4-jonas@kwiboo.se>
 <20250728143020.1007374-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250728143020.1007374-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_104817_573656_10E55B9C 
X-CRM114-Status: GOOD (  23.46  )
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

Hi Chukun,

On 7/28/2025 4:30 PM, Chukun Pan wrote:
> Hi,
> 
>> Initial testing with iperf3 showed ~930-940 Mbits/sec in one direction
>> and only around ~1-2 Mbits/sec in the other direction.
> 
>> Any mix of MAC (rx/tx delay) and switch (rx/tx internal delay) did not
>> seem to resolve this speed issue, however dropping snps,tso seems to fix
>> that issue.
> 
> Have you tried setting phy-mode to rgmii? (just for testing)
> Usually this problem is caused by incorrect rx/tx delay.

The issue is with TSO and RX checksum offload, with those disabled on
the conduit interface (gmac1/eth0) my issues disappeared.

Use of rgmii-id "RX and TX delays are not provided by the PCB." as
defined by the dt-bindings seem to most correctly describe the HW.

Describing switches is new to me, so I could be wrong :-)

> 
>> +	ethernet-switch@1d {
>> +		compatible = "realtek,rtl8365mb";
>> +		reg = <0x1d>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&rtl8367rb_eint>;
> 
> Shouldn't this pinctrl be written in interrupts?

Not necessarily, in my mind the pinctrl is applied for the switch
interface to the SoC, not the internal workings of the switch.

> 
>> +			ethernet-port@6 {
>> +				reg = <6>;
>> +				ethernet = <&gmac1>;
>> +				label = "cpu";
> 
> No need for label = "cpu":
> https://github.com/torvalds/linux/commit/567f38317054e66647fd59cfa4e261219a2a21db

Thanks, will drop in v2.

> 
>> This series relaxes the realtek dsa drivers requirement of having a mdio
>> child OF node to probe and instead have it register a user_mii_bus to
>> make it function when a mdio child OF node is missing.
> 
> This is weird, the switch is connected to the gmac via mdio.
> Can you try the following and see if it works? I tried it on
> a rk3568 + rtl8367s board and it worked:

With a 'mdio' child node 'make CHECK_DTBS=y' report something like:

   rockchip/rk3528-radxa-e24c.dtb: ethernet-switch@1d (realtek,rtl8365mb): mdio: False schema does not allow { [snip] }
         from schema $id: http://devicetree.org/schemas/net/dsa/realtek.yaml#

With a mdio node the driver is happy and dtschema is sad, and without
the mdio node it was the other way around.

The plan is to drop this patch and instead modify the dt-binding to
allow describing a mdio node when the switch node has a reg prop in v2.

Regards,
Jonas

> 
> ```
> &mdio1 {
> 	switch@29 {
> 		compatible = "realtek,rtl8365mb";
> 		reg = <29>;
> 		reset-gpios = ...
> 
> 		switch_intc: interrupt-controller {
> 			interrupt-parent = ...
> 			interrupts = ...
> 			interrupt-controller;
> 			#address-cells = <0>;
> 			#interrupt-cells = <1>;
> 		};
> 
> 		mdio {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			phy0: ethernet-phy@0 {
> 				reg = <0>;
> 				interrupt-parent = <&switch_intc>;
> 				interrupts = <0>;
> 			};
> 
> 			phy1: ethernet-phy@1 {
> 				reg = <1>;
> 				interrupt-parent = <&switch_intc>;
> 				interrupts = <1>;
> 			};
> 
> 			phy2: ethernet-phy@2 {
> 				reg = <2>;
> 				interrupt-parent = <&switch_intc>;
> 				interrupts = <2>;
> 			};
> 
> 			phy3: ethernet-phy@3 {
> 				reg = <3>;
> 				interrupt-parent = <&switch_intc>;
> 				interrupts = <3>;
> 			};
> 		};
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			port@0 {
> 				reg = <0>;
> 				label = "wan";
> 				phy-handle = <&phy0>;
> 			};
> 
> 			port@1 {
> 				reg = <1>;
> 				label = "lan1";
> 				phy-handle = <&phy1>;
> 			};
> 
> 			port@2 {
> 				reg = <2>;
> 				label = "lan2";
> 				phy-handle = <&phy2>;
> 			};
> 
> 			port@3 {
> 				reg = <3>;
> 				label = "lan3";
> 				phy-handle = <&phy3>;
> 			};
> 
> 			port@x {
> 				reg = <x>;
> 				ethernet = <&gmac1>;
> 				phy-mode = "rgmii";
> 
> 				fixed-link {
> 					speed = <1000>;
> 					full-duplex;
> 				};
> 			};
> 		};
> 	};
> };
> ```
> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 
> 


