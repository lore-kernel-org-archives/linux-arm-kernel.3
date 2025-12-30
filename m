Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB72EE4992
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 18:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DeBlucYRjPJxi03a9sGqroKYiJkHVBJguQ67RJd2o8=; b=0xxwH4Fh1u5hZk3Eo3CJBwj54N
	jcMCJlhRCA/F8ZVHYMaTNU0MzDNXsHH5/kpjl+df9buiAnhg8K1nzTi6RgmuJddLwHXC/XiUSGvbb
	WoytnNX/gOBgGuqoj7BHcOYjyJioTxq/wLhFDAeNBsMzkTj0W64l5cbMR9pYruXgZ1mvZNZ+MCA7B
	SXEaHm38EQxK43CAt2fEYZ43GEdJo/23+J3vCKYx01gYTVh6ProoYzlzF1JdxPscIAHR6VbzUoqWy
	ZT/XdilThYgpSbzEEl6z3ryxgxg3SCgxL/Gvyxw+3zpbVi2kLGwpVT01em3IN7FxnwjpIkIca+6In
	ax794XSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae0k-000000059e6-0OHl;
	Tue, 30 Dec 2025 17:59:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae0h-000000059df-3CLs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 17:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1848544355;
	Tue, 30 Dec 2025 17:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E3FC4CEFB;
	Tue, 30 Dec 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767117595;
	bh=OltSCu/7tnyCIgZ6hhfpQMRXS2NygrfmMJuxneFazgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLuBSuecOGLtn1aUSL4LEP9raB7yKl4ykGmqlfpoaVUlcRr606WNEduR8ADaz5fI9
	 CaYsl/F5yUYPe7SbFXj575fwvk2/DrEGm1J8AhwNbNU1GIGwQWfOsR+u1G/gIthTk7
	 O5uFYkLh0UQSOAV6tKnljsLl3H9v+2HGjSDvSYI+X6QoqANAWhdX8MbrF8V2VQFDF2
	 d3YIlSRzq7Npcgv7L637pKEvPz9fE1ryF4XnJWvN1mepvUPXXQvSkgezRkX1ogrUXd
	 big56cIOW9iouM1/vzMZ6nqPV4YA/RgDNh0RzWJw8WSvbnR5eJgAz9IRCXemopBHFs
	 ff7cd7UtMPfMQ==
Date: Tue, 30 Dec 2025 11:59:53 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: nxp,lpc32xx-pwm: Specify clocks
 property as mandatory
Message-ID: <176711759312.868220.4508247636976387030.robh@kernel.org>
References: <20251228224907.1729627-1-vz@mleia.com>
 <20251228224907.1729627-2-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228224907.1729627-2-vz@mleia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_095955_821576_1B789A4B 
X-CRM114-Status: UNSURE (   8.94  )
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


On Mon, 29 Dec 2025 00:49:06 +0200, Vladimir Zapolskiy wrote:
> Both described in the binding PWM controllers depend on supply clocks,
> thus it's necessary to specify 'clocks' property in the correspondent
> device tree nodes.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
>  Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


