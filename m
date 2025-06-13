Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163CEC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 01:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0l4FT/265PtP2SlRKliEFOkYYKE2dg6XYNloUrx8/FM=; b=maoSjY7LrbfgB+nXTWezTnkNSu
	nEa6U4wyIgBHNk9Yl7UEF5j1irS1oblTj4xHXAFSQi+2Nu2gsvac48VVnmkcnesrZS0TSgu15p6WR
	hlkkutEnBFkUde3VZj28bGWWYCXmnj4Fo5455imTMPyF1CV2azUZhIXkvP7PUJ5WHW1pzBDj7GP2q
	fD+lHinAP4ASYjl0EGjZ9d7ks71+tQcp3TekKiuDGwFpoGTdyQByjQK+MH57gRismw6WJN50TlRwx
	PGZTH+QUY/lTOXZ4qN2UGRFfG89z8FDwduc8P4BpnNlQ/HCxq4uvDhWgg/EXFV0Wvjvnco8rxAL5j
	v8qmVisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtX9-0000000F5V6-3A5E;
	Fri, 13 Jun 2025 01:48:43 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtUz-0000000F4WV-2xOS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 01:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0l4FT/265PtP2SlRKliEFOkYYKE2dg6XYNloUrx8/FM=;
	b=oo78miOng3B2Bj9xi0Nj2Zj5kn1rB5m7y8sVKakPNeeswRYl150SwHGPq1OCIR
	XOdUaJ1HsRX5uHOyHMzRWHHs2hLmLHSleYAAsDhM7ckrYoRXkb3rsKrAzOildVT/
	WHKKcx8Hph24JGthQPotDtBB3+mC67NeVhGkmdrrsygY0=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnvlLfgktoX1OLAA--.58062S3;
	Fri, 13 Jun 2025 09:46:08 +0800 (CST)
Date: Fri, 13 Jun 2025 09:46:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/3] ARM: dts: imx7s-warp: Improve the Bluetooth
 description
Message-ID: <aEuC37WwWCQHkXO2@dragon>
References: <20250513142320.4036324-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513142320.4036324-1-festevam@gmail.com>
X-CM-TRANSID: Mc8vCgCnvlLfgktoX1OLAA--.58062S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU1LvtDUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBdrZWhLgIcJPAAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_184630_050706_C0FEBE37 
X-CRM114-Status: UNSURE (   7.54  )
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

On Tue, May 13, 2025 at 11:23:18AM -0300, Fabio Estevam wrote:
> GPIO5_17 is connected to the BCM43455 BT_REG_ON pin.
> 
> Improve the Bluetooth devicetree description by using a more accurate
> description of the hardware as per brcm,bluetooth.yaml.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied all, thanks!


