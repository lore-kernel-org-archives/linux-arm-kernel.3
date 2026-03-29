Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4266F3D60A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHJsj3i2UGu41XggzEkokpN3NfvKwTCjQxHQUroZ1No=; b=mUf6oyDNbHBAYWbQsURumFYzMP
	8k+R6zlC+S7JA1Gk9qUiAVU3rcT93QVpbVDrVxs0ZvLTL5tMknEaPYXYsN0dWiLQq/TidzfM7CnLz
	mBSShnr7xxLJjn3fSWlXfS62E4qqZ6p6E+DbxxJdP9hJixoplmVeGR0HZU5wHqnpb2QkwtjKXX2b2
	oH5th6FIS67apr1MCMagRmh8idXKwgUCYyXeGUb5X4aJ7F9s0QhvvLBYQa5bZv0SJI3gwkfCfr9Qj
	1D/X1wgu7ML+JvNCTVKpJSgBhHi/yI0QT54xsP79Yf0qD73M77CeRIEgkBrgW+yacdYsQyFsEKjVY
	OCEjlh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t2q-0000000A7SP-3jJW;
	Sun, 29 Mar 2026 16:31:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t2q-0000000A7SD-0dAr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:31:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F46360054;
	Sun, 29 Mar 2026 16:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8D3C116C6;
	Sun, 29 Mar 2026 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774801882;
	bh=ZAA7JFyEPX8fZJyDBVdvdGi1nyK6h+0PqK1+/WxNirc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dOHjTPogepQX2xPxX0hSmlgs6yFDTWb04IexwKUJOV5zZC/AjlyyJpiKWhFAhchK5
	 4Tfw/5C4kMe88U8TQf0nU2m7IlO67ALyzPF8vBKIHZ2Xf8T2VEVkIwDKITFrvI18mr
	 VNksCc7KkQBtOhWwarHBXBYwwZr/cYKN4YwS1w5DGIOemZEoBmuUtXRxxCutqdWtcm
	 4XR0DIpHYtovyNLpCKcY2UdmZQfe8vVLfaBBnR0gz8AC/xpK1a1N3nF1dA8Uvw3RHT
	 Z29uR4gBQWrEVvZIaWfoYcU/1Kd/lG+XQbS7ncECd9s1iJfkPbrGMlnWA5TkE2AjGB
	 94lANoVkB8kUw==
Date: Sun, 29 Mar 2026 11:31:18 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, 
 will@kernel.org, linux-perf-users@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
To: Geetha sowjanya <gakula@marvell.com>
In-Reply-To: <20260329152439.10573-2-gakula@marvell.com>
References: <20260329152439.10573-1-gakula@marvell.com>
 <20260329152439.10573-2-gakula@marvell.com>
Message-Id: <177480187879.3821545.1418210029302677428.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: perf: marvell: Document CN20K DDR
 PMU
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


On Sun, 29 Mar 2026 20:54:38 +0530, Geetha sowjanya wrote:
> Add a devicetree binding for the Marvell CN20K DDR performance
> monitor block, including the marvell,cn20k-ddr-pmu compatible
> string and the required MMIO reg region.
> 
> Signed-off-by: Geetha sowjanya <gakula@marvell.com>
> ---
> 
> Changes in v1:
> - Added a description field to the binding.
> - Simplified the compatible property using 'const' instead of 'items/enum'.
> - Updated the example node name to include a unit-address matching the reg base.
> 
>  .../bindings/perf/marvell-cn20k-ddr.yaml      | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml:35:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml:35:1: found character '\t' that cannot start any token
make[2]: *** Deleting file 'Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.example.dts'
Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml:35:1: found character '\t' that cannot start any token
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1614: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260329152439.10573-2-gakula@marvell.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


