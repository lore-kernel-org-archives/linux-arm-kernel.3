Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62BBCE9D6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTMi7M+9Mlfy8PbJXjExNelMD+WuK7Nz1LAg5bB4Ihk=; b=w0Gkf6UEX/ARkXhCjmNSoGXMWM
	8oUlGkndbr21lVFnstCIJCXFeOLW1+zoVDw4mmKBu54zZR4ZCkZp94dpQs813Uo8CUo8OxKsDWeDa
	lJqfiTm3RDJ/CbrumShQXw7ACBW0R/GWsn9O8IkuasBKy6dkjIGSnZpyHCAaNJ0U7nMKCtR9Jb7K4
	vixxZ8z9Dk8Jggosbz8+XRc+ob2XOyM1Pi+wPeOWMqA7w+4LlEOTixizup0qujfWJPBv7uMvj43go
	a1vRH+kEPpwHpj7l8iZO5AW8n+H9VhitIWjgte0O2lRv7b6eoX+d980vSs5NOONPKOLMFaaHWUIYB
	SfjABW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9GY-0000000DQu9-13a8;
	Tue, 06 Jan 2026 15:46:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9GV-0000000DQsx-0q3T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:46:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2D88497;
	Tue,  6 Jan 2026 07:46:26 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12D743F5A1;
	Tue,  6 Jan 2026 07:46:31 -0800 (PST)
Date: Tue, 6 Jan 2026 15:46:29 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] firmware: arm_scmi/imx: Support dump syslog
Message-ID: <aV0uVXXbxKQ5qzLD@bogus>
References: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
 <aUCy5+vAPzDGeux3@shlinux89>
 <aVuzVNmG2l-igiEB@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVuzVNmG2l-igiEB@nxa18884-linux.ap.freescale.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_074635_285958_54BD15E1 
X-CRM114-Status: GOOD (  15.09  )
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

On Mon, Jan 05, 2026 at 08:49:24PM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> Hope you're doing well. Apologies for following up again, but this v3 patchset
> has been pending for quite some time. I wanted to check if everything looks
> good on your end.
> 

Yes overall it looks good to me.

> Could you please confirm whether you plan to pick both patches?

As I had asked once in previous version, I need i.MX maintainer ACK to pick
it up myself.

> Or do you need an A-b from the i.MX maintainer for patch 2?

Yes as mentioned above.

> Alternatively, I can ask Shawn to pick patch 2 if you only intend to take patch 1.

I think that would break build or need to wait for another cycle.
I can ack if it can be routed via i.MX tree or need ACK to pick it up myself.

-- 
Regards,
Sudeep

