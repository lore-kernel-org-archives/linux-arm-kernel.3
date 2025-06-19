Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A34C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzI0z+Mor5geUtGLZUIfALB2YqIZPR9sIP0s0VrIuhc=; b=FNAA2UdNhjK+AwwgnO3PpOo4Pp
	eblC8HzyPxLjtAlV0tHEWI/tIiImBh0q36D8bceFlhnb8WbBO0tFBsax2Z9tLjycOKb53ecyRTLfU
	2UHHpYnEnruvQTprHo4JjPxprSgJDk3l6v9bo5910B0MoDdx32PGiHpgq6MQ4GpSKoXneWPaDKfDA
	K8jdegBUH6hVjUC+wjpw0y08w5OOgryMCVnzW2Pke/mT4JRlFznNaae5hMibB6AKP5UUwjk71AoeO
	8pnBnHcwtZCevc/rBrIYzQh1n0eRUoayJW0d7xs/ykJUdKzxj8fcf2TF8SsNmVynr3P/Llj1V8a4H
	h2qOGcTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAhN-0000000CR8U-25aL;
	Thu, 19 Jun 2025 08:32:41 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSA7V-0000000CMZ7-1suE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=dzI0z+Mor5geUtGLZUIfALB2YqIZPR9sIP0s0VrIuhc=;
	b=flQ+1SN9rSoyu8C/E5IRDER1gqFwqZA+0yErsk5h7gjXXTiptUqS1o5iCkGe6U
	Q+X+kCjoZJV7aR/KWBnTfgu1fKnMcGvIhIkl1CGk3R6uSk2BrTuK7IZSx+5iSHeA
	vcfTtHPg0S+iwTy+aOI3xu9SNU7FTM/kU6zwBhJ/Sbfxs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3l_NpwlNo_koAAQ--.3468S3;
	Thu, 19 Jun 2025 15:55:23 +0800 (CST)
Date: Thu, 19 Jun 2025 15:55:21 +0800
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
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH] arm64: dts: s32g: add RTC node
Message-ID: <aFPCaQyXuBlyYcpb@dragon>
References: <20250526162140.2460122-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526162140.2460122-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID: Ms8vCgD3l_NpwlNo_koAAQ--.3468S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnD73DUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEg9xZWhThWPlHwAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_005537_876600_69B2A624 
X-CRM114-Status: UNSURE (   8.17  )
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

On Mon, May 26, 2025 at 07:21:40PM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> The RTC module on S32G2/S32G3 based SoCs is used as a wakeup source from
> system suspend.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied, thanks!


