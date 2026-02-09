Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94AAE81BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FxxQ03X1gzBxYSKLZtWhzNIZ+YXshyZ4mRWxKUEphA=; b=0/91oh32avYGFw/kO9bIzD2QEW
	7Ct6zNnwhT2gw81/rVM330Pc5mcbrf09RoTVzezTywzuRK0jm1G1hYSFTPcu3lQygTN017576ObMz
	q37GXmhq8Ea16seVuO+KW/GzPs0nD7Q+FpJDervJ/xuoNdMcTK13MuUvoma+A7dCYiD/6o7CS9myk
	cQoHJnjb1EFnFm7T1EBfFGGHpLmkqZs/gFYqVw6lamfu80JqAhvqJs7fqFw7L9OIARRqLUgM7juKF
	ZZai3mgCOkkSVEFCX+vmqPOyTxBPndsZMQ1DDWzzTv7hl3kz//l0fcLmdFpdds1nfIZxa/ezZ9wuB
	/KoRSXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSTy-0000000FXIR-1CAn;
	Mon, 09 Feb 2026 14:43:22 +0000
Received: from mail5.25mail.st ([74.50.62.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSTs-0000000FXGl-0r4L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 14:43:18 +0000
Received: from localhost (84-231-236-236.elisa-mobile.fi [84.231.236.236])
	by mail5.25mail.st (Postfix) with ESMTPSA id 653A6617D6;
	Mon,  9 Feb 2026 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1770648191;
	bh=CsthQDxMaqbHWoPY9LcM4B7QQkY7QXBkgFtYZobMS/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPb+5w+p0ov7fKu9479y8r6ViGMAqbmyKP8Rbj+tw9o5rvAe2iWbOiKS12fkEwZVq
	 +14ZwF8sqtMUSWMGGcO0kjXwMyBdpxA7fcS02OA13S7/MFlqneIHJxa5VbZFUcklqk
	 IIRfFwoxI2Jv2Gfe3HTiWK7JxIJ4w0/YutSWgM4Xdxvtq+63MScVDJTT5a5sa/KagL
	 WQmKdDSJIJ+a0Iu3XxP6EnCzcHTFp9zxq0Kf67KjiF3gr8NacMDxFLivNh42+gxkkZ
	 y/vdtETnUeRouLV+JRk0AQBlg5x/K24NLkI+zm3vdYE6bb+btwObM/f11Detz8ziPD
	 /Kg3+acK7mAJw==
Date: Mon, 9 Feb 2026 16:42:50 +0200
From: Tony Lindgren <tony@atomide.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 0/3] pinctrl: single: bit-per-mux DT flexibility,
 probe robustness, and consistent pinconf offsets
Message-ID: <20260209144250.GC5376@atomide.com>
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
 <CAD++jL=OXJdJZpjbo0_C03vcgPe5btum-J0uifvSJkMaUWG-=w@mail.gmail.com>
 <OSQPR06MB725257E71F0B7F7F1013263D8B98A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260206042215.GA5376@atomide.com>
 <OSQPR06MB7252ADEF2CB075BC40AD7DB68B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLm2a1-G7QQBb+u68DH_RT6kc4=vpqZWQcirvWrcRjw+5Q@mail.gmail.com>
 <OSQPR06MB7252D5BCD40BDF2A91FF41438B66A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLkqpRrcgQ2JvbHJY3NQ=KHi8T91aOg2KvAmkVAXAEzH-A@mail.gmail.com>
 <OSQPR06MB72520084144325D548E36AD78B65A@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAD++jLkB26XNAosUdD2BigLw+=Hd6+VBsmv0fHawQ25e8rQhrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkB26XNAosUdD2BigLw+=Hd6+VBsmv0fHawQ25e8rQhrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_064316_833886_84FA1997 
X-CRM114-Status: GOOD (  18.02  )
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

* Linus Walleij <linusw@kernel.org> [260209 09:51]:
> On Mon, Feb 9, 2026 at 3:25 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> 
> > To make sure I align with your expectations:
> > 1) Would you prefer the new driver to be fully standalone (using the
> >    GENERIC_PIN* helpers + syscon/regmap-mmio), rather than trying to
> >    refactor/export helpers from pinctrl-single?
> 
> Yes. Conor improved these helpers so now it should be possible
> to use these to do a very simple and slim driver for what you
> want to do.
> 
> >    Action item: Introduce a new pinctrl-single-bit.c driver and DT
> >    binding, which can also cover the existing bit-per-mux logic currently
> >    in pinctrl-single.c.
> 
> Sounds about right.
> 
> > 2) For the syscon/regmap hookup, is it acceptable to add a syscon phandle
> >    property in DT (e.g. "syscon = <&scu>;") for the new driver to obtain
> >    the regmap, or do you prefer a different binding/property name?
> 
> This works for me.

Great, sounds good to me too!

Thanks,

Tony

