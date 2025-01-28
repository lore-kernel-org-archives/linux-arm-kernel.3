Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB57BC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9WH4WNzCeYIATPILPxy5tb//08noCNCy7fXxaVGJQo=; b=cLrxJQogYlEtn1RgBEK5C/C1us
	BYAn9+lBJQxVdq9MnN3XyKEG8SxvIgRKTSTQyjsYlzSTFy3gjF7rg8ZON3lJVXf+jISr6j50oN7qT
	hsEEUmskM1cs93hN4RYwn5SDLmh5f2v4STNL8JrS6JdYJcyASWjJHfGSNs6Ex9qPEUtyZsL5cRcWm
	yEydiUSRz2wwgmAelAljuDSUV5YUjYoBRv/u0tp38nPAyCM7Mf6VNABsHTtV40TR8b7gBOlLvzZG5
	2ckmwsUTeJSpiW+TbdOglWOw171z+/unWGHvZ1rQM50pAUM2csc+AYZNsS+QR0AwhHGeO/an5hT8c
	cUpRFnwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tciDi-00000004ZmE-0SaB;
	Tue, 28 Jan 2025 09:49:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tciCM-00000004Zhr-2QVq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 09:47:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E680497;
	Tue, 28 Jan 2025 01:48:22 -0800 (PST)
Received: from bogus (unknown [10.57.35.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACBDE3F528;
	Tue, 28 Jan 2025 01:47:52 -0800 (PST)
Date: Tue, 28 Jan 2025 09:47:20 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vivek yadav <linux.ninja23@gmail.com>
Cc: Dhruva Gole <d-gole@ti.com>, linux-newbie@vger.kernel.org,
	linux-pm@vger.kernel.org, daniel.lezcano@linaro.org,
	lpieralisi@kernel.org, krzk@kernel.org, christian.loehle@arm.com,
	quic_sibis@quicinc.com, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	vigneshr@ti.com, khilman@ti.com, sebin.francis@ti.com,
	khilman@baylibre.com
Subject: Re: Fwd: ARM64: CPUIdle driver is not select any Idle state other
 then WFI
Message-ID: <20250128094720.sgk7gyr5oawzxbez@bogus>
References: <CAO6a-9_aPLCx2CqecQBGbK78_=+-tT44RepPkrBjpkWSvjj4Tg@mail.gmail.com>
 <CAO6a-98cdSvyd7jgAyGNmsC2nxmRSyr3GppxvZU9yHU1xqwz3g@mail.gmail.com>
 <20241211055052.gbxnyqpui3t3zpw5@lcpd911>
 <20241211121825.GA2054801@bogus>
 <20241211143428.kaoovhiwar74dy6x@lcpd911>
 <Z1rbLdWW75KQw5cl@bogus>
 <CAO6a-98XFxbCnOMp5ARwPssjYomyNKWjT=WTk=z2+ZKyOAQ0jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO6a-98XFxbCnOMp5ARwPssjYomyNKWjT=WTk=z2+ZKyOAQ0jQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_014758_659932_EC9D41E3 
X-CRM114-Status: GOOD (  18.56  )
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

On Mon, Jan 27, 2025 at 10:47:28PM +0530, Vivek yadav wrote:
> Hi @Dhruva Gole,
> 
> Q.1. Does your CA-53 properly go into CPUIdle state and come out of
> sleep state ?

Yes, well tested on other SoCs. Seems like system integration issue.
> As of now I made some changes in the DT node. After making changes in
> latency (which is mentioned below).
> 
>  idle-states {
>        entry-method = "psci";
>         cpu_ret_l: cpu-retention-l {
>           compatible = "arm,idle-state";
>           arm,psci-suspend-param = <0x00000000>;
>           local-timer-stop;
>           entry-latency-us = <300000>; # 300ms
>            exit-latency-us = <300000>; # 300ms
>            min-residency-us = <1000000>; # 1 sec
>      };
>  };
>

Does these align with expectation of PSCI implementation in the firmware ?


> I can see that  CA-55 went into a sleep state (state1) using command
> ``cat /sys/devices/system/cpu/cpu*/cpuidle/state*/time``.
> As you mention earlier in a multicore system (2 or more) at least one
> core keeps working and does not go into sleep state. It should happen
> as per theory and other developers' case.
> 
> In my case, after some time, both CPUs (CPU0 and CPU1) go into sleep
> state (state1). Hence the system console hangs.
> 
> My expectations are,
> If I type anything on keyboard. UART interrupt should take out CPUs
> from sleep state and execute commands. OR some periodic timer should
> take the CPU out of sleep. Which is not happening as of now.
> As you said  we can safely remove`` local-timer-stop``. It means local
> timers are working for the CPUs and triggering interrupts ?
> 

Please go the thread and understand when and why you need local-timer-stop and
how it is related to the arm,psci-suspend-param value(especially the state
context loss bit)

I have not got response to my questions. You can just play with DT and get
things working here if the firmware expectation, hardware functionality
and DT properties don't align.

-- 
Regards,
Sudeep

