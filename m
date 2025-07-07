Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6086C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 03:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqD3gSRQjmJJbS8nlCnrgcz+xeIvmv28GDtgViA9HD4=; b=bIXSUGzsKs5ObThysU7ju7saUo
	T8mmvCMCVrBo+gltK3LTpcqhpP9/jpK2rigtctXS6BMNDrd0g3ZrhbdSa3uIb68Zpw/TTl5gp814a
	7t3VfT2ECz1YI+JO8uHEC6f1YOEipXxG7mrkeQ4hYfOCHsvPVBisDOJL5DsVEb2+rNerIILU93lBk
	0OqROOc4+w9Ju3HMmb0ACIhwccUklWs6/xboq7a6JtXQtrKxIXHXf+P4A6Va3855lJ28tZe6pUS7b
	UUY2RVxBeUwZKrNYdTGQ2Nq9OS2uj23DItXUygpWDqEwF2gaq/K9J1fmNxFlF7KyF0nA9g93aUbv5
	1e5Aig5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcdY-00000001IsO-33NN;
	Mon, 07 Jul 2025 03:35:24 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcbD-00000001Igu-0sSC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 03:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yqD3gSRQjmJJbS8nlCnrgcz+xeIvmv28GDtgViA9HD4=;
	b=meqG47i57FfNjO26ICIEITROCN200/JBTduXW6LGQ6BCObWbPl+fMuEbB3KvBl
	BBdjKimHbnwaCzeyGo+leOebYzdHZI5q9mi2wBfY6u3dmWVMsjba2P8K287r9BPs
	qp4UMayIW3weL/xUqbv6UL6FNeUao5XmjD2K0RxP1vIro=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnd+zIP2toQiw5AA--.31332S3;
	Mon, 07 Jul 2025 11:32:25 +0800 (CST)
Date: Mon, 7 Jul 2025 11:32:23 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename
 overlay to include display name
Message-ID: <aGs_xwcBRUYe2EKl@dragon>
References: <20250619054513.2134620-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619054513.2134620-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgDnd+zIP2toQiw5AA--.31332S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzgAwUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgr2XGhrP8oWrgAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_203259_633417_3BACF3FB 
X-CRM114-Status: UNSURE (   9.97  )
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

On Thu, Jun 19, 2025 at 07:45:11AM +0200, Alexander Stein wrote:
> This platform supports several displays, so rename the overlay to reflect
> the actual display being used. This also aligns the name to the other
> TQMa8M* modules. Apply the same change for MBa8MP-RAS314 as well, as it
> uses the same overlay.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


