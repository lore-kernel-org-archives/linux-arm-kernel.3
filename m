Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D02CE9D70
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8n2ThgVzml6oYKdLHrRRtvqoR+e2zHmtT1V6Ff1r+JE=; b=yV+lHUhT4CAdUXIZ66tD0M4rhW
	wABmcZ3whHqdorUVyn7MGn4VqV1v7c/PsQ7FJZQptXp6aVASiSUI6/iM8WtII7InkKxJ0/G50MvsE
	4z/r1AGYmhZTfRar7gdc8PdTTIjnB++pqG9lpRBxH3HAgjwmOSAc11Tevhbcqa06sAZOtVvfjDHQT
	XukkX680o+cuXcO1bdWEl780xWsPQ8v/FJibBSLxiHDyUMrQiuk8zjjGHnhbVCWfK/RuE6rxvZk3G
	W4rSieHOahNQbRjb4w1JzgsKCb9H2I767GZQgDAvyjuZQ1Codvq9XUvyt7AtQ9mKOHJD4xs6v6tpn
	irwQ9URA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9Uk-0000000DS7j-3uCO;
	Tue, 06 Jan 2026 16:01:18 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9Ug-0000000DS6b-0haP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:01:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0C1C10C80C;
	Tue,  6 Jan 2026 17:00:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767715263;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=8n2ThgVzml6oYKdLHrRRtvqoR+e2zHmtT1V6Ff1r+JE=;
	b=Csen4RBye+r1zP0n/+ASabPaG7/5k++dxDVZi4nwIjuYW7EkZhTs4WT2z8kavawoiAtOHR
	MDpMXtmf+7fQpTRNtKAFl8zTr4NLpf/RvNlsozLUFb5zGD3cL86ZCqiNW5rCTFAhkAQ7Tm
	JeteJsi9xEEghenUPjAPq5JR6Xj4dJ4qQYg2CdbnO2Sosv8uBlaGGvvLTNRGCYKvT96V3m
	vJgyYFA107QEQpFUKy5qg12xROFCJN2k7dqYjrEoikfJizx6OrFq6orsQIhs9ybP+YRX33
	PIePmuApoSOfIJLYeb7bDz9kGxGyfdwo6lr50a3Cge8YVu4zPuqsAmsP0qXPEg==
Message-ID: <d2f5b091-a9c6-428a-9d2c-ada962a4190d@nabladev.com>
Date: Tue, 6 Jan 2026 17:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and
 v2
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
 Christian Eggers <ceggers@arri.de>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Markus Heidelberg <m.heidelberg@cab.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251230213401.219808-1-marex@nabladev.com>
 <20251230213401.219808-4-marex@nabladev.com> <aV0eD4t5uQeAokUF@shlinux89>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <aV0eD4t5uQeAokUF@shlinux89>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_080114_427657_ECB7CDA3 
X-CRM114-Status: GOOD (  14.21  )
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

On 1/6/26 3:37 PM, Peng Fan wrote:

Hello Peng,

> Sorry for jumping in at V4.

Thank you for the review.

> On Tue, Dec 30, 2025 at 10:32:34PM +0100, Marek Vasut wrote:
>> From: Fedor Ross <fedor.ross@ifm.com>
>>
> ...
> 
>> +
>> +&ecspi1 {
>> +	pinctrl-names = "default", "cs";
>> +	pinctrl-0 = <&pinctrl_ecspi1>;
>> +	pinctrl-1 = <&pinctrl_ecspi1_cs>;
> 
> Not get the point of using a separate pinctrl for "cs",
> I not see driver using it, or I may miss someting.

That's a good find, I believe it should be this way, because the 
pinctrl_ecspi1 is common and pinctrl_ecspi1_cs differs between v1 and v2 
boards. I'll include this in V5, I hope that looks better ?

  &ecspi1 {
-	pinctrl-names = "default", "cs";
-	pinctrl-0 = <&pinctrl_ecspi1>;
-	pinctrl-1 = <&pinctrl_ecspi1_cs>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1>, <&pinctrl_ecspi1_cs>;
  	/delete-property/ dmas;
  	/delete-property/ dma-names;
  };

  &ecspi3 {
-	pinctrl-names = "default", "cs";
-	pinctrl-0 = <&pinctrl_ecspi3>;
-	pinctrl-1 = <&pinctrl_ecspi3_cs>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi3>, <&pinctrl_ecspi3_cs>;
  	/delete-property/ dmas;
  	/delete-property/ dma-names;
  };

>> +	/delete-property/ dmas;
>> +	/delete-property/ dma-names;
> 
> Why disable DMA here?
The devices on this SPI bus are slow and do only short register IO, so 
setting up a DMA for that would make the register IO slower, hence PIO only.

