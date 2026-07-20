Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF424C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 21:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeYfbR20BofIIg0ulp8ZNieMPvQ2e/qEqcoScefQN90=; b=jfWLHk1iT52tmfkW4F9j/08r3w
	1kGD0P6V2/hWzLceIaqazoeijAzoqZq+nrBK6iCwx1wtvAsxGip6flJqBe3wn+sUpwxRbxqYZ70wk
	xQNiDOVY+pUfBcnLZa1WtSWrELYC00S8ITZR2Rh7KPR0Qhx9gcdIL6mr6MNoTox2fsj9Ud+qorv6o
	kbeEnwSgLWJShUvxLv27kOliHJo1MhRuqJv4a7xn7aT9oFEwiRXHwJt16wUE5t13Z0YArV6QhAnSB
	v4rV3nYhozi3mbmoQ8hdRrHKTfwaxidLk0yEx3KqdTZb1NN33PYCSv/1iUpt7aHid4Vp4ZcVBNKVP
	O1GTSvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvPP-00000007wer-32Ie;
	Mon, 20 Jul 2026 21:20:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvPN-00000007weV-3Dg9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 21:20:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CAB2419DD;
	Mon, 20 Jul 2026 21:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D387A1F000E9;
	Mon, 20 Jul 2026 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784582417;
	bh=OeYfbR20BofIIg0ulp8ZNieMPvQ2e/qEqcoScefQN90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UorGNQdSQ0t/43oZPr1RImpKsOocyXctB3ebryrjLU801tO/76+HRicJywL2jajc5
	 yEAoXiYDdZlgRFSbSfJZAxEyG7ZO24qLAlXG3/LzELC2hIMXqQJ4xzWl7JJ6YWI+T9
	 hXwwP7kDywuwaXwcBjhwjO0UZR/aHehFeZEvpA1HjZGvhh45Be5OTFpBXvKQrzRNoK
	 XFocgDa5HLUInKC7AO8vyjPE4TbrOAbtlIRbvGu/DgHZiSooqTbNmiBDEjdatSA62+
	 AMeN4dwaKMoc9pwlnMjw9qecM8ySr+3XctzSmWFxEMnBSbKDUhLp4jXGuhdjRMn6TX
	 XkWn2RwELbQwg==
Date: Mon, 20 Jul 2026 16:20:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laszlo Ersek <laszlo.ersek@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/devicetree/bindings: update Sudeep Holla's
 email address
Message-ID: <178458241339.4189208.4756351332431744832.robh@kernel.org>
References: <20260720160235.36592-1-laszlo.ersek@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720160235.36592-1-laszlo.ersek@arm.com>
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


On Mon, 20 Jul 2026 18:02:30 +0200, Laszlo Ersek wrote:
> MAINTAINERS disagrees with Documentation/devicetree/bindings on Sudeep's
> email address; fix the latter.
> 
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Cc: arm-scmi@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Fixes: 59e82a4237cf ("MAINTAINERS: Change Sudeep Holla's email address")
> Signed-off-by: Laszlo Ersek <laszlo.ersek@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,juno-fpga-apb-regs.yaml | 2 +-
>  Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml      | 2 +-
>  Documentation/devicetree/bindings/arm/arm,vexpress-scc.yaml       | 2 +-
>  Documentation/devicetree/bindings/dvfs/performance-domain.yaml    | 2 +-
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml          | 2 +-
>  Documentation/devicetree/bindings/firmware/arm,scpi.yaml          | 2 +-
>  Documentation/devicetree/bindings/mailbox/arm,mhuv3.yaml          | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 

Applied, thanks!


