Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A36C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79jrmqKEphR8HYrJwAcmNKOd1EXcartNm7MW+TrWZ6Y=; b=Ub0RXyOUanT4TiUCl0o5wxKMPr
	TF1XFXovwxKBHnwxoxlHnxyEgvrju/a2LmQjQDXh+mMuJBcfLyZdLFs3/P2NIZqkQ2QNAx9zIv+55
	Y9Ed+ruGwCxRdqwDPP3MSmfLXobuPr2OSv1V1W8t7hAATz53xuze1RPqOwr2DNjOj60pp356a1LgM
	7bJWYRou68LPdZXSlTl00g83BbNFUfGQWCNpL+m7lP6B+hjsa+slCAPCkt27jW42xGIJXO4Xbdcqa
	tMKH/2FzVHzFM8arRkDBXBwoDbcEFaM/TWUKc/ucfauh10h4Kk7UFi0T6C3RO06xPUA7nWZXMcQCr
	YtXhKr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfb2k-00000002bpp-1WMZ;
	Wed, 05 Feb 2025 08:45:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfayz-00000002bNq-28Lk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:42:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D6BF5C59C2;
	Wed,  5 Feb 2025 08:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A52C4CEE6;
	Wed,  5 Feb 2025 08:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744924;
	bh=mRrKZ9WljrGXj6hWTjkApoQBg8woTOiVTba7VjhmxUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgeAwMJJYJbhgvPUx405gRQ2X+5yHHilHjRrkkqGrqHUTFakI6/0V+O8f21HdqWnu
	 PPCMy+0U4+fFH+IAo/cneZ1fr0iQQFCKXw2TLr8Q4Mb7CbLg1iyd/BnjDZ0d5TYcTd
	 sq3SSIll35rK2C3JUUFudCmc5HFoMyR7DcBx8/LNyUglDF4Opsmp3Yg5gn5igGWRI/
	 ytYbtVBtU3zRNt4JGBH+wQqoZshsG1bjPWrPZVf4LYHdmJTlUL+0R1oYqsy/5ryRuw
	 ahzpSmaznrPG0wlq7dGDfDOgtib+TlRdmh/wM2JxzAbzazjBsTkwsygdqQlED9n9KI
	 RzvYmymp47y3w==
Date: Wed, 5 Feb 2025 09:42:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: serial: samsung: add exynos7870-uart
 compatible
Message-ID: <20250205-strong-alpaca-of-success-60934c@krzk-bin>
References: <20250204-exynos7870-uart-v1-0-06be6aa96284@disroot.org>
 <20250204-exynos7870-uart-v1-1-06be6aa96284@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-uart-v1-1-06be6aa96284@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_004205_590272_58663A49 
X-CRM114-Status: UNSURE (   9.89  )
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

On Tue, Feb 04, 2025 at 02:08:45AM +0530, Kaustabh Chakraborty wrote:
> Document the compatible string for Exynos7870's UART driver. The devicetree
> property samsung,uart-fifosize must be mandatory, as the driver enquires about
> the FIFO sizes.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


