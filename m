Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6603CCA100C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaKfpyOhV48+eruFeF+3slWhCgAaGl3pjb/el24qkAU=; b=EVwKMZoLz3hX8KyLHwUg5nNyEB
	/VGFH68rFf3pVcln0hCdS5sog2pPTtoWVF5InVRNzFChSFZtSrRFAcCAsU7PUYDjj267QYhdUrTIN
	bJjV7PdnldSKLBjVaAC8EFQG9W9m4wJd8SCM6AEqnrOskFTyQs8VBfco4LASUn0v4pxhmZzuOA6bX
	1SQbg74b9S+UaBSaPL5/XV962+l36n2EgSnOKjzuMcYQTPN1Y1n3BUds551gVamuPg8yxOIAOSNnt
	UekbsrfQtRNrVE5Z3unTWb5yOojfxDWGir4GzcreyNcRLBfpX3XuMAgSJn9YoRBDsokMmc2Rr3wzH
	UZcJje4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnZ-0000000EIl6-0EQP;
	Mon, 01 Sep 2025 23:18:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB99-0000000DnZS-3ReM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 20:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FaKfpyOhV48+eruFeF+3slWhCgAaGl3pjb/el24qkAU=; b=ZcRoSvmIveD6QZ2kraetCA3wED
	+ccFtWCGAyuv1ZFpeCYjXDLjR8gbMS3JLv1ORVsPxfrZOUKnS+Wk/y/nQ1NJwlqk+SfWIoH7MLCRb
	rJCAcHN4zvGX9OVldiCrviTNsyH5uWWT09+2tBBzRGRG0sT424aJhkBhCBPPCgtHCm+3/O0I9+/BJ
	zzDJ35OrQnW45V/k/lRDVHVYnDFJFJZLa1zTwZAi792EcLECBuEr1/zGh6uQ4levZflT1d4kR3Dqh
	5X2GUOX972OmbGOQoHxDIfPBHtfLo3TrN5RR6UnOHPwR9ZC1i8ng9+lH99o4zkcA6VytBThCK5Jz2
	i7izuq5Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB96-00000003sGY-2N7C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:28:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23D6343817;
	Mon,  1 Sep 2025 20:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C1BC4CEF0;
	Mon,  1 Sep 2025 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758534;
	bh=7SiV0tTtklgBoJZ9EHxvqC7tkNgTkPNI3eeQVyIYD7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpaO8Y7r/l2VpKEAiBebCAMBitJO8bHZBiPh7MnlkhZjhDdpEo6qcWS2ih6fA9COa
	 T8BTXcARrPB64lBZyYp6tYd8q9wlS9KUMU2d6M+T5Km2wTnUUHKCgmsMQ5OYeaWJT0
	 ccM8t3mcujTClSNG+d9WA3SO5lPVLQpzhNvkDbVm4YZIARDg15XfXDeRQfbCoyXKDA
	 yIjHSs68+I1ys36G5ZKwGm2+0J8z6hRDDw8JWm1ECVXJfp5DYdv7KRgtCIL4uXMa0b
	 nct7Q6Twa7Rk4fAS4wS7q0nYKiUrU8q2c+ErKtkKShrfL+UNuC6RM5INg594m+B32t
	 faR+1xtMYTCKg==
Date: Mon, 1 Sep 2025 15:28:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-aspeed@lists.ozlabs.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: aspeed: Add AST2700 SCU
 compatibles
Message-ID: <175675853255.286945.13351927869745277477.robh@kernel.org>
References: <20250831021438.976893-1-ryan_chen@aspeedtech.com>
 <20250831021438.976893-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831021438.976893-3-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_212856_925778_274EBC70 
X-CRM114-Status: GOOD (  10.28  )
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


On Sun, 31 Aug 2025 10:14:36 +0800, Ryan Chen wrote:
> Add SCU interrupt controller compatible strings for the AST2700 SoC:
> scu-ic0 to 3. This extends the MFD binding to support AST2700-based
> platforms.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


