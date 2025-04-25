Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851D4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 19:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L41qun/d37XTtsEg+ZVhoV/JMZlwEjni6Qps1eVyTnw=; b=1pp5bdb1yGsLqfvFUPwM7jePUd
	W/vzcDP3q8DOX/RPcsTNkcsB50+Q1RAOTdRcexzjjLqd+UgTNuAR3QlhQ3nEtQwt08eiqGpJXw+xQ
	G68LEVmWBTOepI72XrljBUfEnOLiAchJ0bsUbvIMF7DzZ2YxFw37J5KfwEMwISEZqz4I1xm8obB7u
	xfSYKR38qAKSqDRevYBYw9A5IoKeckQOmuDLfUrnMQoVnRVrZA/06Vh3pqm/8yJx7A/FL0kJLQdaP
	HnJUkjYtLThJAw67ewyYsrAy2XWa+/lZOb8zlfaVs++rXAClZGjGzyZ73ss7ddhobWear9HDOXMMs
	noK8EiEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P69-00000000j3h-0PUx;
	Fri, 25 Apr 2025 19:52:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OqD-00000000fep-0Em2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:36:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 091755C6B41;
	Fri, 25 Apr 2025 19:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C59AC4CEE4;
	Fri, 25 Apr 2025 19:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745609763;
	bh=GMKQHRQsZMaW/x2X5GFzFoiYvbdCI9YX8hUQDYTxlO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GtlD/6Ju5P6YQPrb+MTpihTNuhnbgXni2oofRGIHrFloLKLC/8/OVz5hY6giij2/W
	 E8BWpwFHg+ZvzhO+lOqgCXBOqfx/3iqo6dE78CeZTzcpm7jybv7XFSRkYnUa6lPS2G
	 7Y3Q2Y2SFF1uUURsiDK5DV5dTAyW/3xr9G8uJd0tyYAjGaDP1qCkao5lLi8ZVWKJxV
	 8nKneNzLxvyszz0GSZtbPwNnlaSUbI1VfJDsnnMopaah7jchedKDwpjBmzh+R6KWU3
	 sFzz59K6/cAkRN0a7vjonwaUtACF3B3Impe0wAlIVrbvVs8+cmPWv63vAm8RGYpnN7
	 Tme7TAv3wBeHA==
Date: Fri, 25 Apr 2025 14:36:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mfd: ti,j721e-system-controller: Add
 compatible string for AM654
Message-ID: <174560975726.2869977.1530781618642734702.robh@kernel.org>
References: <20250421214620.3770172-1-afd@ti.com>
 <20250421214620.3770172-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421214620.3770172-2-afd@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_123605_132916_B69E39C4 
X-CRM114-Status: GOOD (  11.60  )
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


On Mon, 21 Apr 2025 16:46:18 -0500, Andrew Davis wrote:
> Add the child nodes that can be found under this node. Then as done for
> other similar devices (J7200 and J721s2) add support for the AM654 system
> controller to this binding.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


