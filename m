Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF92FE8B386
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 01:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuy21SNmfWxzpFF0eJ4b0zFUlyJrnPrFewYXFx3Z9UI=; b=xNlhvtHYaDLBCM3+Nz/5zqGcE+
	QVHNH9j6SrLuGMrOMoXBMK9zfsUT4WuUs0zZgvRirDEmD3LspmAS1YFmpAb6KReiXosbwj3EKLj0e
	yO7Bd9wnxL58GYIzDI6uNTd0B37D9m+GS1BAltMSjQkh6epZTKYWemrgZCkZ5EBYJkuXdhe3jsirc
	SsbV82nbiUKvLU1cfpieq5PZ4BBKuJRC+pAtb4RurMt8oHba65t7WSapV7iWbyn2L0IgVHgR/vhxu
	y0BSf6m8oU+pM+Lz2S1CZ7zckgTFev+m154Pr6JH/LFGb1er18M9iaq7h8jrdfHFepE4LKqctLvmI
	AUn8NUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRQj-00000007fdj-0aYb;
	Wed, 04 Feb 2026 01:11:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRQg-00000007fcm-1LMh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 01:11:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AB6143FC4;
	Wed,  4 Feb 2026 01:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651EEC116D0;
	Wed,  4 Feb 2026 01:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770167494;
	bh=s3lTpYIuHg8HtlxmezJcghRfziSTcL3CioyEyTkqFRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2lFmhByFND7qXjvgfs/szKRGNPi2tJ2Cj5gt9TEI3tzeqwHwK9LXozN3MAs7BN4L
	 NlKGBP02EVcvLINUFRrQ66c/y40Ng/o30IrWEV6AFtoVuM8PPgUzrG1EAGhxrm61Rc
	 8zysuDmNBAF7e0tlQ76+0MyLZRZncVKkuvHcStVrOoVPgy3No7cG/DbOouM/GOK8Ku
	 pH+A/ZQWhEAxuNCqEKiVvkA1GqxundSbQXTj0JVXxxwdxMKYiFSVqz/hChD74qqJM1
	 5T4RTV/3CMH1YlF+TdbkBd56nxkgsFRvKVSdCuCKBOMX522kSFiaSEm9AYAzx6PSgD
	 NSJEA+uBxg7nA==
Date: Wed, 4 Feb 2026 02:11:29 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 4/7] i2c: xiic: cosmetic cleanup
Message-ID: <aYKcc0IGO9jroObH@zenone.zhora.eu>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-4-ce4695f5267d@nexthop.ai>
 <aYIXagCXYb4DrDLp@smile.fi.intel.com>
 <DE565BCD-28D6-4844-BCEE-A1F60DC84662@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DE565BCD-28D6-4844-BCEE-A1F60DC84662@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_171138_374880_6652AC7B 
X-CRM114-Status: GOOD (  13.19  )
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

> >> Re-use dev pointer instead of referencing &pdev->dev everywhere.
> > 
> > ...
> > 
> >> - dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
> >> + dev_dbg(dev, "mmio %08lx irq %d scl clock frequency %d\n",
> >> (unsigned long)res->start, irq, i2c->i2c_clk);
> > 
> > No need to do this here as we change the format string afterwards anyway.
> > 
> > But I leave it up to Andi, I won't prevent this to go in, if he agrees.
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> > 
> 
> No worries, I can do this in the following patch, since there is going to be
> a v 10 anyways.

This would be merged next week anyway, so, please, send a v10 as
there are many little changes (if we were out of time I would
have manually changed things before merging, but that's not the
case, yet).

Andi

