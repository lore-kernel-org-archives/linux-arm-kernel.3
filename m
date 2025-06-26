Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133DBC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGU3XLi2vR/8m6TAYg70DuNRGWVlQogwKzECMq9EzvM=; b=G8bYXjwXH6X93UjnUuGeS7OiGK
	Gey8AtbXjAgm9c3DJoGp1oBh9SAKG/YoTOijK17FuoSAfYRhDBCMHgWX92+MBK2/U9aEcyjDazqBl
	pkAfR+DXlETk5c6i61kKBaqKRG6BoqjsVEF+cy4HEXM2y4iEVUgEMQtwhAvyhYhryUFJhtAwlKewM
	WhpJfa7uSJ1FrjCA0HFOkhIm6wJHhfEeMxDp0dFS1/uA7CkY5miTkeUApVSAVnN5+0ZJM5EJ8lywB
	Mx94vNqB2Vpqtni6/Ep6xNSdIfieXVTBPTgmwKVKYiG7fr3bbsulOEplMcjh7CvSAW77+C9x8nMeN
	wrcGJ0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlOO-0000000BVi0-1n1N;
	Thu, 26 Jun 2025 12:07:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkbw-0000000BNGU-38To
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 11:17:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC9741758;
	Thu, 26 Jun 2025 04:17:25 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C0CF3F63F;
	Thu, 26 Jun 2025 04:17:42 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:17:31 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Add new inflight tracing
 functionality
Message-ID: <aF0sS8V4om3_5YOr@pluto>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-5-philip.radford@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-5-philip.radford@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_041744_822581_8B31F0B8 
X-CRM114-Status: UNSURE (   7.12  )
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

On Thu, Jun 19, 2025 at 12:20:04PM +0000, Philip Radford wrote:
> Adds scmi_inflight_count function to fetch the current xfer
> inflight count to use in trace
> 

Hi,

I agree with Dan's comments on patches 3 and 4...once those comments are
addressed, for me:

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

