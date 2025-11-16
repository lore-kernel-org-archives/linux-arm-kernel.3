Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289DECD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mk5nILU1OOxZoG9axiju5UWDB4le/DG2DDfAwMEADGE=; b=uGayAydu+QiUMAValiATnT5M3i
	XPmqYO4OpdLt3YAt5dzc2CqnKIkpyzUYgRZYF1CU+Lvjy3NbYJLVYwQUclUfpOoNImvMYglvH8iLA
	Sje3Otp4lGJxs9hEu1BipbYTUV6TvVKJKvv/3MARTtlctOThR+onIE++UQ1AY+Py38/RPivOLReIA
	gNdhkL5VEvA/pLhMCsDdZI28OZh3jaV48GPLVAM70FNcD7PTQH3qjkutEvsk74tlyI1xsjDSzhoFI
	76yvzK63CW0/PpRVQswCzneyyMTQ2SNZHzKoYs8LFhpniJEvyfpgq/tXQLVxhR9Vpb18GZIQDGUDR
	/f0XWSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcDm-0000000Edce-1SRn;
	Sun, 16 Nov 2025 12:51:10 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcDg-0000000EdcE-1Vh8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 12:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Mk5nILU1OOxZoG9axiju5UWDB4le/DG2DDfAwMEADGE=;
	b=RuCZW42JHwTLrOOBZ8/hs+jxRpwB//vO35CplNtWw2LtiV4Ku43XmEw/2dc5OU
	rIN2rRU0C4eNDFehQ2/2O8bRkLFCBUscViADsKrbDfEWExRXyTJJW2v86XIMwFoW
	3MYgiFMmPkEVD4pNPf3ICTUZx0jyRZehLB7eR0rB/AZi0=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgA3RNeoyBlpbN47AQ--.8201S3;
	Sun, 16 Nov 2025 20:50:50 +0800 (CST)
Date: Sun, 16 Nov 2025 20:50:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add Skov Rev.C HDMI support
Message-ID: <aRnIqLtW7285gY4a@dragon>
References: <20251107-v6-18-skov-revc-hdmi-v1-0-595549e5b496@pengutronix.de>
 <20251107-v6-18-skov-revc-hdmi-v1-1-595549e5b496@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-v6-18-skov-revc-hdmi-v1-1-595549e5b496@pengutronix.de>
X-CM-TRANSID: Mc8vCgA3RNeoyBlpbN47AQ--.8201S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUFxR6UUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAr8YmkZyKoc1wAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_045104_957278_31BECF15 
X-CRM114-Status: UNSURE (   7.44  )
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

On Fri, Nov 07, 2025 at 03:49:51PM +0100, Marco Felsch wrote:
> From software perspective, Rev.C HDMI and Rev.B HDMI don't differ since
> the panel is connected via HDMI and the touchscreen is connected via
> USB. However, the bootloader firmware expects to find a dts with the
> correct revc-hdmi compatible.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied both, thanks!


