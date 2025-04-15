Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D32C369B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkTq9FDN0thIHHPhc/UrKVYEYUGB2ho+/lVnH2tSOUs=; b=nAS2JJWyHluGc+ScS8qLqtLnhp
	wQMziq30Ve/Gmjmj4YVOTx1DIqB0TseUwKcnxw76fUMrhEXxSX7M551728hIEBkaeEOiSmYkvQxX0
	854JXIrJvWFWXrBcn+ekMNydKlZwbhGXtu/501uSdCzFjSihdbyeyaOPhDXtKhEntrSESPei4rpGT
	7kp154oF2DZ+pvuxVkrlPdy0KrWMhMgtPTURNjX2gJ7PTsoAT5UQUwTo7cTiNFhYv0tfqUrum45Sz
	dMxJ+8rRx//bfdOJEplUxxNmvxyX9cZ+4kupZHEEcibnSqEi9affc8JJRO5e2y6v75FhPx3E8tEuu
	3Qj5U2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hcR-000000069Uj-2i4z;
	Tue, 15 Apr 2025 14:50:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4haL-000000068ya-3WCS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 14:48:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DB9C15A1;
	Tue, 15 Apr 2025 07:48:21 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F45B3F694;
	Tue, 15 Apr 2025 07:48:19 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:48:17 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Message-ID: <20250415-exotic-scarlet-seriema-c0e223@sudeepholla>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>
 <20250414-wonderful-cute-bandicoot-accb6b@sudeepholla>
 <PAXPR04MB8459195AAF65D38AFA1D4F9688B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414-tiny-classic-barnacle-5f8c8f@sudeepholla>
 <PAXPR04MB84593BB91063D13BB05BEB5988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB84598733FA39A7402E91DA1988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414-ebony-slug-of-felicity-421b0f@sudeepholla>
 <20250415091016.GB10243@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415091016.GB10243@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_074825_923576_9A1044A5 
X-CRM114-Status: GOOD (  19.42  )
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

On Tue, Apr 15, 2025 at 05:10:16PM +0800, Peng Fan wrote:
> On Mon, Apr 14, 2025 at 12:17:34PM +0100, Sudeep Holla wrote:
> >On Mon, Apr 14, 2025 at 11:00:20AM +0000, Peng Fan wrote:
> >> 
> >> Oops, I just checked wrong Kconfig under drivers/firmware/arm_scmi/
> >> vendors/imx
> >> 
> >> Build this for ARM32 i.MX is ok, I just think no need. So add
> >> a ARM64 dependency.
> >> 
> >
> >OK, I will drop the ARM64 dependency when applying. I also don't understand
> 
> Thanks for helping on this.
> 
> >the dependency on i.MX firmware LMM and CPU drivers in the scmi vendor
> >protocol as the dependency should be other way around. But I see Arnd had
> >fixed it so I will keep it as you have posted to keep them all aligned.
> Not dig into much on this.
> I just followed what Arnd did when I prepared the patchset to avoid
> potential build issue as reported before.
> 

Yes, I am keeping it based on those changes. I need to spend sometime to
understand why it was done so and see if anything can be improved. It is
not straightforward to understand that dependency, for me looks like it
is in reverse direction.

Anyway I have pushed it tentatively, will let you know once it is finalised.

-- 
Regards,
Sudeep

