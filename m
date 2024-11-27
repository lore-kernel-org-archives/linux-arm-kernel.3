Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F8CD6ACE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zH/XDw3POuQ3VN7AAzF+rBak8d2TsnQBRWkmI79RNiE=; b=Zkns9/61X9FCNZTm0A3gnvZXn4
	bi2rAeYLChCysym7EcCznDDQyTcXXcUFhsWQkfdVm6xkAcLE9YygdZt6DD6k7UK0kTkNtoDnNRfZw
	/0uEi8xlTuWmmwoZyZ53yjc1nZJeQV8c48WKmitJQAMjUvKQaokSAUcq9Eo1Uy312hObPjPW2bl/k
	oXgzaXQG9w4q1xKWK0xf3b1sf4dHfhkQ44EmmB6oLlGcsyLTA1TPI1ltr8Ibmttbqpbq5fRtxFt8C
	fDoN90CuW9gT3zrBP5XR/U0RgKAbgoGB+0K9VfAwKW4TaovzsWl7S1R4IexsXLoFhR/LKfHwogTJr
	Z+He2DpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJXP-0000000DR6t-2PLd;
	Wed, 27 Nov 2024 15:01:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJVl-0000000DQrX-1u9Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 14:59:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A087A5C5BC3;
	Wed, 27 Nov 2024 14:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753AEC4CECC;
	Wed, 27 Nov 2024 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732719564;
	bh=SVhXyj/ZbRJBm3pGNYNcl/3ggq+hcnNG3Esckkf/+Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TGTTDtjwHXPmzkERIfnnt1B08xP9zER2IuaQCb6KIZPwaS6Gja8vheY34Uo/TfQF0
	 Uvrmiz1eloyHIZind1vhluijfaF7fPXrqKw6Jj17pD/ONXPyxYyZu85V+gsevxU2Gm
	 T8Hnl4x6Yd6Od8VwiJbyY5sObEOqEeBkpXseFFSkYX0UhWw5hadQ2J8SuD2Zo0WLDD
	 tNtEoCHAIwNO8nAx9k1yoiUz/RyJvYXG8d2a1u/MhHdibUF+rYHVsOuZ7ZP5nTe/Yc
	 8x/H4AmzuryL/HTW9M+bc4VTgALSWNEubNbu4PNmdMWIAMHAyYoOHPfYGtqXAusS6J
	 0M6eMhpeTELfg==
Date: Wed, 27 Nov 2024 08:59:22 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	manivannan.sadhasivam@linaro.org, quic_schintav@quicinc.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
	cassel@kernel.org, linux-pci@vger.kernel.org,
	alexandre.torgue@foss.st.com, devicetree@vger.kernel.org,
	lpieralisi@kernel.org, bhelgaas@google.com, kw@linux.com,
	fabrice.gasnier@foss.st.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] dt-bindings: PCI: Add STM32MP25 PCIe endpoint
 bindings
Message-ID: <173271956195.3489911.2255772456897177524.robh@kernel.org>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-4-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-4-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_065925_530912_E096EAAF 
X-CRM114-Status: UNSURE (   9.09  )
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


On Tue, 26 Nov 2024 16:51:17 +0100, Christian Bruel wrote:
> STM32MP25 PCIe Controller is based on the DesignWare core configured as
> end point mode from the SYSCFG register.
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-ep.yaml        | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


