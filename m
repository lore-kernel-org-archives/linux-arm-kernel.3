Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E3FC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0InJ64rNB6YDk+9wa2+v0gxDu+S3dtbM2aXEVtkU8+4=; b=zWDdALWCZ4WicEjpmgqL4ZBfY1
	QkWPXWda+y/UIpUF7Uyg5r7cOw56yjEFA3vnIRXW35tp0hKEFCXoUsHmmt4t18Icp6zroOmSNyi6h
	7arZfw+2FjNXMSVaMITi0QFFqKHmokXHdPA7RxkyRkMz0PVT0ZyIJIp9P3tWoUwDhIco8eRbeFBkj
	XVZ3qz3xl4PYHWXMjcQaosp0iZZIZZHGhwSUXdHndIAHqy3u+2cftaOw1R6GwL/SBTHwtLpEE5ivf
	uN2MrzCjlsUYzfd09gcn/uMrWpVJCbGzGOtaspK+3zLEn/gNgOH1h+e95QLidQPYC+42fdOBoZBDT
	gDK2KLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RRm-0000000CfuT-2SY8;
	Tue, 01 Sep 2026 16:34:54 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RRi-0000000CftA-2kjn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:34:53 +0000
Received: from francesco-nb (2-224-12-103.ip168.fastwebnet.it [2.224.12.103])
	by mail11.truemail.it (Postfix) with ESMTPA id 8815B1F8BD;
	Tue,  1 Sep 2026 18:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788280488;
	bh=0InJ64rNB6YDk+9wa2+v0gxDu+S3dtbM2aXEVtkU8+4=; h=From:To:Subject;
	b=ZDqGv1OH4D15tUgJfWMVqQ8tSLn7X7bsnf8GBLiEuOtoc0joSoblMNMgBdsnvwWdD
	 4QfP3sNvLh4OtZIeoDuO30jefSWM/korZFHuZfpgsoV7JQGG0Z05D6lx/6llOb31fr
	 YGKp/sCQYt2ikrXAbHyeWfpF3tcP7HtLEF3UaGlh2cNJdaUsre3+Am1gooir6qFQwj
	 /zBVxs63pS/G/wnq2NsMWatz5D/KIpo054RLmDJcOFkcpmL0StDtOuqilWjckb50c3
	 ACte//wfpNrulp1wm+Z2sb3Rtb5dLtWiOsh6co5NWGMsKuF46eZGuLQ3mSA30EuMpr
	 Ig/ajQZmXYfHg==
Date: Tue, 1 Sep 2026 18:34:43 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] MAINTAINERS: Add git tree for TI K3 ARCHITECTURE
Message-ID: <20260901163443.GA122104@francesco-nb>
References: <20260615132640.161584-1-francesco@dolcini.it>
 <178275222394.2162147.13459463877313723046.b4-ty@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178275222394.2162147.13459463877313723046.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_093450_853857_8263E6C8 
X-CRM114-Status: UNSURE (   9.77  )
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

Hello Nishanth,

On Mon, Jun 29, 2026 at 11:57:21AM -0500, Nishanth Menon wrote:
> Hi Francesco Dolcini,
> 
> On Mon, 15 Jun 2026 15:26:38 +0200, Francesco Dolcini wrote:
> > Add git tree for TI K3 architecture.
> 
> I have applied the following to branch ti-k3-maintainer-next on [1].
> Thank you!
> 
> [1/1] MAINTAINERS: Add git tree for TI K3 ARCHITECTURE
>       commit: 4fb6763ec70d49f592cc6e684bfc5f17a7db7133

What happened to this? I do not see in 7.3-rc1, just in next.

Thanks,
Francesco


