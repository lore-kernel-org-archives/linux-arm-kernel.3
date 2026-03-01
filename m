Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F209FD0073
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 19:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CePlw5M3mDEqqz0hv7DWEnMkF8Peml7Fstnsjx9vx1E=; b=1rup/xrF7ONAoPPf1HofZbipu0
	5Hu7aDSNN87vkM5kynsIZc0tBl91tdrRUlkiMt5Hh1G1wXja+u/H8432KT+qOeirDlH7RDGPoQ8xH
	Kx1N+Iix//7nGmgCyntZzAhZU8PJGXKrnJzum15DXxAWnq5cnyT+iI8SOv+i+9D1vRKd4AwE53u8b
	mRAbWVFZZbqqTaEKuUuRJtZ2spgU+MAUdjih9/pfpAsc2WA6TmU5AfWaWhWcEHDvhG++NAx/KIlRn
	nlXNohub8aeP5sk1MuR7HI2eYtTEe9moPx4CY/Nnhv1O2KW951p8lUQiBGnx2EChMcgmbKg7+ySxK
	QkJpCUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwmYP-0000000Boum-1CKF;
	Sun, 01 Mar 2026 19:34:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwmYO-0000000Boud-0Wrr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 19:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13AD760008;
	Sun,  1 Mar 2026 19:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D72C2BC86;
	Sun,  1 Mar 2026 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772393650;
	bh=7rbVOD75vPzOlqdIY0xNu9uaaRvyRGffFSeHa031auU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qVPauTa9GxT9y6KpV/kICjl+slqdqbPZ8z6sTszN2ExQwwLOSMFkdXAEkRrcMk5v+
	 qlBiyS7UUMcdBCqjM0hdH1czuXF+PC2BkXKMrXoGcfTgeTppbgdT2qNWKn+hThkZLI
	 0aU0xSo5SL3TxiyiuO2aUJXC0dMkhQA2nHUpxULIXqvRdQJW8GoJHklahpKIxElcXs
	 mg5QoJeyGrq237T9nfFEaGg+/rjNKy4ePKPIacVuU7L9PB9i7OGHL6Xov5W4FnAwvD
	 iupM/vdrhb16pAF+U5s6lmoOZCUyz8V/A1Z+mz9SsYHTZSC9aMfk2NokYN1c3GPz8e
	 kgfpfmXa8QeVw==
Date: Sun, 01 Mar 2026 13:34:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: David Heidelberg <david@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
Message-Id: <177239364971.730877.1130326937114423321.robh@kernel.org>
Subject: Re: [PATCH 08/10] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
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


On Sun, 01 Mar 2026 18:51:22 +0100, David Heidelberg wrote:
> Introduce more recent STM FTS5 touchscreen support.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/input/touchscreen/st,stmfts.yaml           | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml:58:1: [error] duplication of key "allOf" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml:58:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/input/touchscreen/st,stmfts.example.dts'
Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml:58:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/input/touchscreen/st,stmfts.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


