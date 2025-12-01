Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F744D116F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJ5TIyr2if/gHMNfcjqDcXCokHmAPtE46r/WEkupUY0=; b=uZKWMc00SdQwEGhZRSdFzF8051
	ekuHuX1I9Pj97umRcfML5jtfLfNFJKKKQnUm4N5RJ335NpcaGkSJz4d4TWDaQZvwzNacs1C36NHQe
	4n/igWRYN7xt8cbRynKpc3FUNTS6CLS6oNYJ7RrPYhPZhQFL9VHjBq8WSTRsQYRNCnUWTbrrwurv+
	ViVGWH4o9/J1MapSB92lr+byzzG/pH5Kgoxj3a32ORySXCbdxjqJYPBAUqX4NPBmzW/5HV1Q5QxSB
	4OAGXuFytiUmYGt5Rir4BjyX8Nn3qFK6o+VRGt5Zf3FTcWukyWz+ZLwdTQRdDOznWc1FAQkigjleU
	qjdlR3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0Hx-00000003DR1-0ivo;
	Mon, 01 Dec 2025 09:33:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0Hv-00000003DQV-1pSi;
	Mon, 01 Dec 2025 09:33:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 972EF60169;
	Mon,  1 Dec 2025 09:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36891C113D0;
	Mon,  1 Dec 2025 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764581622;
	bh=hCB+h8upvH20oKb6hCw5kz2C86FqOUOLpfO3S1y1r/E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bGkSVe+TqazC8R/C2V9gcTpqyhh9E17IB3PgcK50OaJNOEx5Da9ziui3rK/+d2Ki9
	 4I2uZ+c9Xy04uQ9NbD1YPjZIW/tvNmZs7OXBFMWL2CiB3M2xJPwpw4Wa4ZuBqw5N04
	 ZG+E4ic4f+AQsKzw/XlC/NedmXUbELPP6RxpPvUJJgw508g22O2ggGs5ijlZtTQh1N
	 sJwNSd9udYCXRKnSPa4ipmzmfXjQDgSi436q/SA7KoD5trDUEGpUDWP+qfri+fWU5H
	 J4nmmqNGuS7BPE+bv8NFB8jeRflASYMF7FwpFqDwlmfbDryjtc5bJwp8Jgz4sXEE33
	 qjzopgWM+EoEA==
Date: Mon, 01 Dec 2025 03:33:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org
To: Gary Bisson <bisson.gary@gmail.com>
In-Reply-To: <20251201084140.376058-2-bisson.gary@gmail.com>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
 <20251201084140.376058-2-bisson.gary@gmail.com>
Message-Id: <176458161856.2489196.6170126310129033736.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Ezurio LLC
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


On Mon, 01 Dec 2025 09:41:36 +0100, Gary Bisson wrote:
> Ezurio is the new name of Laird Connectivity after it acquired Boundary
> Devices.
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
> Cc: robh@kernel.org
> Cc: krzk+dt@kernel.org
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 428, in get_or_retrieve
    resource = registry._retrieve(uri)
  File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 426, in retrieve
    return DRAFT201909.create_resource(self.schemas[uri])
                                       ~~~~~~~~~~~~^^^^^
KeyError: 'http://devicetree.org/schemas/thermal/qcom-tsens.yaml'

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
    retrieved = self._registry.get_or_retrieve(uri)
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 435, in get_or_retrieve
    raise exceptions.Unretrievable(ref=uri) from error
referencing.exceptions.Unretrievable: 'http://devicetree.org/schemas/thermal/qcom-tsens.yaml'

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 463, in _validate_reference
    resolved = self._resolver.lookup(ref)
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 686, in lookup
    raise exceptions.Unresolvable(ref=ref) from error
referencing.exceptions.Unresolvable: /schemas/thermal/qcom-tsens.yaml#

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/usr/local/bin/dt-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 158, in main
    sg.check_dtb(filename)
    ~~~~~~~~~~~~^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 95, in check_dtb
    self.check_subtree(dt, subtree, False, "/", "/", filename)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 88, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 88, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 83, in check_subtree
    self.check_node(tree, subtree, disabled, nodename, fullname, filename)
    ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 34, in check_node
    for error in self.validator.iter_errors(node, filter=match_schema_file,
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                            compatible_match=compatible_match):
                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 448, in iter_errors
    for error in self.DtValidator(schema, registry=self.registry).iter_errors(instance):
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 384, in iter_errors
    for error in errors:
                 ^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/_keywords.py", line 296, in properties
    yield from validator.descend(
    ...<4 lines>...
    )
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 432, in descend
    for error in errors:
                 ^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/_keywords.py", line 275, in ref
    yield from validator._validate_reference(ref=ref, instance=instance)
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 465, in _validate_reference
    raise exceptions._WrappedReferencingError(err) from err
jsonschema.exceptions._WrappedReferencingError: Unresolvable: /schemas/thermal/qcom-tsens.yaml#
Traceback (most recent call last):
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 428, in get_or_retrieve
    resource = registry._retrieve(uri)
  File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 426, in retrieve
    return DRAFT201909.create_resource(self.schemas[uri])
                                       ~~~~~~~~~~~~^^^^^
KeyError: 'http://devicetree.org/schemas/thermal/qcom-tsens.yaml'

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
    retrieved = self._registry.get_or_retrieve(uri)
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 435, in get_or_retrieve
    raise exceptions.Unretrievable(ref=uri) from error
referencing.exceptions.Unretrievable: 'http://devicetree.org/schemas/thermal/qcom-tsens.yaml'

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 463, in _validate_reference
    resolved = self._resolver.lookup(ref)
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 686, in lookup
    raise exceptions.Unresolvable(ref=ref) from error
referencing.exceptions.Unresolvable: /schemas/thermal/qcom-tsens.yaml#

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/usr/local/bin/dt-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 158, in main
    sg.check_dtb(filename)
    ~~~~~~~~~~~~^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 95, in check_dtb
    self.check_subtree(dt, subtree, False, "/", "/", filename)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 88, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 88, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 83, in check_subtree
    self.check_node(tree, subtree, disabled, nodename, fullname, filename)
    ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 34, in check_node
    for error in self.validator.iter_errors(node, filter=match_schema_file,
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                            compatible_match=compatible_match):
                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 448, in iter_errors
    for error in self.DtValidator(schema, registry=self.registry).iter_errors(instance):
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 384, in iter_errors
    for error in errors:
                 ^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/_keywords.py", line 296, in properties
    yield from validator.descend(
    ...<4 lines>...
    )
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 432, in descend
    for error in errors:
                 ^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/_keywords.py", line 334, in allOf
    yield from validator.descend(instance, subschema, schema_path=index)
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 432, in descend
    for error in errors:
                 ^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/_keywords.py", line 275, in ref
    yield from validator._validate_reference(ref=ref, instance=instance)
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/jsonschema/validators.py", line 465, in _validate_reference
    raise exceptions._WrappedReferencingError(err) from err
jsonschema.exceptions._WrappedReferencingError: Unresolvable: /schemas/thermal/qcom-tsens.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251201084140.376058-2-bisson.gary@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


