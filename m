Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C3FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELnDowNSV88ozqNx2/R40hrPzJSlxaAw2vVwupi0syU=; b=hZGzPndcxQb+RADUP8I/CVxzN3
	1hTHV1bnW9p5gDKTEoqLVcm7zLG2BV5Me0VZ6QRBunngfjqldZOXKBlfJolqvPzaET0/k7lUnTxMl
	ie9Y1yFAL7foX42jW1ZU0Yv42HsFRZ2ZBK6T1JT0HEzkXjLZrxLTyWLmSLsxj6j30MbuT+lCAkW5c
	Y+0iPJ9WE4BDhyjO1IdI6Xx2hDuNG8CEIcdNuUARXmzMTqJw1cxaOxtFBbgcl64T1F2KMWvISDuY9
	u+way1IH2vefmoi2aybNgovn4s4+eoF+pygmSeBEYAGRwWhLrXPJ3XBlMVryKu4+li0aeSjJjJmoW
	zfYL87OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73g6-00000005gQB-0T0r;
	Tue, 22 Apr 2025 02:48:06 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73QG-00000005d1R-3PO1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ELnDowNSV88ozqNx2/R40hrPzJSlxaAw2vVwupi0syU=;
	b=TfAyzARZh3HNQlrT5i/6suExlmSpBZeW87qnkZaaXd4h1ygDxHCvLgSsl5qn+8
	QcY2eNcjsGpFK/Uf2w8+hWFSGckUpwZEnzTxM0MXs6/sJtZSNHOp5UPd3+moqpT8
	QWVjslU5HDi5E9+ftETLiGJ6MDSyh77eq8lYvICx9OBLE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3YiKF_wZomhu8Aw--.13077S3;
	Tue, 22 Apr 2025 10:31:35 +0800 (CST)
Date: Tue, 22 Apr 2025 10:31:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx: Fix the iim compatible string
Message-ID: <aAb/hXdFochL8Lhh@dragon>
References: <20250313192943.1547330-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313192943.1547330-1-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgD3YiKF_wZomhu8Aw--.13077S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYF4iUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCws3ZWgG8BZIOgAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_193145_255486_7E55B535 
X-CRM114-Status: UNSURE (   7.55  )
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

On Thu, Mar 13, 2025 at 04:29:43PM -0300, Fabio Estevam wrote:
> Per imx-iim.yaml, the compatible string should only contain a single
> entry.
> 
> Change it accordingly to fix the following dt-schema warnings:
> 
> efuse@83f98000: compatible: ['fsl,imx51-iim', 'fsl,imx27-iim', 'syscon'] is too long
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!


