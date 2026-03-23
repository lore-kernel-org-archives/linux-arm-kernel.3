Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61630F46101
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyWUJz7ZT4dzndB427q38nfqxK1VH+VJCRGRbsWeTMw=; b=AtEO6reJNR7CvRxel6zWd3W5OQ
	5kRVBaVHbrALA3YzEGvOdqFJTe+Q2hrMiAxO/YJBHBgsqMOw63blLuQ1qhB5gpbTXuP8ib9fJix1a
	6NIYGWbFWK2iA/82o1mGX84IcUNeo6vLvh/0GevQDGVSGcMvkWCiWTpq9S5sSU72M/RqjSFESnbp3
	Ac/DGK/I8+SLZ+ujO2jj24tZqB7ea6vlpwDkDs//oTZ+6bW50a/K6t+Bx4Yy50j9yfJHLlNRz2WMe
	6bpUY9/S5PaGrmJjR9ZLBN8/mIepkVDtAeW+w9jKNWbhbwQ1vvSYV415zpF/Gx2jAg21NTWtmRThd
	qhwSFt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fGU-0000000GoWL-03RD;
	Mon, 23 Mar 2026 13:24:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fGR-0000000GoVl-3V5f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72FB240B1E;
	Mon, 23 Mar 2026 13:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36925C4CEF7;
	Mon, 23 Mar 2026 13:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272255;
	bh=mqs5zAZq0cjIjQqg6msmfW+S/T7XdFMiumdtkA29a98=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=g0PcgubM7/2phLSEIfZRJcQYY5dMdgoRXiFXuASh4e5zc4071rU9I/1RAMcvy9KME
	 KRFPwmvkem7JJe8Q6mxesGSAEB1G7wBLq4IEfc3IUTtUFJOjmKUSWvflhAvMHJz7+f
	 wAgUxsJBrFSHRxstToFKClm43R0I6xdM/0ILGkOA5voZjaVAadO8egJQQoeQZCUd+5
	 bI5RZQ++eN0qMNdOHVICj69lNL6LsHMC6hYn/x8/KypmKEnUpb3hLfCX8U5bqoSKmC
	 2nwSGw/CNKBe+vVdzPoYfT4bFkZJHZmQM2z8bVqbqcXx7sLHPh40tK1LmR4IVgne2Z
	 9LCp15QDNQDdw==
Date: Mon, 23 Mar 2026 08:24:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Michal Simek <michal.simek@amd.com>, Nuno Sa <nuno.sa@analog.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 saikrishna12468@gmail.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 git@amd.com, David Lechner <dlechner@baylibre.com>, 
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
 devicetree@vger.kernel.org
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
In-Reply-To: <20260323074505.3853353-5-sai.krishna.potthuri@amd.com>
References: <20260323074505.3853353-1-sai.krishna.potthuri@amd.com>
 <20260323074505.3853353-5-sai.krishna.potthuri@amd.com>
Message-Id: <177427225202.450573.11125989986102537734.robh@kernel.org>
Subject: Re: [PATCH v2 4/4] dt-bindings: iio: adc: xlnx,axi-xadc: convert
 to DT schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_062415_909422_91FCD6E6 
X-CRM114-Status: GOOD (  14.39  )
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


On Mon, 23 Mar 2026 13:15:05 +0530, Sai Krishna Potthuri wrote:
> Convert the xilinx-xadc.txt to DT schema and remove the old text binding.
> Update xilinx-xadc binding path to YAML format in MAINTAINERS file.
> 
> The 'xlnx,channels' property is a container node(type: object) with
> a vendor prefix, which triggers the below warning:
>   "properties:xlnx,channels:type: 'boolean' was expected"
> 
> This cannot be changed because the original text binding specified
> 'xlnx,channels' since 2014, driver explicitly looks up "xlnx,channels"
> using device_get_named_child_node() and removing the vendor prefix
> would break backward compatibility with existing device trees.
> Also, keep all vendor-prefixed properties from the original binding to
> maintain backward compatibility with existing devicetrees and driver code.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
>  .../bindings/iio/adc/xilinx-xadc.txt          | 141 ----------------
>  .../bindings/iio/adc/xlnx,axi-xadc.yaml       | 154 ++++++++++++++++++
>  2 files changed, 154 insertions(+), 141 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/xilinx-xadc.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/xlnx,axi-xadc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/xlnx,axi-xadc.yaml: properties:xlnx,channels:type: 'boolean' was expected
	hint: A vendor boolean property can use "type: boolean"
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260323074505.3853353-5-sai.krishna.potthuri@amd.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


