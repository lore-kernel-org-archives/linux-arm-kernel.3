Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E1AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 08:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nulp+DBrGyhcYAOoB4gw65w2RJN5mI1WuV63ugFekQw=; b=ONMZ1tMKzU0ywl50PMNeQ9leaW
	0XLSBoIOPp9vpMFPB4Mi3vAw3WORC8nUxk/jLuNUZ6bTuUBdC+ocImte88a8UHulKx+PLpyw7qTig
	/VHbYqy/QuHUtJ+Q6G+VzkDQrOuZSKKadzF3XtsfoIWlP7caw3ZQnO3mcnblKHe1UI1Y1SnaPVrfP
	zv+lAJCNmJs046C+nA7JDjDOJ/Py78uvbbILA7NZotqqL9+NydjvMSK1Afu4fZAyluPURmY/Tuk8b
	AUC3NezUXJKDlG25UWL/oIrX6fTFucS91NHgP+LTFC+SYBdAfejc5NYldU8myTt9p4L/OVt/t8P4O
	BQdBw2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTckS-0000000CQd9-3Grb;
	Fri, 03 Jan 2025 08:09:36 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcjH-0000000CQXt-0yzp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 08:08:24 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50386Fhd2293043
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 02:06:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735891575;
	bh=nulp+DBrGyhcYAOoB4gw65w2RJN5mI1WuV63ugFekQw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wCg07UYXwyuXUgaRXweHyAq90HSLSsLDPjkAVsCabyku2KLqJuhbMKeqKJvx4vlQu
	 /cZSB+aegiqi7uJNs73kEdH2HcVn3m6VZ2Q4Y0GlH7vhwd90dzwshgX39gSZxrvJN2
	 iqpI0usFsv4UFRw67zoM7S+sDjZbei+G39wKoz8Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50386FdI032013
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 02:06:15 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 02:06:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 02:06:14 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503869ik104815;
	Fri, 3 Jan 2025 02:06:10 -0600
Message-ID: <03805f22-b20a-40a8-8d76-f4001c262c5a@ti.com>
Date: Fri, 3 Jan 2025 13:36:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] soc: ti: PRUSS OCP configuration
To: Basharath Hussain Khaja <basharath@couthit.com>, <nm@ti.com>,
        <ssantosh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <pratheesh@ti.com>, <prajith@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>, <srk@ti.com>, <rogerq@ti.com>, <afd@ti.com>,
        <krishna@couthit.com>, <pmohan@couthit.com>, <mohan@couthit.com>,
        <parvathi@couthit.com>
References: <20241223135550.6898-1-basharath@couthit.com>
 <20241223135550.6898-2-basharath@couthit.com>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20241223135550.6898-2-basharath@couthit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_000823_446218_41628F79 
X-CRM114-Status: GOOD (  10.70  )
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



On 23/12/24 7:25 pm, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Updates OCP master port configuration to enable memory access outside
> of the PRU-ICSS subsystem.
> 
> This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit either
> to enable or disable the OCP master ports (applicable only on SoCs
> using OCP interconnect like the OMAP family).
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

The patch LGTM however it doesn't apply cleanly on branch
ti-drivers-soc-next on [1]

This applies cleanly on latest linux-next but not on [1] where Nishant
will eventually apply the patches.

Applying: soc: ti: PRUSS OCP configuration
Patch failed at 0001 soc: ti: PRUSS OCP configuration
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: patch failed: include/linux/pruss_driver.h:172
error: include/linux/pruss_driver.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch

Please re-base the patch on [1] and re-send.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git

-- 
Thanks and Regards,
Danish

