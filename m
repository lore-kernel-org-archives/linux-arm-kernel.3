Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4DDD6ED26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkLv2VhsKciXpolWwFrJFrIRN5TX0iz99r7qnrvm/As=; b=H13uey83MzMzYY
	kO92mkc22jHZPrHmTlybMmIVA3lC3HfygMkrDBqcM/U97YleFFLitxsOzwGdM65ByvhS+QToJ+LS9
	a9KeuMRG2CTiGzli50ghev+O63GQfaJPsUhLCpAkxm6zBAwfHyezFRPeoRL7BwTzG0Qu7gypLkG3g
	khIfuEqPSLno/G+0n7kgPHUhEfXY6ykKfIYMoTL/JJsX7owSWSx/hVhAyH4FOuDKvo+Dk8fDAD9A3
	wnbMs8gGBNuiEgc9IaghHBJDaK9ar9aOA3eKN7TotjEKwIND2LjN4oSznPt78VbCfXrJwe0YXd/9S
	GzxxxdybtqQgOugNs0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE6yN-000000004zU-3BuE;
	Thu, 21 Nov 2024 13:11:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE6xA-000000004n7-1ttn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 13:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D175A4081A;
	Thu, 21 Nov 2024 13:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6858EC4CECC;
	Thu, 21 Nov 2024 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732194635;
	bh=Q7e/7v/wkwzf+9WRZWI76lfTqRghf/xxHp0zdkSzu+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tawtPhkvVrm2LcvaCKjV6g8MeO3JOG8jZncu/ZDZzulDw2HSdMKZKba1yGDemoVGW
	 yy7dPrP1XkRDf8bQeeL2H+6WF2GuVm5fIeP+Sozos2GuqCmQwWElP/Lrju6B7VzNRR
	 Wa1SyJs4R+2xqYpRp1vnPVK6W9SK1MAqTtG9Z0gfjLC47waW+H1bYFeJLipl6c2rF+
	 KwiJpurVykxwY+teUkL7EwnD8Nzx9WOrt4q1X7DZVmYqn7Bc9QuoSsmOqPiqEFP13D
	 FB35V1EzOVOj0hSQ4m3kDYl44vKVzJzzqOTMzgmyv/TzpOF+ofy/EQ8e4uPB8mdfzh
	 J9y0cBm244jkw==
Message-ID: <1c755fb4-964a-4c7b-819f-f5cf54baddfb@kernel.org>
Date: Thu, 21 Nov 2024 15:10:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
To: MD Danish Anwar <danishanwar@ti.com>, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, ssantosh@kernel.org, nm@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20241113110955.3876045-1-danishanwar@ti.com>
 <20241113110955.3876045-2-danishanwar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241113110955.3876045-2-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_051036_557117_F41C2268 
X-CRM114-Status: UNSURE (   6.73  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 13/11/2024 13:09, MD Danish Anwar wrote:
> The ICSSG module has 7 clocks for each instance.
> 
> These clocks are ICSSG0_CORE_CLK, ICSSG0_IEP_CLK, ICSSG0_ICLK,
> ICSSG0_UART_CLK, RGMII_MHZ_250_CLK, RGMII_MHZ_50_CLK and RGMII_MHZ_5_CLK
> These clocks are described in AM64x TRM Section 6.4.3 Table 6-398.
> 
> Add these clocks to the dt binding of ICSSG.
> 
> Link: https://www.ti.com/lit/pdf/spruim2 (AM64x TRM)
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


