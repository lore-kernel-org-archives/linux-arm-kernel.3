Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A3DE67497
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W//kf/xYk90pfIs56Ch6ErGwbP2X2r0D6G2dOa75D2A=; b=wUknJGHmG/iKpXZYBUIQv55mS0
	+3kZI5FLYRYFBxyLFrtOVbi5prcPougG+bnIC/HqNDNwhNAJOJzVmoqvKlpj81etTyg/+MN9ZFggT
	BLXHeGxJFqQ4NLcT1Ku0TwV6waD6/PZuqe3PHEb0moHkwuW5lK4BrBIMFrVwE0zu9tbhQ1S8z2DXD
	71apFOkJAL2J1PPRuHjuAiZbnKAgFepTbMEmN3v9AIatTd9DbCRRRvZYB9r4sh6iREF3MVP/w1r6m
	2/fVQy4KaZxByz4ylR/Iwe0T8E5dh2M/EiKAccTmwzvuhDVl9xQMBA+mPMvmgG1zesbu/qmuObr1E
	y1HKIHrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mzx-00000006GXZ-0JI6;
	Fri, 01 Nov 2024 08:27:13 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mrD-00000006Evw-2iMQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 08:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=W//kf/xYk90pfIs56Ch6ErGwbP2X2r0D6G2dOa75D2A=;
	b=F3kdZrwRbH5+cXqtnibhtwd//eQBKihnrDo6se+FoTwKJNQIs0t3AynIjszhNQ
	Fa3oqazt6r2iuWNm+p9U63uTu80vSchr/rK9arzpD6anjLD4xARQRwU/njzpjl0G
	GDJgQ3JRC0rvJ2GJym6Xc9U9LR3F04sldt9lxRRdE+UKs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBXXhO2jiRnB35nAQ--.13924S3;
	Fri, 01 Nov 2024 16:17:59 +0800 (CST)
Date: Fri, 1 Nov 2024 16:17:57 +0800
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
Subject: Re: [PATCH 1/1] arm64: dts: imx8mm-venice-gw73xx: remove compatible
 in overlay file
Message-ID: <ZySOtUd9jExZdFt6@dragon>
References: <20241018182824.740133-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018182824.740133-1-Frank.Li@nxp.com>
X-CM-TRANSID: Ms8vCgBXXhO2jiRnB35nAQ--.13924S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIXTmUUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxyKZWckPo77kgAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_011812_029847_AED0FB59 
X-CRM114-Status: UNSURE (   6.77  )
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

On Fri, Oct 18, 2024 at 02:28:23PM -0400, Frank Li wrote:
> Remove compatible string in overlay file to fix below warning:
> 'gw,imx8mm-gw73xx-0x' is not one of ['fsl,ls1043a-rdb', 'fsl,ls1043a-qds']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


