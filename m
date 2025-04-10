Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219C6C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 22:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAHWlrkGaGa/sJ3ZWC6puhhyYjNhD0uWw1WtiT3oZXA=; b=Uvk2ugpg8FtKC94kw3QSfI3hwE
	1z+zXYVHb6XIsrjzxpUmTLY/pUxNYYpFWipJZzPCqv1BEmd+FfKC35rO24h9/4B3JWW+E9lTYXOJC
	SbX4Fyfbz31gJ5tDDK+NqBQB3dbPFCa1EOIVnjAiC9T8bXMFBK5WkQVrXww7DOi9+WWUo2xRVNxPV
	m0AAIeB3k64ImDjHrxSg9535q43qYv9svuq2z4tMXurjac+qoHMD8kIfQZvzNp2hKAd51wCBi+F8I
	85kmWdWiyWtsyPUdBj2zyhQFxTsf1Kq3WBpVNGuwobB8uhtrcnHN6mIWrkVYSfKuP+tUleStTfifP
	XL0JcdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30XM-0000000Byey-02pg;
	Thu, 10 Apr 2025 22:38:20 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30Ux-0000000ByQ9-3D47
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 22:35:53 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53AMZkFm1933242
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 17:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744324546;
	bh=uAHWlrkGaGa/sJ3ZWC6puhhyYjNhD0uWw1WtiT3oZXA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aaP+8pzkOCSycvOOl74ognY5yyrUQJuhrNr4m55ZHqJ01ukyv5ozjXRCGOm926WrG
	 5eezpEAJCii4xFBn5IOoXnZW3ewTO7w4JOb/HVcK3JFgT2Ije2Yy5C1fTQBgE844vy
	 HgRCjcEIj2tS+cGXB5CVkXfeDoRCZz1Cm1ynwLoA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53AMZjVJ017990
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 17:35:46 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 17:35:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 17:35:45 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53AMZjPt092627;
	Thu, 10 Apr 2025 17:35:45 -0500
Date: Thu, 10 Apr 2025 17:35:45 -0500
From: Nishanth Menon <nm@ti.com>
To: Robert Nelson <robertcnelson@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>, Judith Mendez
	<jm@ti.com>,
        Andrei Aldea <a-aldea@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Deepak Khatri
	<lorforlinux@beagleboard.org>,
        Ayush Singh <ayush@beagleboard.org>, <kamlesh@ti.com>,
        <praneeth@ti.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
Message-ID: <20250410223545.m747qkoqpwsz57ae@septum>
References: <20250408231823.826163-1-robertcnelson@gmail.com>
 <20250408231823.826163-2-robertcnelson@gmail.com>
 <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
 <20250409130918.d3cyzv3to65oktv2@vision>
 <CAOCHtYgpkBXZmZEDz6gUCO2x+WGA_paKHFHS-Br=ypo+AFrBmw@mail.gmail.com>
 <20250410120822.3vsrt42iyfs75h6q@spearhead>
 <CAOCHtYh7LWhTBOSsua9_=wxSTNt9HmvUaAFCiVS6a8G6dV4AoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCHtYh7LWhTBOSsua9_=wxSTNt9HmvUaAFCiVS6a8G6dV4AoA@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_153551_964894_434120F7 
X-CRM114-Status: GOOD (  20.82  )
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

On 12:15-20250410, Robert Nelson wrote:
> On Thu, Apr 10, 2025 at 7:08 AM Nishanth Menon <nm@ti.com> wrote:
> >
> > On 10:12-20250409, Robert Nelson wrote:
> > [..]
> >
> > > > Any idea why we are crashing?
> > > > https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1#file-gistfile1-txt-L311
> > > >
> > > > I don't see the same crash in beagleplay:
> > > > https://gist.github.com/nmenon/5709a8714d3ab31cac5c00b515d04752
> > >
> > > On 6.14.x i have a little more, info...
> > >
> > > I've got all the CRYPTO stuff enabled, pretty sure that comes from
> > > CONFIG_CRYPTO_MANAGER
> > >
> > > CONFIG_CRYPTO_MANAGER=y
> > > CONFIG_CRYPTO_MANAGER2=y
> > > CONFIG_CRYPTO_USER=y
> > > # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> > > # CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
> > >
> > > https://openbeagle.org/RobertCNelson/arm64-multiplatform/-/blob/v6.15.x-arm64-k3/patches/defconfig?ref_type=heads#L9578
> >
> > OK this looks like to be a independent pre-existing bug then and needs
> > to be investigated, but it is probably independent of this patch itself.
> >
> > Could you share a clean defconfig bootlog? I have no existing scheme to
> > test this on my end. In the logs, please also print
> > /sys/kernel/debug/devices_deferred to ensure we have nothing sticking
> > out in our defconfig?
> 
> Okay stable v6.15-rc1 with arm64 defconfig..
> 
> https://gist.github.com/RobertCNelson/666638abac8eee4ed573997996362450
> 
> root@am6232-pb2-87:~# ls -lha /sys/kernel/debug/device_component/


umm..  It was cat /sys/kernel/debug/devices_deferred

> total 0
> drwxr-xr-x  2 root root 0 Dec 31  1969 .
> drwx------ 44 root root 0 Dec 31  1969 ..

Thank you Robert. I will assume there are no deferred devices or
additional defconfig components to enable.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

