Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5319C28B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJWl1W+zekGlmFazACSn6JbELAQsVTqANNBzfaqB0+c=; b=X4vxZmOaiQNTbQljZlqG8IDCaO
	CXENz5XUs4yJlFgF20nvaLuqAA+ONkLj1b9IoxUeb10IuQ+furyvPsf/A5JH7ppzfWj6qF4VaBf4i
	9lRUzX+FjkzdXuNRX580Ip/exqtxf4KWaXTru05cTh/WtWb3+0vcdzx3lQlvSjncPy6kNeg1QBssw
	wbw5LOV/smz754nIw84STAfNIGVlS0ah/F5xTkAhQcKUY3fTKn11zHLI1Ktyc3ubVTql2btGQV4Wb
	X6zP0gDxW/awzvoYUnbqhdZlwzb0pE3+oDFQ+88Q9mRrfmSWsNoDOmb+l1jMGaKhH1+8zZPXaneqD
	1wz3Y2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDhX-0000000BPih-2qdR;
	Thu, 06 Mar 2025 16:03:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCci-0000000BFsT-3dE3;
	Thu, 06 Mar 2025 14:54:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B15B1007;
	Thu,  6 Mar 2025 06:55:08 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C57E93F66E;
	Thu,  6 Mar 2025 06:54:53 -0800 (PST)
Date: Thu, 6 Mar 2025 14:54:50 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Yao Zi <ziyao@disroot.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Message-ID: <Z8m3OkHAedbQyKbu@bogus>
References: <20250306131016.281290-1-amadeus@jmu.edu.cn>
 <20250306131016.281290-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306131016.281290-2-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_065456_945058_5FDD6356 
X-CRM114-Status: UNSURE (   7.41  )
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

On Thu, Mar 06, 2025 at 09:10:16PM +0800, Chukun Pan wrote:
> Same as RK3568, RK3528 uses SCMI clk instead of ARMCLK.
> Add SCMI clk for CPU, GPU and RNG will also use it.
> 

It is highly recommended not to use clock protocol for CPUs and GPUs
especially if the plan is to drive regulators separately. Please use
the performance protocol instead which can abstract the clock and the
regulator details for the OS.

-- 
Regards,
Sudeep

