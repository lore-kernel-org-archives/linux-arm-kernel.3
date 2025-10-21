Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFA4CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYCe3lkSPCb2Hc0E21Vy3Hl4e6Ov3za1LHe8G0I1rNs=; b=UuoyY3hTNxoyMrDDyQLejtqb1C
	o2mrAQ5wLkcZakjQz4qMf3M9Dqs8AM1m6hQIcJFc3d1x8o01o1Ya3I8gJKa69tbT19QU0YQ6vM9Ya
	BSuNR6XPy3QS0PC1UjXlIc9n+WMrOEm2tQpxoUthuV4XuUYnyf581fcdMThubSJZQZY5iBImgzez9
	RwoUnQlFa3unDZtSvBTRhGkU24aUPIH7qO/dqm+lqOkz9epyg0n/d951Ts5qxi1Tarr1HVJx7mYP8
	TGlBBwg1E1R7yVbb7QI35watBnQPAjmWrbDG2zzvyIo1GzPi/Qf9WPjWiMD6zlCJ0aXY6816b+efs
	44xoueaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB973-0000000GXw5-3Aij;
	Tue, 21 Oct 2025 09:57:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB972-0000000GXvz-1wHe
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Oct 2025 09:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jYCe3lkSPCb2Hc0E21Vy3Hl4e6Ov3za1LHe8G0I1rNs=; b=kf1SmI5SMU2fDD0hWCGxhaiIwo
	iXIbcwTVWv7h3fufvulVeSjCxXpu8h/RW8d+xNvjMwo0lp3agwD9u05lkkSr6B7PV7GBzCqtBI3dX
	Gqt2p1Hek0eigedH4WSULk07sAM+FEdJGxWcJIozEZTZkvwIe69WPwoFP/GYEbK4rEDU0FLFdSVZH
	6lmTzFkUgPz7y+w23aHYXQN6P153OZmUnApa8Bj2ebMHw9dPYJ2ZUQc50IG+6cDVRcr/QVw0OUgYi
	pgCOl9Dmj3x3dcBofPPGI9EUqoxMRYICcARSfvo64+XQdfBpGT01Lh3hu8NwMkgPWsI6sORI64uYh
	ffyepzgQ==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8F6-00000000eLm-3eVx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:01:25 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59L9uRAY1121769;
	Tue, 21 Oct 2025 04:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761040588;
	bh=jYCe3lkSPCb2Hc0E21Vy3Hl4e6Ov3za1LHe8G0I1rNs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=thhEMRO8A5XfHuIPnumSTPetjUUmaaozss8J6GroMAfEPPXPd5z7TBD/JSkX5k0CL
	 OXXuwZNIGkchcrz9KIyGXxvYuMEjr7nvF/Ujx/zlV+uzZ//1pU+P5ozmrrVvAllSDx
	 lGk8jTydu3wFjVaQL0fPF0vtZsgfGRwRKoAzG65c=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59L9uRv11065000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 21 Oct 2025 04:56:27 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 21
 Oct 2025 04:56:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Oct 2025 04:56:27 -0500
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59L9uHo43566169;
	Tue, 21 Oct 2025 04:56:18 -0500
Message-ID: <cf10f312-3ba1-4226-96da-d2c9a149c1c7@ti.com>
Date: Tue, 21 Oct 2025 15:26:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Suspend to RAM does not work anymore with
 k3-am62-ti-ipc-firmware.dtsi
To: Francesco Dolcini <francesco@dolcini.it>
CC: Hiago De Franco <hiagofranco@gmail.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>,
        <hnagalla@ti.com>, <jm@ti.com>, <d-gole@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
        Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        Matthias Schiffer
	<matthias.schiffer@ew.tq-group.com>,
        Logan Bristol
	<logan.bristol@utexas.edu>,
        Josua Mayer <josua@solid-run.com>, John Ma
	<jma@phytec.com>,
        Nathan Morrisson <nmorrisson@phytec.com>,
        Garrett Giordano
	<ggiordano@phytec.com>,
        Matt McKee <mmckee@phytec.com>, Wadim Egorov
	<w.egorov@phytec.de>,
        Max Krummenacher <max.krummenacher@toradex.com>,
        Stefan
 Eichenberger <stefan.eichenberger@toradex.com>,
        Hiago De Franco
	<hiago.franco@toradex.com>,
        Diogo Ivo <diogo.ivo@siemens.com>,
        Li Hua Qian
	<huaqian.li@siemens.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Baocheng Su
	<baocheng.su@siemens.com>,
        Benedikt Niedermayr
	<benedikt.niedermayr@siemens.com>,
        <regressions@lists.linux.dev>
References: <sid7gtg5vay5qgicsl6smnzwg5mnneoa35cempt5ddwjvedaio@hzsgcx6oo74l>
 <e60dd8d6-2bd5-41f0-bf8a-b0a5822a7f88@ti.com>
 <20251021093420.GA28462@francesco-nb>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20251021093420.GA28462@francesco-nb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_100122_434781_2A992AAE 
X-CRM114-Status: GOOD (  23.89  )
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


On 21/10/25 15:04, Francesco Dolcini wrote:
> On Tue, Oct 21, 2025 at 02:33:10PM +0530, Beleswar Prasad Padhi wrote:
>> On 20/10/25 19:47, Hiago De Franco wrote:
>>> DM R5 sends a message that is never consumed, since no firmware is
>>> running on the M4 (the core is offline).
>>
>> May I know why you are not running any firmware on the M4
>> rproc? If the intention is just to run the DM R5 core on the SoC,
>> you can disable the IPC by NOT including the
>> "k3-am62-ti-ipc-firmware.dtsi". That was the motivation for the
>> refactoring.
> Verdin AM62 and AM62P are generic SoMs, that can be used for a multitude
> of different use cases. And not having anything running on the M4 is the
> default use case.


If not having anything on M4 is the default use case, it should
be marked as "status=disabled" in the DT.

>
> I think having the node in the DT is the correct way forward, if you
> want to start the M4 firmware you need such a node, so this is enabling
> a valid and useful use case.


Having the node is fine, you can still choose to keep it
disabled by default.

>
>> List of suggestions/solutions in order of preference:
>> 1. If no intention to enable IPC on rprocs:
>>       Do _not_ include k3-am62-ti-ipc-firmware.dtsi
>> 2. If intention is to enable IPC on rprocs:
>>       Make sure rproc firmware is available in rootfs.
>>       rproc would boot up and consume the mbox
>>       msg, suspend would be successful. Tested this
>>       on TI AM62x-sk with commit 1d6161617c, works
>> 3. Add support in mbox driver to flush the pending
>>     queues.
> 2 is not applicable here, and 1 to me is not a good solution.


Why not? Why would you power on the rproc, enable
the mailboxes, carveout some memory if you never
intend to use it?

>  So this
> means that we need #3.
>
>>> #regzbot introduced: 1d6161617c
>> Would not see this as a regression, but rather a new
>> bug for the omap-mailbox driver...
> As a user this is just a regression. It worked fine before, it's not
> working anymore now.


Isn't this partly dependent on the filesystem as well?
You would not see this behavior if you package the
firmware in rootfs, which I assume you did while
testing a49f991e740f

https://lore.kernel.org/all/20250908142826.1828676-17-b-padhi@ti.com/

>
> The fact that the solution might not be in the same file that introduced
> the issue is not a reason for this not being considered a regression.
>
> Francesco
>

