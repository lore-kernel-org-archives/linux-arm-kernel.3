Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C505CD73094
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 15:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gs1kMOlXrbZsLGY84yk6OiZKLkuZPgIWvrdhGV8DpHE=; b=1yDdYNiNNXBQs7dV5GJpVIFu+d
	ylmV7CiAvqC8A2Zp4+1LEojL4J7ZxmkJxAdxpURzEmCroxySG3YcTQdofBQALndG2Ko4WvcM6mP4T
	F/YhcCqp/YLxpUcDFUOZ27j2+3xukU/nRWH8M7yROPTtWh55Cld9ziy9Vd3gGOf1TTGKV8NGy+MR1
	N6XnB1e5yyd+NR3EtQ4yyp4w7CUAzMlQqwor3ExUXPdJxpykUighsJdlLyRWRzC47t29i84YrEe4k
	TSYV+jeTvXZ17xfrRDNgcBGMpklLbkvTd4ExeSLKUSzTaOIpXQO72O56z8ianc406LNfazw4JmrdC
	1FqEwWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92bQ-00000003Xsy-3GOS;
	Sat, 04 Apr 2026 15:08:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92bQ-00000003Xss-0L5Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 15:08:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09D4760008;
	Sat,  4 Apr 2026 15:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D01C19421;
	Sat,  4 Apr 2026 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775315278;
	bh=vsboea1jS0mbXrEN888C7vI6KSnNsfnadcjKrpMmAnY=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=BqFwLyJnTBhpomTB+sXRdwyVaWyzA1LM4x/jRCX0BFGrA8JpgKS8rfJ3LIpPDY9yk
	 p+d1jqhJ1Mjf2wU0RpwYFVVUOlAbdMj9UlGnuClj9FmR1QC9ZSfTvrkB18QTB/RfaR
	 3w4rXTh/VlmdJJ+A6SXPJawUID7A7XZSgzuHSGqEFu6Tbouz8uVWV9o1VaA1GFu7gI
	 3NdNsOM8C1NHzuvTeKFcIyrqClEFUe0UqumonfV9MfwITs9dnEyWj08ERsdYv9WbWd
	 01HVmLT594g3v4oxts7zZYAk6RxZP3qVHdO7PiI+5yTu0pvGRJP4QeyHxy5PzJrrxp
	 3oxcw/dlirZ+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 17:07:48 +0200
Message-Id: <DHKGQN6D0ANO.2QYY3JTM5435O@kernel.org>
To: "Russell King" <linux@armlinux.org.uk>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Ioana Ciornei" <ioana.ciornei@nxp.com>, "Nipun Gupta"
 <nipun.gupta@amd.com>, "Nikhil Agarwal" <nikhil.agarwal@amd.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, "Haiyang Zhang" <haiyangz@microsoft.com>,
 "Wei Liu" <wei.liu@kernel.org>, "Dexuan Cui" <decui@microsoft.com>, "Long
 Li" <longli@microsoft.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Armin
 Wolf" <W_Armin@gmx.de>, "Bjorn Andersson" <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, "Vineeth Vijayan"
 <vneethv@linux.ibm.com>, "Peter Oberparleiter" <oberpar@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger"
 <borntraeger@linux.ibm.com>, "Sven Schnelle" <svens@linux.ibm.com>, "Harald
 Freudenberger" <freude@linux.ibm.com>, "Holger Dengler"
 <dengler@linux.ibm.com>, "Mark Brown" <broonie@kernel.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, "Jason Wang" <jasowang@redhat.com>, "Xuan Zhuo"
 <xuanzhuo@linux.alibaba.com>, =?utf-8?q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, "Alex Williamson" <alex@shazbot.org>, "Juergen
 Gross" <jgross@suse.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, "Christophe Leroy
 (CS GROUP)" <chleroy@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: (subset) [PATCH 00/12] treewide: Convert buses to use generic
 driver_override
Cc: <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-hyperv@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-s390@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <virtualization@lists.linux.dev>, <kvm@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-arm-kernel@lists.infradead.org>,
 "Danilo Krummrich" <dakr@kernel.org>
References: <20260324005919.2408620-1-dakr@kernel.org>
In-Reply-To: <20260324005919.2408620-1-dakr@kernel.org>
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

On Tue Mar 24, 2026 at 1:59 AM CET, Danilo Krummrich wrote:
> Danilo Krummrich (12):
>   PCI: use generic driver_override infrastructure
>   platform/wmi: use generic driver_override infrastructure
>   vdpa: use generic driver_override infrastructure
>   s390/cio: use generic driver_override infrastructure
>   s390/ap: use generic driver_override infrastructure

Applied to driver-core-testing, thanks!

>   amba: use generic driver_override infrastructure
>   cdx: use generic driver_override infrastructure
>   hv: vmbus: use generic driver_override infrastructure
>   rpmsg: use generic driver_override infrastructure

I have not picked these up, as they have not received ACKs from the
corresponding subsystem maintainers so far.

>   bus: fsl-mc: use generic driver_override infrastructure
>   spi: use generic driver_override infrastructure

These have already been picked up via the respective subsystem trees -- tha=
nks!

Thanks,
Danilo

