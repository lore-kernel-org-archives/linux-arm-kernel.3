Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B49E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4sbUPQNC9hAyQ6x4UVwsrJaPNSRNhT2z6caFe+bvU8=; b=zhb9ZhSEDXmqklJGYLRATeXZsX
	m/y7sYsLaWp78UQVZGPLYViPa82f7VUmvJ7PyFv6pw0NXZUnTcZ7bAyHSnFGKZ/iZi8FQ7alWjyMi
	m6XicyOLDmVS2eymPZdddHhkLNP3hpcNgjBK1IH3l0B209dpt+iTPO97D/hOTF90kDVqEEaW7DRlV
	1E6SFi+8DyIrTUe8VhfN1G3Tkz+RNox4eklFXStDEp/d6CqiMouCMxceExfQ98CrMcF5knxnUBFVk
	csruODvxiOZbqhYHf/u3SenKKXtDuhq51EBbis4mM1tCQykTGJy+3PYGymseHEq8lAGW/l4jDHTg6
	Aw8pkfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYqD-00000006qlT-2IP3;
	Mon, 09 Dec 2024 08:10:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYkA-00000006pAy-0Ixw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:03:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BDBB1A4013E;
	Mon,  9 Dec 2024 08:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438B0C4CEE1;
	Mon,  9 Dec 2024 08:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733731429;
	bh=M1eR8jxcP0+FliXIViYEmIA5DCYCTpnmD97iR8K5UJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQ0qT04SiPOItYVGh8E2+jGDWnrCk0aQ9ZdN6XxZvtY11m5i3RHyRywMC/UO9W0fR
	 CaDmJy9mj7xnkTGDuXsewAkhAYa+HMAmHwCogZ7+4TTmi4ZK9pBaxIvI+i9PKuPwI7
	 v9JvsdPu8dLZlBEIcMTi08rAGcZtDAT6F1FiaIe5wFiLmf1F+bfinFfEEkfa3rX8Po
	 0/196ou4YWtL3Yee3BZbi4nP9kemRbFeiXTtGnnj7/AGtKqRtcUw8qUaRH5yYn4W+4
	 v+dCGpTdRAc5LfHBmtKcUg+WSNRYe0EhSF3d+TSdNInUkKYdT4Z2YS94PJq0lNYLi4
	 zOYyCYt5W8c8A==
Date: Mon, 9 Dec 2024 09:03:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org, 
	javierm@redhat.com, tzimmermann@suse.de, daniel.lezcano@linaro.org, 
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Subject: Re: [PATCH v3 1/3] dt-bindings: firmware: add
 samsung,exynos-acpm-ipc bindings
Message-ID: <k2pnpu3ef2rgy6wre2qrearwmetzb4v4meiyqpy7oyg45hohlp@kmnzulhbmdk6>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-2-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205175345.201595-2-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_000350_254941_59325720 
X-CRM114-Status: GOOD (  22.53  )
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

On Thu, Dec 05, 2024 at 05:53:43PM +0000, Tudor Ambarus wrote:
> Add bindings for the samsung exynos ACPM mailbox protocol.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../firmware/samsung,exynos-acpm-ipc.yaml     | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml
> new file mode 100644
> index 000000000000..bfc9b4af9ea1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/samsung,exynos-acpm-ipc.yaml


Filename based on comaptible, so google,gs101-acpm-ipc.yaml

> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2024 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/samsung,exynos-acpm-ipc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung exynos ACPM mailbox protocol

s/exynos/Exynos/

> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description: |
> +  ACPM (Alive Clock and Power Manager) is a firmware that operates on the
> +  APM (Active Power Management) module that handles overall power management
> +  activities. ACPM and masters regard each other as independent hardware
> +  component and communicate with each other using mailbox messages and
> +  shared memory.
> +
> +  This binding is intended to define the interface the firmware implementing
> +  ACPM provides for OSPM in the device tree.
> +
> +properties:
> +  $nodename:
> +    const: acpm_ipc

Drop, no schemas have anything like this.

> +
> +  compatible:
> +    const: google,gs101-acpm-ipc
> +
> +  mboxes:
> +    description:
> +      List of phandle and mailbox channel specifiers.

Drop description.

> +    maxItems: 1
> +
> +  shmem:
> +    description:
> +      List of phandle pointing to the shared memory (SHM) area. The memory
> +      contains channels configuration data and the TX/RX ring buffers that
> +      are used for passing messages to/from the ACPM firmware.
> +    maxItems: 1
> +
> +  initdata-base:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Base address of the configuration data in the shared memory.

If you really need this, then it should be rather encoded as part of
shemm phandle (phandle-array with describing items, just like syscon
phandles are done).

But OTOH, I don't see why this is needed at all so far - compatible
defines it.

> +
> +additionalProperties: false

This should be placed after required block.

> +
> +required:
> +  - compatible
> +  - mboxes
> +  - shmem
> +  - initdata-base
> +
> +examples:
> +  - |
> +    firmware {

Drop

> +        acpm_ipc: acpm_ipc {

Drop unused label.

Node name: power-management (based on your binding description)
Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "google,gs101-acpm-ipc";

Best regards,
Krzysztof


