Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA39E63FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 17:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fK4CeZGVb1KNMIdR5Au5izpo8ayGMJknWsxoBx3biqw=; b=QsFKKIfkqq4q5JbWPrVkiJahRK
	kXM4HcI1ImJ3SWRiFWTOESiMgb+7NGkLnvzcx9MT28x8b2SC0t0ioiMRBkhGzeClQKOakvIOpPy/M
	XtjIZ2cekh7GgDcO04tMIVKQ3JEYSC7D2dwAk4LmLwvc1UEYw50drlDP8EGBNUUdZ6FlYzH3PLl6T
	YMRWm0uXe4uWiVPLG50yfl6B57TXBPPBbX4CprGsqxAIef/M906ry8J5q8x9YD5AVAKSJ7EAn11dc
	im+Akx9gS5nhLcSPXeba2nagABVLsrwFxdDACoCTrX9KTr4/lj+rqOOZcLzIzR27xd5PCrKC1A7H7
	o14cbtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w94QG-00000003cVy-2cjk;
	Sat, 04 Apr 2026 17:04:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w94QD-00000003cVc-49zM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 17:04:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 979924060D;
	Sat,  4 Apr 2026 17:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6663AC19421;
	Sat,  4 Apr 2026 17:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775322272;
	bh=7PzP6n6U4E9ZflmrRkBSMwOeYsGN0d+ge+8bYc26zsY=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=fe5eJq1d99JHNmPB8IpFig8PRyyyj5sltf3KPYrDsk0N8TKZGpBePJLkrkPDItx5u
	 OD9XiP1BsdzxhDnieDTpdRavUaIxIOsfwema+FPuAf2OftNWG3RNzfc/+E74+vzYXL
	 hr6gl/9eoMudVQ+SB7i9KoJ64jNeCH7KBFn19c9SoYtuyJxnlnjg/gnFezKFCEM8UT
	 pXBEauClp409xFE/+hMuTZWOGegzPULPyvlbewkUUrLyfkmmluI/xnbmAAlztMocbH
	 5TCceEPtW/9Z41b0BUe5ZnMFG66SCb9IcaE5AfJKxdvb9nrxftJLbDrCkbK9ayIBu8
	 7zufDNhS7HSYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 19:04:21 +0200
Message-Id: <DHKJ7VWI1CHO.3ETHUGQVPFFDE@kernel.org>
Cc: "Russell King" <linux@armlinux.org.uk>, "Greg Kroah-Hartman"
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
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-hyperv@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <linux-s390@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <virtualization@lists.linux.dev>, <kvm@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-arm-kernel@lists.infradead.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: (subset) [PATCH 00/12] treewide: Convert buses to use generic
 driver_override
References: <20260324005919.2408620-1-dakr@kernel.org>
 <DHKGQN6D0ANO.2QYY3JTM5435O@kernel.org>
 <76355cb5-0b5d-4a29-9702-8d020a79f4c0@kernel.org>
In-Reply-To: <76355cb5-0b5d-4a29-9702-8d020a79f4c0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_100434_092617_F6A813E4 
X-CRM114-Status: UNSURE (   8.07  )
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

On Sat Apr 4, 2026 at 6:58 PM CEST, Christophe Leroy (CS GROUP) wrote:
>
>
> Le 04/04/2026 =C3=A0 17:07, Danilo Krummrich a =C3=A9crit=C2=A0:
>> On Tue Mar 24, 2026 at 1:59 AM CET, Danilo Krummrich wrote:
>>> Danilo Krummrich (12):
>>>    PCI: use generic driver_override infrastructure
>>>    platform/wmi: use generic driver_override infrastructure
>>>    vdpa: use generic driver_override infrastructure
>>>    s390/cio: use generic driver_override infrastructure
>>>    s390/ap: use generic driver_override infrastructure
>>=20
>> Applied to driver-core-testing, thanks!
>>=20
>>>    amba: use generic driver_override infrastructure
>>>    cdx: use generic driver_override infrastructure
>>>    hv: vmbus: use generic driver_override infrastructure
>>>    rpmsg: use generic driver_override infrastructure
>>=20
>> I have not picked these up, as they have not received ACKs from the
>> corresponding subsystem maintainers so far.
>>=20
>>>    bus: fsl-mc: use generic driver_override infrastructure
>
> I droped it from soc_fsl tree, some dependency must be missing.
>
> Feal free to take it if you can, it is acked-by Ioana.

It is based on v7.0-rc5; if you want I can pick it up.

>>>    spi: use generic driver_override infrastructure
>>=20
>> These have already been picked up via the respective subsystem trees -- =
thanks!
>>=20
>> Thanks,
>> Danilo


