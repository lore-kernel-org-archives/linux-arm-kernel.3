Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A0EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 01:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/khsHseSeDANI9AcueSC1NZqa7+XUI5LWtmaVCfors=; b=l4kdJxXFxLSuMPFvj1wWgIWoLR
	/rgW3JY9x6B9nYSp5U5DVcygv9fKbsSCti6C5ZQs/0xNZ9HNp4SLx6OVfIQ1eFyd2nYy5ciUcZ/+2
	YCwpzLRP3G1wGITePLGhqV1wKoiQVFvm90KUZSlIIaKQj5w2JrupD6vH2eaNhg6fNbQJHsYqG65L1
	WLSsHD2yN82TnbDk3rF1wnBpBbR1BmrFwdMgfOaTSlfD98koXF3CvJ3Vn8wwE8RfBbxkGLvf0/zNk
	N8ioJtGl7fZQRKKpjt9DEhf2HwX/A5FGYoTxj3Si/0UKZ9oR6oSu4ij5+ND6Nlcb3bTexItROPyZR
	bG3TsMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87yx-0000000Fi94-2Ghc;
	Fri, 25 Apr 2025 01:35:59 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u87x2-0000000FhvT-40W5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 01:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=t/khsHseSeDANI9AcueSC1NZqa7+XUI5LWtmaVCfors=;
	b=GKav9YMoJ9UN/xtBHSp3Yq3Il18fFedslGx6oMATvbGcqSkvC4ivNBUcPbDi6d
	5POOg03+oOu2ONAFo/iiJ1wvOhMS/kdO2TfN/KlBiWp4eZyBYvFSsQaNQ8SDTidr
	TXwxcDINek60tmyQQWXtXJpnxZHUOZ6aLA+972+2Hc364=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXBEBy5gpoBQ_sAw--.17829S3;
	Fri, 25 Apr 2025 09:33:40 +0800 (CST)
Date: Fri, 25 Apr 2025 09:33:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] arm64: dts: s32gxxxa-rdb: Add PCA85073A RTC module
 over I2C0
Message-ID: <aArmcsTXLZvRrg1E@dragon>
References: <20250410144826.73651-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144826.73651-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID: Ms8vCgCXBEBy5gpoBQ_sAw--.17829S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVaZXUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQw6ZWgK0Y1WOAAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_183401_294824_DAE3292C 
X-CRM114-Status: UNSURE (   7.45  )
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

On Thu, Apr 10, 2025 at 05:48:26PM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add support for the PCA85073A RTC module connected via I2C0 on
> S32G274A-RDB2 and S32G399A-RDB3 boards.
> 
> Note that the PCA85073A RTC module is not battery backed.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


