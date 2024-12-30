Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A042DE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 07:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stkkzQ0NGdLWxEFE8mBuddW732lN8XbJUV0E782b7gs=; b=pIhWlPvUXmQyciWCYzwG8UYsuB
	9U6gmH5Mf1AHlSMxz5vTF80pPEOYPFNT8WgORBCkgp+9ZRGPgNxWK/3JqkyTO9ndng20nudzNaKCV
	pKrDcPhJVth8wkao01jrIYK5SHm1X9BhYd8h2/Pwx9DREueXFWz0Xd6hLzxBitcpJFidVyNgFx2sw
	J8kpotQi4byiSZFIIfvFMqvnaWQEpU4IMB4gOP8tviWC/PCiOxIHqZsIjWu3XTONMuvUKMf2iXKdE
	NK/8aApUqNovUlfSS4IFkR+1vkbSbSmynfxq4+agQ8mGl3FL2pQ4wyzTPa6dN6wNrqYu/B/ik64gM
	KwxiByyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAZR-00000004lZW-1Yq3;
	Mon, 30 Dec 2024 07:52:13 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAWx-00000004lBV-2fyo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 07:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=stkkzQ0NGdLWxEFE8mBuddW732lN8XbJUV0E782b7gs=;
	b=OYM1922pSwyShKq9idwjWUua37d1pRxWhv6A//z7mlnkF8Nzk1FCTqt+iSFG3V
	hEsCEPN83Pm+H80cY03ZorwVfBw/wiIoJkeACS97yLGQLr8Oh1GUR+pwc7hGGfeY
	9GOqNcNfaCXAB4M6vfBRJn+Kxk5RHM20QhlO//6dmG5wg=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBX+Np2UHJnmRwGBg--.61233S3;
	Mon, 30 Dec 2024 15:49:11 +0800 (CST)
Date: Mon, 30 Dec 2024 15:49:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Hui Wang <hui.wang@canonical.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, shawnguo@kernel.org, xu.yang_2@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH v2] ARM: dts: nxp: imx6qdl-sabresd: add dr_mode to usbotg
Message-ID: <Z3JQdnIObYJk/rtW@dragon>
References: <20241216040722.21738-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216040722.21738-1-hui.wang@canonical.com>
X-CM-TRANSID: Mc8vCgBX+Np2UHJnmRwGBg--.61233S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIb10UUUUU
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxjFZWdyEhDb4wAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_234940_011593_92F21EEA 
X-CRM114-Status: UNSURE (   9.87  )
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

On Mon, Dec 16, 2024 at 12:07:22PM +0800, Hui Wang wrote:
> Currently there are 3 type of boards (imx6q|imx6qp|imx6dl-sabresd)
> based on imx6qdl-sabresd.dtsi, they all do not set the dr_mode for
> usbotg device node. The chipidea usb driver will configure it to otg
> mode by default if the dr_mode is not set, but some testcases need to
> parse the dr_mode from DT and decide the follow-up test strategy, here
> set the dr_mode to otg explicitly for these 3 imx6qdl-sabresd based
> boards.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Applied, thanks!


