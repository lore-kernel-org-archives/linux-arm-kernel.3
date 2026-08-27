Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50E0C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OD3WDKVPKy4gFKDQyvFk0U8Q8vSh1Hf0rGi/7d2Ce6I=; b=HyXapWtzPL0G3N+IPOpJ3TUDoJ
	bXNQ1/D/LR089goSWrY384Cxyrl59dLHBvHWilhd2ae/3t0fspbHJB6SF9+xMBmlEBos2EFkCT5td
	XXgatut67K+aWkprd2ZieuGD9Rv7tIgFrXPJucNlKoc9AhyY633dqoYgLQc4T8KiUEqvWsm/uO+RP
	i00prDKyQPpvBDlZh0wJQQ9ZfQRfkuc4b8zEerGAreFQCC8BNyD08CpZ2qqutrJoYYcS9XxQ7bHfs
	u9cBZN04YrrYOYudMXlUkG+vfh1gzdFmEti0jUr+Cy9WY10Len16LQDKxv/6W4aEMqn9qloh8fpdm
	og09qOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdTF-00000004Pt7-1UpK;
	Thu, 27 Aug 2026 17:00:57 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdTC-00000004PrW-0Iyc;
	Thu, 27 Aug 2026 17:00:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FE9511D051;
	Thu, 27 Aug 2026 19:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787850039;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OD3WDKVPKy4gFKDQyvFk0U8Q8vSh1Hf0rGi/7d2Ce6I=;
	b=GPQLHb1iRWr07a51QmhBSJYtn/FKuxaKOgOQIUO2Un5lYyCRvSZJ9MKrvoSUN9nETTGrQh
	QoE4gpk2xigPEGZFO3Id4JPgU1IOHNIKsbj1dj4njz+hIK5jZsx6IToaA7jmRocIsq/oWK
	RgVh4dLbArZL7B6KD7zRjrRTj3TW4TGdQzGmvU3ylGVzXxAm5IHU3x2eyDa8r0VUt+wCda
	A39LgKSS566fU7hIydInXNYlArHQnJaZyj+QKaYrUlFUhhA7YimXEuRRdkYKC1XQNLkShh
	fQO4l3ipFHSygK9CxVQV/xOzbbXQNVfieZ+IXrvQ4zdA1v0KfbNpuV8XuSn0mw==
Message-ID: <34c48ff1-524f-4d24-b53f-99e7171d08db@nabladev.com>
Date: Thu, 27 Aug 2026 16:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
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
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-2-marex@nabladev.com>
 <7a16614a-bd1b-462a-be13-4a9c22aa588e@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <7a16614a-bd1b-462a-be13-4a9c22aa588e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_100054_340740_7DF5F8B8 
X-CRM114-Status: UNSURE (   9.31  )
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

On 8/27/26 2:54 PM, Krzysztof Kozlowski wrote:
> On 22/08/2026 09:46, Marek Vasut wrote:
>> +description:
>> +  USB2 PHY block in STM32 is attached to USB 2.0 Host controller and
>> +  USB 2.0 side of DWC3 DRD controller, and provides the USB LS/FS/HS
>> +  connectivity. Both PHYs are the FEMTO-PHY, but their configuration
>> +  bits in the system control register are different for each variant.
>> +
>> +maintainers:
>> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> +  - Marek Vasut <marex@nabladev.com>
>> +  - Pankaj Dev <pankaj.dev@st.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - st,stm32mp25-usb2phy1
>> +      - st,stm32mp25-usb2phy2
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
> 
> As pointed out by different patchset built on top of it, this is wrong.

What is wrong in this (V3) of the patchset ? I think the ST patches were 
fixing up V2 and what they were fixing up is already fixed here in V3.

> I do not understand why Fabrice Gasnier cannot reply HERE that this is
> wrong and instead another patch is sent for in-flight code. That's not
> your Marek problem, but lack of responsible review from ST...
ACK

