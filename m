Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FF3C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LE7z9nrLXLLZC1RAFHGnOfXK7oETSSYNaWo138f4OKg=; b=rmXPqXB0nCMVHK+emkE0IuyrTv
	DI6CJ0pRofL9urlH05hSlb0tdvvNoo47JknuNji61zylfuXOBl7zfrLuD4epdY8EMzkJVAfdjfioQ
	XATQ1Mk8TcQ2y3gbeBpd/0YUwuaOVs5IQkUHAu237jNVkxcddhpn2f4NcGM6cDKGqgH+JWYXWRW0D
	R8HHwAhm1Wcxf9gxaFhf5q6lbRP2OAPwZoaTPxPCQ5oszJ/WpnBx+H9f2P8hxUpsPwf+soUMaZ8Cs
	ZGe/grnwlt0pW1YQrTsPO9bIHoHwpAKEGcwZiXXzYaGr/OzzlAe4JSMcS23SIPy+iXy7LQItLh9x7
	f67Dw9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsEE-00000005K0f-2cwQ;
	Wed, 02 Apr 2025 07:09:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsAS-00000005JFi-0CtL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:05:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 176E6435CB;
	Wed,  2 Apr 2025 07:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACCBC4CEE5;
	Wed,  2 Apr 2025 07:05:42 +0000 (UTC)
Date: Wed, 2 Apr 2025 09:05:39 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	thomas.fossati@linaro.org, Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com, S32@nxp.com, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/nxp-timer: Add the System
 Timer Module for the s32gx platforms
Message-ID: <20250402-ginger-hare-of-action-dc3fff@krzk-bin>
References: <20250401224644.3389181-1-daniel.lezcano@linaro.org>
 <20250401224644.3389181-3-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401224644.3389181-3-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_000544_128335_F5CF97E0 
X-CRM114-Status: GOOD (  12.48  )
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

On Wed, Apr 02, 2025 at 12:46:42AM +0200, Daniel Lezcano wrote:
> +
> +static const struct of_device_id nxp_stm_of_match[] = {
> +	{ .compatible = "nxp,s32g2-stm" },
> +	{ .compatible = "nxp,s32g3-stm" },

Drop, the entire point of me asking for compatibility is not to have
useless entries for the same devices.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nxp_stm_of_match);
> +
> +static struct platform_driver nxp_stm_probe = {
> +	.probe	= nxp_stm_timer_probe,
> +	.driver	= {
> +		.name		= "nxp-stm",
> +		.of_match_table	= of_match_ptr(nxp_stm_of_match),

Drop of_match_ptr, you have here a warning.

> +	},
> +};
> +module_platform_driver(nxp_stm_probe);
> +
> +MODULE_DESCRIPTION("NXP System Timer Module driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 

