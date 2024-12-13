Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C209E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 18:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRGmrXJDkPkdQQ1g92QKeQzS0fSdQyrzj3l+xobyjNk=; b=HTZNz1sRbj0KpNtl8Gm7CoZhbr
	vfpk38PigKSBqFklM1k8frWtH0KE5l984anvZuLdtovq4U3+608d84zbg1d3dnb7a1m2c73pHT+v6
	7CW3pFgBBAwzYqEAu29Y2xejQsTZvMZKcp6cNAN2onbRKkPdohNMEbtof/cF7MepGVvEH/qf4MAv+
	HU3F2grnC4XCWLkeu+hw43dewB37gDgvpIoKWyGlGuPTW3B+WM250Ig8u9XCTBBR/Udic5kdqdR8U
	FG45FiSrz29igI5xEfA8OpPvVvMz0asLWlz39X9N8tHIxb+9uKJExbo8wZtcVYJTLeSUyPcrmliPO
	nYCGZdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAO1-00000004gSc-3YrE;
	Fri, 13 Dec 2024 18:27:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAMw-00000004gFg-2veP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 18:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 694335C4BCA;
	Fri, 13 Dec 2024 18:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D661C4CED0;
	Fri, 13 Dec 2024 18:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734114387;
	bh=4QlQ8Ys8G2MWmjm47JxPe6RF3jcZXqGLZ9LhHvUiEYw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=l80XU+eziWwpelejTM/N5sXcHPuLiJKP62nQeM7hEPk45myreewJlbvwH7+PcWozZ
	 sWpq5HQtC9PPIOg2m3p5wYw/JO3EiGtuNajgUiUJmqhfz0rsjJTG5rd+bRraxN9IT5
	 aB9FzHXvb8B8gyYbqJ/ulSywHaQx6Ms9pVEpmJZnDi3ewVk1Tt7LLtJ2VPOBx+p6BD
	 g8W9d/IPe+TJVuYuIbwN0uNgoQsnCgY2ZzsVuCAEUrRNS2mTvn7xxhU5vRDx9m4Npz
	 o0DYxrvbxIMELDA9hinjFLEb+OQOiQNsrwRmGHMXKrzf9/OeCLoDp2Dyml9vjDyl8X
	 YroHa82/vvJjQ==
Date: Fri, 13 Dec 2024 12:26:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, 
 linux-arm-kernel@lists.infradead.org, kernel-team@android.com, 
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
In-Reply-To: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
 <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
Message-Id: <173411438555.1847522.16456703753774291235.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: mfd: syscon: allow two reg regions
 for gs101-pmu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_102630_823752_9C2566C4 
X-CRM114-Status: GOOD (  16.73  )
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


On Fri, 13 Dec 2024 16:44:39 +0000, Peter Griffin wrote:
> To avoid dtschema warnings allow google,gs101-pmu to have
> two reg regions.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> I don't really like this patch, but also didn't want to submit the series
> with a dtschema warning ;-)
> 
> Possibly a better solution is when Robs patch
> `mfd: syscon: Allow syscon nodes without a "syscon" compatible` [1]
> 
> gets updated with a v2, we could remove syscon compatible from
> gs101.dtsi (an ABI issue). If I understood his patch correctly,
> it would mean this yaml update would then no longer be required.
> 
> Let me know your thoughts
> 
> [1] https://lore.kernel.org/lkml/20241211-syscon-fixes-v1-0-b5ac8c219e96@kernel.org/T/#m5ad1ed5c69f693d2a5cc54342a87fbdf3df756d2
> ---
>  Documentation/devicetree/bindings/mfd/syscon-common.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/syscon-common.yaml:68:3: [error] syntax error: expected <block end>, but found '?' (syntax)
./Documentation/devicetree/bindings/mfd/syscon-common.yaml:69:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/syscon-common.yaml: ignoring, error parsing file
make[2]: *** Deleting file 'Documentation/devicetree/bindings/mfd/syscon-common.example.dts'
Documentation/devicetree/bindings/mfd/syscon-common.yaml:68:3: expected <block end>, but found '?'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/mfd/syscon-common.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/mfd/syscon-common.yaml:68:3: expected <block end>, but found '?'
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


