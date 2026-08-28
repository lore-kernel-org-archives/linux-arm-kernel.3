Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BD7C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vqB5kVCtlgGODPknu1efKSqxOo5/8MQttYHRS2tvFY=; b=HxwHrMqEdwOaiAo81Kis6OXDUb
	4ZT6jtpb9zlgm3KVvu3j9hQxJ4KtBdJXJeqKO04ERd8sLY6jvHOdtnPZ4EbPX99euilTwSufOvdBB
	yaOYN8WxNp6O38IiNE9PFFDhVe6jeJ0h41qpZIE/jlVywk2SQlALKyPLe9szKkhrTm4QwbOBmcrfj
	lhsK509MZOlQCyoOCCv2Bk94+2u9uDgwqvvm6pL699n6QNvpqEVj/ZzgAVk6OxINeEwkxwmd4QLro
	3YgtQ8l42TXkAT2T/j5aPLsjaaQTyr7ZgYtGNSat9GuKD2YiCWAKTiuDZwJ7LipKZWfWiY/3Uh7vT
	ShQk6Qhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsej-00000005Pk7-3Zj9;
	Fri, 28 Aug 2026 09:13:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsei-00000005Pjr-3Slr;
	Fri, 28 Aug 2026 09:13:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D063B601F7;
	Fri, 28 Aug 2026 09:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC3A1F00A3D;
	Fri, 28 Aug 2026 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787908427;
	bh=7vqB5kVCtlgGODPknu1efKSqxOo5/8MQttYHRS2tvFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BSbNOk/MIr0IH/xOkK7Ij3mfjoZ4sX5NoqRZW6BxD9va/h+OWqGlsaHFGxWXaavdx
	 nUPCl3mZ6/8YJphIM94WEjlrMrI/jysRtQxojDB66jkOl1QNf7l/zmg7RMm5qBTktl
	 LhJXUcDCm1U3I5m0sprYPg65cCJ2I99JUiA73oEpH/bUvWHrwk+H+YJ6v+nt/b7/nE
	 MdRo8hcD/WsmnS1Frrj1GzTmpsxJhu1nmZch+F785y2zE8TNIwezHuUNOp3Pxo8pDg
	 UwnhzkwVazIHURtAa3RDQf9okldqQmCh7DNYEQPMj6IGSE5TaSjt+100EMC97wTbzl
	 QOiNHEbbFDrRQ==
Date: Fri, 28 Aug 2026 11:13:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Christian Bruel <christian.bruel@foss.st.com>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, 
	Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 3/9] dt-bindings: usb: generic-ehci: Document
 access-controllers property
Message-ID: <20260828-puzzling-shapeless-gaur-f0d737@quoll>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-4-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822074816.548662-4-marex@nabladev.com>
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

On Sat, Aug 22, 2026 at 09:46:36AM +0200, Marek Vasut wrote:
> Document the access-controllers for EHCI USB controllers in case
> access checks need to be performed to use them.

Please mention in the commit msg which compatible/device from this
schema actually uses such access controllers. I see your work is for
STM, but there is no STM compatible in generic-ehci/ohci.

Also, please send USB patches separately from DTS and other subsystems,
because Greg takes entire set.

Best regards,
Krzysztof


