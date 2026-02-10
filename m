Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62120EB2718
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 21:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XscM2E/dW4y4NolWAJoTD+vo2fj8gfXABnlEwyo6sXU=; b=mR1PZU1xMwBBN9tNqEt7FmTInC
	rygkK+fq5OWUrrHflGVGsFD+bgJyKNc7rFOfXMyBQy8psLjhSmzgkxAXqZ6f5/mkxMDo6+WoKNgwl
	CPhkjbcNzUC9D2k6kamTCzFFg0zIb+SHuL6ONV6pgEoYB4s2/NNGSdjRA1vqOntMi9iBe67vr6bQc
	CqY2u+tsl2GFSXT5yga/ubPpK0a0J7yxC/LWjP3QptcJs4PpJUTt94SNvaARQBRuZGfQjOUHNEG1+
	g6xUc2BzpvrRtJVXpKwDq7cgG8NJGwP3LCeOByZLJ328trNUq0ffpY5zaz/INNWCDh6dB1anf0DDd
	RemKePiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpvGN-0000000HWWB-1qek;
	Tue, 10 Feb 2026 21:27:15 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpvGK-0000000HWVO-39ib
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 21:27:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 698601104B0;
	Tue, 10 Feb 2026 22:27:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1770758824;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=XscM2E/dW4y4NolWAJoTD+vo2fj8gfXABnlEwyo6sXU=;
	b=Xm7xfRtu7rKY0s1c0XVZowP1Y/sM8fFxLM5sgeZdV3g9v1Ur17sdSlLE6cbc9OwrEcJYb0
	Iucm/iKk8tZLjRGqy/AmrsQnViiR7VbSN57j6DsU4Rc5oPUZtPWLs3+IuM+Ne9hzcJOP1B
	/cv5T67VrL0E1dALltYXFbKPM6ixICLwtLAXlDttr1TrTa7jyEeJOuDtLjsXWK8i3pTISA
	HO4iYJ4geFUqlPv2Kmc9pYZuCOEN01OKZ5UZ2jRTNLk/01k/l2ju+484LNHKOquFKLeg7a
	y3QHvhf2snwN8ttBzwvPrlgYdS9Vde5xCLzZxu61hUN/MfsbCmzkN6FNoTCW0w==
Message-ID: <077a52af-add3-473b-bf3c-d3ae9c6a2874@nabladev.com>
Date: Tue, 10 Feb 2026 17:12:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: imx6ull-dhcor: Handle both 1DX and 1YN WiFi on
 i.MX6ULL DHCOR
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, kernel@dh-electronics.com, linux-kernel@vger.kernel.org
References: <20260209170739.22379-1-marex@nabladev.com>
 <aYoyrqV2lSJetls5@lizhi-Precision-Tower-5810>
 <9760a129-ee03-4556-b98b-2625739b21fa@nabladev.com>
 <aYtSV8oynehECLPM@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <aYtSV8oynehECLPM@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_132713_097735_430BC630 
X-CRM114-Status: GOOD (  15.07  )
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

On 2/10/26 4:44 PM, Frank Li wrote:
> On Mon, Feb 09, 2026 at 09:41:24PM +0100, Marek Vasut wrote:
>> On 2/9/26 8:17 PM, Frank Li wrote:
>>
>> Hello Frank,
>>
>>>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
>>>> index 75486e1b0c15f..a0adcd3fe1229 100644
>>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
>>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
>>>> @@ -201,7 +201,7 @@ &uart2 {
>>>>    	 * the speed can be increased accordingly.
>>>>    	 */
>>>>    	bluetooth: bluetooth {
>>>> -		compatible = "brcm,bcm43430a1-bt"; /* muRata 1DX */
>>>> +		compatible = "brcm,bcm4329-bt"; /* muRata 1DX or 1YN */
>>>
>>> in driver, brcm,bcm43430a1-bt and brcm,bcm4329-bt should be the same.
>>>
>>>>    		max-speed = <3000000>;
>>>>    		vbat-supply = <&vcc_3v3>;
>>>>    		vddio-supply = <&vcc_3v3>;
>>>> @@ -222,7 +222,7 @@ &usdhc1 {
>>>>    	status = "okay";
>>>>
>>>>    	brcmf: wifi@1 {
>>>> -		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac"; /* muRata 1DX */
>>>> +		compatible = "brcm,bcm4329-fmac"; /* muRata 1DX or 1YN */
>>>
>>> driver have not check "brcm,bcm43430a1-fmac".
>>>
>>> Look like driver can work for both CHIP without modify dts.
>> Sure, the driver can work even with the current DT, but the DT isn't
>> accurate as it describes compatible string specifically for the 1DX part.
>> This change makes the DT use more generic compatible which fits both 1DX and
>> 1YN parts. And it also fixes the comment accordingly.
> 
> Okay, can you descript more clear at commit message, especially how driver
> can auto detect 1DX and 1YN.
This is already there, see "drop the more specific compatible string and 
let the driver auto-detect the chip type."

What would you prefer to change there ?

