Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844B4FF5134
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 19:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdZJqWRBQH9TckWYyXTdJ7uXBiUi7I9srmuc4o/FF1c=; b=K3PJ59p+OlEGsBUEpX3evrSyTm
	s62/KT1JBGRCqdGxX3th+DA5w0ZJW+HKvip0J0iMs2mQLD/IJdtax2O4DFeNMuofAIF0hFZjadW5O
	mfuI2y8ovj671xDNRXQGjt+Rr0ySeHV5fMYcKUlwVRKlR2r6tTScR9End8bZ/xN8b/TPABeTdN6oY
	08eMJbvmeYaiANvCY34fapjwZSyOAxFQcsrfZFS30nAMhyADl2C5mbC6xHrZa5DHu+E3CCGcaXpYv
	pQR9yHNxc7R2m3/4WOfycfz3YOj6Vs+HqoYbn8jFkzwusqNua0QCpceKrI3mFyUbwpiIQc+g4tcVu
	OtVBtAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wABnG-00000007ABW-3xWE;
	Tue, 07 Apr 2026 19:08:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wABnE-00000007ABD-11D6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 19:08:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A6E84174F;
	Tue,  7 Apr 2026 19:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8F9C116C6;
	Tue,  7 Apr 2026 19:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775588935;
	bh=u4p4j14nBfKMVlnfafMssBd+Km2VMF7NLSQuYZdeM1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ni+GZeLIGk0p5/vkZR18uK3/Gq1Za2r8WLI/5h9kbN/oRCRBHEg9TEWLSWpEBG/U1
	 DUVVw87E68DXVwCVX4YNkIWfG5ENXBFkJqNvT6XKsESPRxzKdnB0dHU/1qqXyfeQin
	 VC28ZqbOHWlDBJwjjyr3c8pi0+beg0ZUuuyOqnbFyZLr7GRctmZ0ph8of+lW1ZxvUY
	 kTE1wm4ILxyDs0Cvg6Q0S0xZFBDaS0ve6GOHDWAvdtb7O6e995NmwhuXqvkSA2Ohfq
	 6mKOpIKEoRKLC1ozyH/wKKES1UjEtLmp8NxDfdhV02ikhR1SucMrtCfB1NzM5EKNr3
	 Q3kswq2zGEMTQ==
Date: Tue, 7 Apr 2026 14:08:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200
 OHCI binding support
Message-ID: <177558893274.3412548.17799728970061303874.robh@kernel.org>
References: <20260327-atmel-usb-v4-0-eb8b6e49b29d@gmail.com>
 <20260327-atmel-usb-v4-2-eb8b6e49b29d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-atmel-usb-v4-2-eb8b6e49b29d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_120856_307432_EAC92FC1 
X-CRM114-Status: UNSURE (   9.11  )
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


On Fri, 27 Mar 2026 16:47:43 +0000, Charan Pedumuru wrote:
> Convert the Atmel AT91RM9200 OHCI USB host controller binding to DT schema
> by defining it in the existing generic OHCI schema.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/usb/atmel-usb.txt          | 27 --------------
>  .../devicetree/bindings/usb/generic-ohci.yaml      | 41 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 27 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


