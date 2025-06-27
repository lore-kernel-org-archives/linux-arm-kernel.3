Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883A3C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 09:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqKw9XVhR+qxNQYtc8D+VXobeJwuIJ2LC19rg6NaqnI=; b=qutGTveS3fLD6pPNshJLBUEJhx
	HtgbESJ85PvISif2O6nM4NKPaEcc3zdM1cBgVPON1D4VzWF9WH/bTs6twkgNxupPTXsdk2KxiyB+1
	I+yH2/i8RsC353enj+cFZuuW1sDIoLb1eCfYs92pi7CsNzCsACwHsui9tFMt2WJAhu0+c1heSJGj9
	yLj0MPmcX7ryaWM9GPwzt0zBku3+5vXgLnyeOUKnN3n5YKLxLmi4aXo7prfma0qo2rX22xteV1GcR
	8uHD8ZBqA/v5i3qJullHXRR7Hl1qosKKztfTgUgToEb2iZSVvMXOFZlzrzbAhjH4dHwR1K7LU9Nx1
	5FzFs7+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5Si-0000000E8Gc-0cqt;
	Fri, 27 Jun 2025 09:33:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5QP-0000000E7ti-0bFM;
	Fri, 27 Jun 2025 09:31:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74EE161120;
	Fri, 27 Jun 2025 09:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D37C4CEE3;
	Fri, 27 Jun 2025 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751016672;
	bh=r+cMuNgB6MPRUwQ4haejjrte5YkesaM6//0oKaMCXtk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=GrClMbDZTNQa2dxZzyHT23wfQZ+Hq5XA13kLv4KS8KBYx7TTbUDfI8C6vq3Oxm0XF
	 8AJO0QYWYhMZKpOV+kULgKgUXiUoEeL+j7szQna4QkManv7XrVS0TQ8FkwJMr+GYFu
	 DcO0X9OScLdS2NdTMXQUszJLmjcesqmP32f4ZBF+EKF0wOvRGKpkhdKlr6ddqKsOyn
	 h4XIOC+OuhWqDmexSEZm1+Ci/oDpu+WYu6TN60C741Q8ytqqquOH71FnIw8ymTmQAL
	 GC61zMQnZTnqSwHC9fMawPllsApHQWI6nFKqGokAm3k183VcW4/7h8/Cap7fELVmzw
	 uPuzd4b05ckDQ==
Date: Fri, 27 Jun 2025 04:31:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, Li Jun <jun.li@nxp.com>, 
 imx@lists.linux.dev, Lee Jones <lee@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250627-dt-bindings-db-v1-1-d5c7072acbee@linaro.org>
References: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
 <20250627-dt-bindings-db-v1-1-d5c7072acbee@linaro.org>
Message-Id: <175101667037.2392362.10689943517425489653.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db'
 suffix duplicating dtschema
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


On Fri, 27 Jun 2025 10:01:51 +0200, Krzysztof Kozlowski wrote:
> A common property unit suffix '-db' was added to dtschema, thus
> in-kernel bindings should not reference the type.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> RFC because this depends on dtschema changes and should be accepted
> after new dtschema is released with this merged:
> https://github.com/devicetree-org/dt-schema/pull/166
> ---
>  Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml: audio-gain-db: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250627-dt-bindings-db-v1-1-d5c7072acbee@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


