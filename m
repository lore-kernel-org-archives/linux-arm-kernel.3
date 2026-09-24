Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D70AC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFUL/f9Inmg2xJQE97ITP8b/GlvetqpoJPMk0QqhSlU=; b=ve3ppdHx1Mrrs5v3QeCZITyYdA
	8/z3plLVzO6N9Pwptrr/brQOklEbSjgj58vn3ewK931l5x2GfYB3CQOBdq2ToR1RGkUFn3Fd7Ab8n
	MAv5M+TBgF0VdW1V3uD1CiN6Q3bvJD6mm70i37rzwv22upZDsXxwpqONBpAkBEmgqQWX5ODmQBhQQ
	MWQzQxRlfn50rNvpMuIIqzKu6zFFd1gpF+jVuuEDYHobtAjaAuu2avBxyakwNUDjPUAjGxXvHXVEV
	DlWyhWeHZTwvHV8tjDTRY+QzcoWRhhCbCU3O3+V+BN/4ZGNghWW326vtwTFFe8py7jogxTYYzIcXh
	wfC2AflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rqW-0000000CHJm-49vY;
	Thu, 24 Sep 2026 22:23:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rqV-0000000CHJX-0iQf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:23:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D3C041B35;
	Thu, 24 Sep 2026 22:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8981F000FF;
	Thu, 24 Sep 2026 22:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790288594;
	bh=mFUL/f9Inmg2xJQE97ITP8b/GlvetqpoJPMk0QqhSlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g92dkVu13EtNuuVaqVSa1Y4o3fYAzFYUwxDVxAvGzbSVBYULEVAIxe1jpAJ31ojfk
	 TuHJ+Rz26vtH4YoUOioO8apijH+kr/0wmOsItxGQLpZJ5LYWgI3Z+5Tl2Hy5K9wN4K
	 4dFQHCMMNoxIFoWTFDI4ZpFVSo/0kOZJzfaBDSpawUfeEPYsv+J14zX6SY1zWpag9x
	 faNED8r87NiN6llI4sRht2X0zjmIoOXW3dDHYIr6ACrNbgIyK+xoyEWVPQBMcFgy6l
	 9d4kFBgqJy8r5Z+26KYxPq60dQWzudHjwsvsl9zxwiNU0Ie06uNaM/Yp6gkL6ds/Qs
	 71bSTAWJxoHkQ==
Date: Thu, 24 Sep 2026 17:23:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: vexpress: drop the obsolete hwmon
 and regulator text files
Message-ID: <179028859209.2061232.10536474709345982702.robh@kernel.org>
References: <20260917115818.540344-2-quchaosheng000406@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917115818.540344-2-quchaosheng000406@163.com>
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


On Thu, 17 Sep 2026 19:58:18 +0800, Quchaosheng wrote:
> Documentation/devicetree/bindings/hwmon/vexpress.txt describes the
> arm,vexpress-volt, -amp, -temp, -power and -energy sensors, and
> Documentation/devicetree/bindings/regulator/vexpress.txt describes the
> arm,vexpress-volt regulator.
> 
> Both restate what arm/vexpress-config.yaml already documents: the same
> compatibles, the arm,vexpress-sysreg,func property and the label property.
> The regulator node refers to regulator.yaml, which covers the generic
> regulator properties the second file lists, and all 13 in-tree
> arm,vexpress-volt nodes set both of the properties it calls required.
> 
> One sentence in the regulator file is not a restatement: it says that a
> supply without regulator-min-microvolt and regulator-max-microvolt is
> treated as fixed. vexpress_regulator_probe() implements that by selecting
> vexpress_regulator_ops_ro when the two properties do not both define a
> range. Move the note into the regulator node description in the schema,
> so that removing the file does not lose it.
> 
> Nothing else refers to the two files. Remove them.
> 
> Assisted-by: LLM
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
> ---
>  .../bindings/arm/vexpress-config.yaml         |  4 +++
>  .../devicetree/bindings/hwmon/vexpress.txt    | 23 -------------
>  .../bindings/regulator/vexpress.txt           | 32 -------------------
>  3 files changed, 4 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/vexpress.txt
>  delete mode 100644 Documentation/devicetree/bindings/regulator/vexpress.txt
> 

Applied, thanks!


