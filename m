Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3748C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 22:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64yZTokUOKWEi1l5XEMnLoTKVKqtdorCaDPLUUg5R/0=; b=ikix69H6ENUVNVC1piYSLCWnNX
	vavq6k+SVHaVcuZ4r8t3imvTry5z3zmBkKriR6Jw+05GCuyNGVdu2dADDcyED8B568P6SFAASJe+e
	Vq7kprZMjLWgGI89btkvnG+9UGWTCub01XkKapRXc9V2IO+WPKm9XSK8rf4RIhs/rdwFcIDU7L2Q+
	LEsb7VaD/FlFi9j3vMVH0nmdIbUO3yxsGLO35CIrVu0jrLORK9TR3WaEtgalODxS26lf98OS58n9v
	DIaNMPxBuSu7VTm5mZ4uACkgqn3Iw7dv5jYHFV6p0m+kFqtNSxVshMxyIGXABv4mZRxoPLgxqeCuj
	8cgQ2zuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whDbx-0000000FwBE-0Dq9;
	Tue, 07 Jul 2026 21:45:49 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whDbt-0000000FwAk-21Jj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 21:45:47 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260707214540euoutp018cf7ea42ac22b890dbdba35a70cb024f~AIBgSP67m0751007510euoutp01B
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 21:45:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260707214540euoutp018cf7ea42ac22b890dbdba35a70cb024f~AIBgSP67m0751007510euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783460740;
	bh=64yZTokUOKWEi1l5XEMnLoTKVKqtdorCaDPLUUg5R/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J5Ql4lP1oiFXtQYiTzFXBmfxUjrzpzyZIpRJNeQHBONwrncCno0MOBr6cc0EmYxlu
	 qF5E54SFmmGhCpalWIiWVKmoAGz/OtSGDc+SJJDY3j4GJwLNwxWljxwjafpp1QFsxE
	 4Fs1fvxkC4wf13bezU9LBhFtgTzqgDUb5ayosdMk=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260707214538eucas1p2b46a6831dbed600dab30756a0078711f~AIBeoMkm10868008680eucas1p29;
	Tue,  7 Jul 2026 21:45:38 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260707214537eusmtip272eee7641a70a5f1694e39ef6326faf4~AIBd7L2FY0322003220eusmtip2Y;
	Tue,  7 Jul 2026 21:45:37 +0000 (GMT)
Date: Tue, 7 Jul 2026 23:45:34 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Stefan Agner <stefan@agner.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Ovidiu Panait
	<ovidiu.panait.rb@renesas.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net v2] net: stmmac: resume PHY before hardware setup
 when opening the interface
Message-ID: <ak1zfkNN4akdKrRQ@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <ak1rseUKTWFKzBib@AMDC4622.eu.corp.samsungelectronics.net>
X-CMS-MailID: 20260707214538eucas1p2b46a6831dbed600dab30756a0078711f
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----086pkQbFtnoS7HLFmBecfPu9Cf9WQCmSNse4hrMKP7AYRkCa=_12ee25_"
X-RootMTR: 20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1
X-EPHeader: CA
X-CMS-RootMailID: 20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1
References: <message-id-of-your-v1-mail>
	<20260707195425.405989-1-stefan@agner.ch>
	<CGME20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1@eucas1p2.samsung.com>
	<ak1rseUKTWFKzBib@AMDC4622.eu.corp.samsungelectronics.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_144545_977127_7B90E807 
X-CRM114-Status: GOOD (  10.62  )
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

------086pkQbFtnoS7HLFmBecfPu9Cf9WQCmSNse4hrMKP7AYRkCa=_12ee25_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 07, 2026 at 11:13:46PM +0200, Jakub Raczynski wrote:
> - This change is actually broken - in previous patch rtnl_lock() was asserted
>   by dev_ioctl(), but in this version it is not asserted anywhere and will
>   trigger WARN_ONCE().

Ok, as I looked again, I am wrong again, ndo_open() does hold rtnl_lock
already. So from this point it is good. Relocking would create deadlock,
so I take that part of comment back.

BR
Jakub Raczynski

------086pkQbFtnoS7HLFmBecfPu9Cf9WQCmSNse4hrMKP7AYRkCa=_12ee25_
Content-Type: text/plain; charset="utf-8"


------086pkQbFtnoS7HLFmBecfPu9Cf9WQCmSNse4hrMKP7AYRkCa=_12ee25_--

