Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070EFCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deXU0gcF7yBIf+TpC1TbTUZssVkV6sZTs9sHoaAOhKo=; b=OVqkRR6YXoKgjBRo8bZmcJZvIk
	fkNDsuDp/mrFDx11THLyME8kRfex2sB4+8EewO2KOmoqm03xGrCgbwIZmt8lComPy3TjIzJCGNRx8
	Y/gBWyFegi0wGEaQrD17fwFRtJt6pDolhh4xKzppaUu8xW6Tprc9Pvxi+lGdJKY1e+CJLce2yG/zA
	nB8lM9CbAqv6LlRnHdnJz3QBfjLWegrraIYpco1FlPVfEl4n2nanUKRSlucSXplqIHIaYB8XVLQ6y
	XdrEida4VNAfmJjEyxBoz7eiD0kxhtBl31p/2jqem8zUsF9eaU3q6DC8vN8MTL/1WQnyfSCV3RHjx
	n3/515Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQgS-0000000HXVU-1sG0;
	Fri, 05 Sep 2025 07:16:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuPNa-0000000H75D-0e2l;
	Fri, 05 Sep 2025 05:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=deXU0gcF7yBIf+TpC1TbTUZssVkV6sZTs9sHoaAOhKo=; b=rco3EMV4Wt2VyqeetV9N8LyVPC
	dX6SlBGQuX3s5tjDwMdjzgjNcf9snf4erTwYbUd2Syp8dj8NpyLauI+F9q8WONGecmcxY24Ag/rAq
	dWx4ooli/OUns9yfIIvvWxkzlo8eRXKDOgHG/1AhSxp3mJdqdqhO2NawV/2tFjEq3oNrT7eyq1TlH
	nf7dB+c2oNYsAOn/bvpTql/QESyUQGHOpb1j+m3dy4mz6236lgeWhWEex+MTo8zs7TwPI9CBWFa7N
	ofNL0oRo7ifk5ab2jUNGaXdFji9RPT3BqJd+gw9VNOF7HOBxthcmUrqSrWJg47CJcvRcuc7CdM033
	dv8lWy/Q==;
Received: from i53875bb6.versanet.de ([83.135.91.182] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uuPNQ-0004GZ-TW; Fri, 05 Sep 2025 07:52:48 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
Date: Fri, 05 Sep 2025 07:52:47 +0200
Message-ID: <2267196.NgBsaNRSFp@diego>
In-Reply-To: <20250905025632.222422-4-cn.liweihao@gmail.com>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
 <20250905025632.222422-4-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_225258_215832_6F0AB014 
X-CRM114-Status: GOOD (  14.69  )
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

Am Freitag, 5. September 2025, 04:56:27 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb WeiHao Li:
> Add a clock id for mipi dsi reference clock, mipi dsi node used it.
>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

another process-related comment :-) .

(1) You already got in v1 the
Acked-by: Rob Herring (Arm) <robh@kernel.org>

So when sending a v2, please include such received tags
(if there are no major changes to the relevant code)

This prevents people from reviewing things needlessly multiple times.
So patch 3 would look something like:

=2D-----------
Add a clock id for mipi dsi reference clock, mipi dsi node used it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
=2D-----------

(2) As can be seen in
https://lore.kernel.org/linux-rockchip/175690195013.3771488.435870786224873=
257.b4-ty@sntech.de/

I already applied the two clock patches, so in newer versions don't
send them anymore.


Just to keep in mind for next time.


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





