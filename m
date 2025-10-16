Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00779CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UZ7TBAFRv9QMlrqmMJIgxKTa7jBW8b6E1/jAgXuGlo=; b=zHBZ8dzJirjQBmvE1mauvDs2TY
	R0r5NqHE6uyPk2T7S52f1fn0/ip0p+TVSUX1QkDi3JoG/Rr55gROhKKq4mzideahtqU9EFzpcib8z
	tKUxsfePhWF38dLUwFm202OsB1bWli6ZnYQZq8z3K5+/3X+ujxS9Xcj6tJ/1VcYm6kOxHGcy/frlv
	OdEVc0XB3MZY5x/RyzoiYLekzi2bpMcW5c4VEtqcPLhHXMZYbTmOgBG+SDOOJ2jOwNKNsCb3Wp/nm
	LqgIxWQ7Wkk/HqnZTYPKGDRERweB/pRvwWrD3mauz76O77DPSKmCRSIcG/s3LC//GN5LVEDj8kUx2
	mKqSChkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QUy-00000005MCe-2FIs;
	Thu, 16 Oct 2025 16:06:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QUw-00000005MBt-0n0H;
	Thu, 16 Oct 2025 16:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0UZ7TBAFRv9QMlrqmMJIgxKTa7jBW8b6E1/jAgXuGlo=; b=oH1YeVeSPwxjgB8BReleokluBW
	L/YnmwycCEwtNdpHcaBTwVY3Tm9/XPKUrNPDFuG3WIrNi/M4Uuw+n0u2lbe46vaUffCTxRLOXma0I
	5NXXmX3pmYQz5/iJG1ydP6SMjzlcVAVBA+padkoun6JAu0J18FI51rgrDutbd2RsxuKoMGVK476nw
	pOm9ONwUz6l3KAwHZpkS7sNnH0hT7hwhRkVwVR3qi6uPB/f254hK9NIpR5Cr1fhXoxx0XUE52HcPj
	FMAdlGqWvmyCNl1BJ1kGJqHrJsMniM79TuJSp8QIWXdUSCXU13/bRTGViV2aggt03Npm8pEIYIPcj
	q4CY1Emg==;
Received: from i53875b4f.versanet.de ([83.135.91.79] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v9QUt-0001JG-IO; Thu, 16 Oct 2025 18:06:35 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ulf.hansson@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 finley.xiao@rock-chips.com, zhangqing@rock-chips.com,
 sugar.zhang@rock-chips.com, huangtao@rock-chips.com
Subject: Re: [PATCH v1 1/2] dt-bindings: power: rockchip: Add support for RV1126B
Date: Thu, 16 Oct 2025 18:06:34 +0200
Message-ID: <24800526.ouqheUzb2q@diego>
In-Reply-To: <20251016134103.294636-2-finley.xiao@rock-chips.com>
References: <20251016134103.294636-1-finley.xiao@rock-chips.com>
 <20251016134103.294636-2-finley.xiao@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_090638_223988_D6EE904B 
X-CRM114-Status: GOOD (  13.22  )
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

Hi Finley,

Am Donnerstag, 16. Oktober 2025, 15:41:02 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Finley Xiao:
> Add the compatible string and power domain IDs for RV1126B SoC.
>=20
> signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> ---

[...]

> diff --git a/include/dt-bindings/power/rockchip,rv1126b-power.h b/include=
/dt-bindings/power/rockchip,rv1126b-power.h
> new file mode 100644
> index 000000000000..0a418f16e4ea
> --- /dev/null
> +++ b/include/dt-bindings/power/rockchip,rv1126b-power.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
> + * Author: Finley Xiao <finley.xiao@rock-chips.com>
> + */
> +
> +#ifndef __DT_BINDINGS_POWER_RV1126B_POWER_H__
> +#define __DT_BINDINGS_POWER_RV1126B_POWER_H__
> +
> +/* VD_NPU */
> +#define RV1126B_PD_NPU		0
> +
> +/* VD_LOGIC */
> +#define RV1126B_PD_VDO		1
> +#define RV1126B_PD_AISP		2

is this missing a 2nd "i" ? ... The TRM calls this aiisp (for ai-isp maybe?)

Heiko



