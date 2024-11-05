Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC19BD1266B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9O95ubP6Me8oTOSXo8EbkRnUD+yD7mWX15pGQ9Vkpc=; b=V/mmSExTPImPrGCEZYYs2OI5QR
	Bevd8XOZ5Vah5tIuKAiOwSGj5JtQXW5cPn/YIcS9t1BbKSIZg3UdMaZeRM6gFn8L9gkjUzsmYNRGL
	j6AMablDx8DBJXqPEYqTDYfFEFBr1kQ1XsXkO7GIoFhNH7KmlcI3+9rN7Vwb7nPNaLHsn8RDP+8/T
	qBe54XrmY0Ep7JPSIEp5EEoYKdlSWz7tqLkB/QL4bPFpoPiv4va9djOr4Y0Xevascdm3gLkvUU3mW
	TnyX2HdkbFtxZ09i6mwC2sKTlX2vh4+SpcnWnteWueYamwK7X5BYnZwn8clPSN8vLy8cugJwHoiGs
	+/MljlBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FWU-0000000GRTd-0swC;
	Tue, 05 Nov 2024 09:06:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FUm-0000000GREG-1SG1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:05:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A852A42A08;
	Tue,  5 Nov 2024 09:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E660C4CECF;
	Tue,  5 Nov 2024 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730797503;
	bh=UnwmGlzFhaYNeqG3ngovYpYoNCY9R17OMQumYyjWslw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAAUVxUOMfTvV6MaF23c1TmprwEH5rQs2leIXYBwpH4/W5u8GI5xtMUDYhEwUwyWr
	 f4r6lNMsKUlfphfeH9nFw1QdrdGpoBRLqM97pGmLI1Y3H9sr3XZJo5QJieKJzEaKcC
	 m2AyRAZWXNgmn6aI3UpNE8gYEtzxh3K8/P+RgBJ/luHNxVpEEOOx2dytYY96LXndzV
	 +SJX6Ev65VdWWtst5NMZHg/xrnLG+Ns2ajpQBCUZpN03GVFyZkt1KjXdSkMK0QdiJs
	 AfJtEtDq+PsRQGYg/qdbBNJPqbMIAUMCeJC/HAHukGCP9Cnvrh+UobBmXQtGvFYZK3
	 jTtAT8EnlxFUg==
Date: Tue, 5 Nov 2024 10:04:59 +0100
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
Subject: Re: [PATCH v2 02/15] dt-bindings: media: add description of stm32 csi
Message-ID: <pp3t7we3niohooaiubs5l2grsobzgrcrc5gmt5ea7fmj6sbmpc@nvnviojusrxk>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
 <20241105-csi_dcmipp_mp25-v2-2-b9fc8a7273c2@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-2-b9fc8a7273c2@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_010504_469450_13D62AC8 
X-CRM114-Status: GOOD (  11.75  )
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

On Tue, Nov 05, 2024 at 08:49:05AM +0100, Alain Volmat wrote:
> Add the stm32 csi controller description.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2:
>   - rename into st,stm32mp25-csi.yaml to match compatible
>   - correct port / data-lanes (remove useless lines &
>     use data-lanes 1 and 2 instead of 0 and 1)
>   - correct commit log
> ---
>  .../bindings/media/st,stm32mp25-csi.yaml           | 125 +++++++++++++++++++++
>  1 file changed, 125 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


