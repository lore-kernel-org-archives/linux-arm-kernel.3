Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE5AD4415F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdskGiAKE5aPLX+jUFdMvBaqDF22aG0Vy96NCz1MBtg=; b=MaJG944lnV4sg9l2BPeFWvqCED
	3O8Cl0pEjMY2oCdEpfWahqlawWv/IsnOMtpRygM5TVkX4K3m6vQK8XRQ9xbYlYWQxb8i7CRAyfF7z
	HUROiHYdtze2ll8EnvSpYR0Oy6YhsxBiBwlNxLgJ8I+HjCqu9UE3L8SeE4uJxrzYXIZWjv3C3v5vw
	jyCNDER5OMW1GQmmIOGFJUF62u7MoAw5tXBkhuOh1/RElEGZIShvIgI6C2nA+xbD8fIXSBuMA4/vI
	lwBLDuQWtaCwM5YGfo6P+DRGJcw20w7lzXe7qiAA3HDFx9U+zhDvX+A4uliSwAzYvuVBkGCwy/phN
	/4G3+PRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOft-0000000CabV-1QxZ;
	Tue, 19 Nov 2024 13:53:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOeC-0000000CaBI-3kbk;
	Tue, 19 Nov 2024 13:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wdskGiAKE5aPLX+jUFdMvBaqDF22aG0Vy96NCz1MBtg=; b=2de1Jntw/tTC85BNE2GliQMS+D
	BAWUVmGyNsHpfjl7okrvpe3K8Qfvxom16AzCvMLt/j/UYV1eUD+7ivtW3wjDxoLLVDlcyl8QJGNA/
	U8B8zjQVky155gqqSn0+LHA5j3H38O6j3jf3TU8jHKWwIa5LQrZJXYbBf/xV7V8bt9cV+yIZVIXJr
	V2SKemyBJqfmIAPsf1xhhSlHi/kpKg7Z5U9SjD2Mjw8TeOu4IiHWdB9E9t6GjuWZw5a7bRFx0jwh8
	6npMIu0a8DXTOrsz9E+KgXdRrsFRsbMZDvYFy7HEzUtBeE10tRZB9MCeIiEY9FYM6pCfWIRmDJ3bj
	1du4/OWw==;
Received: from i53875a30.versanet.de ([83.135.90.48] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tDOe7-00079C-QT; Tue, 19 Nov 2024 14:51:59 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org, Diederik de Haas <didi.debian@cknow.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 detlev.casanova@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 sebastian.reichel@collabora.com
Subject: Re: [PATCH 1/5] clk: rockchip: rk3576: define clk_otp_phy_g
Date: Tue, 19 Nov 2024 14:51:58 +0100
Message-ID: <2989559.o0KrE1Onz3@diego>
In-Reply-To: <D5Q78ZOX5SE0.2SCB8FEGY7EFA@cknow.org>
References: <20241119132916.1057797-1-heiko@sntech.de>
 <20241119132916.1057797-2-heiko@sntech.de>
 <D5Q78ZOX5SE0.2SCB8FEGY7EFA@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_055204_950541_BB0010B1 
X-CRM114-Status: GOOD (  18.24  )
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

Am Dienstag, 19. November 2024, 14:45:53 CET schrieb Diederik de Haas:
> On Tue Nov 19, 2024 at 2:29 PM CET, Heiko Stuebner wrote:
> > The phy clock of the OTP block is also present, but was not defined
> > so far. Though its clk-id already existed, so just define its location.
> >
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  drivers/clk/rockchip/clk-rk3576.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
> > index 595e010341f7..029939a98416 100644
> > --- a/drivers/clk/rockchip/clk-rk3576.c
> > +++ b/drivers/clk/rockchip/clk-rk3576.c
> > @@ -541,6 +541,8 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
> >  			RK3576_CLKGATE_CON(5), 14, GFLAGS),
> >  	GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", 0,
> >  			RK3576_CLKGATE_CON(5), 15, GFLAGS),
> > +	GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", 0,
> > +			RK3588_CLKGATE_CON(6), 0, GFLAGS),
> 
> RK3588? 

darn copy-paste, thanks for noticing ;-)

At least the register and bit number is correct though ... according to the TRM.
So I messed up only the constant and did not notice due to the gate being
ungated by default of course.


Heiko



