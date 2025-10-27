Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D7ECCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 05:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVn4b0deNMpWiRLKcZDZlWur5NaH7E5RHtbADcGazGw=; b=ssdXaQJAA53l4wWEsdjugDJrWH
	Yrzvn+uD59AuH4YdoR9+fqna/G9YJDPCwxlP/zcqV4oGtNgxvO5t0zd6Lx1esC9DaumZ3uuoyw0DK
	90mTOPsIvzn3PpBtVWZVM2d+/3EDs1BC1vCzXEOuo2lHFblRo4arrRWnU3k/GnB0MFliNTyNqpPiL
	HYMJ5QK3fCifUIToJbHKXM1vvJXKtr7JjQfAKVUjVZ6+PsduX3mdofOKQMBK8+kvpj6MgN/ZDYI5z
	898IPF0Wx9RS1+13v7nWEyOgkoEvCah68eHlyVWmtmrwR7dZHezKAamUpjwVsY9J88g6RUaJtZvEy
	QY7MFUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDFzS-0000000D89X-2LAV;
	Mon, 27 Oct 2025 05:41:58 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDFzP-0000000D89A-2kXT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 05:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=iVn4b0deNMpWiRLKcZDZlWur5NaH7E5RHtbADcGazGw=;
	b=F3/HY2nw5S6JLNqpitn99uVadtBHG8q2efti5F2VT3SfG79Q1WOqTTiMz+TVIr
	1u/hHh/T6FAH6VTsaJmfN8fIbVQxm2dsiPmhmAdrPLSs3qyfZKe9Y8Pc1QPIqvFp
	rQM/0VVvWHU3Mwwfp/Z3Mc31nmltNz4zfJXQe0jVYvU2c=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHz6gVBv9okR2+AA--.24198S3;
	Mon, 27 Oct 2025 13:41:43 +0800 (CST)
Date: Mon, 27 Oct 2025 13:41:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jan Remmet <j.remmet@phytec.de>
Cc: Teresa Remmet <t.remmet@phytec.de>,
	Janine Hagemann <j.hagemann@phytec.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10:
 reorder properties to match dts coding style
Message-ID: <aP8GFPBVQhyIA0-2@dragon>
References: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
 <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-3-7e5de62c79bf@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-3-7e5de62c79bf@phytec.de>
X-CM-TRANSID: Ms8vCgDHz6gVBv9okR2+AA--.24198S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcYhFUUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhegBmj-Bhc3ZAAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_224156_035525_DC5A3DC9 
X-CRM114-Status: UNSURE (   6.82  )
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

On Tue, Oct 07, 2025 at 10:12:28AM +0200, Jan Remmet wrote:
> Sort properties. Rename regulator label to match schematics.
> 
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>

It doesn't apply to my branch.  Could you rebase?

Shawn


