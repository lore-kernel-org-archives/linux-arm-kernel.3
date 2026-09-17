Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D906EC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yumYLHUvW3/1TS23nhuUD9hW8oj7UmGI7exEUoW5L3Y=; b=eTGYuxNP9NDONX+JNEgDSTWTWp
	03TYtvLDio2TZDQQ7tIovr4sOAXljL+zypszurbVMwD+fX/lnkGm3aeb4kjur8uqQwvvC40LykBxm
	eV2x/X4JWc8ktSvCJ/gaZGBx6fy7hG6Z5zHK8Ges3eO6JX9maRSAHLWysHo2PdbjgG/a+ZvsWXLRm
	0UCuF8LnargggvqaB8791D2PgVkr1fBAWriJpqIo930aKBnSRLtNSnlk8jt/VENsHMVW7KbZUQJFI
	FQVidYd3gWcgnofFmzLBf/5U7BJK7VrFJ8ZgJzMIpHystc7/6GMGzJ3O+0Y4tF8KVQZphgIE7wOog
	wCSmQQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kg4-0000000Cfh3-0hMl;
	Thu, 17 Sep 2026 22:34:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Kg2-0000000Cfgi-462o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:33:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 270B2600AA;
	Thu, 17 Sep 2026 22:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D8C1F00893;
	Thu, 17 Sep 2026 22:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684437;
	bh=yumYLHUvW3/1TS23nhuUD9hW8oj7UmGI7exEUoW5L3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Itur1K5DcIonMQiFwCuSHBNC+G+XgkC1by6FAyKs3y5O1/YfSdAXaH9OEQN3hR5AV
	 rvBEyOiDZQYrAyqvbgJPSJWjXECGWbV/YJT5QX4ThTxAmqSbQSxG+j3ggXfuxCu3Pg
	 +e9FkKsonOK5nog+e/qOAxVUbhvfFXxF/2KgcY+oc3ugc0ZjJrcVKUywXno/WfGr/d
	 dM5WesB0jmc2W4QxyudRDtKmUZ+w1unw6lajm/d956LXWI3WssEghNuKZ049iVCWIJ
	 dyxFwqs8sE1zQR3gS3UR+mY4AYP8ahkRcrJ7OSgi4oncb34suUc5a9NHY2zS/bHSJq
	 hacZuzCMFWZAQ==
Date: Thu, 17 Sep 2026 17:33:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, devicetree@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>, linux-usb@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, asahi@lists.linux.dev,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 06/22] dt-bindings: thunderbolt: Add Apple
 USB4/Thunderbolt ACIO block
Message-ID: <178968443469.4111891.16643051848376045316.robh@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-6-1f80085f93fb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-6-1f80085f93fb@kernel.org>
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


On Sun, 06 Sep 2026 20:36:29 +0200, Sven Peter wrote:
> Each Type-C port with USB4/Thunderbolt support on Apple Silicon SoCs
> comes with block called ACIO ("Apple Converged I/O"). It contains a
> Cortex-M3 co-processor, the hardware blocks implementing the USB4 host
> router, the Native Host Interface (NHI) and a DART IOMMU. The
> co-processor exposes the NHI and its DART to the main SoC bus while it
> is running.
> 
> ACIO can only be powered on after the Type-C PHY has been switched to
> USB4/Thunderbolt mode. The Type-C PD controller publishes the negotiated
> mode and cable information through the Type-C class. ACIO finds the
> corresponding Type-C port through the OF graph connection.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  .../thunderbolt/apple,t8103-usb4-acio.yaml         | 213 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 214 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


