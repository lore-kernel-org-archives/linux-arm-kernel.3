Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17DCC36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kh+Yz746CJP0t2LaqwAgYhCRlQN91DBejOzWJ2uy/tg=; b=1pHZPKCjV8vjMquEmjFsCXBuwB
	/UHe3P2jUvqix+UsBw8aKHxbNMVpVxrVc3WDe8KVuPo+wrgbIZ2MtiFg/sV+53VdUUIQvsvlc34ow
	a9XZFhwB+5iVDVdG/y+WT+ydwQc9j5uOtXhfDCpgo70HvmkgONSMCT7xGrnCHRGyn3nK7qQUTQv3F
	ZtBtPIR8HOVQFzyb27F1CILd94wPELDRkh7+5U98DrL9PFGNYMXwGPvelt+S1IWxN86PemRYoLH/V
	oaX1NpZ9dXvTObzyZocVfFt7zJwHt3BCP+beVCzdY6qIzo11Q1BaXRf+JcxJuYw6c8nqFMlDart7o
	Ol6Uovww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9RO-0000000HBYp-0Tcg;
	Mon, 31 Mar 2025 07:20:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Me-0000000HB6A-2a94
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:15:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C16F5C5A78;
	Mon, 31 Mar 2025 07:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1769C4CEE3;
	Mon, 31 Mar 2025 07:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743405319;
	bh=U9WwColyPjE0PpqjI7kbqYiBlOxCoADRrn2LMrMsr6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ay1EarCvuM4L667uBXmzflmFp6Gpw+QkTMwL8AEnelkr5h9Rs4pnLyMNxJc5fSia0
	 4P4suRMQCzZ+F8Lc7OkB7/Rr5+rbsfMR2kBNvnds9HXdtBvtI9qA+WzMag1hTEqquc
	 f/pJOOT6/cn0u2zA9zcQlMvuaroEopWI8xLGcy9BWxH1FmCn6HGtbBWYvsVnPr39MR
	 bXBE5Qi6jJl2cIDHP1pxKjTv9Fu1ShNBolIxr0srHHjSAU9i+ugaoxv3EdGT2PVzKn
	 9LMt9OvneCmz8DWaLTBbD4q26Fmf2Ag2naHinrAmsxsfLPCktVsx80hdSdvyuhkLwj
	 MvCmukjMnIfWg==
Date: Mon, 31 Mar 2025 09:15:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: soc: samsung: exynos-pmu: update
 reset for gs101
Message-ID: <20250331-curvy-daring-urchin-aeafa8@krzk-bin>
References: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
 <20250328-syscon-reboot-reset-mode-v4-2-77ba57703ace@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250328-syscon-reboot-reset-mode-v4-2-77ba57703ace@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_001521_138247_A867D3D1 
X-CRM114-Status: GOOD (  12.32  )
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

On Fri, Mar 28, 2025 at 03:15:20PM +0000, Andr=C3=A9 Draszik wrote:
> Add the gs101-specific reset node, allow it on gs101, and disallow it
> on !gs101. Similarly, disallow the generic 'syscon-reboot' on gs101, as
> we want the specific one in that case.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml | 21 +++++++++++++++=
++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 204da6fe458d2d4bfeee1471ebc5c38247477ae2..8c7362cf3eeab11f6bb13a27e=
b295d5ee6721b71 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -97,6 +97,12 @@ properties:
>      $ref: /schemas/phy/samsung,dp-video-phy.yaml
>      unevaluatedProperties: false
> =20
> +  gs101-reboot:

syscon-reboot

> +    $ref: /schemas/power/reset/google,gs101-reboot.yaml#

=2E.. which leads us to the existing node. Just use oneOf:

oneOf:
  - $ref: /schemas/power/reset/syscon-reboot.yaml#
  - $ref: /schemas/power/reset/google,gs101-reboot.yaml#

or actually better:

additionalProperties: true
properties:
  compatible:
    enum:
      - syscon-reboot
      - google,gs101-reboot

Best regards,
Krzysztof


