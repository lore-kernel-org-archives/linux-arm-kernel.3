Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0765CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 11:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJCH52YP9rP8RG0j3oZeKH0UGauR2RT4AzqFBNpn10o=; b=1M6InriHGlO0dHusWqWXsMJPxP
	S6zT/M0Dia79JDb8bcjUF82ayowY7iWUwt9oL8a63lWLvNDIrO8M70rrpYvIUF17hDJ/wg/2fDf+s
	mP6/FARDTSS5lrb7tsVzD4XjT0pQXguNtCl0I+A9tQ1RW4Qs+bj4UvOOzgWG9e9eo++SlttLAtQsw
	j9KZ1vi8du5qH8jBlMYC/cFNvWcMNKchvIwhtaOOW6ES6Pv6PlMJrspJB5OltHCasosM2pfVsRhSU
	mQzJuxX3YLP9tVfPWb6Fso4T0OMXMIhq1Cu4/rVbq4oFbiktxXFxW6yBxwN+WroNohEtYi8s1oJEN
	RFjNEVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTI2U-00000008grB-2d1n;
	Sat, 30 May 2026 11:39:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTI2R-00000008gqs-24QS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 11:39:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E299600AB;
	Sat, 30 May 2026 11:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B263B1F00893;
	Sat, 30 May 2026 11:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780141174;
	bh=OJCH52YP9rP8RG0j3oZeKH0UGauR2RT4AzqFBNpn10o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KHqC6UlAMU+pNd2HcPpAKDkmbEOolghV3O/WPbhgq/seoqoAxWFYDG+U5HmOo/zQ1
	 GSMUeHwXXKhggzcy1tUoeE5lQB45+TF5IvxmKGxOxiBdnOupvBhRU6Qke0BONGodeK
	 CzfLVUx3JeAxKWdQqZonRd6TEvWcBDdu7fBC/QW6NUdu06mDTI5ieefiEpGWNMfipb
	 nKMabN/mo6qNNI5J4rvLunOiq8vLx5ktQvR+2YqrMFwsR+nv/FyeULPZ5BwAJHsgIi
	 ewBbcdk1TYsE1GMM7psna8NNNvmvyjJwX4tJX1t4bihpLBhrA2IyPKMfXP4gWIgzmM
	 rNAnUemuXITrg==
Date: Sat, 30 May 2026 13:39:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abraham I <kishon@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
	Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: soc: ti: ti,j721e-system-controller:
 Add more compatibles
Message-ID: <20260530-rare-spicy-catfish-657b1f@quoll>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
 <20260528-ti-main-conf-v1-5-a54ac5c8d081@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528-ti-main-conf-v1-5-a54ac5c8d081@ideasonboard.com>
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

On Thu, May 28, 2026 at 03:53:46PM +0300, Tomi Valkeinen wrote:
> Add the following to the list of accepted compatibles so that we can use
> the same binding on these SoCs too:
> 
> ti,am62-system-controller
> ti,am62a-system-controller
> ti,am62p-system-controller
> ti,j784s4-system-controller

You just copied diff - that's pointless. We can read the diff. Explain
why - what are these? Why there is 62 and 62a? Are these different SoCs?

Your commit must say WHY you are doing this, not what you are doing.

Best regards,
Krzysztof


