Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ED6D4A61E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGCCaGWgIfg2vfdsl9W+Yld60nDB/Iv9Cfq95SmZGJI=; b=Nmk+/f7c8mQMgv2/WHbUVFoZxT
	pZQAGO4i7ArRtxUVbOWR37Uz7MlsOjsvgYnlSe+PkArTwUAbTb3xCX2DCfYfibi/BdrfbFp30vOHE
	P5qIdCNh2O6selGPvMMBTCjdxdc1Q+8L7bsgDvHp9o58S/a7wHZgJqs4DHrhe9CLweo3ObI3XvHDv
	wAHIJ64srK+N8WxBtMhjPGLgpc8emPBao0jbu6d0OdFd8slwv3XgbTzIjEqJNoyS5CW+mvZszyQPQ
	gZeK2N/v6gq2/w5l6B36lB5DFTCWSqXFRYBMJBm5sbJtGPC8sl7haRwHH6BWud457kKP0vNkYjA6N
	XQeaAUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggNG-0000000DsfL-2zZY;
	Fri, 16 Jan 2026 09:44:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggNE-0000000Dset-2jMO;
	Fri, 16 Jan 2026 09:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QGCCaGWgIfg2vfdsl9W+Yld60nDB/Iv9Cfq95SmZGJI=; b=X/EKOz3ywJYWTNlqdF9VO9mql5
	4xqoQqvalFKibN2AMQncOi+i9nZUxkoIuPYhvI/FtRsNo66DBdHnsn2ZmwMZWbrE8IoJDy2XZmuNG
	tfYsgLEUU+slhtyaVTt+tpeVhn5ZM8pmMHPoymFb/5qk5v/tUXpchepygjStqoQWSvfpaSeU9sOST
	EcbAMgR6GRYyjFX3guDim1kIMORAtWLZpKTcAazE2T82Jn8BbsikfwlRm8I1fsC1wM0tvyhnGVdVx
	x8zrOWwE7JUtitXUbMgt1xZvks2AYJ5P+sF5DcMYS8Hm+M+V2aF8W42uSzgafMAiEqGLbKpeXowEO
	rlWUq23Q==;
Received: from i53875a97.versanet.de ([83.135.90.151] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vggN5-002bUI-F4; Fri, 16 Jan 2026 10:44:00 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Marco Schirrmeister <mschirrmeister@gmail.com>
Cc: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-rockchip@lists.infradead.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: rockchip-dw-mshc: add
 rockchip,disable-runtime-pm
Date: Fri, 16 Jan 2026 10:43:57 +0100
Message-ID: <1791168.izSxrag8PF@diego>
In-Reply-To: <CAGJh8eAWNe0JzC7BdA2Rw5etCYgGq3O5Zdgk9zSzsLNv18k=ag@mail.gmail.com>
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
 <20260111-melodic-chestnut-coua-73e6ec@quoll>
 <CAGJh8eAWNe0JzC7BdA2Rw5etCYgGq3O5Zdgk9zSzsLNv18k=ag@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_014408_746187_D539B5E6 
X-CRM114-Status: GOOD (  21.05  )
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

Hi Marco,

Am Montag, 12. Januar 2026, 00:51:24 Mitteleurop=C3=A4ische Normalzeit schr=
ieb Marco Schirrmeister:
> On Sun, Jan 11, 2026 at 10:41=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
> > > +  rockchip,disable-runtime-pm:
> > > +    type: boolean
> > > +    description:
> > > +      Inhibit runtime power management. This is required for boards
> >
> > What is runtime power management? Like Linux PM? If anything phrased
> > like that is it is a clear no go. Bindings describe hardware.
>=20
> You are right. This refers to the Linux PM subsystem and describes
> software behavior.
>=20
> > > +      where the bus timing becomes unstable if the controller is
> > > +      runtime-suspended.
> >
> > You described the desired Linux feature or behavior, not the actual
> > hardware. The bindings are about the latter, so instead you need to
> > rephrase the property and its description to match actual hardware
> > capabilities/features/configuration etc.
>=20
> On this board, the bus timing becomes unstable when waking up from
> a low-power state. This causes a constant retraining loop.

As you describe it here, it does sound like a real hardware quirk (which
would be a dt-thing) ... it's just that the previous wording describes it
in a non-hardware way - as Krzysztof pointed out in his reply.


> I will move this logic into the driver and handle it as a board specific
> quirk using of_machine_is_compatible("friendlyarm,nanopi-r76s")
> instead. I will send a v2.

This won't fly I think. We can't really have a (possibly long) list of

If (boardA) foo();
if (boardB) bar();
if (boardC) bas();

That really is not sustainable and most likely won't get accepted.

Heiko



