Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5D4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/f7eY3kVgl7N2EL4ncuhVE5xQDYNoDV9DtJxE6RGIo=; b=UOBBZ2Uax3sWuWrThfZqTavADd
	yLkotH5raGbG5XU2qZpo0ZoN8YdBz8MtOgrMAHbXZS7CMCN1SL61eajouCh9fWuOsG3UkJih10C1t
	kDWE5Xj5rNukkvM0MlsenHvcR0bmXcfnHi2vPY92OITbGsorBvuz6gKWU0gjfgUJI43CRYaYOapCB
	w5LPPKVAa5r1INKb0xERGIpkOshhtB762ljAg9j7oBS1dwzmOPuRdrhOj2ciXe7HcG8JlE4CdtQlD
	M0V3KvXv4BC911oCVYjRPuZ4Xf7lDxNDiO59wO0SkcXSHr132w5Iufs4PbxNGQYQJrtKrHa0XEHzd
	QXfsrpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9c3-0000000EEyn-43Ct;
	Fri, 11 Jul 2025 09:00:11 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8nw-0000000E5Fg-33G4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=h/f7eY3kVgl7N2EL4ncuhVE5xQDYNoDV9DtJxE6RGIo=;
	b=OP59YnskeNiseYFWrR10zN+uDMLip8mSXEPH9bQT08orJav4xNfcy6HaOdkHWA
	WruYMdaTtT1CbD4+BSDXjAlo+H4DE2b6l7S1TowuNFgsV6jRzCovejLM7xbAuOVl
	Zv56zQ532hcDA/JpsNsMoIy9K8geAWbcLUVLvVf8AEYQg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3X7pnxnBoJd9RAA--.10335S3;
	Fri, 11 Jul 2025 16:08:09 +0800 (CST)
Date: Fri, 11 Jul 2025 16:08:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: max.oss.09@gmail.com
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx8mp-toradex-smarc:
 remove gpio-hog on lvds_dsi_sel
Message-ID: <aHDGZz6C50CbeTz5@dragon>
References: <20250708135300.2855155-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708135300.2855155-1-max.oss.09@gmail.com>
X-CM-TRANSID: M88vCgD3X7pnxnBoJd9RAA--.10335S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFy5tFyrWw1ftw47Jr1DWrg_yoWxuFX_uF
	47WrWUX3yxJF17t3W5Kr4rZry7Kayjvr1Sqa93Wws3Ar9IyFW5CF1kGr95G3sY9398GF9x
	uF15X34vg3ya9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjs2-5UUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAkCZ2hwxmlPzgAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_010825_179524_19EC2EC8 
X-CRM114-Status: GOOD (  12.05  )
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

On Tue, Jul 08, 2025 at 03:51:40PM +0200, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> The LVDS_DSI_SEL does not leave the SoM, so do its pinmuxing on the SoM dtsi and don't
> leave that to a carrier board dts file.
> 
> Using a pull down on the LVDS_DSI_SEL signal is enough to have the signal not floating
> and have the SoM in a defined state.
> Thus remove the gpio-hog used on the line and leave this to carrier board dts files or
> overlays to use the signal as needed.
> 
> 
> Max Krummenacher (2):
>   arm64: dts: freescale: imx8mp-toradex-smarc: fix lvds dsi mux gpio
>   arm64: dts: freescale: imx8mp-toradex-smarc: remove gpio hog

Applied both, thanks!


