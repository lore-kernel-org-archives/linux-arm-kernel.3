Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1A2CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSJqX1AAqYYY3cwD7+kPGOUDcEyMxKTWaZHJI25fkLc=; b=S/uMwdiJmboSoemuIFC1xmbTKL
	en5bC28v4TJ8eaYxpddATbo4KqEXwmEiBxeAGQDorlPcQ7xoA2fLbQ3jWw0aT9ki8TqJK3u+xeF3V
	kIr2LdeGcfOR5F03UKJ0JZnF5XBptBWKzPMa4MsaAEb3H9Q0ycp2cox7j1LvyX7MjIY6ANl335zmQ
	fSeuVBkk7k68F6XJ0dUc+eHuRKpNmL+9F7/M6iPndSSI9ukwX1hxYYC+Yx9QNMoylVwptIaDyYyQB
	1ZMF5FzA2clHs2AEUfyR+76/cjhyrXHMnjjikzzLSB/iegFu5GB89PxJg67BUD5T14rfeF9pqjUWk
	jUCC2Adg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvabh-0000000GqCs-06vi;
	Mon, 08 Sep 2025 12:04:25 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYQx-0000000G85Z-12PN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 09:45:12 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5889j7Bg077755;
	Mon, 8 Sep 2025 04:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757324707;
	bh=vSJqX1AAqYYY3cwD7+kPGOUDcEyMxKTWaZHJI25fkLc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dhbD+lWnE6JwR2i9iy7Fi4ZjtgbhGvxq0IVdPw0x5ftpfLZo/PKlb5qjbBCca5l5M
	 RRM7NLkEaGHmtoYrvZVsHiYTQ5FZFka+JbVwpiOpQdHs4qc+yEwa/qgYHbyCHwq+KQ
	 uxCtbMJmzhioBnofioa4FbvxyzN5mpZ985Ouu5zA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5889j7NU3685564
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 04:45:07 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 04:45:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 04:45:07 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5889j5gl394282;
	Mon, 8 Sep 2025 04:45:06 -0500
Date: Mon, 8 Sep 2025 15:15:05 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 29/33] arm64: dts: ti: k3-am62p-ti-ipc-firmware:
 Refactor IPC cfg into new dtsi
Message-ID: <20250908094505.4dasmw6sv5bazd5z@lcpd911>
References: <20250905051846.1189612-1-b-padhi@ti.com>
 <20250905051846.1189612-30-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250905051846.1189612-30-b-padhi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_024511_331906_414FA13E 
X-CRM114-Status: GOOD (  13.08  )
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

On Sep 05, 2025 at 10:48:42 +0530, Beleswar Padhi wrote:
> The TI K3 AM62P SoCs have multiple programmable remote processors like
> R5Fs. The TI SDKs for AM62P SoCs offer sample firmwares which could be
> run on these cores to demonstrate an "echo" IPC test. Those firmware
> require certain memory carveouts to be reserved from system memory,
> timers to be reserved, and certain mailbox configurations for interrupt
> based messaging. These configurations could be different for a different
> firmware.
> 
> While DT is not meant for system configurations, at least refactor these
> configurations from board level DTS into a dtsi for now. This dtsi for
> TI IPC firmware is board-independent and can be applied to all boards
> from the same SoC Family. This gets rid of code duplication and allows
> more freedom for users developing custom firmware (or no firmware) to
> utilize system resources better; easily by swapping out this dtsi. To
> maintain backward compatibility, the dtsi is included in all boards.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Tested-by: Judith Mendez <jm@ti.com>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

