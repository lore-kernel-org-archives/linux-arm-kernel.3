Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FFDCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zid6g4JYJYfZT5PbYX3jGzbUqIB8B4TxIUlDctSA0Ao=; b=KXjKzrRLvxTctFtUOlMcRttAM/
	mWbx8xZJu5/GStUZ3nNrQSo1ov4BR4QhtdS9RmUYevqSdOeI9ezqCMred5Qg8DCUB6T6grewdHmhW
	ZdEKhgf+QmeZ/pq7Hi8/MQFk/tBpgO5IvPLn2O0NnZqlnc7WHUx1UYsUsCoRUbTIcbIv7WlyGizBh
	I7N1Bzg8FjULnC8iwxkCxxb9JcRF5Klf74+nWZxYf7UOMLppkSILCJOQ+f4rCXEmHb3vPdP+Be0O7
	IBi7EAZWH1b7QNz0CLgKRhQC6+0YtncPhEzaLJGcS/OlafXRYmPQNiYIfLDerK8A8fLh2axR30+Aa
	lYszChPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcX-000000011Yc-334Y;
	Fri, 22 Aug 2025 00:27:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8g1-0000000017R-3eVY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 17:02:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E4860A58520;
	Thu, 21 Aug 2025 17:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F21C4CEEB;
	Thu, 21 Aug 2025 17:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755795732;
	bh=QlyP+EybHdG/BjvDs4e1GOTfEiPxKwv1SmW3xs+WcNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OL94fan15xuckPr35axKla7h8MZtGA8yIcVd+buWXzAQSG05oIGUBiqEBb53XRhle
	 JmeFYsuGXJGOunPKsS1Lbfbr70a40ig3+CNUml+LCM4CLjRStOkv9+PzortwXBztYv
	 RkypUQ7qLmOuK0P5rdvLNOi1hBU/5yZ+GdWob8NfDtHKYfXYdCVz9UH0/XTolmBFCh
	 kZoIzbEGtG9kun8xTlL20/iCNyBFn13AtJsXb/uF+eLHMoMU+MHvFu8nOb9qMCU/zR
	 RqEipU7pPALnBOKvCOhPuQVSUaCq7k2Miy1P5EUFNH+taITrJVdEsun71ru50sR1kH
	 9W8Udw2mBmj2A==
Date: Fri, 22 Aug 2025 00:44:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 01/16] gpio: dwapb: Use modern PM macros
Message-ID: <aKdNBhpNofchexgb@xhacker>
References: <20250820154037.22228-1-jszhang@kernel.org>
 <20250820154037.22228-2-jszhang@kernel.org>
 <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com>
 <20250820191039.4f8af41e@barney>
 <CAHp75Vdpgf3DUMQw0mYqhG=9UrYG8KWrobbd387QZapBor_LHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vdpgf3DUMQw0mYqhG=9UrYG8KWrobbd387QZapBor_LHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_100213_971021_EDDC393C 
X-CRM114-Status: GOOD (  20.18  )
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

On Wed, Aug 20, 2025 at 10:04:39PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 20, 2025 at 8:11 PM Michael Büsch <mb@bues.ch> wrote:
> >
> > On Wed, 20 Aug 2025 19:54:44 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >
> > > > The dwapb_context structure is always embedded into struct
> > > > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > > > data overhead for !CONFIG_PM_SLEP.
> > >
> > > I don't think it's a good approach to add a lot of data for peanuts in
> > > case of PM_SLEEP=n.
> >
> > It wastes 36 bytes in case of PM=n.
> 
> ...per port.
> 
> > The driver currently allocates the struct with kzalloc and stores a pointer to it
> > in case of PM=y.
> > So this probably has an overhead in the same order of magnitude (pointer +
> > malloc overhead/alignment/fragmentation) in case of PM=y now.
> 
> ...per driver.

Before the patch, struct dwapb_context *ctx is also per port.

> 
> So, I can't say it's equal, but I leave this to maintainers to decide,

What in my mind now: this is linux rather than RTOS. After greping the
the arm/arm64/riscv dts dir, the max port number is 6, the berlin2q
soc families, so this means current we have wasted 216 bytes memory which
is trivial compared to the system memory.

