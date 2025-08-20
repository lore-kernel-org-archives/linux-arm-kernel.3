Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7443CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfs6x+xaaDiB1KmRY5HWUIfmRGs9QHMY0GiMb0LLErY=; b=YcfEMFVXwPs8DFMf3yrBhAoIE0
	5MnS90gtoyzo+qA3daBbbCwMM2QZ7j7C+uZsN60Hfcc7s7x/FVWCjp64V3UC/Yfqib8FhJLPHwGKT
	FeUgQYksR8tjN2jNKWjczdaR0eKh3QZUz8TZCgEJ8+lmfgmYe2vqypnppy71nxFC+ZY/tb+L8N42x
	jeik9kkwir66cSAEuDPenOleXPPdkYljYtUhtmS/peDrvsGle4kxbOUSvK0t2Fv/5Ah14kNVFHCgi
	6FUCbGBCx0ajA+PuHZpxrqCKuw7IbJ7KY+n9RSTzr9+mNZkPSPEGjEqS5a48bH82sjVKq06Ny/P7Y
	ekvOm+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeSl-0000000Cn8F-0Bqx;
	Wed, 20 Aug 2025 08:46:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodua-0000000Cgbk-2hgh;
	Wed, 20 Aug 2025 08:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 115D3613AB;
	Wed, 20 Aug 2025 08:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32FAC4CEEB;
	Wed, 20 Aug 2025 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755677471;
	bh=VT+iqwjK5SOfP9/xG8DuerN5YycqDQtO+PK7VX3YosI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udoFllzGuMux5GX71E9zFu7RtI1omoWXM1h7YrzDfH7MmfStaxXOFfIjGVnht6MRG
	 jF4mpi+AhwvS+EF6Cxr6gqZ/jVZOd3k9zOtPVMwcHJbqWpPZplNTLXgIQFFBXeMNLV
	 q0YsY0Re9cr72ut0K+YToEUJT8jK4CBbX2HG6RpCQe3vB5IKT3B7QJzIE1BgRAPogO
	 6Juh/V6jXixOzyuvWeoGMvZ5Rz4W4yeGq4sQyGsCBWu8iZ+WirqgaUtnqS6wlSLsYB
	 kjpa48VQa4rsntV3g3vaPbuKW0HpnGCqA8eIMkZYEUpjqFZduqSh1Y1Phy3NiCoRBy
	 kvvL4QirQ2KFA==
Date: Wed, 20 Aug 2025 10:11:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/13] soc: amlogic: clk-measure: Unify the compatible
 property
Message-ID: <20250820-righteous-slick-ibex-cde2f8@kuoka>
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
 <20250815-add-more-socs-to-support-clk_measure-v1-6-59f04ba67457@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815-add-more-socs-to-support-clk_measure-v1-6-59f04ba67457@amlogic.com>
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

On Fri, Aug 15, 2025 at 04:37:32PM +0800, Chuan Liu wrote:
> The clk-measure IPs across Amlogic SoCs have minimal differences, so
> they can be managed with a unified compatible property.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/soc/amlogic/meson-clk-measure.c | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 4d91d463d2a5..6927f87b99cc 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -292,28 +292,7 @@ static int meson_msr_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id meson_msr_match_table[] = {
>  	{
> -		.compatible = "amlogic,meson-gx-clk-measure",

NAK, ABI break, obviously.

Don't ever send patches from your downstream tree but read the rules
ALREADY DOCUMENTED in upstream Linux kerenl and adjust to this process.

Did you read writing bindings?

Best regards,
Krzysztof


