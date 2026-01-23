Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E0BD6CFAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 02:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImYCBDxcwa6xUZaU3Vt+EOCESXER0tcEn3gxhCtxGY4=; b=aP+nWwaHdfdUZYdDUM/kICAAF4
	5UPsnD3lYkRaa/nlpaPonbeAxtlnkUAoliQJmA0PPMyWSyq3y0o1GarXBBuV1CUnCO2YBqg28YVhz
	C8ZAQX5yMMt9zD3SGUcb0a9qm1+X3xVmorKRavfJHvksDqT/EPYGTOHqa5Ky9UHtzxmL/QSSAS2EF
	yZgQqscKIS+QHts7ATCPN+jdIOxUZnug+Uh5xL0jvHdG05pRYaUebAPrCmnPMM5Q5BcNGR50V3h+H
	Wp9QdKr3C4PocCiiKlqsfAQt+uBjeW5S0HHGWlh1iTXttawqNcU48zLcbkc4KWJWuAsuLHDHbG8tJ
	6RttpRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6uk-000000082Qy-0sp5;
	Fri, 23 Jan 2026 02:28:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj6uh-000000082Qd-4AxN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 02:28:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2618541971;
	Fri, 23 Jan 2026 02:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1D4C116C6;
	Fri, 23 Jan 2026 02:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769135323;
	bh=ImYCBDxcwa6xUZaU3Vt+EOCESXER0tcEn3gxhCtxGY4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=c81k/N8k7h6SQi875WtEfXYBXJGUoyTzS/ho9z/4qH8+IpQesy+tvXxWkO1wG9A6R
	 5hzhmZ+qMw3xdMO2CVyG7vKkGntj+VUocsz5248TTvjZ3UUXIQ7Wi4UzQ+UrskNUBH
	 e/ipUmFzKSmtSAbR6ogop/0sTnphiJAJ7HZfCgi9x1+sblRsbI3aD5TZ72UFaTrERb
	 iW3TwmYUAL/5mdvEcIf8MUMVT7dMdshue707bdpC7NyJ+JdrUs9ZjVaAWREEcXOUJu
	 qFXJ4Jgn+FsHowxaKkNDZwnhp9JR/fj75d+Vh8RMlMLssKFx4gn0Dcvsc0rr70EYUE
	 otWx9TPMK+I4w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
References: <20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com> <20251106-ccm_dts-v2-1-12fa4c51fde7@nxp.com> <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional clock enet[1]_ref_pad
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
To: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 22 Jan 2026 19:28:41 -0700
Message-ID: <176913532114.4027.15108524142710620193@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_182844_054893_81FC9FD5 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

Quoting Frank Li (2026-01-05 12:50:11)
> On Thu, Nov 06, 2025 at 02:57:21PM -0500, Frank Li wrote:
> > Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad for imx=
6ul,
> > which input from ENET ref pad.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
>=20
> Who will pick this patch? Abel or rob?
>=20

Should be Abel.

