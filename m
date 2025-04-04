Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A10C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 15:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+qaDsHdf8BS5fBTT5XLZ+y0eKAe6ChgiYicrsjUlMc=; b=qKKEzfGm70Wml7/vJ2Ad9yH0kJ
	WKL7OBH8mne6n2Pz9VwhDICRbDlWgBx1wptM9Abo1tDPqw7YscK9guNrMmw9csZ9x0zTZM/pUgecw
	1SQ7aGrNNmhcJyT//jEelE8WTsA1CboKTL0W0cfl44Qd7kSCkUku33CNr+U2IHIdESQ0pSFhIaMr3
	6Vq8AgbWUDp0K7IWvhGiJLsLLLRBFFlSyrlXDvw/MdFs6MLce1khXEYOgO813I8oEUrRlmrq/OgHM
	0QRH5iJkbmr5GvLGDR8qw9yhRWMsqLa18ldS6uhbS6XuSOzabUw4BvRMShqlRG7bvtt0oOZo74gcx
	QeJm2cdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jAX-0000000CCCI-3tAs;
	Fri, 04 Apr 2025 15:41:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0j8G-0000000CBpo-1wZn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 15:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76438446E1;
	Fri,  4 Apr 2025 15:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF36C4CEDD;
	Fri,  4 Apr 2025 15:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743781139;
	bh=MJ8gi+tG+9w7E6JAgGJyxRT9HR+3XqjoIb/hCQhDaLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQF0rQbAUwPvf4cMDeHtzMToEc+cqoBfo5M3qEt60EAZXk+SyMO2ZMd8NAzBI5oEL
	 TxSVB3eWgpxQ2SJFeB4n/azx7GII9N+1wQLX2KZXzOVhp8iYH6fSAO/kxXiJV+Hhyd
	 lE8djtO4fLcrq35dmDwKckBwo9Sso5VvJdyGcTrMVVndHO5GWoCLdTkSIWvVjojzNQ
	 8wVvxbPe1CSxU+BeQtKEbvDV3tLNvPDUqwBZNjIDlOBAV8QipZz7BY99I/y+UBZRTw
	 yMr8Nu/mVaUEdzmSJeqcc1+VIBsCWVanv49MdyjFNTFS2Jt/X3MVEfwpt1NhwdmkWD
	 m/W2YY+HwaPVA==
Date: Fri, 4 Apr 2025 16:38:54 +0100
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v7 05/10] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <20250404153854.GG372032@google.com>
References: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
 <20250316-bcm59054-v7-5-4281126be1b8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250316-bcm59054-v7-5-4281126be1b8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_083900_523366_1DC7AFCC 
X-CRM114-Status: GOOD (  18.71  )
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

On Sun, 16 Mar 2025, Artur Weber wrote:

> The BCM59054 is another chip from the BCM590xx line of PMUs, commonly
> used on devices with the BCM21664/BCM23550 chipsets.
> 
> Prepare the BCM590xx driver for supporting other devices by adding the
> PMUID register values for supported chip types and store them in the
> MFD data struct as "pmu_id". (These will be checked against the actual
> PMUID register values in a later commit.)
> 
> Then, add a DT compatible for the BCM59054, and provide the PMU ID as
> OF match data.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v6:
> - Move PMUID value to MFD header
> - Use PMUID value as OF data/device type value
> - Add bcm59054 to I2C ID table
> 
> Changes in v4:
> - Rewrite commit message description
> - Rename "device_type" member to "dev_type"
> - Drop awkward line break to fit function call
> - Add PMU ID/revision parsing function
> 
> Changes in v3:
> - Fix compilation warning about device_type pointer cast type
> - Name the device types enum and use it as the type in the MFD struct
> ---
>  drivers/mfd/bcm590xx.c       | 12 +++++++++++-
>  include/linux/mfd/bcm590xx.h |  7 +++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)

Looks like the Regulator changes depend on this.

Let me know when they're ready to go.

-- 
Lee Jones [李琼斯]

