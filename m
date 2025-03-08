Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C0BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfxZ2EUMtcYRuh5iiI7Ca6IZaZJZ9N99juCripq5x6I=; b=pDBbCWV8tOAqulQA5RtPLKxBou
	cS1dKNExEBc5bXO3MTfLMwlRd6BdBVVFMPNfz8/hiDqoqf1H35MTVVuTG7+6oXlhE0zql6H8nbYZA
	153mzmMCfzsYcuVf17bOlY6r/V9fFk5775jBPaWioKGd/2IhjzdozidRmvQwqMeyhBjuyyryjPgCj
	oLV58peE9rJVUDCHYWpXWz2Q76ZuTLlJvvyxyr1SqxG4HaksbxZDtw2KGmNm6RBGJ/PJ4rO8ps3i7
	3rI+xklkUILbUKT4dyG2m0VBQDvWy+Nqft3jOfpeysf63nP30RTcn4O2zoYHkjCGmRCC9qWCPhnRB
	QMGfbgHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqx9y-0000000GsGP-0PyL;
	Sat, 08 Mar 2025 16:36:22 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqx8K-0000000Grz6-3nZ6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 16:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741451678;
 bh=XfxZ2EUMtcYRuh5iiI7Ca6IZaZJZ9N99juCripq5x6I=;
 b=YKnIHgllVMG4nqeiNKXcYeefh5vxyg+fKHO9y5caNmXmsutbXOuXOLH5UuJaMhRN54CzgJgD4
 NpDUgKYX1gxOv2tf4RGFVd+gvJwgzPn6XuErUaJFDgqzntHfdU1IGSUjwN1WfqGNd5g/hSRPztg
 +yevr9xYaCQxgXKRydyDyhabhdOFbpyWVA2qAtojzDajypNQ5PkY2bCUzVohRGx2uSbLID7H1PL
 dFXewjohkiPxksqGyv9+P0hILkedh9ZjcOi1TK+vEP+yCcpekEjxZbxfiCgsdZS7MnBYrUXrs68
 YaQl3L6Vi0B2nKq0Fy10c0I/8NO/rzjOy6yU8/W9937w==
X-Forward-Email-ID: 67cc719a91daabb65c1b40e8
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <29739e60-15f5-4361-a57a-2e6b93fba09c@kwiboo.se>
Date: Sat, 8 Mar 2025 17:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Xunlong Orange Pi 3B
To: Arturas Moskvinas <arturas.moskvinas@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240626230319.1425316-1-jonas@kwiboo.se>
 <20240626230319.1425316-3-jonas@kwiboo.se>
 <d1c600f1-a874-4bb8-8b9f-22a3414edfcc@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <d1c600f1-a874-4bb8-8b9f-22a3414edfcc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_083441_029884_B8FEFF9F 
X-CRM114-Status: GOOD (  17.56  )
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

Hi Arturas,

On 2025-03-08 15:53, Arturas Moskvinas wrote:
> On 6/27/24 2:03 AM, Jonas Karlman wrote:
> 
>> The Xunlong Orange Pi 3B is a single-board computer based on the
>> Rockchip RK3566 SoC.
> ...> +
>> +&gmac1 {
>> +	phy-handle = <&rgmii_phy1>;
>> +	status = "okay";
>> +};
>> +
>> +&mdio1 {
>> +	rgmii_phy1: ethernet-phy@1 {
>> +		compatible = "ethernet-phy-ieee802.3-c22";
>> +		reg = <1>;
> 
> Jonas, were you able to test V1.1 board's Ethernet?

Yes, I have both a v1.1.1 and v2.1 hw revision of this board and
Ethernet should be working on both hw revisions.

> 
> Whenever I start the board - Ethernet initialization fails with:
> ```
> [   21.140055] rk_gmac-dwmac fe010000.ethernet eth0: __stmmac_open: 
> Cannot attach to PHY (error: -19)
> ```

This is because of a reset issue with Ethernet PHYs in Linux, see [1].

Two workarounds:
1. Let boot firmware reset the PHY before Linux, i.e. use U-Boot
   v2024.10 or newer.
2. Use a ethernet-phy-id compatible with correct phy-id to force Linux
   to attach the PHY.

I suggest you try to wipe U-Boot from SPI flash on your board and update
to use U-Boot v2025.01 and try again.

> 
> But if reset is performed inside gmac - initialization succeeds.

Use of deprecated snps,reset- props is not a proper fix for this issue,
instead Linux could use an improve Ethernet PHY initialization handling
and ensuring the PHY is reset before it tries to read a phy-id from it.

[1] https://lore.kernel.org/r/47d55aca-bee6-810f-379f-9431649fefa6@kwiboo.se/

Regards,
Jonas

> 
> Eg. patch:
> ```
> --- 
> linux-6.12.17.orig/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dts
> +++ linux-6.12.17/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dts
> @@ -16,14 +16,14 @@
>   &gmac1 {
>   	phy-handle = <&rgmii_phy1>;
>   	status = "okay";
> +	snps,reset-gpio = <&gpio3 RK_PC2 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 50000 200000>;
>   };
> 
>   &mdio1 {
>   	rgmii_phy1: ethernet-phy@1 {
>   		compatible = "ethernet-phy-ieee802.3-c22";
>   		reg = <1>;
> -		reset-assert-us = <20000>;
> -		reset-deassert-us = <50000>;
> -		reset-gpios = <&gpio3 RK_PC2 GPIO_ACTIVE_LOW>;
>   	};
>   };
> ```
>> +		reset-assert-us = <20000>;
>> +		reset-deassert-us = <50000>;
>> +		reset-gpios = <&gpio3 RK_PC2 GPIO_ACTIVE_LOW>;
>> +	};
>> +};
> 
> 
> Arturas Moskvinas


