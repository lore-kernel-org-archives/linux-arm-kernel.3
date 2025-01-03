Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C86E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqCHo4dglbNRmr0c18Pd+sgctlfIIyEMIkjc2OSHyY4=; b=hOa+5BO77TW0D8s6nta/egviZC
	S6X6z+rv2IP+wjEtOh8lsEpp5jQ/rTSIF3xveRbhTsqc1f6JJa2I5/BHNZ1fASzIExkbNASCztW0I
	TX6B1AKgcj0ci+QnVD1MW7ZSszqqxwCOzoKr01Wjq85QIbAckSJpwlab2RxhA+3VCehgT/X8e52r1
	RzEnDyVmRT9/vzqN5EYfWwMwQEquaV/5pXiro/9IYKACJXE9z2LlfzGjuOtgyQDu7VArFBOH0cAlk
	hCFdE9U2kK6/ft6+hiDOiuCQn0Z8DDWCakpVcwMPOuagZHzJK6rCKabYgnbtPZLYyQHQkqmAk3GbV
	JtjqsMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcPL-0000000COmj-2Zdc;
	Fri, 03 Jan 2025 07:47:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcO9-0000000COW6-0kpO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 07:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 416D7A40488;
	Fri,  3 Jan 2025 07:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336EBC4CECE;
	Fri,  3 Jan 2025 07:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735890392;
	bh=Sr2A/0SiN78NSfZrU+RvRd5qX0csLyf8fws67QBeq4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWodhkeEc01Ri1x7WY2Jq2fcUKhaK7UOvjtktmb/H3HGPmuMOESqhkgoxC0gK9V+t
	 2EfzGA8ERSqKFhufFAduFvWyTL73lgWUzluog4sqcG8LsFkYslWJi+aoqj9/bGc7pH
	 i7/6z+R7jiBokFhWzz2RQbxZbl4VqHGgRcBui9eWNjrRejPheqtiWrSek4AowQ7Ei0
	 zVTqqE1+wh9EzHo4HZ81Tt1MMdL1yPNjWOl193ioKMOOdcJsqqpE3YViGFWsLrTaMH
	 FW2/dJJ3QkS1Q++fBCAC4Q6AwOWQ5bbeAa3jDAM0UgZgAL+0pMIXJmuPzVsd+e+qK5
	 7FIjkHk8yjMLA==
Date: Fri, 3 Jan 2025 08:46:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: Add Morello compatibility
Message-ID: <wmvrwd2roy2ttbyyzdt2fbr4f7dg6pprrkdhuy6ygab3fl2kll@gnpf2v6zgd4d>
References: <20250102155416.13159-1-vincenzo.frascino@arm.com>
 <20250102155416.13159-2-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250102155416.13159-2-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_234633_281667_C92BCB22 
X-CRM114-Status: GOOD (  10.87  )
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

On Thu, Jan 02, 2025 at 03:54:13PM +0000, Vincenzo Frascino wrote:
> Add compatibility to Arm Morello System Development Platform.
> 
> Note: Morello is at the same time the name of an Architecture [1], an SoC
> [2] and a Board [2].
> To distinguish in between Architecture/SoC and Board we refer to the first
> as arm,morello and to the second as arm,morello-sdp.
> 
> [1] https://developer.arm.com/Architectures/Morello
> [2] https://www.morello-project.org/
> 
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


