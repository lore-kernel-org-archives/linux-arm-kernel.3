Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F151C71132
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UGC6obfJEdHLrDw7HVfrKqfiFrLveko3d0SKHEz6Ig=; b=m1WN2c2F99zJhYgOo8oCx0w7ul
	se3FPsf/x73jbrjToaTPYfIXuk9k/f6Cqar9lrfaDjztdCgNNziXkSneIaUlX4vabt0jspgrckBqq
	OgOkcHNts4CW7r8HCL/xdLMz/jKg2b7Mq15D0QTtS/yYMZc6Ixup0VSgWdkSnhI1+mpR/BSbyJ+Sb
	fcZ4JgNFDd6yONhsTIhX5lhUTU4tLuZ2z7Cz/MMNk0NAw+Z6himEA+obCrTUhyHo/8I0VWC/n94zH
	CXE4FoShfGjj3RHxRk/gJrlFN6NYorlE7aDJ7nupi/TUAeNnyaM8fGrHaQ4CVMH5spZ9ufe6vcrFS
	TS/BqRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOubP-00000006DNH-0nXd;
	Tue, 10 Jun 2025 08:45:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuPh-00000006BsG-2sQy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:32:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B9D561129;
	Tue, 10 Jun 2025 08:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0218C4CEF0;
	Tue, 10 Jun 2025 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749544376;
	bh=SeM2fX3V7rJHEICuoUesxqz8Z/Gb6XXlCMnMM8yJjo4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oNUnm/0d0NSyV1KpxCElUMuB7NV/RWA1VylR1xJD38v2VZ4vXD3fAj7l+Purr3T+G
	 /w/H19u1gmrtKw+9nu9ac/G594YLZ75qXNFE+b+9H7NQ8M5tX3xVKDyBXDZFw7Q3Lu
	 S9j+gsEf1XeyyIHIGHQ8A2SIsJS+/tNlxu2XN6KS2GwnkIEYEMId6Vacjj8ONvLmxi
	 oqAVfxRELEdUbuR9ifYUEhSNJooDSuS75RT2mDhOsV6yQ+d5wYsHDZlKjKjshtNQgi
	 OOHBu58tOtWzhqK7ce88/rmpeD+7hiMN2A1s6BUpimb+E2FhHARmuVa9gP9VgRmosL
	 WZverJznxiS6w==
Date: Tue, 10 Jun 2025 03:32:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, michal.simek@xilinx.com, 
 monstr@monstr.eu, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Neeli <srinivas.neeli@amd.com>, 
 git@xilinx.com
To: Michal Simek <michal.simek@amd.com>
In-Reply-To: <dba4f2c39a25b54010c292c36e349cb289d6cd98.1749540869.git.michal.simek@amd.com>
References: <dba4f2c39a25b54010c292c36e349cb289d6cd98.1749540869.git.michal.simek@amd.com>
Message-Id: <174954437576.4177094.15371626866789542129.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: gpio-xilinx: Mark clocks as
 required property
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


On Tue, 10 Jun 2025 09:34:31 +0200, Michal Simek wrote:
> On Microblaze platforms there is no need to handle clocks because the
> system is starting with clocks enabled (can be described via fixed clock
> node or clock-frequency property or not described at all).
> With using soft IPs with SOC platforms there is mandatory to handle clocks
> as is explained in commit 60dbdc6e08d6 ("dt-bindings: net: emaclite: Add
> clock support").
> That's why make clock as required in dt binding because it is present in
> both configurations and should be described even there is no way how to
> handle it on Microblaze systems.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
> Based on discussion at
> https://lore.kernel.org/lkml/20241002-revivable-crummy-f780adec538c@spud/
> 
> Actually this shouldn't be only targetting GPIO but also for example
> xlnx,xps-timebase-wdt-1.00.a but I would like to check it first on gpio
> before starting to check other bindings.
> 
> ---
>  Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/fpga/fpga-region.example.dtb: gpio@40000000 (xlnx,xps-gpio-1.00.a): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/dba4f2c39a25b54010c292c36e349cb289d6cd98.1749540869.git.michal.simek@amd.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


