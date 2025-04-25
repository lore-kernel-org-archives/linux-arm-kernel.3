Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E2DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4Rq8oM0lfxwGxHCxGHz5nvQEWnfy10Mn/MUqJBAsDI=; b=FV04RBIsHUlj+uZmIRCCSVOnOY
	zShGdVEfjN4jKHtWfAtn9jrBFL+i1mbBdqJPli8aps+pAWc0FnkB3DOGpMKlSqLh6m8m38W2nt2h7
	7Oz+IXKxZGnPwBYslvV+pxNH+f9ewLepzJc8h12jicGBJA9mXP3ERQ7h3thCh3sS50g8mabawFGBX
	DXq6L9jQy6jjCiHKQYKXFoBbu4JMf/2dDmyKVGTspE1BBnso526dOLZL/B8IuCpF49PFJpZ2h3/4T
	9niuRY+0XfTEP/xY6AVWI9Dx92uVvI4CAmhAejshS5LdKOdnHlf4DtRzixuedQ/2M5vjxWGL7lN+o
	ulG5R1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88Rt-0000000FkMw-3tFu;
	Fri, 25 Apr 2025 02:05:53 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88Pg-0000000FkCg-1C8H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 02:03:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=A4Rq8oM0lfxwGxHCxGHz5nvQEWnfy10Mn/MUqJBAsDI=;
	b=ozwY4w83ev7WrpOBi/KKnBVlxt0eSYZGRLhNKOfKLpFjx4khFNj3Ruhu9OG77i
	MtkWK2jRqHjfGE8pTmrBJo75KbcWLjzfQ7SL6Y2FKg/AOue7urCWkDHFsmtAAlMW
	JebPiLShAF99fK3llREW7xanCG6IQYN1iS2j00WNFAb5Y=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCHhtVe7QpoHU_aAw--.28202S3;
	Fri, 25 Apr 2025 10:03:12 +0800 (CST)
Date: Fri, 25 Apr 2025 10:03:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: add MBa91xxCA Mainboard for
 TQMa93xxCA/LA SOM
Message-ID: <aArtXhus7Q+Qa+Wb@dragon>
References: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgCHhtVe7QpoHU_aAw--.28202S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3YFADUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgQ6ZWgKtVvRfgAAsq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_190336_660201_733E5771 
X-CRM114-Status: UNSURE (   6.72  )
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

On Tue, Apr 15, 2025 at 02:59:44PM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> Add MBa91xxCA starterkit base board for TQMa93xxCA/LA SOM for
> parallel display evaluation.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!


