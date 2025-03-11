Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8D3C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 02:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICnWS1cvR/lqvpW3gZSBK0qzpmW+rKkDV9mICgOyRUw=; b=M9UMOLsHdpAfne9s6own97ziNB
	T4sX9eqLXAZPPcUqZLA5tC4TdXFAXdEJov7hrCziYheqKEtPlOCw6QqV5GYoH16ZKjqUaf7OXwJa6
	G1k4MDt+GM2RuFoqp4kgetuhMEJpJVRyhRsIgsj/vYZzvbIKEqE2cqo6bXRBXafU0jgCkkn57qsPq
	A6KCS2XdGG/eVVe0LxUOsqVOpUrU2Sg4BYmty27wTdNqGhKubCmKDAs5LqZlDDPJMv6Zk+uyR4PZr
	+TM4GDBavQaRz8nUV5NVx0y+nV1bzAjjrT5+VJHYMvl5wkfu6Zl9tjan2vC7f3A3CjHG/KHGsaYin
	I5Ewairw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpMk-00000004QPV-0ms8;
	Tue, 11 Mar 2025 02:29:10 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpL6-00000004QBU-11iP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 02:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ICnWS1cvR/lqvpW3gZSBK0qzpmW+rKkDV9mICgOyRUw=;
	b=QJz17dUOuRqwYZ4lw1SFnNr1/JueywpcOnyinBhnk7Mj3pbNGLgnEkb878/6qI
	USJVuEPEyLp93fUX2fC+aEJf5yxBTLRDVJqpT084uww3n1eT98OIxAj0FMS1yej0
	/4G5NII8rkRnaPKQvX7si2hZeDxGPh5fsYDJx4ZN6HzGw=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAnDnqBn89nqoywAA--.815S3;
	Tue, 11 Mar 2025 10:27:15 +0800 (CST)
Date: Tue, 11 Mar 2025 10:27:13 +0800
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
	linux-kernel@vger.kernel.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH] arm64: dts: s32g: add FlexCAN[0..3] support for s32g2
 and s32g3
Message-ID: <Z8+fgXENvCrqXvTP@dragon>
References: <20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID: Mc8vCgAnDnqBn89nqoywAA--.815S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3l1vUUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQcNZWfPUELrJgAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_192728_597249_C91798F7 
X-CRM114-Status: UNSURE (   7.37  )
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

On Mon, Feb 24, 2025 at 03:40:16PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add FlexCAN[0..3] for S32G2 and S32G3 SoCs.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied, thanks!


