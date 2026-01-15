Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEA7D4660D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 19:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZfVIgbU+zwipEaxhvW1yg/fdl+UqBXrb6cwXyjrg7E=; b=0lCqLqCNblvMl5lHpXiUNuaukD
	B1sZFAw2jmF3EG+OvDEGU17YUdb2sonQfPbZZZr1UO2P3Zv7Dobwt8BMZzff+wZTBmtKhtqSCB5xl
	MBJQYs8LGTohokS0oatkbkFr7gA6EPIvzTqdNMu3LuKwioJF6qaemuVu313R8SL9E+rIjkUlgwvZC
	t/VwfQtmZL+F2cTu+8Ucv0nst8M2Vjhr2trVRLEi50ZYG4YGFPZg6V2+WKoAk72zAWr7XDB5W97zr
	FjH4Yn1kQqDGAQE5yWOJmtEwKWvD6icodqIEa9Trad7szDh/fBG7kFohwlvSQqiHeQOclf75Q+62G
	tuKYylSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSap-0000000D0pz-20nQ;
	Thu, 15 Jan 2026 19:01:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSao-0000000D0pj-2Qfk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 19:01:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A5EA60130;
	Thu, 15 Jan 2026 19:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD8AC116D0;
	Thu, 15 Jan 2026 19:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768503673;
	bh=kbDE4I87P0BVWxV+dNPffz+z+PAooAzag8YpvFHu/SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzQdeiORsmFVr3W2xywsEeCDLaLp7l83NC37XK+pawV9POmYfLWH7j3bTeU0/Foav
	 vh3KegliIHHQqPQC4/HVSBz9oh44YoXok+Zq8VSDfurZS/7WO/zx/S/I1GSiUUctIO
	 6flNjhHYBt2Fb1Z5VBbO3NHHw7hWix2ub+kbz85TC1pU9NwMAMj3c0bB9hzwGVMtLD
	 Ql2MWpIaeLI0OfoVyaGtefaA1v6Z7yBh2QUZKJiDVJ5aJuHVV5ySbhy5v6F/3ren1G
	 tXmVmDAkFmN1ucJGeMP611PUCSSQbtOiFLkca+AlQmh1q4SqNzELMGaW799fr/2ik+
	 NgIMAR8w1heHA==
Date: Thu, 15 Jan 2026 13:01:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: jens.wiklander@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Leo Yan <leo.yan@linux.dev>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	coresight@lists.linaro.org, Conor Dooley <conor+dt@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v2 02/11] dt-bindings: pinctrl: document
 access-controllers property for stm32 HDP
Message-ID: <176850367158.1015177.14103390194697312038.robh@kernel.org>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
 <20260114-debug_bus-v2-2-5475c7841569@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-debug_bus-v2-2-5475c7841569@foss.st.com>
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


On Wed, 14 Jan 2026 11:29:16 +0100, Gatien Chevallier wrote:
> HDP being functional depends on the debug configuration on the platform
> that can be checked using the access-controllers property, document it.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


