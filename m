Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA462D29C39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7m8CtZLoIJUopJ2Bz0dYC1xUr9kNJN6RNv86ZGfFOQ=; b=OnJSCSnRc697MTo0yAcCzx26pN
	m5LfacSoYGfKtyjBlzM8kwmsGt7jgq7pxOwjy0wvWVDiluONe1SEbfCMWSl6jp9pc8zS5gxEWdV8m
	uHEjTSE/HvDzDPx57FMlJjbPzsUfD78DEP4Qzr0vCIPa6n3Vij7Jo0vvtVbT0s1N8gp60CO2U7RcD
	snaLuMWX5Im9JUG6yfQY+AXL/AAMdAQMT0gVEh1mcoUuGQv0nrl8z8p9YgYlf9bx4k7XPzFEhYRX3
	QaOUWBgrUyqxaFVv5TWQbBYXasr7zimG67mi+HSN2Axbt4Ri6hAIzTaotVBT0X/DfsMTmnPxa1a6l
	nYpljoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrPr-00000002NU3-1k9l;
	Mon, 19 Jan 2026 15:43:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrPm-00000002NSM-017k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:43:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7AA8497;
	Mon, 19 Jan 2026 07:43:30 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFF4A3F694;
	Mon, 19 Jan 2026 07:43:34 -0800 (PST)
Date: Mon, 19 Jan 2026 15:43:32 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, d-gole@ti.com, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v2 01/17] firmware: arm_scmi: Define a common
 SCMI_MAX_PROTOCOLS value
Message-ID: <aW5RJGz0ashv4txN@pluto>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
 <20260114114638.2290765-2-cristian.marussi@arm.com>
 <20260119111827.00001704@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119111827.00001704@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_074338_399931_56D474A7 
X-CRM114-Status: GOOD (  10.72  )
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

On Mon, Jan 19, 2026 at 11:18:27AM +0000, Jonathan Cameron wrote:
> On Wed, 14 Jan 2026 11:46:05 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add a common definition of SCMI_MAX_PROTOCOLS and use it all over the
> > SCMI stack.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> Hi Cristian,
> 
> Mention the introduction of SCMI_PROTOCOL_LAST in the patch description
> and probably say why it takes that value (which is much less than
> the SCMI_MAX_PROTOCOLS value).

I'll do.

Thanks,
Cristian

