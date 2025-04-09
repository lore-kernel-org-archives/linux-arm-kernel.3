Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5504EC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abtamrHb7KpB7ZVHENDFGKHkjUUAFMqBv+OzVR2p1fA=; b=bkwmsBjt0Pi70Uv7cAKLt8anoG
	fstZ+t94lSw5uS5gVUg1PSHhb4xdyWUmwoqvlTISE1vcXRhHFyB8TSNqUQErkHiYpqQk6UCiPveCs
	K1DW62vBz8F3GAG2hV0PaqZxZtC6WP1ETmxKGLO5I8mfkZMdgiRWlGxPMbcSvIyzKSHArpV+tJV+I
	mCHPwBCL9nZS86L7NvwCeKT8F0ODFJiT5JBneg7trd0LlUQ3pQI0NnAheTJKI5iP9MSRPBdc3Rq95
	ocdC99RTH2bjcr6erx8O0G60cvJNPmP5nhaxqtkBI+Wi7SuqL24KDyYaOPc65BPshHV5wv1Fmbi5u
	lhtLcqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ugw-00000007AoT-2uOj;
	Wed, 09 Apr 2025 12:38:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ub7-000000079pi-0c8T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:32:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C452915A1;
	Wed,  9 Apr 2025 05:32:04 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFEB33F59E;
	Wed,  9 Apr 2025 05:32:01 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:31:58 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow
 linux,code for protocol@81
Message-ID: <20250409-heavenly-sceptical-ara-bceeb9@sudeepholla>
References: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
 <2003940.PYKUYFuaPT@steina-w>
 <20250409121829.GA11949@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409121829.GA11949@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_053205_256646_3EB83C8D 
X-CRM114-Status: GOOD (  15.56  )
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

On Wed, Apr 09, 2025 at 08:18:29PM +0800, Peng Fan wrote:
> + SCMI maintainer, Sudeep and Cristian
> 
> On Wed, Apr 09, 2025 at 12:59:50PM +0200, Alexander Stein wrote:
> >Hi,
> >
> >Am Montag, 4. November 2024, 09:56:21 CEST schrieb Alexander Stein:
> >> BBM protocol supports a single power button, supported by driver
> >> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
> >> using linux,code. Add a reference to this schema and add linux,code as a
> >> supported property.
> >> 
> >> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >
> >Is there any other feedback or things to do here?
> 
> I see Rob already gave R-b.
> 
> Not sure this should go through Shawn's or Sudeep's tree.
> 

I am fine either way. Peng, just let me know if you want to pick this up.

-- 
Regards,
Sudeep

