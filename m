Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7744ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jupNrTs3JMwOvq+fnMPXFS8hLrrLD5lrJLhDJBoxSEs=; b=23tdeLKEoIrrpFFjKOiwcpqKyB
	KGSPbpea78oYWpJllMOMWUsWbYHAmKTwnyW8cpiAklMDXNlV8Fqd/f0X9WMmrNdel03wYUi4dUAS6
	u8HQRUzlsXkzYnQzicYrwyCiAF91DCPXzTUd+EY8Oo9TyMwxCVkN1/ZaZby5mCLhY7XLlPCWhQeFk
	0kk1dt3nQdGQ97Wip4IPAJ7gIuL+ZH412q/7z7R9VcVzDRZCLbf6uRwJFcfz1ZVWgAhcsWi2Ve3az
	KRDrrdM5pBX0nsu2uUGfIB21KGbu7xUpEZFzGzmfNIMu6SUHpl2GUDztdskjf997j9fQSV7CNGxju
	/gHQPxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGQz-0000000D1FA-2WtS;
	Wed, 10 Sep 2025 08:44:09 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGQw-0000000D1E8-3wHD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=jupNrTs3JMwOvq+fnMPXFS8hLrrLD5lrJLhDJBoxSEs=;
	b=gEF7w8yg+1iuLMmCraMdsagAWxzGsodzN3SjBWGYTGKuazSL3IiqlmafGSKxv2
	U04fsQYvnREEFhAy67GKLLdbYWIAIKqTwYpMuNzO9sK8C/wpK7/DiNu7eRkl0OVh
	Onuc4N9A7sHAluvCbYd4gNNnsgrIdrKZBvVoxugTjtQgI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3P987OsFoZf5EBA--.43160S3;
	Wed, 10 Sep 2025 16:43:41 +0800 (CST)
Date: Wed, 10 Sep 2025 16:43:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
	mathieu.poirier@linaro.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..." <arm-scmi@vger.kernel.org>,
	"open list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..." <imx@lists.linux.dev>,
	"moderated list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..." <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH V2 RESEND] dt-bindings: firmware: imx95-scmi: Allow
 linux,code for protocol@81
Message-ID: <aME6O29QxvU_PcRx@dragon>
References: <20250718094723.3680482-1-peng.fan@nxp.com>
 <20250825082154.GA26152@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825082154.GA26152@nxa18884-linux.ap.freescale.net>
X-CM-TRANSID: Mc8vCgD3P987OsFoZf5EBA--.43160S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw45GF1UZrWrGr47CrykXwb_yoWfJrc_CF
	WxJr9ruw4agw4Ik3WrtrW3urnrK3y8XF1DXr1Ygr1fXFnxArZ8Z3ZxA34rAw17ZaykXFZ7
	W3Z0qF409FyDujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUfMaUUUUUU==
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwLEZWjBF1101wAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_014407_313104_6F6D0494 
X-CRM114-Status: GOOD (  12.30  )
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

On Mon, Aug 25, 2025 at 04:21:54PM +0800, Peng Fan wrote:
> Hi Sudeep, Shawn
> 
> On Fri, Jul 18, 2025 at 05:47:22PM +0800, Peng Fan wrote:
> >From: Alexander Stein <alexander.stein@ew.tq-group.com>
> >
> >BBM protocol supports a single power button, supported by driver
> >imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
> >using linux,code. Add a reference to this schema and add linux,code as a
> >supported property.
> >
> >Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >---
> 
> Not sure which tree this patch should be landed in. But would you please
> pick it up?

I do not see the patch in next-20250910, nor reply from Sudeep
indicating it's been applied, so I just picked it up.

Shawn


