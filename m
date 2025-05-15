Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EF7C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNTuXkkuvsEfgIEUL6i9vw+CjUWCFS2WGIry+JlM6nE=; b=eERovNoXoQnuMK83JaESduZZcr
	pyfn+m8FXsJ6yNO/aF7g03fSawrYOtfT9im9ghNWWrIUOoF629oiLZ076rqf80a1XnKwAI+UMub+6
	KpDv6MlGyvvgl9Qe99fTJPkVi0cJc27DGFEbJ0DrEIMw8ok9Cpd5fdyxSiNhzNNl8sUmdc4jklxAr
	McnO0YTkM2H6SXZZrvZFkQnUpZZa0vg7q/O23pnQ3wRllpvG9qWwdX/vCdD/ywvkHmm9hQno6fdG+
	wj9pNDdvpQBuQZSfZW+9q+mrXbRF/jYgnjy2hFvzeqPpNzHISDTjBqqSx4NgEDYFCCzoFmrmZfJS2
	92HZuYOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXyh-00000000bfl-3VmJ;
	Thu, 15 May 2025 12:46:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXul-00000000arb-31mN;
	Thu, 15 May 2025 12:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=cNTuXkkuvsEfgIEUL6i9vw+CjUWCFS2WGIry+JlM6nE=; b=fUJOgOU/hCDCJc+zM19+yxqn7g
	0/mus2JVBADogordoH1Hd0pvjYUCtObeMO8OUp8idsK/fAWkbuPrlWZ0ka5gonvaJt9WrUX5nLOF5
	rIbAoBjVetl1ZeFfXB4CXGNZJDAogS6jLHGXDmelUu80VDkosqbwY/saM6aulCkGCr7p2LNKcIT8R
	bHZb/c4ASQjnT7CrLJ64X+EeRmsEDbAgTsOOFnPdACjGhQ7nQbuaMhBrct6fkOv1gcQOAuyMKiV8J
	WFFK4M+PHBcmUvmrtdAMpZYHJNkf9VJkoRj701cxpfayEXfMhXsdtoMvILKBH+FdG8x4MqCUd/GT1
	fEtSkq2Q==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFXug-0004e2-L9; Thu, 15 May 2025 14:42:14 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Kaehlcke <mka@chromium.org>,
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: usb: cypress,hx3: Add support for all
 variants
Date: Thu, 15 May 2025 14:42:13 +0200
Message-ID: <18791204.sWSEgdgrri@diego>
In-Reply-To: <2025051550-polish-prude-ed56@gregkh>
References: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
 <3784948.RUnXabflUD@diego> <2025051550-polish-prude-ed56@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_054219_756428_4FCE2BC0 
X-CRM114-Status: GOOD (  27.18  )
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

Am Donnerstag, 15. Mai 2025, 13:49:19 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Greg Kroah-Hartman:
> On Thu, May 15, 2025 at 01:43:59PM +0200, Heiko St=C3=BCbner wrote:
> > Am Freitag, 25. April 2025, 17:18:07 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Lukasz Czechowski:
> > > The Cypress HX3 hubs use different default PID value depending
> > > on the variant. Update compatibles list.
> > > Becasuse all hub variants use the same driver data, allow the
> > > dt node to have two compatibles: leftmost which matches the HW
> > > exactly, and the second one as fallback.
> > >=20
> > > Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress HX3 U=
SB 3.0 family")
> > > Cc: stable@vger.kernel.org # 6.6
> > > Cc: stable@vger.kernel.org # Backport of the patch ("dt-bindings: usb=
: usb-device: relax compatible pattern to a contains") from list: https://l=
ore.kernel.org/linux-usb/20250418-dt-binding-usb-device-compatibles-v2-1-b3=
029f14e800@cherry.de/
> > > Cc: stable@vger.kernel.org # Backport of the patch in this series fix=
ing product ID in onboard_dev_id_table in drivers/usb/misc/onboard_usb_dev.=
c driver
> > > Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> >=20
> > Looking at linux-next, it seems like patch1 of this series was applied =
[0].
>=20
> It is in 6.15-rc6, not "just" linux-next

yeah, I mainly used linux-next to see if a part of this series was applied
anywhere :-) . Because neither my inbox nor the list archives seem to have
gotten any form of "patch applied" mail.


> > The general convention would be for the binding (this patch) also going
> > through a driver tree.
> >=20
> > I guess I _could_ apply it together with the board-level patches, but
> > for that would need an Ack from Greg .
> >=20
> > @Greg, do you want to merge this patch ?
>=20
> I thought a new series was going to be sent for some reason, which would
> make this a lot easier.  But if you want to just take this one now,
> that's fine with me as it's not in my queue.

As we're close to -rc7 now, I assume the chance is low of someone
needing this before 6.16-rc1, so thanks for the blessing, I'll do that :-) .

Heiko



