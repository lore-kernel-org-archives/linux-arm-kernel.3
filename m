Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0B7C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 19:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4NSJ3muM9pW+APDoR/7C/7ePJDKryD+BOMDYLBwb4g=; b=Q5YjSwsdY+ZM4ql0bpp5ehT1Ju
	eC0dD9H/yd+glL+XQyEaB+ly53VTtqSljI7eMLujcBock09iCtgNsgp5tydA5Qz2pIJXnJ1aqDDVq
	hXd4sjMnO0nBsO7H+4OSyoYN7/LssOsmVgChDNBjJk6fkqsEfoy3Sdj8FzER1zfKuwdiIV8l1xy2u
	LQ8g6mEr3HWS15gsCLyB/Wa55QA4aG5Jynb5ErKGe4I693WqRGw2Pt5y9R5Bna4bIpQdUxuROEz2U
	4HdZGhn6DmzbtBNVY8wE2xYbdh0YQA12My3gDWZvtQ5Eu9qCevyFRsEmfV9ns2CFTUcaoB9U9Pc61
	uo0mUGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vkg-0000000A3ng-3gIL;
	Wed, 16 Sep 2026 19:57:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vkf-0000000A3nM-2saP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 19:57:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8A25600CB;
	Wed, 16 Sep 2026 19:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A31D1F000FF;
	Wed, 16 Sep 2026 19:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789588624;
	bh=y4NSJ3muM9pW+APDoR/7C/7ePJDKryD+BOMDYLBwb4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fa61XX/f3c2DcH30+gynVEqUEVSnwf3P6jqIIoMSvx+Uy1h1IImPwq0sl/B6OLnZf
	 evrY8T+lEwpPu75+9Ec4gTQNr2Jt3phEJ4MuEBO2qSUG/e3d9elcwmjNDu0A1ecrCh
	 Eq+PSbS0NrCqmbzhsYQGtxblrksT+EAPuanDfgNl2G0/1rGxYcvmIv9Fnu6IhmrFTn
	 dZI997GNCz0t3oJdP8CPTK5oClFYCBMWokw4PsiY16f6mhQMJvq2pURLZzA4DhNcGq
	 79kgudedDVY5i6Ja2mc5XJZ/eX6kC3A1zQWgKzJbbbSiOtOVqazlNOEktKxcl03cgZ
	 qeOvkV/9npfIw==
Date: Wed, 16 Sep 2026 14:57:03 -0500
From: Rob Herring <robh@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Fix CoreSight CTI Kconfig symbol
Message-ID: <20260916195703.GA1353861-robh@kernel.org>
References: <20260822081912.88774-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822081912.88774-1-kmehltretter@gmail.com>
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

On Sat, Aug 22, 2026 at 10:19:12AM +0200, Karl Mehltretter wrote:
> The option exposing CoreSight CTI integration registers is
> CONFIG_CORESIGHT_CTI_INTEGRATION_REGS, not
> CONFIG_CORESIGHT_CTI_INTEGRATION_TEST.

DT bindings should not be referring to kernel kconfig symbols (or 
anything else in the kernel) in the first place.

Rob

