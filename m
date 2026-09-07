Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9298AC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2A/Nbd/sgxzMN3+ZeCUQZmfzW3dZ/qRtwKK82swN7eU=; b=m/GSy3H+XB8XsUW4zPfI+ObdmO
	7K4b10D3vHH8l+dMYP0O0TV5Macya87H5yJO5eDGm+BHHeFZ81Pekja4uw0H6ekqr5MXiuM29zFf0
	TmgAG/GU1FHCe6uo0AKNY5CpB9FfYkHahiMk0ZM1Eg+WX7F2BMPvJ8m2s8Pui6x0RcwvUb1WDTD6B
	ZTuPde10AJuviMvVKKfCJi3dlFpk5a0LYGSeFPUPvgAkBp5AGI5tRkz6JV4j3idfk7n9UUeM4Dzp2
	uXZweS/ALcuVs4MkWJXzfW2s2lxSlSHKx3GWdBMw5Z9/ikXcMltFNOfpbM1b9P2VbAvNKwHaml30D
	V2snm22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Vvo-00000006O79-0eBp;
	Mon, 07 Sep 2026 09:46:28 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Vvk-00000006O6H-358l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 09:46:26 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id A0BBF1FDC8;
	Mon,  7 Sep 2026 11:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788774380;
	bh=2A/Nbd/sgxzMN3+ZeCUQZmfzW3dZ/qRtwKK82swN7eU=; h=From:To:Subject;
	b=jqBAko162TWMJDxFqoY9VWo16uH8wShA8f4jgt5mJsuqzneYMm3R4YrZfC4hUCtgY
	 SRldY8Gfcq/P0tCxwMxvw1lZCT8eV7NqThugNKHoiVrDtenovKJrMIs48PxdRMHHoh
	 1IQo3jz4fzRUqtyj0Pmb3Z705ZAcXvTtJ2FcXibo4g6xaQMl1gj5vpYAo1zg8lkmTl
	 gJXBCbwlenwJgkt5FKPGe3UI4huPN77l9awcwdjpWddUDOYX1WBVc7SO5m9ubQriWV
	 Fy0kHJKHHg2nyhqbQJmpzSV7AYuJSEf7RNnRi2IRDkSL/ABd5SG1FxJ38JuJv73QkB
	 eNrZpnzPOfNHQ==
Date: Mon, 7 Sep 2026 11:46:16 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: freescale: imx95: Add ENETC port 2 in
 SGMII mode on Toradex boards
Message-ID: <20260907094616.GA53628@francesco-nb>
References: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_024625_344304_00FB1BE0 
X-CRM114-Status: UNSURE (   7.91  )
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

On Mon, Sep 07, 2026 at 08:47:19AM +0200, Franz Schnyder wrote:
> Add the ENETC port 2 on Toradex SMARC and Aquila iMX95. The port
> is connected as an SGMII Ethernet interface.
> 
> Enable the reference clock on the modules and enable the PHY connections
> on the supported carrier boards.
> 
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


