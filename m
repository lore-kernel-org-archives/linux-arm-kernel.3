Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F76C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epFJdz2raSwiSrlvTcfNvV8dwE762tYyJaZ3x7E71cs=; b=rH1U46nO98H8MgUN7AqKWKZkNW
	MbqUORF6nCk7uGgdSXyzrM2XBECwZy5SEfjY37+oUXfJ8p8d13jeK7gFIlOOsNiE4CRr2fCiURR0f
	0BUdTGEPr0sNqpkUossj5yzN/zg2ES/Xl+zcjQJyh/3R/9r4dOSImUI9kUIHEyAXjNa0QqNpljKt+
	JreI9QnGjoyXXyAzxk1KSPZF6u4sWqehb+WKni4/Xk/xZV+R/onKWUczlbSdfRnpUmXEVpN4i6NaA
	B+Dor1b4/RHkThYFdm0BMGqKrceI77HV6nK2T97UvJxs5ZM9YTJliGDp/Q/vH+8TVlM71vC+MmNp1
	XsuSNKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDNN-00000003Kzw-0yKn;
	Mon, 17 Mar 2025 16:31:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDKA-00000003KYG-0UKi;
	Mon, 17 Mar 2025 16:28:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1D525C4B35;
	Mon, 17 Mar 2025 16:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D65C4CEED;
	Mon, 17 Mar 2025 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742228901;
	bh=uiemPpna5rz6rmRSiNXvn84q3IoFNY3GCTXNLMa76G8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YmYOhRgTUCy9c4eosSMsk+iVvO8n+jefN6oc5T73q3zQN3kYlrgBrLz6wur7on4dR
	 9jfv/G4ijgIwpSU/Rmqf2t453W1oeTu0R4WQObxWLBHPg6mBForJ0xhX3wxAaZFYeT
	 1hlk9qEKF5yzD412xdFDSCMMdBpG8XOgFx542UCgFT/QZCyV42A7NnCH43OqkT7Q4L
	 DdELdpMR1bKISkhjK77zUG5pPoiUCm8TkfyT+oFpdexKxDE/pGOw7B12dLxFCMvXBd
	 fi1AhuQLuemue+7zEKolFK/MsHTbjqbaczwc+mUyJa3VSuNaSfKUk0LvZMvHopDmba
	 Wdl7oor7mGlEA==
Date: Mon, 17 Mar 2025 11:28:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/7] dt-bindings: arm: amlogic: add S7 support
Message-ID: <174222889947.175239.6799516902581952337.robh@kernel.org>
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
 <20250317-s6-s7-basic-v1-2-d653384e41f3@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-s6-s7-basic-v1-2-d653384e41f3@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_092822_196068_0F440A33 
X-CRM114-Status: UNSURE (   8.27  )
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


On Mon, 17 Mar 2025 15:16:53 +0800, Xianwei Zhao wrote:
> Document the new S7 SoC/board device tree bindings.
> 
> Amlogic S7 is an advanced application processor designed for
> hybrid OTT/IP Set Top Box and high-end media box applications.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


