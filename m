Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F27C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaGn2ueXT/ncMwVr6k78VIvGPTsfJDcVet1zMdDM6Jo=; b=iDp2lwbh9Nc0ZZQ4GvfJ+bY/KV
	CWAlKuPY5utydCkoMSUzM8g5FAR7YkTwDpylZMbaWxPtEmsOfXrvn6yw4W763F2kpsVFQrGmO6aAP
	mdu7B6mH5/JoKJeRY7RUTMIdJDK1vEVX8uE1gp1HaGnadaZIUo2b/HCS+tqipY2GOU2d43TrYbajZ
	mcQx8v2IS1H6duChXZWeWmTH7J4hpYUMRjwBMRqRShbLAAmDtbIQE/h6MJ6D/cM1rKELJbplXbIoN
	vj/PQioh7subLTZ++Ux5krpsEFrqC2KYtL+Oi8yRJl0cUVjvN+pVyqgnIG2wmCA1j9Wt/VNoQitNO
	RqHYuQjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSqY-0000000Dxnf-3ite;
	Tue, 20 May 2025 19:41:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSaI-0000000DvO7-1EVJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 19:25:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EE2A629E5;
	Tue, 20 May 2025 19:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCD4C4CEE9;
	Tue, 20 May 2025 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747769105;
	bh=/YQuD/zXoYuchGtOXAaMXzL86e5ZTR1Z9Yg6aUdHmaE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Pm03hirfXqvWbK011PvyDZTeKD4xh9DP40C0ABh/Ysw6K4+tq4abcOoIoCf0F1gGc
	 82Fb5HnxBy+bQUH3IAzfuz7EN9Eawm4UUWq11H8MUAh9KZiAY5m8NovoXz4SzLnNK1
	 wpxVLlCHpD9kfgNJOyrsuhqRgJipU4kGxs+WJxB/8/ZeA31BTTxj3ICMMZgXuUUXrF
	 Adh5Gst1HVJ3QHntXwLLmU0CdobimUXECalSIWjuUQxydJ9lr7Nkcmc207/6o6AQgk
	 K8Vp1fJwqpaY+pGsUqiWunkC3ZR6CajLGe+VGkn02DtTXzO9niJ0MdzAePbONXYh2F
	 WLiAll5knHuOw==
Date: Tue, 20 May 2025 14:25:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
 <20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com>
Message-Id: <174776907517.1215979.15639504513287893325.robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: stm32: Introduce HDP
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


On Tue, 20 May 2025 17:02:28 +0200, Clément Le Goffic wrote:
> 'HDP' stands for Hardware Debug Port, it is an hardware block in
> STMicrolectronics' MPUs that let the user decide which internal SoC's
> signal to observe.
> It provides 8 ports and for each port there is up to 16 different
> signals that can be output.
> Signals are different for each MPU.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl-hdp.yaml     | 188 +++++++++++++++++++++
>  1 file changed, 188 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl-hdp.example.dtb: /example-0/pinctrl@54090000: failed to match any schema with compatible: ['st,stm32mp15-hdp']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


