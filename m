Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03787C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhDDMWGQfoN/IoETady6spAHB+S/e2zUwubwvYhAa/U=; b=UfO5jshQnosQEz0PLwJ3RHNGor
	PkcXu7RAjv24ssLDq1zNqlGa+RNXRJBZVQ2iYMT3yE74wEFfTdDtVec2967jWY2Pb3cw56MwW9niU
	ezhoQmVjcYWa+Ui6yeC/yRtxSsilrSQiXnnqXQSzEf/sWYRtKR703EzvCvXI0oFxHiovMakmjvpel
	MM97llag9Kr1jTAuhTDwSW/7hslwhUP0ZPj4QCCx8zh4djaYq0Hc58p8HYNZgcIIQE//Cj2xDZGdV
	acErNZkhx2R3/BG2eqNMP/7Kpu1GAysiiWSIUhwX/NvqZceozdL1+f2ZflwbNmisXvCzeACP0aZrp
	WlEzNjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fxJ-0000000BeWa-0KgC;
	Fri, 04 Apr 2025 12:15:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0frw-0000000Bdp3-3T9a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 12:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D62B061127;
	Fri,  4 Apr 2025 12:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516CBC4CEE4;
	Fri,  4 Apr 2025 12:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743768595;
	bh=wklgCHdEkZc8IgfK1ledIFfG+/zA4q5CE9+JLRTrhNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ev9RmMqfhL/elbuW7Mk1wSG8cFGsdTVP0DlovxjTUBEexSqhtge975qEFChTHuWSd
	 DwaFwP+oH8Wx9OakYlD8Qkfm0k6jOofcvt73HY/gVOeL664BcMVbLmAxKJ1gRcV242
	 mjO4GdtG4Ql1aTWCrpPSgSnLjLq+pR0EOUlm/B5s+g9JGcEhj59RhP5zoctzLxZ/IC
	 4rXkKEcLzzMPh1f2koJqZ3EJhBEmQp22ugbrh9wZfdRpwDDheVeiU0IFSHxed1NZkZ
	 x7o9Wn127Tcyrq+TpVy3oE4ISB36dPm73+5KLZPey446OENxrRFSxxZ0COwuJCEScH
	 aFxV2c1djmPuw==
Date: Fri, 4 Apr 2025 14:09:53 +0200
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
Subject: Re: [PATCH v3 03/32] dt-bindings: firmware: google,gs101-acpm-ipc:
 add PMIC child node
Message-ID: <20250404-agile-thistle-albatross-6dc93b@shite>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
 <20250403-s2mpg10-v3-3-b542b3505e68@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250403-s2mpg10-v3-3-b542b3505e68@linaro.org>
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

On Thu, Apr 03, 2025 at 09:58:55AM GMT, Andr=C3=A9 Draszik wrote:
> The PMIC is supposed to be a child of ACPM, add it here to describe the
> connection.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> v3:
> - drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
>   'additionalProperties' instead (Krzysztof)
> - add some regulators to examples since s2mpg10 requires them as of v3
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 35 ++++++++++++++++=
++++++
>  1 file changed, 35 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


