Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEE5606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TraeiQ9z;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BZc30TXs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IF5JmCW1BC4BgBsc5mQFMDf74ipcvoOsW/SYkFaxrng=; b=TraeiQ9zLulZ7wdWjbyERtoMYX
	KKB4nhMXwQng5Qpz66P+nGYAv4dlj7V/tXL66oC4FQzfl0FwK3af/BRB5S+rNttur+LtMvleOyZ6X
	O0lfj8TpqcFXpas62lhFM4bZ7i9bCk8bDL7YK8ShBZvwWxqig6ennYaH3+Y6Enn7D7+vBrfr7EdjY
	/VG56pHdCZPC33Rl37RIJzGCVMstAhP4MP52PyrgMcbh+kglbI3oEzubT+CltNj8450nEZrrO0gze
	xdOcV1soKB9GEpVgl0GAdiJ63Ios2I1eY7dZh7x4TvGRsUOashjdD9PH6L0pX0FBAuSqqNXH0K8RR
	t3M76L8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOca0-00000005j1Y-0gFB;
	Wed, 04 Nov 2026 15:07:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcZy-00000005j1D-1iJ7;
	Wed, 04 Nov 2026 15:07:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE78B43773;
	Wed,  4 Nov 2026 15:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8953D1F00A20;
	Wed,  4 Nov 2026 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793804829;
	bh=IF5JmCW1BC4BgBsc5mQFMDf74ipcvoOsW/SYkFaxrng=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=BZc30TXslnJqS4sHCg405QqTCny7j/2zxR/saesz+OqWOde9X+qFA0WELQX4/T0bT
	 pm8RDbnBJ0dpNfuQFDd5WaFBighRep8V5vPi/UZ881BzFwaenZ3ugzJrqvicsjJEkN
	 onxcrMOVAg5oLbhFuuW7076Y2/kIMF4E6Tcrsb/1hK8H3Cy9vo0IPqx6smG2KxjSe6
	 fCvYuWZ7tV3eRNcCdLhcAvMLv1DKR9ML1vJIbR/B/zjZ60wvSEMmAPfrD2aMKynRLm
	 dkm+4Y/STrsPEU2IJXXf35CxR8Jsv3YVisRphf5ZYDY3OwKSSeBH9Dy7G74pOUESn4
	 dSq16UKUy/IVg==
Date: Wed, 04 Nov 2026 09:07:07 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Dom Cobley <popcornmix@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stefan Wahren <wahrenst@gmx.net>, Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list@broadcom.com, Mark Rutland <mark.rutland@arm.com>, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Ray Jui <rjui@broadcom.com>, Will Deacon <will@kernel.org>
To: Ian Rogers <irogers@google.com>
In-Reply-To: <20261104030300.1140180-2-irogers@google.com>
References: <20261104030300.1140180-1-irogers@google.com>
 <20261104030300.1140180-2-irogers@google.com>
Message-Id: <179380478743.1076165.493810572910679874.robh@kernel.org>
Subject: Re: [PATCH v17 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi
 AXI PMU definition
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 03 Nov 2026 19:02:58 -0800, Ian Rogers wrote:
> Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
> found on BCM2835, BCM2711, and BCM2712 SoCs.
> 
> The hardware exposes two MMIO register blocks: the primary monitor
> evaluates the System fabric and the secondary monitor evaluates the
> VideoCore VPU fabric.
> 
> Co-developed-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml:15:58: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml: error loading YAML: mapping values are not allowed here
  in "./Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml", line 15, column 58
./Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml:15:58: mapping values are not allowed here
make[2]: *** Deleting file 'Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.example.dts'
Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml:15:58: mapping values are not allowed here
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/linux-dt-review/Makefile:1726: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261104030300.1140180-2-irogers@google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


