Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE7FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+wrJuVhFDbFHGAbhIGnA2cIJXtpLd/P8h4Mv8rR6ZU=; b=VVTT1/dRV1N9kgRMe80Qok4J/d
	VVPwiNqgbA/usE80h3vS7D6rUz5q4RKr7TrfXQSP4cym5nRRYfpooHQGqNtdwnJW2ewUwg6h9thQ7
	LMr/qpdrDkOjQUpXhNuzx3xg7X4M+p3amNln9WBuuTSl3ISJa7/J3O9+yhrVlHOS90S5bOEZ5KT+U
	V84ckcHrHjBto5JcM45o/Gzn7Xmt5HHOkBj6IG5DrO0qTWtZOMX1rWGSMAd0tyAT2yL7cEBrSQpn9
	jqLzcAYlRDb+mABvIv3k3ATmX0lCsX6YLIlGAcZaDCp4AYmccCziVnqivORMscCIejRxkPreC3mjO
	8S54vMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJqz-00000004tr1-0QH6;
	Thu, 02 Jul 2026 16:01:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJqx-00000004tq9-0G7q;
	Thu, 02 Jul 2026 16:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=r+wrJuVhFDbFHGAbhIGnA2cIJXtpLd/P8h4Mv8rR6ZU=; b=RqesHXHXaYOPCKhUf9LBqc52Pd
	Nx8ajwVcRXhNtLf33JzWPlsmGpA6yjCpfX1JTkYxG2/dnhV69dQsPFzEMpcZLFYA0W6SuXklLRkg/
	UPtKVC7irgrR+C1Dd07QhNbeQAqMonruQ2vBXPY+pBx/HIOWgm/WONwB6BAwPGqvkl7tfZ1A4pqBj
	cY+uvDNZz5eiPgIbRoDBIu/q1rW13g40ZAu/2OI4k7QuIeFd+67dJzQ0K6tdBU8hnSGOtrE0N1rfn
	z5l/Htbn3wRbSBIpd/Enf1ZiZJe12ef5FuwDawa1pvfNzUcczyQfJnH/Wqyf4AfRA/48dqMgF3GHZ
	2MfYmDMw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-can <linux-can@vger.kernel.org>, 1579567540@qq.com
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel <kernel@pengutronix.de>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Eric Biggers <ebiggers@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Karl Mehltretter <kmehltretter@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Cunhao Lu <1579567540@qq.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD compatible
Date: Thu, 02 Jul 2026 18:01:06 +0200
Message-ID: <2459655.BjyWNHgNrj@diego>
In-Reply-To: <tencent_3B2B6003D1DE4FB7A984665A062581766405@qq.com>
References: <20260702140654.2961561-1-1579567540@qq.com>
 <tencent_3B2B6003D1DE4FB7A984665A062581766405@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_090127_130231_575A38B3 
X-CRM114-Status: GOOD (  12.34  )
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

Am Donnerstag, 2. Juli 2026, 16:06:51 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb 1579567540@qq.com:
> From: Cunhao Lu <1579567540@qq.com>
>=20
> RK3588 integrates a Rockchip CAN-FD controller variant that is not
> fully compatible with RK3568v2. The RX FIFO count register field is
> encoded in bits 7:5 on RK3588, while RK3568v2 uses bits 6:4.
>=20
> Add a dedicated rockchip,rk3588-canfd compatible to describe this
> variant. Do not use rockchip,rk3568v2-canfd as a fallback, because that
> would describe a register layout that does not match the hardware.
>=20
> Changes in v2:
> - Use enum for the single-compatible entries, as suggested by Krzysztof.
> - Reword the commit message to explain the hardware difference instead
>   of referring to Linux driver match data.
>=20
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

after fixing  Krzysztof's comment:
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

and doing dtbscheck of the binding against the dt-patches:
Tested-by: Heiko Stuebner <heiko@sntech.de>





