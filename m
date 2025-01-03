Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012CAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 06:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jru5kwZTRXJdfwuiwx+1xk6FRUBsJW+n1mD6zcJCVx8=; b=yhHOu3wpIvk2Wmkh7jMTUa/Equ
	Awvu86RIODbQzyjvHYzZgwUO5syON7nFkOKwnIj7qhWeJ+txQJuoQx5pYUpVRlLY8g1jluPn47V46
	753Qyk8FaQLolePHtQGCYbX+PMUJCA0cR+0raFhHhm3oyTkIVDboBCm0dyck3YBTnJ3x9Bs1l0NWC
	GvubJ41+xrTNVNL27J6p7rHHqpLTzP/BJSBhCwV07rAO9/D4gHu2LEKyog4jscQ9l912oRFsmhe2H
	oyvlv4hwhlXkDXXyBfGbjQPzWZgxa/yb8e5hCHaa3qrfL3lJzPvW6/hrul8TlyZ+Uv6IrJoDd5FP0
	X4U9PzFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTbTh-0000000CFsS-3FUV;
	Fri, 03 Jan 2025 06:48:13 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTbST-0000000CFje-0QtZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 06:46:58 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5036ikmW2284291
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 00:44:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735886686;
	bh=jru5kwZTRXJdfwuiwx+1xk6FRUBsJW+n1mD6zcJCVx8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NAsXjhCYSiN43CZ4nUArSuLagC4OBZVyoLv1h/N9uJULy1dU0iMmKK/IdF42maB7F
	 R/cQV1hZGoJ0MhYpe0kqNQW9aJXbfwxzSZ8M47Rs0ub7VQQuIr0N0Ne+CPjGUQECng
	 a6FpyRAi13qt/oRs3okLLhmRS5BzSdzXp+cnbCiQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5036ikiU002336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 00:44:46 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 00:44:45 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 00:44:46 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5036ieZg024244;
	Fri, 3 Jan 2025 00:44:41 -0600
Message-ID: <7f71f386-02fb-4a3e-827a-2e9b3f8face4@ti.com>
Date: Fri, 3 Jan 2025 12:14:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Add AM57xx Support to PRUSS driver
To: Basharath Hussain Khaja <basharath@couthit.com>, <nm@ti.com>,
        <ssantosh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <pratheesh@ti.com>, <prajith@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>, <srk@ti.com>, <rogerq@ti.com>, <afd@ti.com>,
        <krishna@couthit.com>, <pmohan@couthit.com>, <mohan@couthit.com>,
        <parvathi@couthit.com>
References: <20241223135550.6898-1-basharath@couthit.com>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20241223135550.6898-1-basharath@couthit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_224657_197989_B729A6B3 
X-CRM114-Status: GOOD (  14.89  )
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

Hi Basharath,

On 23/12/24 7:25 pm, Basharath Hussain Khaja wrote:
> Hi,
> 
> This patch adds support for AM57xx SOC compatibility in the PRUSS driver
> which is a prerequisite for ICSSM Ethernet driver.
> 
> I will submit the patch series of ICSSM Ethernet driver for AM57xx
> subsequently in a separate thread after the merge of this patch.
> 
> Thanks & Best Regards,
> Basharath
> 
> Roger Quadros (1):
>   soc: ti: PRUSS OCP configuration
> 
>  drivers/soc/ti/pruss.c       | 77 +++++++++++++++++++++++++++++++++++-
>  include/linux/pruss_driver.h |  6 +++
>  2 files changed, 82 insertions(+), 1 deletion(-)
> 

For single patch, cover letter is not required. You can mention
additional details below the tear line (---) in the patch itself.


-- 
Thanks and Regards,
Danish

