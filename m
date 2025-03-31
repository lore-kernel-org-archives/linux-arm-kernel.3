Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78F1C36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/yOG+yWuHdV2l/zlKAWpHk5hBX4ETVfSf1Stdd263k=; b=Y7XkJ9BA9mNSeX6qwfzTR3mJ4X
	pLIOqIVfx6y4GqdR6LWflF4tD7axGfELUWR6GbXc4mN8JqljfXwuarqS98qJVc1Siy4mCrOLgAPN6
	14YVll+U2+omOJOw7oOwnrNsAaEuwWIfudoF+YX19PjcQlRDSZrzfXnZK8zXTVeC6tyh0QFImaCO2
	0O0UYWtsxghMDZJoxRO165KkDE7+j2YZ/P7v3hhF32t1JSMCHV83V87Zm0JEHfSzjmn0x5HF56Jwd
	28/FqpCb9stDPYzx57mO+avk/kvmpvo9jkeJ/fvEKhT7r8/V6tz5HmuV0+eucmkNKBBaekLkehN45
	sq33NzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9kN-0000000HEMi-0vGn;
	Mon, 31 Mar 2025 07:39:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9gG-0000000HDdC-3eq0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 408C4A43006;
	Mon, 31 Mar 2025 07:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBB2C4CEE3;
	Mon, 31 Mar 2025 07:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743406535;
	bh=A9Gk5MXC1bSvKeS45s1VhPpZ/lnbaWeef++2Cj5TGAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pilpS5yB/toibhVDR8rY0m7ycyfC5hawxGsTGDW/VPp0f1Xd6BKxY29kHD/DvmCYU
	 dl/xdf0J5NUGnUy2vgBGU+5ggVuvsJNmRIltssUaNxPpa2576LurQgH766ty9dK6re
	 vi9L7PFdeQy0uoon7VQQrgw6uIJuEIVETMXoGTiAPreGmDr19lUNY7MCVkTf0amHfk
	 7eUmO703he7zl/995od8Qe/sqSJAn5WKM6XP3ylOxWa5vb3YrpWtPNim6evjS8sxuJ
	 6jvitXsd411vVm+0fGLlsT/ZyCjycmWTgmUfyScux49+i5TYl1lqeN6PWwejHha3Yj
	 tgqxnHr1lczdQ==
Date: Mon, 31 Mar 2025 09:35:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 03/32] dt-bindings: firmware: google,gs101-acpm-ipc:
 add PMIC child node
Message-ID: <20250331-shaggy-mutant-scallop-cb4866@krzk-bin>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
 <20250328-s2mpg10-v2-3-b54dee33fb6b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250328-s2mpg10-v2-3-b54dee33fb6b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_003536_997364_F813856B 
X-CRM114-Status: GOOD (  13.21  )
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

On Fri, Mar 28, 2025 at 01:28:49PM +0000, Andr=C3=A9 Draszik wrote:
> The PMIC is supposed to be a child of ACPM, add it here to describe the
> connection.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml        | 17 +++++++++++=
++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml
> index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..5524f2af5bda2d29b5113f8fe=
14ece7f02366a60 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -27,6 +27,16 @@ properties:
>    mboxes:
>      maxItems: 1
> =20
> +  pmic:
> +    description: Child node describing the main PMIC.
> +    type: object
> +    $ref: /schemas/mfd/samsung,s2mps11.yaml
> +    unevaluatedProperties: false

Drop these two and use "additionalProperties: true".
> +
> +    properties:
> +      compatible:
> +        const: samsung,s2mpg10-pmic

Best regards,
Krzysztof


