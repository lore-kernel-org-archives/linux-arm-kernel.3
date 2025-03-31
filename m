Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EA5C36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Po3ob5RoTF3xCVYeTQK/rpZiBiOQKoGkhKE6FaE9URQ=; b=PnUENRbjxG0ALSbCDnCox1dU1O
	Zfj1QdmeqJIiHJUYcGI5i9YBOwFQRgWArLK2POJID/Dwu4mkZ/RoJ45qGrIBXoGNnoqN8NgO/cZY0
	j+3NEx/Y3NTx3/BbK8gnHf0M2qjQ6sDZmtu2Pdqu//oPSgMS+g073ede13gY5snEWjBpg38ylFI7A
	qhZ3TCADdkK6zfEH0ZYm2GIs6aRS4bQzof3gxdF1dvWoBLBr7POlg7PCqOgVWsFjLRuUSfERn8m21
	OzkykWHdps+e5CL7uRnedHMvwTMrBEmtX+Lcbc9ef2PYHENCaIKPtWQf/S92OFYYmvK5yhV7UgPTr
	I+GFBF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9gz-0000000HDiv-3WtC;
	Mon, 31 Mar 2025 07:36:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9fH-0000000HDS6-1ffa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:34:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 358E8A42FEE;
	Mon, 31 Mar 2025 07:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2EBC4CEE3;
	Mon, 31 Mar 2025 07:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743406473;
	bh=tGc0yZ9S56lmGZ8X3yzmu/RRoHPLD+50b87kiWJPefo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JA7vlAxJVj2TwXGWhCabmFcSVxMEKKF3aRsKpopNTz2ticno+FLbcLVgFcmtf0Vas
	 By1vbkN+enGJyD3jRzncriHofarLHaGjIhoFKZyShCdI5FtUWgrXcSXJsDtDLfDrQ0
	 uc9oOBml+OtZAGgKPKGXE/aCQjL40uyFJfZcD2jhzFITcAe1IHQBckm7qwXfEUD49l
	 ON3EokiRJBeugtYhk2p7WaksPBaPuPVH9drZe1+KBb+NISycPFJoLzFPTzuyyTTTcG
	 U4ZMY5iPH/D8YR+QspDyTmmZG7d7IgiU0EGZx+X7xuBhF+RtBvshoTqg2ZsiXzF7vo
	 ckgiVFefF4O7A==
Date: Mon, 31 Mar 2025 09:34:29 +0200
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
Subject: Re: [PATCH v2 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
Message-ID: <20250331-prophetic-convivial-dinosaur-efb1af@krzk-bin>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
 <20250328-s2mpg10-v2-1-b54dee33fb6b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250328-s2mpg10-v2-1-b54dee33fb6b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_003435_527500_7814C07D 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

On Fri, Mar 28, 2025 at 01:28:47PM +0000, Andr=C3=A9 Draszik wrote:
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,s2mpg10-pmic
> +    then:
> +      properties:
> +        reg: false
> +        samsung,s2mps11-acokb-ground: false
> +        samsung,s2mps11-wrstbi-ground: false
> +
> +      oneOf:
> +        - required: [interrupts]
> +        - required: [interrupts-extended]

Drop, you should require only interrupts.

OTOH, why regulators subnode is not needed? Commit msg mentions they
exist, so they should be required. Binding does not change because you
added or did not add yet some driver support.

Best regards,
Krzysztof


