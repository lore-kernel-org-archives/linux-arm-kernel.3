Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB8F1061B3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 12:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UppyQ/xNq8mnP2lW5sR330eErTdEUcGW603koO2qfjM=; b=JNJ1sBqvSGL2RC6vQJTrv1Nicc
	O67VRkOHusMonc2LAM2Mq9//evjYVgpO2rmlCpkAzQX+gYRgWdp2MLErrwpW0V2Tn6KIJwuzVkoTQ
	tIC4TZ0RuAxnOxO90Q6gy5zzPF4sdktkPbP5zcVaipfHnVHa+pMfVdSZXr1/MEEgjyjJqjzVD7QNN
	tlEVm4CX7D+1mhTS7iVdRJ2QTIzZv/qBQ8FMLD1Ab0gpuvs537ixrFfamTkBykTIJLJqg/NR5uK5X
	KIkw3icCy2r1obaGBN7bQpOKGAHCzJcAVZA2IbzoW1BOAfl5Yw0t/1WaLSQ74yzlM2CFz6SK3P1NH
	E0WMd5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YG5-0000000CwTh-27dr;
	Tue, 31 Mar 2026 12:31:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YG2-0000000CwTL-3DJP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 12:31:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0640243D39;
	Tue, 31 Mar 2026 12:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F94C2BC9E;
	Tue, 31 Mar 2026 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774960305;
	bh=D5/3xk1fp4FeAb9Blzw/Ddwbf2aw5cJA1gRZc9Dui5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JeZmfUXJlpPYISkPKqERcAolc05szSMZRt9nhT12TH9URKkMk+w2B+W7BZ17XItfk
	 XcNLFtDwSyNrFBduWXcYJa5380Lf7XUX+midjgd+iyy57I57AcdLtABuxMX2KRc0bP
	 H6d02jmzpTbhA3juTB2XvKiFeZApE487rQevjDHjhiTdcD828tkla1Nnc711b8+2pG
	 XSdFSH/e+zhOwASztRQvEeZ8AhAMkJDE5qaVeYfHs6qlRlZmbGEpTJ+gUA6nu1DULH
	 or0u9EGt0jrXbbr/KClkZG5ojZhOneIzPIuCNPv0y1Xr0WTA03PHlvHkZy2zZVh+dN
	 OvaI8+vB3QwvA==
Date: Tue, 31 Mar 2026 13:31:38 +0100
From: Lee Jones <lee@kernel.org>
To: amitsd@google.com
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v9 3/6] mfd: max77759: add register bitmasks and modify
 irq configs for charger
Message-ID: <20260331123138.GE3795166@google.com>
References: <20260325-max77759-charger-v9-0-4486dd297adc@google.com>
 <20260325-max77759-charger-v9-3-4486dd297adc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325-max77759-charger-v9-3-4486dd297adc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_053146_827163_7C3333F1 
X-CRM114-Status: GOOD (  13.38  )
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

On Wed, 25 Mar 2026, Amit Sunil Dhamne via B4 Relay wrote:

> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Add register bitmasks for charger function.
> In addition split the charger IRQs further such that each bit represents
> an IRQ downstream of charger regmap irq chip. In addition populate the
> ack_base to offload irq ack to the regmap irq chip framework.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mfd/max77759.c       |  95 ++++++++++++++++++++++---
>  include/linux/mfd/max77759.h | 166 +++++++++++++++++++++++++++++++++++--------
>  2 files changed, 222 insertions(+), 39 deletions(-)
> 

[...]

> +/*
> + * enum max77759_chgr_chgin_dtls_status - Charger Input Status
> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE:
> + *     Charger input voltage (Vchgin) < Under Voltage Threshold (Vuvlo)
> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE: Vchgin > Vuvlo and
> + *     Vchgin < (Battery Voltage (Vbatt) + system voltage (Vsys))
> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE:
> + *     Vchgin > Over Voltage threshold (Vovlo)
> + * @MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID:
> + *     Vchgin > Vuvlo, Vchgin < Vovlo and Vchgin > (Vsys + Vbatt)
> + */

This comment is masquerading as a kernel-doc header, but isn't actually
kernel-doc.  Either change the formatting or adapt the formatting to use
/** and use W=1 to check it.

> +enum max77759_chgr_chgin_dtls_status {
> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_UNDERVOLTAGE,
> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_MARGINAL_VOLTAGE,
> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_OVERVOLTAGE,
> +	MAX77759_CHGR_CHGIN_DTLS_VBUS_VALID,
> +};

-- 
Lee Jones [李琼斯]

