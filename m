Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1088C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdpMoBjRF6weCelhUSwlEX7zawYj+14G2BcZrtn36gQ=; b=HA/54ThYSgzV+L26u6EZQxaWqG
	dak0QhQk5o1nKla0StLo6sur5QG2v8I22l2/JkyUQOOhB4isROH5z5UvlTe/st0m+u08warkut8mJ
	ZoXgcyAhtiQQD8MW+7KHCTknC7d1r2T40G901u0DuBM3t+9vKg7m2I1icihjLkVo9vXy+1V5mUxBi
	oMWpldSZXkiqBRR0rGuqFvrcTRhwO2q6Yjw6VbYc9DWxRkTZRYsX17W/vio6LwCCs6s3jDuiXOwO5
	apqqx6zc1ecEUsxhY1j0henEO2oVy2TItznwOoLYH9jLOTxdhcwj3hi/dPGwMT4PhZ/5oM/eZadQV
	z1edI74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdTF-00000004PtG-2I06;
	Thu, 27 Aug 2026 17:00:57 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdTC-00000004Ps6-0Oso;
	Thu, 27 Aug 2026 17:00:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2403511D047;
	Thu, 27 Aug 2026 19:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787850045;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=YdpMoBjRF6weCelhUSwlEX7zawYj+14G2BcZrtn36gQ=;
	b=ZNZ0NoRDZPqbddDE4Fs1g1QVk8MReIB1oF3ZAdqRlUyEuhztpYGBtzllCOK6jBeMOQcmo5
	Ssq96Z5WHI0ps0JKcmesn1Hgr+nh9xHB7gjQG8vCL7R3DJbmMu4Pz2mGG9vO1jbMeDoRe0
	0WYBLLobUVYT0UQFgKF/QhuWlD538/1AMzXCs3joOW3BzTtNC/vslc0Q5x1pBQxHB9+fVJ
	f8oFrMl3blKW05q7jUwHF7LjlJXG0dQxurEjjJiJrYGfcAfCr4Fb1V/7UXEqmY9wftIy80
	YyMRSMVNfXJ7fYvTWqhBHzBqQar3hVMPZNaPjlVQvmabZKbNYrQXsX4gFf1Amg==
Message-ID: <6caa0c4a-3e94-4bac-8661-5f2501b5d9dd@nabladev.com>
Date: Thu, 27 Aug 2026 16:56:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3
 xHCI USB controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Pankaj Dev <pankaj.dev@st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-6-marex@nabladev.com>
 <20260827-strategic-hallowed-lynx-ca3bcc@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260827-strategic-hallowed-lynx-ca3bcc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_100054_340870_896BD591 
X-CRM114-Status: UNSURE (   9.30  )
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

On 8/27/26 2:59 PM, Krzysztof Kozlowski wrote:

[...]

>> +++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
>> @@ -0,0 +1,97 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/st,stm32mp25-dwc3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics STM32 MPU DWC3 USB SoC controller
>> +
>> +description:
>> +  The STM32 MPU DWC3 USB SoC controller block supports both
>> +  Host(SS/HS/FS/LS) and Device(SS/HS/FS) mode operation
>> +
>> +maintainers:
>> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> +  - Marek Vasut <marex@nabladev.com>
>> +
>> +allOf:
>> +  - $ref: snps,dwc3-common.yaml#
> 
> Honestly, I am lost. It seems this resolves my comment at v2, but now I
> went through patchset from Fabrice Gasnier which was ON TOP of this
> patch adding this line.

I think the stuff Fabrice sent was on top of V2.

> It is not your fault, although if there are pending comments expressed
> not via review but via patchses on top of things being reviewed, then
> can you check for them?
I did, while briefly reviewing that series.

