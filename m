Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1967FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 10:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwxHeywLh4KrwQiqrLgmDoeWyxSu3XmmurwXVdnBOqA=; b=0pUGrmUbIpSURAjlicFoEc4Vt2
	jQaYuJSvDNCSu6ez8CUy3P+03OuRwHhoKLiTSJjthmwwmOrFb6PqYR0/iUmKaWJntWGCSrA4DOG3x
	jAAM/QuagkJ5rDGmZ62mklX59HGZmguQJKpSsDVWkZuiKmYXG3w39BNpVa4lBK4DmKUCYew51X0QR
	hFSCQBw8WzEmoihZg8bUORjwd7YlcAEPk6d0E2LJg8vHYN782TvthKkuhxaKilEZOyf9vIYlovGDW
	vIEVGLdaHkYQs0XM5/05IddBHThJLWgPSbU6fMiqvC8NhaHaTbbmpc7lEa4BUysNgsxkfp0Z9Jnl/
	yhOpnwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WvC-0000000A6Db-2nk4;
	Wed, 23 Apr 2025 10:01:38 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vuf-00000009qQQ-1rCz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 08:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=CwxHeywLh4KrwQiqrLgmDoeWyxSu3XmmurwXVdnBOqA=;
	b=RbPwiFs3tAdHcmyH8/ppEQR4Pj/h9KdEGPwF4+ifl6x6vOr408RanLq7UZSbc8
	vMe4a3L4Pzj+iBDSpdcZixdaoOuYNWZ34R798NXWKoTD992mbC8FX7Po/VBoz53+
	VM59dahKIwVQSLvnST5WHWuyT+UvJa9UAV1YFyYTKzzzk=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXFNtMqwho8_nRAw--.33766S3;
	Wed, 23 Apr 2025 16:56:46 +0800 (CST)
Date: Wed, 23 Apr 2025 16:56:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8qm-mek: consolidate reserved-memory
Message-ID: <aAirTH/lBetu9avM@dragon>
References: <20250326215214.1706887-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326215214.1706887-1-Frank.Li@nxp.com>
X-CM-TRANSID: Ms8vCgCXFNtMqwho8_nRAw--.33766S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIco7DUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwQ4ZWgIdsHOEAAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_015701_785075_CD8781C0 
X-CRM114-Status: UNSURE (   5.70  )
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

On Wed, Mar 26, 2025 at 05:52:14PM -0400, Frank Li wrote:
> Move dsp_vdev* to under existed reserved-memory node to consolidate all
> reserved-memory together.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


