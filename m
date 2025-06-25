Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA754C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvYZ5yNZvL+dld/xcOdpSH6zqjUuOW5xfvr/IIg2U2A=; b=2buCxbyAurw2GGq+Ge4tUMwHRN
	nsxXkrzx1TlFBEPXTyKaXP3NQKx7YOB3UM2kaBHmBfj4Q7KFAXuQ/MTIjx/tdAMGDP1MY/svnbs1v
	vHISpTcojOhJ7JAjY4jbtqkIcwQuYfZhMqeSH30TDTbUBrFyZrx54OgqumjV0s7eV58wOuUlQUSu+
	UXwxlrJw8oSMinOdq+lR0mDegq5KoUYGqNU25coBj3rXNLj/JXf3O5t1EJn4Lc/mGWX6KTAaYoC/3
	wcz0B9i0yLjp8E/U7a3pmkZYCIBaD7kHWN0x58OELnogidVPOclOET2HAd6NOWYkv/Rjem6eMOVvX
	SrBm0iuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYPs-0000000A35J-326S;
	Wed, 25 Jun 2025 22:16:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUW4B-00000009mAW-4BBa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:45:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F56760010;
	Wed, 25 Jun 2025 19:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BD2C4CEEA;
	Wed, 25 Jun 2025 19:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750880755;
	bh=iE1k+ki4BDdbDrZW8QEoC64t7Lu6xKcC681QpLa1rY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQOavjnZxWmUZHTbOz8yFFpo5sGNpNLSBrl8C5crhVXZoNQt6olfvEFxEQ3X/y/p8
	 Q15QiBuOhtyDvrsiESvOlS9cRAJNjZeCIqXGyJD0zNklCwGgtTjAioQz2ZKXbJYF/Y
	 teYaXwipFxZ8OQnlva3SBr/PDeIfXfCJ7gtwnREmrcG+KfnpFA00ssyNJUKz9qL3tD
	 IpROvUS7c6+/m+K5hTdHOCPFGUGDMKDBpZt35gr0WiMpDvi2pkcE3uFHQhRsi0sYqB
	 MB1dLL2tfic1KBSJ5fOAxFj12j6gT3Ixm8mc3bya2CwBWjxUdUmiotxTVitZy6DKz+
	 PpUpTWSWu4dVA==
Date: Wed, 25 Jun 2025 14:45:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: memory-controller: Define fallback
 compatible
Message-ID: <175088075350.2101342.9839294436407973749.robh@kernel.org>
References: <20250609212356.2264244-1-florian.fainelli@broadcom.com>
 <20250609212356.2264244-2-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609212356.2264244-2-florian.fainelli@broadcom.com>
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


On Mon, 09 Jun 2025 14:23:55 -0700, Florian Fainelli wrote:
> All of the DDR controllers beyond revision b.2.1 have had a consistent
> layout, therefore define a "brcm,brcmstb-memc-ddr-rev-b.2.1" fallback
> compatible string to match them all rather than having to continuously
> add to the list.
> 
> Link: https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  .../brcm,brcmstb-memc-ddr.yaml                | 54 ++++++++++++-------
>  1 file changed, 34 insertions(+), 20 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


