Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF46CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0n1HU/m4TSdH9CaEx9tsnYmwDr3u9MdOP9L6pDaSTyk=; b=MxFiMcW0scl1aewxVuMuuQ1tn3
	OsfQ+n0+eH1pRnRox4K3dwfVjolzM+l2BdrZhJZLLej74fraqmrVkNO/BuzrvM2382P93PGwjXDjX
	Hs5jsr6KOuTy4FYAEsjOtS9oa/X2gLqCDYce9tF77TubIb3sduS1Q06LvshuivfU+zW4flJWNHMLi
	rVrAcUyNhpyPfIfB5FOWx0gEZKuBwQmfmsHc8iYPuI8473YySUIHFOjCFNrkOMa/aEPZgG2yPiYJU
	+g6k3wXuUk0s/5V5/dzLW1mW8r0TPqkcivaxzmipPI14z8vEJRC9qRCQRSymEFH/y1Ifjh5tAFnHW
	wgq8BesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbSs-00000007hKi-15yK;
	Tue, 14 Jan 2025 07:35:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbRd-00000007h9a-0HAG;
	Tue, 14 Jan 2025 07:34:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9543D5C5606;
	Tue, 14 Jan 2025 07:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B318C4CEDD;
	Tue, 14 Jan 2025 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736840076;
	bh=YxrBUkBOC0+g4ghiLAUJPBhAPUwiWqR+8mCY9TKXTTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMcW0/5owhNZEv7H6DT1smEvLGinXH+sRSZKsOvw7cqf6WeJJrCYbZI/QlDJ6tgKM
	 AFXxbSMo9K/PXcrfuO9w9h2YV2tSl+zwYbPuU21FltWOhm+OoQ+t2ETkKX8r0OniMW
	 yxPjF42av37lI333//E4cpgDkecvAlmNnTLfsqHj5rKHfyJUabJ2Ept2YuL0ZExO6r
	 VoWDHxHMsXJwVv32cK/NzPUqqCuPRbE9aBg3IIN8m/M+xSc+LUe3SsD3s4LgSM+Hwg
	 wak944NxtCrRU8pehD+Qoa1D8z7EL0S7tSgeE86Sk2D1OTZTkAfe2ZLnSGStjVIEdW
	 +w3IiDdmFm2WQ==
Date: Tue, 14 Jan 2025 08:34:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/7] dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
Message-ID: <nrl67b3qrtib4v6bcgpdhomsihphkpkxtnmuwdrdfm26opbdwc@7urmkziycwqt>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-3-09afe1dc2524@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-3-09afe1dc2524@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_233437_147503_B2BD56DC 
X-CRM114-Status: UNSURE (   7.94  )
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

On Mon, Jan 13, 2025 at 01:52:09PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 uses the Synopsys DWC3 controller. Add this to the compatibles list
> to utilize the DWC3 QCOM and DWC3 core framework.

We see that from the diff. Say something which we do not see, e.g.
differences, why is it not compatible with older variant or why
interrupts are not fixed.

This comment applies to all the commits here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


