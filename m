Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B6FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/N8g8/qVoPBEKBIfIm1v+a1Lcy8fJnT8su5q5VehsW4=; b=izdsyK90lu8OCAK9ZQOlx0ptCx
	RnDDQ3jevjA9/e33PsVhLuOmLEUW+c2hvR9y+22qdjCPg4R0er+TkXxa/vTe8GnsrzXuDBnjYDCMc
	zxl+3p3hbt764EL7vBsGNDeB2tcfLOzQ2AtVtBmFJaSOLCRuxL8LJeaAmukmmqX/TS3geWfF2NY4y
	Jf2CjLvck5tpbMGBTFjqFXPWkpxZ5VJWd1p5+sbJXGms6/GzRLIA7CYAWR7Ibd2LHGSklxKCNe0RB
	FX2rSh5BtqbIUP+PFLeEubf+mRkJGvLFFmMU4ciJ7IyYFYYL9yyxUGm36DDNmDtFJEKzDOb1EElZ+
	innWkKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAon8-0000000DLYh-3ycq;
	Mon, 20 Oct 2025 12:15:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAon7-0000000DLX6-0H2X
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/N8g8/qVoPBEKBIfIm1v+a1Lcy8fJnT8su5q5VehsW4=; b=n/P+MkWXnnUmtTQtrr+XNIKBVf
	oZw99nd7thDX/xmITHLb/XqqXNrXUWCn//4aNpEGpgGd0eq0VaL9auCRGiuivvn9oS96HF5/TYMPD
	x8HpSH/wwMamq8qEr3FtUdn6cFDVFFQoJy4oGxO71S5lVEAmQWKL45IlBoTfcE8wqBv0P5/J4cj68
	10fuiv+4hAVn4uaDzTE4eKTRCqH+DcCN95U0p6wNhQIt8v4lbxOX+S0JYB3f1NwqDpgWXgWBXeDnh
	3DBNej2VDe5ROugi3HfyhdjbZVJhEx8b/1++tg4QKPlWb5HF/tTfLStez0AQakbxDUU2lTBwPyi6+
	WnqMDSMw==;
Received: from [1.95.21.17] (helo=mail-m16.yeah.net)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAon0-00000006dEk-1ZLQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/N8g8/qVoPBEKBIfIm1v+a1Lcy8fJnT8su5q5VehsW4=;
	b=qYeqXXYYQ9oyJygq2euQbXLOD/A0TPfRtmR4ttWfL/y2fZtY7PUiRqjv2a2a3p
	Kifv0uKPajfBm9T+nNHuLlJ56SODiMahQwuta3bRIyfs7eOSKrdPJrtxuE9dbpLx
	L58Bki9UhcSF4x9xYkQSJg2AlC8UPGLGt3eLrPgeQ4pNk=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDn16CoJ_ZozapTAA--.27231S3;
	Mon, 20 Oct 2025 20:14:34 +0800 (CST)
Date: Mon, 20 Oct 2025 20:14:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, l.stach@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx51-zii-rdu1: Fix audmux node names
Message-ID: <aPYnqLvUt9672wYb@dragon>
References: <20250915220655.143861-1-jihed.chaibi.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915220655.143861-1-jihed.chaibi.dev@gmail.com>
X-CM-TRANSID: Mc8vCgDn16CoJ_ZozapTAA--.27231S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcGNtUUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNwrLMWj2J6pTqgAA3t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_131504_827335_8CC9061D 
X-CRM114-Status: UNSURE (   7.81  )
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

On Tue, Sep 16, 2025 at 12:06:55AM +0200, Jihed Chaibi wrote:
> Rename the 'ssi2' and 'aud3' nodes to 'mux-ssi2' and 'mux-aud3' in the
> audmux configuration of imx51-zii-rdu1.dts to comply with the naming
> convention in imx-audmux.yaml.
> 
> This fixes the following dt-schema warning:
> 
>   imx51-zii-rdu1.dtb: audmux@83fd0000 (fsl,imx51-audmux): 'aud3', 'ssi2'
>   do not match any of the regexes: '^mux-[0-9a-z]*$', '^pinctrl-[0-9]+$'
> 
> Fixes: ceef0396f367f ("ARM: dts: imx: add ZII RDU1 board")
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Applied, thanks!


