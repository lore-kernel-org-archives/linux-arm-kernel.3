Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4EEC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVi84rw/b1gRJpf9LtRq3wFDlc9DTBvaxMpQ/dVQsGk=; b=U1koS85DVj/1DDDjE9PmsprDE6
	l/z3hZhGZg2BwZdbz9+SF5qAtsX73/Oj6wEOKycEY1/uKS4QRCdk6RaBYxWcRthssDHEQ5LfCEW00
	/Bz3ljaUzft4mmFVZcdjizMrjGvFpWQh8Cpt303sJZvlkXwVvvdSxvR1yiON3Ifub4ZbSHyRZXWnW
	SS1L5Teb7scfyYIYSSHAXhPEj1xELk9Zx+uhpHUl37ykVunlR0BisbTGGbDG+MhBrcqhHSX7xDCmw
	7cUauDZjcXRTdBjN86rJ2CZxVLWr4v9lvliQwvNgpZqJfBLpNvS/bx3PKN+nQRcZv7lfVFJGcXPNx
	5lm1LE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Te7-000000026LN-3xog;
	Fri, 04 Sep 2026 13:07:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Te5-000000026Kp-3DKq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:07:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41216143D;
	Fri,  4 Sep 2026 06:07:45 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85A033F7D8;
	Fri,  4 Sep 2026 06:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788527268; bh=ZYyUqu6sI7SIz1YOEE/GYSxPypcgV67Hts5SjXKxowM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rr+q0YoIBt+QpyYTKmX5JV7AQu5Bf37pokB44mtNlS/6V5Rs91+kUDGSAV6BViYEa
	 q7Vb3tq7ksP1rLUDFlXfMLKaBIlW2cRikHTOnuRgIlAnhLcANmBN9RZBurrzaDQkrn
	 JJbnluZhOIAanD0VFe+lpozUxxBm0KRtCqaeIeCI=
Date: Fri, 4 Sep 2026 14:07:46 +0100
From: Leo Yan <leo.yan@arm.com>
To: tspamiitesh@gmail.com
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: fix typos in
 Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
Message-ID: <20260904130746.GX8904@e132581.arm.com>
References: <20260904041942.150054-1-tspamiitesh@gmail.com_quarantine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904041942.150054-1-tspamiitesh@gmail.com_quarantine>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_060753_848636_160824F3 
X-CRM114-Status: UNSURE (   7.98  )
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

On Fri, Sep 04, 2026 at 09:49:42AM +0530, tspamiitesh@gmail.com wrote:

[...]

> -Description:	(RW) Enable/disable tracing on this specific trace entiry.
> +Description:	(RW) Enable/disable tracing on this specific trace entry.
>  		Enabling a source implies the source has been configured
> -		properly and a sink has been identidifed for it.  The path
> +		properly and a sink has been indentified for it.  The path

s/indentified/identified ?

