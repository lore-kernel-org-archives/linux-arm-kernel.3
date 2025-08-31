Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7125DCA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fr6WeyZngKjkJ5+vVtCZO61j1ruKlxiA/dfdiEwKXnQ=; b=b56fWsLma4vnEzXwbqfVRYtTsW
	cjJYUVu7yPhmF8SPIOeJwtV2dt0UgG5+kWKMQyD3eSKPhAybOqlpnaESakPBQ3rhZ17K3vaaXAYP2
	BTOVt/iKJcxna3vDt6uhqj5zZRMYCJ2d5m9iiD2bCJHQ9H5hzPzKmzgWNfIGUmGHWt9t2fLtSx6t+
	VApqAjUHH1t81hFnpkgfHiLhMW05MLRPHTdVpe2T/T5WAiU6Ciyc0+fWosSrv9X5rVNLNt7HmrFih
	BfYQDcmsQGJTFEY5CLpK1xVsI0RJFw+Mp7Umagj87wtNpwN7MO1fSLrQyQBmQXS/aIL18x+RAlIzI
	DFrV9vBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjaE-0000000AK0f-3hxl;
	Sun, 31 Aug 2025 15:03:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usjXT-0000000AJhS-1tTG;
	Sun, 31 Aug 2025 15:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Fr6WeyZngKjkJ5+vVtCZO61j1ruKlxiA/dfdiEwKXnQ=; b=LfMXg7NI+LMPnZfVWumdDKjTyJ
	0uX6YKgMouWgKkBiHu6f+kxKivGn9BwAMdUyKqPq4yCbL/qgdjLvWsXMEwCdRuvwyXhaYysFpgmzs
	kyxCUbdhxD8IvEaKjipla6gnREgCpzdQiit83mftQoPsBM0H8z8NfyLuSw5yUbG0EOwd03aTElKA0
	eV/5b1XpLlAM3X5/+0E2vrey41ZB0Mel1vM3R9aZtvQL5hDS3qGOzWChpTL80SfNJbffKz2vgowZK
	XC2bPf/Qk3F6s91Ir5dkICdjdvAUYhuwdDF3YZ2V36gPCD4Dl67f8wdKgzLNEDcO/6Vb2vdiHlMmo
	x5MDfHJA==;
Received: from i53875b56.versanet.de ([83.135.91.86] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usjXF-0007mn-4M; Sun, 31 Aug 2025 17:00:01 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v1 3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
Date: Sun, 31 Aug 2025 17:00:00 +0200
Message-ID: <2235041.irdbgypaU6@diego>
In-Reply-To: <20250831104855.45883-4-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
 <20250831104855.45883-4-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_080015_513558_A6A9D387 
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

Hi,
Am Sonntag, 31. August 2025, 12:48:51 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb WeiHao Li:
> Add a clock id for mipi dsi reference clock, mipi dsi node used it.
>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

you missed a number of devicetree maintainers, Rob thankfully does
not need to do this on his own anymore.

so please get the appropriate list of maintainers via scripts/get_maintaine=
r.pl

Change itself looks fine though.

Heiko

> ---
>  include/dt-bindings/clock/rk3368-cru.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindings=
/clock/rk3368-cru.h
> index ebae3cbf8..b951e2906 100644
> --- a/include/dt-bindings/clock/rk3368-cru.h
> +++ b/include/dt-bindings/clock/rk3368-cru.h
> @@ -72,6 +72,7 @@
>  #define SCLK_SFC		126
>  #define SCLK_MAC		127
>  #define SCLK_MACREF_OUT		128
> +#define SCLK_MIPIDSI_24M	129
>  #define SCLK_TIMER10		133
>  #define SCLK_TIMER11		134
>  #define SCLK_TIMER12		135
>=20





