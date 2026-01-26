Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424EACF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qArYCsdhkFQ9pemxYyN7/iRY01bc0LTXDWRa/rq/1c0=; b=a9Fs350MnpHOjgMUyYw3OBYNf7
	dNeoS7+IAUZRC76bhXj4v96wommjblhj+r59Q7PL0LmiAC2QhjtresHTtsakmkoVVSny2oeDPhJuk
	F3dHJKGRX90sfXw+1k1E1RX2NwWPTtChCgC4UFo1T5OToRgMsxVZUFIPMphwnzMBhc0muSzMVcMAa
	EqzG6+lOaITKRu09rZa8iENWFYaFCdDwAoc2kSmm4MbaDjNbf18PfOMAs9sN1DoGO3jT5dSCzdHR1
	TNsKn/LRTVm03UX68/AKb2DuOKSxdnwcr9PWv0DuI2odt1T/CLVcJPcFlAt03+Hetfdq0S+Ac1qLm
	3XR5PZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKWu-0000000COMU-2gFl;
	Mon, 26 Jan 2026 11:13:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKWs-0000000COM8-037X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 11:13:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C5FF41885;
	Mon, 26 Jan 2026 11:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C64C19422;
	Mon, 26 Jan 2026 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769425988;
	bh=b1kGKt4I8uMv/tbEisQ62grCjanU+UDk3PHQZ10u03k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYUJYhTxY0Lo8rG5w6QGDsMd7bd0+bpuDz6N5AAmu64AvbVsGXHV8dgAlztgb/cue
	 82+YoKQxSUDTMrPkL2cdx7n+IvXHGQzuGSrJdYscb7XBSVOR7lM7/tPadYXHfUc6ZV
	 AjuFrI9IeZqJsLnKVeHxldSjrUf9+LjyM7qJhCfw=
Date: Mon, 26 Jan 2026 12:11:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, james.clark@linaro.org, leo.yan@linux.dev,
	mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] coresight: Updates for Linux v7.0
Message-ID: <2026012635-audition-umbrella-74ad@gregkh>
References: <20260126105001.2012310-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126105001.2012310-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_031310_115898_900F2227 
X-CRM114-Status: UNSURE (   9.95  )
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

On Mon, Jan 26, 2026 at 10:50:01AM +0000, Suzuki K Poulose wrote:
> Hi Greg
> 
> Please find the coresight hwtracing subsystem changes for the next release.
> 
> Kindly pull
> 
> Suzuki
> 
> 
> 
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v7.0

Pulled and pushed out, thanks.

greg k-h

