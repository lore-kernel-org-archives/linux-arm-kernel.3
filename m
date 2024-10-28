Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFB7D339A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiXeE6N++/dBgj4+EkfjjGfN3TzozHkK27/hXnwg3P4=; b=lPsmDIyBdmusX7isnE67RDtTk8
	ViOd3Dtr8ixPM2qLjDzqe5M8Vemys7rcJIyN918cusDxWRsJQRXnm/6yI1b2fbtMa1Y1jNPhoegL6
	nxqnLpUYor2BmOQPc9t0mecVmSipTa22y0jirfbSWtdKkupR0Qv9v90TzTscDchVkbMxkK7HajDHr
	ZWf7ilmJ/WtwoYWDmj5PBEpp+RtVQff3Etp1csVhIgmahUmjG8qvIBQpMbM5j6IGxtSgUP3lHY+Zg
	i3t/GYm8oRH9WCPI+MQyvUiBXupc1ETmQTsSXVal6j+REoOpmIepaaXPZot03yNEbiWrFORHNxony
	B7HUMS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SyC-0000000BZnq-2dRt;
	Mon, 28 Oct 2024 16:51:56 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Sn1-0000000BXMB-3PdP;
	Mon, 28 Oct 2024 16:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730133622;
	bh=kUEYbE6hXz/vHFt3YZ/89fRX5hOEaE51SuiUkxDzgpU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NqgPwI8SWqQsmYbYtgFKykLcMxXKveA8fZ0lao9DCK4PCwOKJ2velptL71QECqePl
	 rnPPrmBq5vhBJHFWAkHjHgOjvV+Tdxx1/frpgF3xxOIdmt48PDbZopZfGmHnMNt1HX
	 PyBcVA3pwdn+86ChDkVznRmnBTpEK+UDiaL0dhOY6Vro28ihTcoGKewP+FaEUvmZLM
	 hS78aI46rAJAbpUFz7e2akQkorx6P76z0gbpO3+XhgTkGcCv32gz++bgOL81fGO9yc
	 0FC2lSTNFAv02g3oeI3Zg0esVml/e/H1bFXi3StthXPWEeeK4s06+vcLvh2FlOdugl
	 0TAQ5euobPX7w==
X-Virus-Scanned: by epochal.quest
MIME-Version: 1.0
Date: Mon, 28 Oct 2024 13:40:18 -0300
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, Viresh Kumar
 <vireshk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Thierry
 Reding <treding@nvidia.com>, Nishanth Menon <nm@ti.com>, Chen-Yu Tsai
 <wens@csie.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Yangtao Li <frank@allwinnertech.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-pm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Andre
 Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, Yangtao Li
 <tiny.windzz@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Parthiban <parthiban@linumiz.com>
Subject: Re: [PATCH 03/13] dt-bindings: phy: sun50i-a64: add a100 compatible
In-Reply-To: <173006348387.87150.15151805812797724971.robh@kernel.org>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
 <20241024170540.2721307-4-masterr3c0rd@epochal.quest>
 <173006348387.87150.15151805812797724971.robh@kernel.org>
Message-ID: <242e94322071be17480b001de0d1347b@epochal.quest>
X-Sender: masterr3c0rd@epochal.quest
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_094023_973070_121404A1 
X-CRM114-Status: UNSURE (   9.62  )
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

On 2024/10/27 6:11 pm, Rob Herring (Arm) wrote:
> On Thu, 24 Oct 2024 14:05:21 -0300, Cody Eksal wrote:
>> The USB PHY found in the A100 is similar to that found in the A64,
>> although it requires some quirks to be enabled. Add a compatible for 
>> the
>> A100's variant.
>> 
>> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
>> ---
>>  .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml    | 1 
>> +
>>  1 file changed, 1 insertion(+)
>> 
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
A quick note that I'm updating this patch in V2 to allow for falling 
back to the D1 compatible.

Thanks!
- Cody

