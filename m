Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEC8E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 05:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elDffjx4OH6SRJ4sYrMr/jtN2gDKhRQX2JMdW7ThPak=; b=yY3gkH8l8n08srZ7+XryCS9LY7
	hUbqeDT+XqlQMlT1cUtn1of7hl5YDm+nh+3EL9cvJvBLxDYtsRd1+nvrOea66gESefNAz3RMHq/PA
	yow1TZsGbYG0BRi2vMQMMjxrE4v1Knuy7T73bxdZfEWqb+j/mxiT4rWcgJ4KJDOsyj839qibnx38S
	6WWOsTGOfQnXGiYl7WILSa2MJxCjYNmp4agqZh9Cfou73K7NlLK601EbuQx/w/TXh41nosPeSSHe8
	BN+6KIOl3tDCnGTy4Xf7ekxb6bNoMHxbvFac40X5g3IwlWUc+JY1IH1+0sU0Fe7BlPzcUwAqB/Bbk
	jAZOy50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFdv-0000000DsFQ-0xpI;
	Wed, 11 Dec 2024 05:52:15 +0000
Received: from [198.47.19.245] (helo=fllvem-ot03.ext.ti.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFcr-0000000DsAh-1Iv7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 05:51:10 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BB5orHM2575121
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 23:50:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733896254;
	bh=elDffjx4OH6SRJ4sYrMr/jtN2gDKhRQX2JMdW7ThPak=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MiX1K6rANJ762nagAgnOCCends7HgNQkNptdpkG7a3hwItvApyoEsDjp+dr89XRnt
	 FVREdbLDKIxd5coDOkbMcyLhRD7P7KlAlXrTs1QDKunL1oue5yQepiCBZeoqRpEbuK
	 kbmvJB5pEaErrB7Kv3ayv/AxKv2VreL/sTRpOQiw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BB5orpZ103007
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Dec 2024 23:50:53 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Dec 2024 23:50:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Dec 2024 23:50:53 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BB5oqsI039946;
	Tue, 10 Dec 2024 23:50:53 -0600
Date: Wed, 11 Dec 2024 11:20:52 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Vivek yadav <linux.ninja23@gmail.com>
CC: <linux-newbie@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <daniel.lezcano@linaro.org>, <lpieralisi@kernel.org>,
        <krzk@kernel.org>, <christian.loehle@arm.com>, <sudeep.holla@arm.com>,
        <quic_sibis@quicinc.com>, <cristian.marussi@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <vigneshr@ti.com>, <khilman@ti.com>, <sebin.francis@ti.com>,
        <d-gole@ti.com>
Subject: Re: Fwd: ARM64: CPUIdle driver is not select any Idle state other
 then WFI
Message-ID: <20241211055052.gbxnyqpui3t3zpw5@lcpd911>
References: <CAO6a-9_aPLCx2CqecQBGbK78_=+-tT44RepPkrBjpkWSvjj4Tg@mail.gmail.com>
 <CAO6a-98cdSvyd7jgAyGNmsC2nxmRSyr3GppxvZU9yHU1xqwz3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO6a-98cdSvyd7jgAyGNmsC2nxmRSyr3GppxvZU9yHU1xqwz3g@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_215109_539774_640AE4C4 
X-CRM114-Status: GOOD (  26.68  )
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

Hi Vivek,

On Oct 14, 2024 at 16:06:34 +0530, Vivek yadav wrote:
> ---------- Forwarded message ---------
> From: Vivek yadav <linux.ninja23@gmail.com>
> Date: Fri, Oct 11, 2024 at 3:14 PM
> Subject: ARM64: CPUIdle driver is not select any Idle state other then WFI
> To: <linux-pm@vger.kernel.org>

+ Kevin, Vignesh and few colleagues at TI who have been working on this as
well.

> 
> 
> Hi @all,
> 
> I am working on one custom SoC. Where I add one CPUIdle state for
> ``arm,cortex-a55`` processor.

Any further luck on this?

I have also been working on something similar[1] but on an A53 core on
TI-K3 AM62x processor.

> 
> idle-states {
>       entry-method = "psci";
>        cpu_ret_l: cpu-retention-l {
>          compatible = "arm,idle-state";
>          arm,psci-suspend-param = <0x00010001>;
>          local-timer-stop;
>          entry-latency-us = <55>;
>           exit-latency-us = <140>;
>           min-residency-us = <780>;
>     };
> };
> 
> I am using ``Menu governor`` with the ``psci_idle driver`` in its original form.
> After booting Linux I find out that the CPUIdle core is never going
> inside the ``cpu-retention`` state.
> To check time spent by CPU in any state. I am using the below command.
> 
> ``cat /sys/devices/system/cpu/cpu*/cpuidle/state*/time``

What I was seeing is in a multi core system (2 or more) all cores don't
enter the idle-state simultaneously. There's something keeping atleast 1
core always busy. However I could definitely see entry into TF-A from 1
core at a time.
I then switched to a single core system to see if we were atall able to
enter TF-A when only 1 core was available for linux, it turned out that
with the "local-timer-stop" property that we have, this is never
possible.

See this chunk in the kernel cpuidle driver:
	if (broadcast && tick_broadcast_enter()) {

When I dug deeper into tick_broadcast_enter it always returns something
non zero and hence in my case it was entering the if block and tried to
find a deepest state. Then the deepest state would always return WFI and
not the idle-state I had added.

What we found out was on our kernel we end up using 

kernel/time/tick-broadcast-hrtimer.c 

This always seems to be keeping atleast 1 CPU busy and prevents idle.
If we remove the local-timer-stop it was helping us, but we still need
to dig into the full impact of what that entails and I am still
interested in finding out how so many other users of similar idle-state
implementation are able to do so without trouble.

Arm64 recommends to use arch_timer instead of external timers. Once we
enter el3, timer interrupts to el1 is blocked and hence it's equivalent
to local-timer-stop, so it does make sense to keep this property, but
then how are others able to enter idle-states for all plugged CPUs at
the same time?

> 
> OUTPUT:
> 0 ===>CPU0 state0 (WFI)
> 0 ===>CPU0 state1 (cpu-retention)
> 
> increasing some time value ===>CPU1 state0 (WFI)
> 0 ===>CPU1 state1 (cpu-retention)
> 
> increasing some time value
> 0
> 
> increasing some time value
> 0
> 
> What am I doing wrong? Why does ``cpu-retention`` state time not increase?
> Any pointer will be helpful.

I had asked a similar qn. on IRC [2], but didn't get much response. I
am still interested in finding out what the right thing to do here is.

[1] https://github.com/DhruvaG2000/v-linux/commit/0fd088d624276a2e72b8dc6660d261ab6d194f4b#diff-34369928f669d14776f8f5bdbe3fc3d75306196a2ac28b1a4d7e17402b9c3995R160
[2] https://libera.irclog.whitequark.org/armlinux/2024-08-23 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

