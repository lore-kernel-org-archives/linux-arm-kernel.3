Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1529C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 06:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94X5h2I9/t80oartguceQwzpr7mdXzD6cocCjNwxFj8=; b=cb+2Tz0sOR8FRWUYJJB4xkMgEN
	h0e1LRTfxxAg+cGMsio4y2aDRTVYB4YCaDduVS2X/u8QTSqPePz2kSSaKMSHoObsHeQx7Xm3g+AN0
	vK27Ne78WFyT5S0JD+N7Le8LWXG1Yj8ygtX7AVFm0Aej9byGsllfeEG3bo2ya2/EwbeBPzJsNl9Eh
	5X4OI2SlqUY/XAFuD+S5GgG+jgtCWl4Bcw5ivP7iIAPbQ25sqnmC9divK4pLv+V/mNp0iXAEBWvBd
	305ql6x0qUiKyZM8eKcyu5/d6vwyQDiC4Zv5uJ8peeCgygVqPqSuSpp5TYeeeIUU19EargSj+fCOS
	s2tn9vQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYd5-0000000EQHj-3hcN;
	Wed, 07 May 2025 06:51:43 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYX9-0000000EPdd-1jNV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 06:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1746600331; bh=7HbNIzMEBH3G1bZP2toTzbtQQnF+CEXpP6d9nsdQ/bY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TSDu3/e9wC/7vkGemThhcyDL1eyfJswqiF+QvbHgBBl5FWJdrT3q+vqpcVyLE53ZI
	 PP6DCQL3tLLlz4Ygb5IXgCe4AvGmt1NsYzFrOl6Tt2gyiBwrk6ZPBds7qSL620m86B
	 LQmiNSbBi7qQ8xhaiTy0oMF8qyeRiCEl+hQdebrQUoD2Ye+IcH0fMiyo1q0yuSoVfN
	 cXPi2iOGg4TDbFl+bdURsC9F1hSyiiFkXY42/53VIX6aQJThmsPwaLmc2kVWx35tV/
	 2IvU8xF3JWvhpMH/OscJWcOdTRs0hPvhelVz+9TEwOpJ+jjwd0reaU258Gd3mvp/zK
	 PSTtEEgGHVzeA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 2C8DA3B7F0F;
	Wed,  7 May 2025 06:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1746600331; bh=7HbNIzMEBH3G1bZP2toTzbtQQnF+CEXpP6d9nsdQ/bY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TSDu3/e9wC/7vkGemThhcyDL1eyfJswqiF+QvbHgBBl5FWJdrT3q+vqpcVyLE53ZI
	 PP6DCQL3tLLlz4Ygb5IXgCe4AvGmt1NsYzFrOl6Tt2gyiBwrk6ZPBds7qSL620m86B
	 LQmiNSbBi7qQ8xhaiTy0oMF8qyeRiCEl+hQdebrQUoD2Ye+IcH0fMiyo1q0yuSoVfN
	 cXPi2iOGg4TDbFl+bdURsC9F1hSyiiFkXY42/53VIX6aQJThmsPwaLmc2kVWx35tV/
	 2IvU8xF3JWvhpMH/OscJWcOdTRs0hPvhelVz+9TEwOpJ+jjwd0reaU258Gd3mvp/zK
	 PSTtEEgGHVzeA==
Message-ID: <fd2eaad2-2c9a-4277-b705-cac5258d6409@mleia.com>
Date: Wed, 7 May 2025 09:45:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: serial: Convert nxp,lpc3220-hsuart to DT
 schema
Content-Language: ru-RU
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250506220048.2546915-1-robh@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250506220048.2546915-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250507_064531_201306_81B92975 
X-CRM114-Status: UNSURE (   4.52  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_064531_201306_81B92975 
X-CRM114-Status: UNSURE (   5.94  )
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

On 5/7/25 01:00, Rob Herring (Arm) wrote:
> Convert the NXP LPC3220 HS UART binding to DT schema. It is a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

