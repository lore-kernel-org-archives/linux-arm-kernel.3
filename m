Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB91C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 06:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uy9+A5kw1OQWo0Zddg0J8hfck8HfhOY4S4SUWD2p7lE=; b=N6hwnGVC+h2OoQ+QpLNNNNXoPb
	7dI95IAW8qJ8FgAnBfZVljtsY3doVvc6No/9cumyqI+fWMkqNkFB4RdjgBttB9qnYPgCyneJee237
	iZeb6/7GaLf13MSF0ftNsbBP98+AgHA/zGo+HZ7Zqy4PIm3iJItqdOlAB50yjeYnmX0fyMopvSRD1
	lC2R7yZcCNLgkVg3SBUoJTFTQn4i/zP5aGE5zVqIIE1rE1p0A0yx0GRzPlJ7d4P+lbrzi8amIT4Ak
	yoKFxa+vEC0GyW92aqvuqBFzdgG7UKHAaAC7kgt7jPkUkJ2HMGLXCijhTDYjDu/o8r2HkShlI2EA6
	OGTxJeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTb8B-00000001p2m-1iOs;
	Mon, 23 Jun 2025 06:58:15 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTb10-00000001o6C-30ER
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 06:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750661450; x=1782197450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ID0tYhe+3AnmdvyD6ijER8q96Dh67gLD5peP97R3a94=;
  b=B1dH1yPco738zrd9MAEzeSUD9mL8q8uOo1QLJRskVyss7XvkSxcji/4t
   6l697NfCmd87hVLGlRbgzAQePo88EyuBnsGGyrvwvKrm4jueENmOn7Owy
   R5zM4se99i3VYmNIGKeLsJh2vpff/njbAVEDNF9/yOUODTxl3BoRnnKFL
   zI/4cuejSicsIF5JS/B5k4Fam1hW6G1A5TJqI//FMha+fOHBICqo5qPk/
   0jXjFRcXB7OuymiAKDxtwrAUjAHkx21/dJmHekm29IeAwBI7Kmicuwmvb
   hhl/94jUn4yh5H5SMUzPEBukKysyfDGRaSx66BYCKPlbeaWRuLqmRNgPa
   Q==;
X-CSE-ConnectionGUID: QhFnsetmQQ6r5UNBUFHdVA==
X-CSE-MsgGUID: 1YY6bUV7T8O69pVuU7Y04A==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52987257"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52987257"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:50:50 -0700
X-CSE-ConnectionGUID: 8+RVV+lORPq9cNr/+qIs5g==
X-CSE-MsgGUID: i4cX/fd5SYK6vhXNVZNv/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152184805"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:50:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EEE3D11FC36;
	Mon, 23 Jun 2025 09:50:42 +0300 (EEST)
Date: Mon, 23 Jun 2025 06:50:42 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v4 0/5] media: i2c: imx214: Add support for more
 clock frequencies
Message-ID: <aFj5QnPBO0We5SBQ@kekkonen.localdomain>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_235050_790530_6C12F91E 
X-CRM114-Status: GOOD (  18.48  )
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

Hi André,

On Sat, Jun 21, 2025 at 11:37:24AM +0200, André Apitzsch via B4 Relay wrote:
> The imx214 driver currently supports only a 24 MHz external clock. But
> there are devices, like Qualcomm-MSM8916-based phones, which cannot
> provide this frequency. To make the sensor usable by those devices, add
> support for additional clock frequencies.
> 
> This series supersedes
> https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu/

Is there a difference in this set from the v4 you posted previously?

> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
> Changes in v4:
> - Add missing colon to error message
> - Add A-b, R-b tags
> - Link to v3: https://lore.kernel.org/r/20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu
> 
> Changes in v3:
> - Limit range of pll_ip_clk_freq_hz (Sakari)
> - Drop unneeded 'ret'
> - Use pll.pixel_rate_csi for bit rate calculation
> - Add patch that deprecates the clock-frequency property
> - Link to v2: https://lore.kernel.org/r/20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu
> 
> Changes in v2:
> - Add A-b tags
> - Switch to v4l2_ctrl_s_ctrl_int64() to acquire the control handler mutex
> - Add error handling for v4l2_ctrl_s_ctrl_int64() and
>   imx214_pll_update()
> - Replace "read clock frequency from dt" patch by "remove hard-coded
>   external clock frequency" patch
> - Link to v1:
>   https://lore.kernel.org/r/20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu
> 
> ---
> André Apitzsch (5):
>       media: i2c: imx214: Reorder imx214_parse_fwnode call
>       media: i2c: imx214: Prepare for variable clock frequency
>       media: i2c: imx214: Make use of CCS PLL calculator
>       media: dt-bindings: sony,imx214: Deprecate property clock-frequency
>       media: i2c: imx214: Remove hard-coded external clock frequency
> 
>  .../devicetree/bindings/media/i2c/sony,imx214.yaml |  29 ++-
>  drivers/media/i2c/Kconfig                          |   1 +
>  drivers/media/i2c/imx214.c                         | 263 ++++++++++++++++-----
>  3 files changed, 217 insertions(+), 76 deletions(-)
> ---
> base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
> change-id: 20250406-imx214_ccs_pll-e4aed0e9e532
> 
> Best regards,

-- 
Regards,

Sakari Ailus

