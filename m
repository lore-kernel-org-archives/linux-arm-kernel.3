Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6FDC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PY7cZFKZneUTeLOOtsZxYXOiYs5XUMlZCu7OspbPofg=; b=tC+jFloQQgToi2m3VAcHqs8vZ3
	Q2gECrDat7O3r2Cm4faSjXp/7MtK4XpzcLO8ZPttxKgP2tluKL+U5zCNDL3bU1C3ijQzlnxZln/wC
	BwMy7wFDmqZ6R9TjK4jXVV+gQxyfAU9FLJDB88NTSaXEbgWwM0Klw+6W7GTPCza7pRzlrcaxUjHRe
	LjFwue4MkZkwdus/HHxLx0pLovlzfSZJPvJbPyzkMzFZMyb93R6kf0N5uPk5d/z2Wt6elXgS5PxFq
	/UK2Qg4aARjrdu10HsQZTA2YR3yTwL9FowU3yYVC0w8WBvPLyTOTJE3DgfKxUYYkOMJpBGmETbx+A
	Qpm6oNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfb5V-00000002cQL-3AC3;
	Wed, 05 Feb 2025 08:48:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfb48-00000002c8E-1wMF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4DAD3A43268;
	Wed,  5 Feb 2025 08:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEDFC4CED1;
	Wed,  5 Feb 2025 08:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738745243;
	bh=uneNg+O/MbXGyjnuoovNGs4oaGpveM8WtUe65AIHv6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyTw/sdDiOx7NIo9rTHCia+SRptdfIeprG4LZHe0P1Qh5WKSCALQMPLxEzqVrJ84m
	 wrt5OYQRa2DnuGE6Xlg7uetNaaE5zva7jyZ6t3VOfPrYyEsznS9L4gvOZUQ7ZJr/7E
	 sjMl9HMDyYxJyIUyepFzzW6thdIleLPMh5jixajDMshZa/VbFsWC3PgYtlT40zEfmz
	 e+UlB9oQyxO64HCJG7i8pF89xxcoAv0CDl82XB9uS/HoPlflBv9+zMbJ2OdYMJuieA
	 bfYrfsRBFXQMlDOPtXWe+maVtbaDCm1TOE75rnT09dGd4JGVpnmGdDClAt6SVbiefd
	 U1JyNeODHG7oA==
Date: Wed, 5 Feb 2025 09:47:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: dwc3: exynos: add support for exynos7870
Message-ID: <20250205-eager-ibex-of-pleasure-61e3bb@krzk-bin>
References: <20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org>
 <20250204-exynos7870-usb-v1-2-a7753f8183a4@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-usb-v1-2-a7753f8183a4@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_004724_660185_D9A2CB8A 
X-CRM114-Status: GOOD (  16.96  )
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

On Tue, Feb 04, 2025 at 02:09:30AM +0530, Kaustabh Chakraborty wrote:
> Exynos7870 devices have a DWC3 compatible USB 2.0 controller.
> Add support in the driver by:
>  - Adding its own compatible string, "samsung,exynos7870-dwusb2".
>  - Adding three USBDRD clocks named "usbdrd20", "usbdrd20_ctrl_clk", and
>    "usbdrd20_ref_clk", to be controlled by the driver.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
> index f5d963fae9e069e1bd145ff5bd1b704da89fb74c..34f2b9e8529303cd2a957baed5819a45cbcf3309 100644
> --- a/drivers/usb/dwc3/dwc3-exynos.c
> +++ b/drivers/usb/dwc3/dwc3-exynos.c
> @@ -163,6 +163,12 @@ static const struct dwc3_exynos_driverdata exynos7_drvdata = {
>  	.suspend_clk_idx = 1,
>  };
>  
> +static const struct dwc3_exynos_driverdata exynos7870_drvdata = {
> +	.clk_names = { "usbdrd20", "usbdrd20_ctrl_clk", "usbdrd20_ref_clk" },

We already stopped this mad downstream pattern, so don't reintroduce it.
Use proper names describing the purpose of the clock, not the source
name. See Exynos850 or GS101.

This is probably bus_early, "something?" and finally ref.

Best regards,
Krzysztof


