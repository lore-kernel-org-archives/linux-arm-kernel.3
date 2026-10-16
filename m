Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51BDCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AZLnJTPa8wX1pZieqb250DY53PVfT0l/gCS0GpXSrI=; b=yxV3LGTkj4NQyBvtLE3PlL0uEp
	oyjHcYyvbOcr83XY5K/wi9MzXq9Qg920lINmzcuygnHD8QhWam+inlFjsBXrUydO2rRdFKifuQe/B
	IyAVbngJLU+sRKbydZ/6SzfjTx+nV3FwI6e021eNq+jM8fGB+NeFYjoiP3cSTrGVP2xDxfCh8PHCv
	ZPCgUmC2V0HEMBIKQnMbadeB9wPiyeYwRoQPMjZBegj/osSNxPGXZG7OvG8wYgNP5i23mfh6kRmiD
	XFULQrxAZA/fbRYKq+JXlLa7AeJtuzLu9uyUNOCBU6MDoQJ9rkfLgQ/NqoO62T2jQRj4sO0JYSPyi
	YiUZno2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkdL-00000003Pou-2vsw;
	Fri, 16 Oct 2026 16:18:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkdK-00000003Poo-1XQK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:18:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A44960202;
	Fri, 16 Oct 2026 16:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE6E1F000C4;
	Fri, 16 Oct 2026 16:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792167493;
	bh=8AZLnJTPa8wX1pZieqb250DY53PVfT0l/gCS0GpXSrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dQbmMsZGHo+u7BRY0QBalZamSBEzv+PEx9vV5J08fw7Yag9Y5WNId8f+ybzv3cvLP
	 kGWQSGVzYU3BwoSW9actmRWKvpO/MR/FIM1NoHtXi6tzLxjaPsggnkgJ+xMtWy4Jx4
	 cZX4oTVhC31EIHn3n4lH2tkO+RXsfDnzKM0QbsNBxVFXCtgRt/C0Ja4YN25cxbUWRi
	 47DkDd8U2Ekpm+rmyCW+KHc+kA80eUqm0GWs8NNeR5yFlazGtXpIaiMzSVx1Z382p1
	 ViLZdI+X/FURRKCwYeqmiTGQR9YUm/dzQpfCTH/B30mEjISuxgai5/psd+vncEPdVC
	 +w8ZeG8/q1K+w==
Date: Fri, 16 Oct 2026 17:18:09 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: jaidevshastri@vt.edu
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scpi: publish scpi_ops with release
 semantics
Message-ID: <20261016-curly-nano-reindeer-44cfa7@sudeepholla>
References: <20260921-mb-arm-scpi-v1-1-6aabb6533a40@vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-mb-arm-scpi-v1-1-6aabb6533a40@vt.edu>
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

On Mon, Sep 21, 2026 at 09:06:04PM -0400, Jaidev Shastri via B4 Relay wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
> 
> scpi_probe() stores scpi_info early because scpi_init_versions() sends
> messages through it, and sets scpi_drvinfo->scpi_ops as its last step.
> get_scpi_ops() returns scpi_info->scpi_ops, so the ops pointer is the
> gate that scpi-cpufreq, scpi_pm_domain, clk-scpi and scpi-hwmon test
> before they use the driver.
> 

None of these can be probed through the drivers are initialised until
the devm_of_platform_populate() after the scpi_drvinfo->scpi_ops is set.

-- 
Regards,
Sudeep

