Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9268C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 07:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HGvvkUO5PI2lhLwqNWFUyi3tDt6/UQpdwEBa8XWbrc=; b=UOqioJFog4kVkDOCdzoTs9IbER
	EidGjb8UlU9HfdE3gSUuGp+rbW3aPxCfWOEXnINxURE8UXPN6YBi54xE7k1gp//Zi7kpm6Wv5oJCN
	QaKbzfCwSqlWJp82n9LpiD9kfJ4TFaeLQ2NoYEJw6dgUlD9Fa4AvMy+eJfTS+WLO6oJViBUeetpJu
	SQi4EPCfiGIYSzaKiuT92S/RBSlcR+Fw8dBk7feZXbjN2GPRWDDtpJRkSeGZCreGv11jZl4gWVoU/
	TijPLWFcoIMBOROafAMZVTwoltM/MpJTF1d3On5bB7BK4k9t7DDRTEKjlCVlErkotg09IAhLaO1Lw
	HLkuBkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twyuU-000000057DY-2t0h;
	Tue, 25 Mar 2025 07:41:18 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twysk-0000000571s-2Bja
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 07:39:32 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 40E451F83F;
	Tue, 25 Mar 2025 08:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1742888360;
	bh=/HGvvkUO5PI2lhLwqNWFUyi3tDt6/UQpdwEBa8XWbrc=; h=From:To:Subject;
	b=ysemAN5y7zQf5M11vmEarU5i9KubasQV2MDpOX7Etq22Ey3B8M4DrC8roLpD84+5P
	 Q6E/n07U+wQJvlhMnnPVBDaPCOLgoXbBazpDYXwr+MdRtZGVWoDDBkzEMCk9pYZZpy
	 bbQUBaPIZhWPjEyUZLpZWTAK8wz93QqDlmMjCBlnBcCTxHrxXX/9qE7pMxk7Ha7ZaU
	 Q+pu8nOlCjYMudptUbckwwzk8K+sPYOvmCWMpauakoC8yDOQ+c2hWJ/pREKRl6GpVY
	 yMt+pgdozStgO3CYDDGvmfP42f11NKVMKeu4edkMV81hsbxEhQBhqTKG6lR5nxQYTX
	 /edp9QyvweNNQ==
Date: Tue, 25 Mar 2025 08:39:16 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Joao Goncalves <joao.goncalves@toradex.com>,
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: imx: document i.MX 95 Verdin
 Evaluation Kit (EVK)
Message-ID: <20250325073916.GA4684@francesco-nb>
References: <20250324234013.140440-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324234013.140440-1-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_003931_439336_060BFBBE 
X-CRM114-Status: UNSURE (   9.33  )
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

On Tue, Mar 25, 2025 at 12:40:01AM +0100, Marek Vasut wrote:
> Document support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK.
> 
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
> 
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95-evaluation-kit
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Francesco


