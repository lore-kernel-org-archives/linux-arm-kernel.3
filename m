Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10AED41C39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tl5RTa5P3Gs+mQ7bqxJjh8TfNGlU8RhuQsYMtnHWW/A=; b=eagKpranUppyN8psHRJqj3yb6y
	ilP6FVJqwVp8WUKxcucucbQTnReDjrkz68lTagcvIvKZTjrTtwSu4+6VB+FwS3IEFkGB0qCw7blVK
	b0ZxiEhhfciijzsr7Cm3peVaAHRYqPB6EE+YRtvDh1lhaIbplua+57bw7F7Yhn4c8J0jYXA4sOk1m
	DwC+xAOaqg5k7AaXMcpdTjuS1cKvnP5UUxz2E3ya8sZO3dR+ubIqyH/aGTYijb4/LNCnNvusE0tmo
	s/AV2JH4qBHPSKMG+mltWLsdsQENgxVekyXiCw/Z0e6ye7ZN/oZkDbW4LkqA0JLJEIOqi31XpvTUF
	uTo7pgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh20-0000000Gfcr-3KdQ;
	Thu, 11 Dec 2025 13:48:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTh1y-0000000Gfbo-3lNX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:48:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 355E51688;
	Thu, 11 Dec 2025 05:48:22 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 225593F740;
	Thu, 11 Dec 2025 05:48:27 -0800 (PST)
Date: Thu, 11 Dec 2025 13:48:25 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Alexey Klimov" <alexey.klimov@linaro.org>
Cc: "Vivek Aknurwar" <vivek.aknurwar@oss.qualcomm.com>,
	<cristian.marussi@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
Message-ID: <20251211-masterful-caterpillar-of-love-bc2d4c@sudeepholla>
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
 <DEVEXHI9CEFA.19RL3BXTV8E38@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEVEXHI9CEFA.19RL3BXTV8E38@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_054830_970703_1E1B4520 
X-CRM114-Status: GOOD (  13.21  )
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

On Thu, Dec 11, 2025 at 01:14:06PM +0000, Alexey Klimov wrote:
> > On 10/14/2025 12:34 AM, Vivek Aknurwar wrote:
> >> Some upcoming SoCs define more than 32 operating performance points (OPPs),
> >> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
> >> (next power of 2) to support these configurations.
> 
> Didn't touch for a while. The way it is stated confuses me a bit.
> Should the value defined by protocol be updated out of the blue?
> Should the protocol (defined by spec) be changed first?
> 

Ah good point on confusing commit message. I just assumed it is limitation
of the implementation. I can update the log when applying. It is not spec
or protocol limitation for sure.

How about this ?

  | firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
  |
  | Some platforms expose more than 32 operating performance points (OPPs)
  | per performance domain via the SCMI performance protocol, but the
  | driver currently limits the number of OPPs it can handle to 32 via
  | MAX_OPPS.
  |
  | Bump MAX_OPPS to 64 so that these platforms can register all their
  | performance levels. This is an internal limit in the driver only and
  | does not affect the SCMI protocol ABI.
  |
  | 64 is chosen as the next power of two above the existing limit.


-- 
Regards,
Sudeep

