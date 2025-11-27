Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7B4D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZPqyY1OMiCDA2RQ/5yIG9vqUuXPlyE6yls6+AMgh8E=; b=DXaAHHCONHeToWPNZ5dxQukvZM
	YtYEinP8/rDs521SrzVk6/AX/8bthc9tSkoDzgNKlxs4Uk9t8W7z9BXpdJUEVRsRfL5pJ0L11oA/e
	fjbExobNE6oZ1mTB1c8EZ10FTbvnz+YGTBVeeo8+dPzuHSLjLnn9D2M2lyroczX3eYVPxqvBDgrIF
	aS8B6v9N4OZFNN5aLoD1RUjkNAdnhpFhuR/5qEkizFJICv5ZcewZyOELII7oHBaA9NHjsU+yV11WC
	lyGrmLea0yW3lMf3lLJwWQ3Acz/Pk7LYO7Me5zUmvAjjeDlBJCjwUrTneyFjTfMZ6bK6+EyV4I7FZ
	1fNtKkRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWkZ-0000000G9gC-38vz;
	Thu, 27 Nov 2025 07:49:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWkY-0000000G9fF-0kEv;
	Thu, 27 Nov 2025 07:49:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4D1240029;
	Thu, 27 Nov 2025 07:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF33C4CEF8;
	Thu, 27 Nov 2025 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764229749;
	bh=xCHxcpEIdv+cYmEpWP1sxWzNhSIiDpBmJZwuNZkMZtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQwfqP/QVZii9l8ecWYPqL+DhTc2gEZKdzPKZe3sPat/h7wPoswC6nqt25oEbfI6X
	 AJ9VlIQp7MkXckUpVg5sf4thLKbOR7D3ncXL+cVNTd+jA8GfsXMxp3q6k0kLGeGKBq
	 wZc50SuOI2+9aJI4j7aHrVGZWcKj1uAMfWyTlw8AL3zaR++iE5651KdiynSbupz92T
	 HrG6MpTWaGD8bmDZWJgP0HebESgwtDG8TVq9izwQYCdI8EEIKH1ECFhPfOZPFmPsNG
	 mnZcOker27snb9SaAQYHemgr/fRGAD9Eehoxe5gVmiSoZ33k9LM03qHOMYL2vYP4eH
	 Qw8fNHFSpnFmQ==
Date: Thu, 27 Nov 2025 08:49:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: rockchip: Add support for
 multiple interface clocks
Message-ID: <20251127-enigmatic-faithful-viper-baefa2@kuoka>
References: <20251126083345.88-1-kernel@airkyi.com>
 <20251126083345.88-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126083345.88-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_234910_232236_3D169DB6 
X-CRM114-Status: UNSURE (   8.83  )
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

On Wed, Nov 26, 2025 at 04:33:44PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The iommu found on RK3576 NPU/RKVDEC may contains more than one
> interface clock.

So you need to restrict this per each variant. See writign schema doc in
DT dir.

Best regards,
Krzysztof


