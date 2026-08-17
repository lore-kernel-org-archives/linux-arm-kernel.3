Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA16C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 23:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtrN3lAWZAKRJ2tUbDwmP+q7qFhyr1LIxuBeZrAeC18=; b=EWXQ6i/wCePMhcSwIWL6LVV8MO
	Fw/t4jVflUcDIGVlHrjn82uPH4f70CfJQ9i265GdbjkqPUzaps3I4ZrMXnrweshYTgGMU02qvKD2L
	YJ3FYU5rHDErEYrN3Vnr63gpP8HhtXeria5CfvwB49O6V6pQx6e/DBkyf5iqDX94lXhA7z68PfZ/0
	Czacurn8LFd3p+VW3LXZPg2b9T4zCKi7QXtH1iPOI5fY7Hw1pebEo7cC2BTN/d6alP+yl36uULUNV
	RrqQXSKVMHn603z0c4y1wWWi+8rMIgr78V9lAGWz+pdier3t3O2BGAPYK1L15MYEgCMjLe1+vGFDh
	Gtdoapew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww7EL-00000006zy9-1XHB;
	Mon, 17 Aug 2026 23:59:01 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww7EJ-00000006zxm-0c2i;
	Mon, 17 Aug 2026 23:59:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEC8311C29E;
	Tue, 18 Aug 2026 01:58:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787011129;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=AtrN3lAWZAKRJ2tUbDwmP+q7qFhyr1LIxuBeZrAeC18=;
	b=NQq11MPzUYMsWwlx4ZJXP3+g2y/P9YUC8LLnnIx7p3n1/Sa5qThgBEen1VL9zF3wSQoeHi
	DEngtzK8KRebR8vv/MWIpWpzVF0fjb1M5d/eJijs1Y43cZNQV8aBRcIa4LXeXBwMRogKoL
	fzdwLE3V9zLf7SNuJdlF8bFZJwP29/cFHkYa/tNjU9VfVebb44QfHjQ3y1YUwJefbEvMJt
	qOs8SPJqcS2M+E5cnC0JrbgP6F7O6QId/UINbPRqTsoV8pDRHGSCW9kVGb2+G0KfRfqcqi
	HDE+ZVfyfkwHI6NoerKC0krpVcOtYo2VD/g95HZ4kmStFmvSkMlYFE4Z67adkA==
Message-ID: <d55b75da-d86d-41c0-95c6-9a6627599244@nabladev.com>
Date: Mon, 17 Aug 2026 20:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: st: Add USB nodes on stm32mp231
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Pankaj Dev <pankaj.dev@st.com>,
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
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-8-marex@nabladev.com>
 <8161b556-7ea5-4d5f-a8cc-12a71c850aa1@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <8161b556-7ea5-4d5f-a8cc-12a71c850aa1@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_165859_416819_675758AA 
X-CRM114-Status: UNSURE (   8.45  )
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

On 8/17/26 6:23 PM, Fabrice Gasnier wrote:
> 
> On 8/12/26 02:55, Marek Vasut wrote:
>> Add USB controller and PHY nodes to stm32mp231 DT.
>> This includes two USB 2.0 FEMTO PHYs, USB 2.0 host
>> controller and DWC3 DRD controller nodes. Include
>> missing COMBOPHY for the USB 3.0 controller.
> 
> Hi Marek,

Hello Fabrice,

> There's no support for the combophy on STM32MP23.
> It means USB3DR can be used in High Speed maximum.
> Please check the datasheet.

Dropped

>> +				interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
>> +				phys = <&usb2_phy2>, <&combophy PHY_TYPE_USB3>;
>> +				phy-names = "usb2-phy", "usb3-phy";
> 
> Please update USB2.0 PHYs and speed:
Fixed in V3, thanks !

