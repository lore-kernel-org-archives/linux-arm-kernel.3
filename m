Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92390C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 01:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hk7ZeiYwOz40YUch5aVMcMHStH9+6Z54QC+hnbt5LbA=; b=V31rJV7dvqOUTH25v9+djo0Ga9
	VFkQTrllNIijX5OtA6ISSmR4NzHG/hxYC+A9WoAwwdSkgp+wOsaR3HIjP3HHLNLJucAPihJZBL2nq
	ZBWgO+7SXxCssxOsvRDSBP2+v/TpCYadMZhvL1ii+mTmmt6o+C2sYy8cZOrHfA1R2C4/rbiSNyGgI
	qMG0tUif8oxvvoduYrrasZXm80fmHDRpzrfP2LYHowNX9LyqLc7KL1wvlHMBKTBcHjebaxLHnlZ0s
	p5wvgZ9Uzyqg4zVksoBlucjouuCWFlLfqmxpeymuE1RSyUae41zrNuh6tn3og47TU2DfZM4A9+HZh
	GH3boshg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmN5-00000006zkI-0ZCe;
	Wed, 02 Jul 2025 01:34:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmKL-00000006zTp-4BCI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 01:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751419916;
	bh=hk7ZeiYwOz40YUch5aVMcMHStH9+6Z54QC+hnbt5LbA=;
	h=Subject:From:To:Cc:Date;
	b=bu1mHB8I8dJgGgzFe5UcIwj7MQrDplM4UegN72H849eg2IrW5EJ7liLZJUGV3dviF
	 nc/KBxwSK5WtusXVtuXDYq51qxDggLwJ9GEoni5L1cZ6jY2mB4Xbjwd4ydKMKA8UNR
	 HkB9hApAPik3yjT2aPgHFjVxU0EMXf8lXw2apMdpT+TGbppozANseIpvmJuYCQh6+k
	 8YSN2/+qaeUDVhijB2SZjxwGsEnGnHUzzPoz+KNrmcyiTaYQoJsYWr9bMKK4udqtn5
	 TIwTuT5oy6pw0oaIqGzKRiXM0tr4hSJiwyxH+DlmP365l8J/P8jfCpNYyS3tH1kRBF
	 T8xsOpQt8E/ww==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CAFFC640B4;
	Wed,  2 Jul 2025 09:31:55 +0800 (AWST)
Message-ID: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
Subject: Add bmc/linux for-next to linux-next
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,  openbmc@lists.ozlabs.org
Date: Wed, 02 Jul 2025 11:01:54 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_183158_229921_597A4915 
X-CRM114-Status: UNSURE (   4.71  )
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

Hi Stephen,

Could you add the following to linux-next?

   Repo: https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
   Branch: for-next

This aligns with the recent patch to MAINTAINERS for the ASPEED tree:

https://lore.kernel.org/all/20250702-bmc-tree-update-v1-1-c270cd8af0ab@code=
construct.com.au/

Cheers,

Andrew

