Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250ECC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CltZnwazgrTEEs05C/6NqccRWvY9REx+zE+N/zNrLoo=; b=ht2yoIaMU3wEcO6ln1ueKGgbWc
	Cu/kjO1UgCiglB0QtHAVo4wg8NPiSQpyMuo7HaY4xZEHM/5hV650QIrio1kjb5TQv7w7ConWIhPMv
	AfWcWHrw0EJd5dT3dWYsT1/e9t4tUzuA2Yxy9scFC8J+E6HZYvKiUfjeVC9yzQ8ydRwg2KVAn6xCi
	AJuBv2+OiCKqEE8hcV4qmigFMZjtGWyUZd/VuFRKugnHVorGYVlNTaxD/N4RKF7Vd/ZD9c8e4inBu
	DvFEG9hnf8lXHGMGsk2E6DQ0Bz7xqOLFldpW7VZMKSgLEeDfrjs+tP46f5khb5NszYOlKdQdKpy62
	AWbz4Pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOQ-00000007beA-1dJt;
	Thu, 24 Jul 2025 13:53:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueuLT-00000007M9C-1shl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 11:42:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A15F91A00;
	Thu, 24 Jul 2025 04:42:35 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B2313F66E;
	Thu, 24 Jul 2025 04:42:39 -0700 (PDT)
Date: Thu, 24 Jul 2025 12:42:36 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: mathieu.poirier@linaro.org, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..." <arm-scmi@vger.kernel.org>,
	"open list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..." <imx@lists.linux.dev>,
	"moderated list:SYSTEM CONTROL MANAGEMENT INTERFACE (SCMI) i.MX..." <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 RESEND] dt-bindings: firmware: imx95-scmi: Allow
 linux, code for protocol@81
Message-ID: <20250724-groovy-mosquito-of-witchcraft-6a1e6e@sudeepholla>
References: <20250718094723.3680482-1-peng.fan@nxp.com>
 <2793923.mvXUDI8C0e@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2793923.mvXUDI8C0e@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_044243_522516_7FFFF4B7 
X-CRM114-Status: GOOD (  17.79  )
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

On Thu, Jul 24, 2025 at 12:17:17PM +0200, Alexander Stein wrote:
> Hi,
> 
> Am Freitag, 18. Juli 2025, 11:47:22 CEST schrieb Peng Fan:
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > 
> > BBM protocol supports a single power button, supported by driver
> > imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
> > using linux,code. Add a reference to this schema and add linux,code as a
> > supported property.
> > 
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> > 
> > Resend [1].
> > I not see a reason that why this patch could block i.MX95 remoteproc support[2].
> > But to speed up the work, I took Alexander's work and resend it. Hope this
> > could catch 6.17
> > 
> > [1]https://lore.kernel.org/imx/20250513-whimsical-almond-quoll-e3ad5b@sudeepholla/
> > [2]https://lore.kernel.org/linux-remoteproc/PAXPR04MB8459A0F330554EB69E990E048850A@PAXPR04MB8459.eurprd04.prod.outlook.com/T/#t
> 
> Thanks for resending, I lost track of this patch and though it as applied already.
> 

Sorry if I missed it. I would have assumed anything without code in the
series should go via DT tree directly. I can pick it up for v6.18 unless
Rob is OK to pick it up for v6.17(assuming it is not too late)

-- 
Regards,
Sudeep

