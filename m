Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A180CC36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46e1b62YEu2V3VHMgMii0f213DPbDdWd4UFbAdOJ308=; b=ePZ7bnK7bTNZ7h3FeFgD+Cyyfx
	lSY4fEIVAuGnjQMregmFs0BAHNwyYSv3YlsVfWsndWiW+nwhLItWO+x1emhreLeydhJnSmxBQoKUn
	8CNGnYr96e8Gcy59QCtLVkpzeFuDgriySF8n7TfzqyfI8r+6bC+BiVOXnDF2PDC3n1yopDmr7Wc+R
	4psAIp0N4IDNb9CoOIOSRJrYsL1Z0MHOuA03LmQGETovu4fm72EgvdRq2wZRLu+dRTDv5Ztz9U9o3
	P2TZ5+9nmrJrx+hjszdgLxGRwq9jwfLc84M2nV8st6GPZ1Gjb3pOeCNK/UDfdWJhfSVcmUxxGe6oS
	B6t39y6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Kf-0000000HAqK-3YzK;
	Mon, 31 Mar 2025 07:13:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Iz-0000000HAkq-2Kph
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2B9661120;
	Mon, 31 Mar 2025 07:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697F1C4CEE3;
	Mon, 31 Mar 2025 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743405092;
	bh=xT7WrDbAbzGj6vaDIChdvhzipFV59/v3gg7SXkyKn/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XSdeyP937ISbslf0eEzJY8M6DYJnTqjE+jVb60RjB5P67SAFNTShNRYCKBFASxLDs
	 W2oJaOvepv4bZhaaCbg0tOvgGZwzF1cVN+qQVTCT7O5MPS45emLqzilhLwBqoFhv6i
	 SEeC1N2sQeZxgM8u+RbduukDLjdBIcomOj+llpbpMsn3LokbNfZu4apPL1UH44eqWo
	 xEm/eqIa2LM17yDDFJmrxQfpq/EP6jAq6VVja97cFeVihSom8P/NmTNFsHKCTLHoH+
	 NdXSAwCcEipajZ5JX3OISZZvxSE4w1xl/oUU+VrCgkHk2hhvVWkQ3xmpNGagwvc6jM
	 k7ls3aKigRzgg==
Date: Mon, 31 Mar 2025 09:11:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: power: reset: google,gs101-reboot:
 add Google GS101 specific reset
Message-ID: <20250331-unnatural-tacky-mouflon-a1157b@krzk-bin>
References: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
 <20250328-syscon-reboot-reset-mode-v4-1-77ba57703ace@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250328-syscon-reboot-reset-mode-v4-1-77ba57703ace@linaro.org>
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

On Fri, Mar 28, 2025 at 03:15:19PM +0000, Andr=C3=A9 Draszik wrote:
> GS101 supports a couple different reset types via certain registers in
> the SYSCON register map.
>=20
> Add a binding for this.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  .../bindings/power/reset/google,gs101-reboot.yaml  | 32 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/power/reset/google,gs101-r=
eboot.yaml b/Documentation/devicetree/bindings/power/reset/google,gs101-reb=
oot.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..cbd0a1d9b45af0cb994d616c5=
6b96440c43ab971
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/google,gs101-reboot.y=
aml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/reset/google,gs101-reboot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 syscon-mapped reset
> +
> +maintainers:
> +  - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> +
> +description:
> +  GS101 supports a couple different reset types via certain registers in=
 the
> +  SYSCON register map. This map is retrieved from the parental dt-node. =
So the
> +  gs101-reboot node should be represented as a sub-node of such a node.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Just const instead of these two


> +          - const: google,gs101-reboot
> +
> +  priority:
> +    default: 192
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +allOf:
> +  - $ref: restart-handler.yaml#

Missing example... unless you are adding it in the other patch to the
parent node. but then separate schema for just two properties and allOf:
is really too much. Altough let me comment on the other patch.

Best regards,
Krzysztof


