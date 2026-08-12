Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C10C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H19yU3A8Y/XE4lULkPLRYtMwMnahPHyjUbEiZ8HBLXM=; b=VBVWF7+tLx9FLZP+RbFW0X/s3L
	5kmnkTAAWGNvUZqTF8mJTuXsDGerIP8e6cRccnMvggFPgraKIDU9g5huAQepqQFJzvSQZjEFlRbGX
	2QzvKd87Nj10xann/24cW4Hd0gLlWhuw/MfPxfKFmaP0ZheaxB3lbFUmEmnULTUK8Bpa2h7uj+zyl
	E4rwAdYevjYXnofCAM5odHHQ8V0k1xhksKhYhb6JPP/xs+l15/IRmlRlO49yYbn7FA1khTBto5GG7
	4CTR6l61HThkFfs6YI8ObIKhC6iQt9OU8dOWAkLH6WUJJgm7UlQoYTDCpXhlvqYDh0lGuC6CqiUY+
	B9dmJjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6dY-0000000Fyo1-0QLr;
	Wed, 12 Aug 2026 10:56:44 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6dR-0000000Fyml-2lLZ;
	Wed, 12 Aug 2026 10:56:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A540511BD66;
	Wed, 12 Aug 2026 12:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786532190;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=H19yU3A8Y/XE4lULkPLRYtMwMnahPHyjUbEiZ8HBLXM=;
	b=QOW0fXqL5P+LZcOk9Ad1vvUrZiV5Z5pfpESJ6kJuuJNJ48yR27mMGD07nT3W9LZ9kfdCf9
	utUnTrFC0agBWlIICmuXyMDmcMklVISxPEYdZcoPVFDPGOgVycjbdxPhEZ4ffg3XojogaH
	ggKwhOSUHaGg4j6bFDQ2fqFIv9mSAh/9M/ECRxXTyMiMBbw31sLmwlmdSib6MTKbJNpFO3
	UR+K6p4wXJI7rN2WICoO8mSIvWiM37S4UWkhPz0Pfq4mS3azUfIRkhUwoW7wITbNCahWJd
	sySy6HHbbfSQw5lM4Cc3U6uVO/BcQwCo8fxJ6ShB+SOaRJaWYCxW0Y4Q6hj9rw==
Message-ID: <ff691741-a110-44e8-90e7-ac54a96de1af@nabladev.com>
Date: Wed, 12 Aug 2026 12:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Rahul Kumar <rahul.kumar05@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-2-marex@nabladev.com>
 <20260812-silky-omniscient-dalmatian-b268cb@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260812-silky-omniscient-dalmatian-b268cb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_035641_579166_C5EF7F35 
X-CRM114-Status: GOOD (  11.13  )
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

On 8/12/26 12:15 PM, Krzysztof Kozlowski wrote:
> On Wed, Aug 12, 2026 at 02:55:41AM +0200, Marek Vasut wrote:
>> From: Pankaj Dev <pankaj.dev@st.com>
>>
>> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>> slightly different, therefore they use different compatible string
> 
> What is slightly different? This should be either here, or better, in
> "description" part.

They are both Synopsys FEMTO-PHY , but they are each attached to a 
different controller (one to USB 2.0 host , the other to DWC3 DRD) , and 
their control bits in the system controller register are different for 
each variant.

I extended the description in V2.

>> to discern them.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
>> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> 
> Incomplete/incorrect DCO chain. Who sends it? Rahul?
This is lifted from the ST downstream kernel fork, it's a combination of 
a bunch of commits there and then cleaned up. Pankaj and Fabrice did 
most of the downstream work, I did the clean up for upstreaming. I 
collected the SoB lines from all the commits from ST downstream fork and 
added mine, hence this list. How shall I address this correctly, with 
some Co-developed-by tag ? Who gets which tag ?

additionalProperties is addressed in V2, so is the reported from Rob's 
bot regarding the botched compatible string in example.

Thanks !

