Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B019CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 20:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86TLixaQ4qZmTfqmXe0cl5nLobZEJ9tiRlB2jm0Vi9c=; b=1qu9v7bL3omaer9WVjKHGXcbl5
	Yuq3YZRJ9Sc+z5KhABiyV76JfwWLu0/cwE1cqgn+gRmguVO8mqtRYAGNJCiMoUW+q9MNNvq0vPjo5
	WhwSZ/cdhmO75OMxIIpAH7CFXuGf4LLoNQbYdoY8kd1YgqDwA2W65XQHbQXS3RfhsiKsTDLIfKlsS
	0E4sjstNEZCXc08Zeo2JjC2HGGMv88B+VAykPt2P+d+4fW7Me369PFErqXHlmOKyag4Pmwbfd0E5v
	ayw9otUq0cvuvt3SMNLEEmlPlIa+hB6ypmIbK1l87UoNp8Xw/6FrXIvECnxhlCy4mLCRSCK62Gcnh
	AcEtY4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nXy-0000000BUgh-0VIH;
	Mon, 22 Sep 2025 20:54:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nXw-0000000BUgX-40xf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 20:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 216FD60241;
	Mon, 22 Sep 2025 20:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6131C4CEF0;
	Mon, 22 Sep 2025 20:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758574443;
	bh=Sr2X5P1gNWeAsocKaWUqNJp3KIq8TIFmVTuLBsbU70A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o2ActnDCu07Tsa6Lughyxct0Cd9FIxHiuwhFxTQSzSh977Ito3vj4x0F0hh+jMQ3T
	 nDjVj8tCwmSqJOz6G0HpWHptllsygqpiUva1wwjADecCewtRykJ/2cbSjKrjeppX+d
	 ERhFmgFD8EDDR/d/PyV9I0oeKDNkPpOSp7E5UzdAuWsP4TXMjyDF0DsFmC9H6z/umy
	 V8emmE/c0NKRAWAcSPh4d6u3w6g8JGAYK1CWhQPgo2i+cRCqY0ayu16Ue6zOcAMOiB
	 ofEAOtB7aF7IKlrEl2uanGx7s3B/ecC0QJ/bLWvt7j5sjfGTnnwPkNrbHisV3vsUrH
	 a37vSI8OW56GQ==
Date: Mon, 22 Sep 2025 15:54:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rogerio Pimentel <rpimentel.silva@gmail.com>
Cc: primoz.fiser@norik.com, imx@lists.linux.dev,
	alexander.stein@ew.tq-group.com, devicetree@vger.kernel.org,
	joao.goncalves@toradex.com, Markus.Niebel@tq-group.com,
	y.moog@phytec.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	marex@denx.de, frieder.schrempf@kontron.de,
	linux-kernel@vger.kernel.org, dario.binacchi@amarulasolutions.com,
	xiaofeng.wei@nxp.com, francesco.dolcini@toradex.com,
	linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, josua@solid-run.com,
	s.hauer@pengutronix.de
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Message-ID: <175857444205.1306528.291706454583324337.robh@kernel.org>
References: <20250921233534.838680-1-rpimentel.silva@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921233534.838680-1-rpimentel.silva@gmail.com>
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


On Sun, 21 Sep 2025 19:35:33 -0400, Rogerio Pimentel wrote:
> Add device tree compatible string for the i.MX8MP FRDM board.
> 
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> ---
> 
> No changes in v2
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


