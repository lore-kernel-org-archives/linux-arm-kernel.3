Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DBFCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 12:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpE48q+PsG/FwICY44olX3NmM67Pp1q0dE72zZ4RYME=; b=U+yNOKjP8HZ398pm79RiDlkEVS
	IZl44WzVsxFaR5QwOfNlbjzA5mb3C783fR95FYKqP+PaTePRlk6xCcHsJmEWYWQ87sO35eOVIZFpD
	VDZd96PgjkhTdeMBMrCZn9bCepIueePDhojV3YWYgszE3l02OBeZ8WTm+lMQIxQXYjCFPeT6dK7p/
	00lpRodlGn88DGDf/YOJyvDHEUJmKfh55YcZnxsv5jOqyq1gw1TfcyOzcEAoSVLMzpAjfdpQq+YwS
	JN1LALICLTB98wPuhUqEl/+ANyi/XmVgNFj0Yu/EXCQGM0A38085EjPQQEILwyuc9WzzbEn/FnSfl
	qn5QXWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11ut-0000000DHbe-1QYE;
	Tue, 23 Sep 2025 12:14:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11us-0000000DHbM-0KSb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 12:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37FA46024D;
	Tue, 23 Sep 2025 12:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F89CC4CEF5;
	Tue, 23 Sep 2025 12:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758629678;
	bh=RVhxoyPovtSx43TfKXZLJv8gzg5A8eiVNVPKu1RqQAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qX5i3YwFTMku/9P76Zl9TJjXNQtW4RhCJOrAb8GgnMeRcY9PWaLgZ+3nH9yX+JsX8
	 /nKUQnNhfATH55uUBqgWnqukxXOTiiu/QRxsQheg6p2ZRusbmSFbnrUMyioVITmZmE
	 pJMZv5wSbWA8WrFLgHZi/jQVN6LJfcOITjg3gLTs=
Date: Tue, 23 Sep 2025 14:14:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	james.clark@linaro.org, leo.yan@linux.dev, mike.leach@linaro.org
Subject: Re: [GIT PULL] coresight: Updates for Linux v6.18
Message-ID: <2025092306-foster-outsource-fb07@gregkh>
References: <20250922125907.2268152-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922125907.2268152-1-suzuki.poulose@arm.com>
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

On Mon, Sep 22, 2025 at 01:59:07PM +0100, Suzuki K Poulose wrote:
> Hi Greg
> 
> Please find the CoreSight tree updates for v6.18.
> 
> Kindly pull,
> 
> Suzuki
> 
> 
> 
> The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:
> 
>   Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v6.18
> 
> for you to fetch changes up to 559d6c380ea0a27e71d0269410301303515e4179:
> 
>   coresight: Add label sysfs node support (2025-09-10 17:53:01 +0100)
> 
> ----------------------------------------------------------------
> coresight: Updates for Linux v6.18
> 
> CoreSight selfhosted tracing subsystem updates targeting Linux v6.18, includes:
> 
>  - Clean up and consolidate clocks handling
>  - Support for exposing labels via sysfs for better device identification
>  - Add Qualcomm Trace Network On Chip driver support
>  - Miscellaneous fixes
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>


I get the following error from the scripts when pulling this:

Commit: 0ac00534623a ("coresight: Fix a NULL vs IS_ERR() bug in probe")
	Fixes tag: Fixes: 26e20622a8ae ("coresight: add coresight Trace Network On Chip driver")
	Has these problem(s):
		- Target SHA1 does not exist

Please fix up.

thanks,

greg k-h

