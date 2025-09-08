Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFD0CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSKJ/Tn+iBT6nQpf45aUYXiAjuv9BOtzaJIlf5ZJ3j8=; b=z2OJxqDvbnaXq9pI42tPBJGa5t
	n34VHzOzn4u7G/QRlyJnfFTWS54f6eap9oUWrbpS4t4ctTlYvPNxELSmtktaoH8LEYtW6AJ+Z+Z0f
	+5VcgRzqrcrJTJnqpMB1IKmyYot1pY2xqtqU4kjWHskam8sqfSkwAP/pMsuVv5rekowj/4zryAUxb
	1GECnj05GtzIKKknl9FGrIjhrBpoleqIOLyrdxcYdDrDPDj0RKcnsYDhE0uZDPx7O0Uj/f3bf/Q5K
	U5gdYjl8KdqhlBOa21xpJFBLwCL1o4cGEQG2TYw6bhU64AoHE3KyzSn3FBHJCeGJU36Btwme0dJCe
	GGUCDuSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvar9-0000000Gybq-0tSd;
	Mon, 08 Sep 2025 12:20:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZiP-0000000GYVJ-0eRx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 11:07:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A10D1692;
	Mon,  8 Sep 2025 04:07:08 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8AEA3F63F;
	Mon,  8 Sep 2025 04:07:14 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:07:12 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 6/6] firmware: imx: sm-misc: Dump syslog info
Message-ID: <20250908-devious-hairy-reindeer-ae1d05@sudeepholla>
References: <20250904-sm-misc-api-v1-v4-0-0bf10eaabdf1@nxp.com>
 <20250904-sm-misc-api-v1-v4-6-0bf10eaabdf1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-sm-misc-api-v1-v4-6-0bf10eaabdf1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_040717_236102_C586FCA8 
X-CRM114-Status: UNSURE (   6.92  )
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

On Thu, Sep 04, 2025 at 06:40:47PM +0800, Peng Fan wrote:
> Add sysfs interface to read System Manager syslog info
> 

Need Shawn's/Sascha's Ack if you want me to take it together with 5/6.
But I would wait for 5/6 discussions to settle first.

-- 
Regards,
Sudeep

