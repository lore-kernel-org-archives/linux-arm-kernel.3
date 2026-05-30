Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D26CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 10:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnSw9/eFV2gm9WzVroD9AlPYZTDugHNiqlnBeQ2uSDs=; b=k9icDjgX7egcVXrQldI4KqjAhD
	IMoIxqB2cw/WsrKIgjiF1Qbdn42wdMpiHLZ5RCvRM2olYqI2UNkRCTGuqFuEkUzlg+Hpg7dlY6Opo
	VSX/QvAPdh9zR6gA+fMcVxrEJRLOx2SSFkN4LbX8ailJGXEdPUG2QPLtoyxqi66Kt/376VKt2iFTO
	+vjGyFbXY5biFl0/7N1RbTMOx5U0DCvEjPzYRuwvXZOWVpVtmW/k4RQkZZO62HiIeO/uqQcy3xxuv
	1+gMmO5gyV34Jo5Jhhnxjza18qqQAvM1j5Tin8RDOA+u2NeewXeK7SfmaPUvlUh9ZrenqsIZhBU/h
	UzA8d5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGsL-00000008cwK-0F0x;
	Sat, 30 May 2026 10:25:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGsI-00000008cvn-1Omi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 10:25:03 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:382:6f:8c15:9eec:bfe9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 517277CA;
	Sat, 30 May 2026 12:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780136679;
	bh=7DclqNSWpjRXXBRFWrNUXdTeUwXd2xsqw56KwwCn1mQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=srFsXAr0aGam8biawfn9fF17wEv2Y4RFd4XGkHIuo07DywhfuLMYY1MlDH+iHORoa
	 VHvqYgoLtLWqpr6Sh+ICtCE0juXNCyU7z/IsLgvZLrDnG20NxLFbGha8n/G9UbvhHn
	 L9a3FM/Wqg+NoLQbgPZoetReNlaQh4tfaEN1+EVw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260529150119.dqzzruc7xqliftwp@bullhorn>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com> <20260515-beagley-cameras-v2-3-f6acb66c9995@ideasonboard.com> <20260529150119.dqzzruc7xqliftwp@bullhorn>
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Date: Sat, 30 May 2026 15:54:55 +0530
Message-ID: <178013669509.933414.8765119606360834035@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_032502_527167_C263F5B4 
X-CRM114-Status: GOOD (  12.43  )
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

Quoting Nishanth Menon (2026-05-29 20:31:19)
> On 06:46-20260515, Jai Luthra wrote:
> > RPi v2 Camera (IMX219) is an 8MP camera that can be used with BeagleY AI
> > through the 22-pin CSI-RX connectors. Add a DT overlay to enable use of
> > this camera sensor through the CSI0 connector.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/ti/Makefile                    |   4 +
> >  .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 121 +++++++++++++=
++++++++
>=20
> Oh man..
> https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.co=
m/
> comes to memory.. Afd - what ever happened to that?
>=20
> other than the dsi mux, painful to see so much duplication..
>=20

I recently came across the new DTS Addon proposal:
https://lore.kernel.org/devicetree-compiler/20260112142009.1006236-1-herve.=
codina@bootlin.com/
https://lore.kernel.org/devicetree-compiler/20260409115426.352214-1-herve.c=
odina@bootlin.com/

which might be handy to unify overlays for all 15 and 22-pin Pi-style FFC
connectors, which I guess are now quite popular across different vendor
boards.

> Other than that, there is the previous comment (ordering etc, repeated
> here). I also suggest people put the url of the board/part that the
> overlay is supposed to refer to when creating overlays.. at least, some
> sort of canonical link so folks are'nt confused in a future date.

Ack. I'll add https://docs.beagle.cc/boards/beagley/ai/03-design.html#csi
in v2 unless there's a better link I can use (?)

Thanks,
    Jai

>=20
>=20
> --=20
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
> https://ti.com/opensource

