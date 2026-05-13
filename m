Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E996CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJVMT8J1z1CDwbK46WvZ9JMT88h9lZdDKnbfata57vk=; b=1k+G4HJcmKGhS5upEY+RJXh1kw
	H1swaKfzZFDGLM0rx4+bla79R31gHd+fsjJp4im9EJ4B/ZRIc/EKwzUVxdN2IpPW5wxbTWQaxINd4
	quCVrFjn8z0SlTVnk7CoNqXBKFmiYBjad+UECgNrP1bsvtasXN6c2KnfanuYrb4yE4L0mkn7PMO4r
	8yRFVfYM+jKo3rV8S2becMDQ0SPTfwY6PNs9kZq7R+/tyS0Fw6tN1/sfqBELehTK9nLxqA1m/5x+N
	aG4U4J1SU9VRUrRMgkWYGLjvFn/242B68Byy/+0nCQIm+0hAPU7odh6Nq5bu0qSCqW7AP68jSKhDS
	JeukEj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDxE-00000003Qdn-1qO1;
	Wed, 13 May 2026 18:05:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDxC-00000003Qcv-3G2O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2919244503;
	Wed, 13 May 2026 18:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8589C19425;
	Wed, 13 May 2026 18:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695506;
	bh=RSUDBpyZ6Frx8kWi7gZ9z6X/1ezYQUz9Ikag1Hqh2dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kuBrwmKxwsPyQZleUGbiXx0JetulP4a9+Y3xldOmeLhsrq5U70SaDHU+AOK4xPM8I
	 6nJGo6L7of5+d7QMRLGjlOZUKPoS5KoDU+IHWH8ByTOcH7F6tZS53bynp3+vOPh6Fz
	 e78SwWB2BeG1se8rD2kgtnF0tuJbTC0hS50CbKfbf9LtNWwNVjAZwxjCBESDF7d4O4
	 bB6DQG81PjvCIQrY+kJKum3rUrVQAneGQ2f7ZwZYI6Ajumq7hL3lSto4dSLY1nFJVT
	 rIoLd3Pdtp9y1bXAS0uO7Ri9kAcBAvs03LLEoLLsNcpuC+r4KEpM5rQ289kmuUTvI4
	 AExsav7UOgWzw==
Date: Wed, 13 May 2026 13:05:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
	Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616
 compatible
Message-ID: <177869550281.1497011.1142937282232673663.robh@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-4-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505134812.408316-4-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_110506_836643_56DE599B 
X-CRM114-Status: GOOD (  10.46  )
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


On Tue, 05 May 2026 21:48:07 +0800, Chen-Yu Tsai wrote:
> The H616 contains a video engine similar to past SoCs.
> 
> Add a new compatible for it.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


