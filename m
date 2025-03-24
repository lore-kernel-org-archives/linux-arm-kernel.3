Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9911C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dc4mPveff1IHAG1A+Lkmj0HP1FzC7Aejqx8vHkJuXc=; b=hsqe51R1yr9CkGiDXSHlvw6AnK
	TS88x+Vzj0xcgAMV+ATbdBj6TtHM3v+T9O6CeZka2XTeeKDCDKiogJrd1bLlnaFZyDv2dfYXCAfKg
	ht4/FZhdRtVdPagPEogQGUQOEisMAerVjiXU8dTt9rmF2xmKcL+xxQHU9ru9yRTPUrllNuFrTOkx6
	NT7I4nP5JpKUSJaBysMiyB684o8X3yZ0xVwvfU4TEOO5bbseEs8ijwsFZXKHlONCNudxNfR1F59IS
	JhDfLWQXvV5/rvdtR42qfYAX6uxXR/hVEz3WZuTS3LCDYTECqc1iLyL1XMYM8uZRU4NV40pmbeLr+
	9/pmXp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twihr-00000003NZ5-0uSF;
	Mon, 24 Mar 2025 14:23:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twig9-00000003N9t-1rHR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 14:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0320C61582;
	Mon, 24 Mar 2025 14:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F4EC4CEDD;
	Mon, 24 Mar 2025 14:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742826084;
	bh=BUz8zYXf16hLfQPBxgTj8QMJv/VwcmDZZs0OAPRiMrc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aEp+e2S2Mt5oiqdGcYgXj22r5GuOik2+/7oBiJTp3js7wmt6R/EPVP7RrmIsPjT/d
	 RtEXQPJXegXw9zanTSfpD1IMnJNDP3kDC2b31xYnNpLbUJRVYnFl8VedB9MH/HwsRK
	 ajc7p/shnr8u603dLAsvdrNl7lqm0CvOg4MxaY98Zu314I3cEgjQr1Jx/HSmoC7gsy
	 qIyKp4Efh70CMLHQ14x2hfmeYYspmORhbX7q3xFfINGgnM8xn/8r3OYIQXeY59qrlL
	 NAiYUH3UmsSKI7gGFfkNsUy75IMg7sEnvrrQE9VSP7f2IvC0CX/CdOFzzYpuP01R5C
	 GG7PkYK2LXqsg==
Date: Mon, 24 Mar 2025 09:21:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Fossati <thomas.fossati@linaro.org>, tglx@linutronix.de, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com
To: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250324100008.346009-1-daniel.lezcano@linaro.org>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
Message-Id: <174282608006.6289.10388719224772938093.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: NXP System Timer Module
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


On Mon, 24 Mar 2025 11:00:05 +0100, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/timer/nxp,stm-timer.yaml         | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timer/nxp,stm-timer.example.dtb: stm@4011c000: compatible: ['nxp,s32g2-stm'] is valid under each of {'items': [{'const': 'nxp,s32g2-stm'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}, {'items': [{'const': 'nxp,s32g2-stm'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}
	from schema $id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250324100008.346009-1-daniel.lezcano@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


