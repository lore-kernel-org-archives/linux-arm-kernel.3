Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C40D12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7DsfaV2BTa9QdYGtV5oD5RPjq68h1uvXoIpOHc9Wbw=; b=q0vre+owHQbmd+B+0OFGtBOizl
	yY7h1UydMbIBmKPQHWj53d4cLzExSkLwbCWx8xuS6j9+MzzZRpD1o6XuE3J7qozGWpge8P+m/nsTU
	wvMmzODX9Oy5fscAs2YfUGTTIrQNbTispd+kgsJH95rg7pjLhBjRPP2MVLUN8995tdQA1nAuuU7WP
	WoELAMvB01kvh7QPAS6CMwAJ8immFbPztSuIPIjFbv6z1tD1P6kDRaLtcULe7tgTEmslCa2DDMEfE
	rZCMlDmagiINkXMsHwNd7E4ZdSBUdtOQOkRFWF2qpPCF1DtnmTL78HGQ69sYfOeRetDz/WKkjTfCF
	KKP33UPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FY9-0000000GRfk-49qX;
	Tue, 05 Nov 2024 09:08:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FVk-0000000GROP-1hqa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:06:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2427C5C4FF8;
	Tue,  5 Nov 2024 09:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB98DC4CECF;
	Tue,  5 Nov 2024 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730797563;
	bh=GDrGkgkKkKFWd8y1ePnPXiZoFyFPWQH0eSaV5iah2f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WS1+4hz+FBnCbbuYhdym0r6AnbSbR5LyHs2U4gSrPNv0+8RQSt9pELil70n4xz5hO
	 LlrMg6tgQEMfhR7lILbEbFTrY2aM89H7Hs52yerC/Y4MQ/tiu8YPPsOiuZD9fDg3yn
	 09K727+MPRaRpQMPVWR9FS5p11VjV09BeUeIBcTWQ3HHHEcDIvcWYHpZHr5vQOwdDj
	 G9OjUKg6YSsr+JbrnzbevAHIGEdY4+SydZ/Q+WKKW43tAdvPswyJbDOV/Uw0sFSjzD
	 IGHBuV2GzUPFoT6KNcN0pEbuIeH4dJn6ERG5sOv/rSnFhLWSbB+hnp/5KMjjxqBEOD
	 MZ3TsbL+rZvkg==
Date: Tue, 5 Nov 2024 10:06:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 12/15] dt-bindings: media: add the stm32mp25
 compatible of DCMIPP
Message-ID: <5ummiahsnvp2hx434eqxzic4qtfbys2zkf7ezg6uhwxt7p5a4l@6je6xafal2mh>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
 <20241105-csi_dcmipp_mp25-v2-12-b9fc8a7273c2@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-12-b9fc8a7273c2@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_010604_510701_A5BAD8B0 
X-CRM114-Status: GOOD (  12.05  )
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

On Tue, Nov 05, 2024 at 08:49:15AM +0100, Alain Volmat wrote:
> Add the stm32mp25 compatible for the DCMIPP.
> The stm32mp25 distinguish with the stm32mp13 by the fact that:
>  - supports also csi inputs in addition to parallel inputs
>  - requires an addition csi clock to be present
> 
> Add also access-controllers, an optional property that
> allows a peripheral to refer to one or more domain access controller(s).
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2:
>   - move allOf after required
>   - reword commit message

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


