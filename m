Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF72E77361
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1czq59Nt65AqFr5IgKckT5tSyhy8hgPlHxp+wONESN0=; b=fmfuFMj4YXjYFuo6njk3T07tDS
	bQPAWXy8gJW8BdC5tRNsX/AXDUkSDXQh9LAnnWDsSLWstobQBKchCErel4UElMXj/FHHmpAY7AhuJ
	vCleXZMjl1cgMEItHFy15SGvnlkh4IsoiMq4xhsGEGLQsMMKJGzhgn8sVc8fSJ0dlNeA8Y3PPFAqv
	FNW1UwpVm9bgvFrrhnbm7HIrTdmGpfFerkoBGNX1OpOLHvr/ar6bJ0DMiEkV/8WcBi5C1Pvzav90Q
	yw+yVbnjPsr84Rme+hJWtK4yOM3fhHnYepUgsy6E4etvZ/ldXRDwmSxYDmviGMbbTYUnMe0Bi6aU4
	HXhjoUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRZ8-0000000HDwZ-0jo9;
	Wed, 24 Dec 2025 16:18:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRZ4-0000000HDvz-33wB;
	Wed, 24 Dec 2025 16:18:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DEC84337A;
	Wed, 24 Dec 2025 16:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1340CC4CEF7;
	Wed, 24 Dec 2025 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766593097;
	bh=jzhJfxnvJUvERodafb6uRPp3to4d4hQE2SKWE3YryHY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FCp+/KOhwYp98tnwqGwWl8jrc/X5Z/Q4Q8YJmARm0sL3g9KO7lgOnfT9cmlzHPe9Z
	 QWjUspxRLmTGsvUvOJCMlErLfQLehAM4kFU8asmQV8KZyxG+CacSkcAIDy8Caf8nm2
	 NMBZ+th33jQtp81ci0vKx3zV0E99Zvkg1UuWbKhPDEgdWflK19Ujzn60Z/IigTPG85
	 J2ZhCxsZ8dM4HWxl5+LxVYNmnngUhIj3tm2SXy/kP/vs9fll7dCDCXAydHowKCqCw0
	 f0yg4Xto3pISXrooax5EKL43DKr+5RXvlk4R4HjmBo6Ev/HfEMWtnJuGCZ3dcI9O7p
	 R5hOz3toSaeag==
Date: Wed, 24 Dec 2025 10:18:16 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mani@kernel.org, linux@armlinux.org.uk, linux-riscv@lists.infradead.org, 
 nathan@kernel.org, devicetree@vger.kernel.org, catalin.marinas@arm.com, 
 kever.yang@rock-chips.com, dan.j.williams@intel.com, 
 linux-doc@vger.kernel.org, haren@linux.ibm.com, palmer@dabbelt.com, 
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, alex@ghiti.fr, jose@osyx.tech, 
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org, heiko@sntech.de, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, will@kernel.org, corbet@lwn.net, 
 dev@kael-k.io, aou@eecs.berkeley.edu, krzk+dt@kernel.org, 
 maddy@linux.ibm.com, bagasdotme@gmail.com, ajd@linux.ibm.com, 
 pjw@kernel.org, davidmcerdeira@osyx.tech
To: joaopeixoto@osyx.tech
In-Reply-To: <20251224135217.25350-4-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-4-joaopeixoto@osyx.tech>
Message-Id: <176659309471.2305281.17349642622422527927.robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: Add Bao I/O dispatcher driver binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_081818_836117_DDF8AD3F 
X-CRM114-Status: GOOD (  19.35  )
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


On Wed, 24 Dec 2025 13:52:15 +0000, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> This patch adds a Device Tree binding for the Bao I/O Dispatcher kernel
> module, which can be loaded into backend VMs. The I/O Dispatcher
> provides the bridge between the Bao hypervisor Remote I/O system and the
> frontend device model in userspace, offering a unified API to support
> various VirtIO backends.
> 
> The dispatcher handles hypercalls to the Bao hypervisor, IRQ/eventfd
> forwarding, and provides a character device interface for frontend
> devices, enabling efficient communication between the hypervisor and
> userspace device models.
> 
> The binding documents the following properties:
>   - compatible: "bao,io-dispatcher"
>   - reg: Memory regions for the dispatcher (multiple VirtIO devices)
>   - interrupts: Interrupts used by the devices
>   - interrupt-parent: Parent interrupt controller
> 
> This enables kernel drivers to correctly instantiate and configure Bao
> I/O Dispatcher modules based on the DT description.
> 
> Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
> ---
>  .../bindings/bao/io-dispatcher.yaml           | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bao/io-dispatcher.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/bao/ipcshmem.yaml:4:6: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/bao/ipcshmem.yaml:5:10: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/bao/ipcshmem.yaml:17:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
./Documentation/devicetree/bindings/bao/io-dispatcher.yaml:4:6: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/bao/io-dispatcher.yaml:5:10: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/bao/io-dispatcher.yaml:20:12: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bao/ipcshmem.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/bao/ipcshmem.yaml:17:1: found a tab character where an indentation space is expected
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bao/io-dispatcher.yaml: properties:reg: 'anyOf' conditional failed, one must be fixed:
	'type' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'items' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('type' was unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bao/io-dispatcher.yaml: properties:reg:items: 'anyOf' conditional failed, one must be fixed:
		'maxItems' is a required property
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		'type' is not one of ['maxItems', 'description', 'deprecated']
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		Additional properties are not allowed ('type' was unexpected)
			hint: Arrays must be described with a combination of minItems/maxItems/items
		'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
			hint: "items" can be a list defining each entry or a schema applying to all items. A list has an implicit size. A schema requires minItems/maxItems to define the size.
		hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
		from schema $id: http://devicetree.org/meta-schemas/cell.yaml
	1 was expected
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/cell.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bao/io-dispatcher.yaml: properties:reg:type: 'array' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bao/io-dispatcher.yaml: properties:interrupts:type: 'array' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bao/io-dispatcher.yaml: properties:interrupt-parent:type: 'string' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bao/io-dispatcher.yaml: properties:interrupts: 'anyOf' conditional failed, one must be fixed:
	'type' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'items' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'minItems' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('type' was unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bao/io-dispatcher.yaml: properties:interrupts:items: 'anyOf' conditional failed, one must be fixed:
		'maxItems' is a required property
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		'type' is not one of ['maxItems', 'description', 'deprecated']
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		Additional properties are not allowed ('type' was unexpected)
			hint: Arrays must be described with a combination of minItems/maxItems/items
		'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
			hint: "items" can be a list defining each entry or a schema applying to all items. A list has an implicit size. A schema requires minItems/maxItems to define the size.
		hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
		from schema $id: http://devicetree.org/meta-schemas/cell.yaml
	1 was expected
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/cell.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bao/io-dispatcher.yaml: properties: False schema does not allow {'description': 'Parent interrupt controller node', 'type': 'string'}
	from schema $id: http://devicetree.org/meta-schemas/interrupts.yaml
make[2]: *** Deleting file 'Documentation/devicetree/bindings/bao/ipcshmem.example.dts'
Documentation/devicetree/bindings/bao/ipcshmem.yaml:17:1: found a tab character where an indentation space is expected
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/bao/ipcshmem.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1565: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251224135217.25350-4-joaopeixoto@osyx.tech

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


