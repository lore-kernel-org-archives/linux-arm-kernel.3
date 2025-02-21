Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25847C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 03:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N78GacnllDpHdJ+WjiFEaD2wxa6C0mAgRV0Dbj5P5Jw=; b=unnZ4qDjqWj74f40BV+M9Y+Q/Y
	b3N7IoOLDB5XZ1xwDTX+mX9TX3nfJU0L0CD5Lr/otKT9WTz1DhauvY4hUbGaJGqG17Zxvk1EUWcZe
	it1HUXP3PFdB17qDPXemy9a1MbzPWjmE7w0UtQSVdHBiM97fWfSO/OZ5Dja/GnOTPld1NQ1hMUaTa
	pR/klGHdwezSYFtioSKWwFuh6x191vSqbcCyGv1V8kHDH8YxNQbPdxW6+kI5V98mBTZXKhT9BuKeO
	kGdxPKg9Z+p110TlUplgA6/pSYBCaphK0lrs2+cJbGCXwQi8LxiXLJ602WO6a0ABYk9GeDjQy0b+s
	YIm5U//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlJWj-00000003xLv-0Jry;
	Fri, 21 Feb 2025 03:16:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlJSC-00000003wM7-0tSw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 03:11:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DEAB35C5F2F;
	Fri, 21 Feb 2025 03:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5036BC4CEE2;
	Fri, 21 Feb 2025 03:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740107510;
	bh=cWhiygrePoEholasW4NiNmJa4UxvRJ1E334B+HxDlG0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fugaD4P9PLi9X77E+EI59RH1iDkhGTd8RZGXa52LXicMbBXKLLu6cC+ZpzZikJMV3
	 AHfG+ARK744DejIatOfQVKtuOlF9x4I7cSLesHsqkPBw+y9EUwCkuc9zYtFNiyWwHe
	 uv9Te8SR/Q2R7dsVSOHKY7Cr8vzbRXEscnWdwpHHwXDijhWgbwW0FYVBkgq5vBwfhE
	 jKL3XAP4kILa2dcArS34L/YZfBspswOQ3Op67w/XuZyVhwBPN+SISJJY6EWx3SpoGC
	 Z1rNjko6eBjXU3JgI3Mia8MpkLXUXgMQReMPPvK44Vv96mLnEa8EZ21XuAjfON+Ejs
	 PmUCm7LpDiu1A==
Date: Thu, 20 Feb 2025 21:11:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, andrew@lunn.ch, krzk+dt@kernel.org, 
 linux-kernel@vger.kernel.org, gakula@marvell.com, 
 devicetree@vger.kernel.org, sebastian.hesselbarth@gmail.com, 
 p.zabel@pengutronix.de, salee@marvell.com, 
 linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com
To: Wilson Ding <dingwei@marvell.com>
In-Reply-To: <20250220232527.882888-2-dingwei@marvell.com>
References: <20250220232527.882888-1-dingwei@marvell.com>
 <20250220232527.882888-2-dingwei@marvell.com>
Message-Id: <174010750791.4160970.11701879696918181174.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: Add Armada8K reset
 controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_191152_311449_171EE1D3 
X-CRM114-Status: GOOD (  10.38  )
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


On Thu, 20 Feb 2025 15:25:24 -0800, Wilson Ding wrote:
> Add device-tree binding documentation for the Armada8K reset driver.
> 
> Signed-off-by: Wilson Ding <dingwei@marvell.com>
> ---
>  .../reset/marvell,armada8k-reset.yaml         | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/reset/marvell,armada8k-reset.example.dts:22.46-26.15: Warning (unit_address_vs_reg): /example-0/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reset/marvell,armada8k-reset.example.dtb: system-controller@440000: compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250220232527.882888-2-dingwei@marvell.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


