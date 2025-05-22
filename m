Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E289EC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BBve3CAqtTIUzKA3PN0hMSVn8ceGQGI2YO2vhfttaE=; b=uhl35XNvo2Ov+B0V3zQ+UEw6ta
	aIvfwAG8+aDns2dORufxwtbIpwH5lyQtJplxBi8e7zZkzpdf+PvdekXB9mxQGXexn60cI/VIV5GjA
	kZQJgbSh1EyT5DnEda2bKUrbJaa0neXOcL+DMhNxVrBK64aksrr9cCCzc32TunC+tXcHo1Fck5DHb
	B/JBj9ifWN8CPts2IKAZT2XHWZXDztUlYi5yb3c/32a0/iqwjZnF4fE/DEhi3/pNOoG9ojNnVe+1w
	LtUBHMZy15QPdn7iEJJDE1FowIOs6Jb9z6KmkfMr29H8TrBR92qqfVHJ2vK6r8FoWp98nTvo910We
	uVQHDg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8m1-00000001Z8u-1344;
	Thu, 22 May 2025 16:28:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8Sd-00000001XFe-1v9d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 16:07:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81DA26135E;
	Thu, 22 May 2025 16:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B957CC4CEE4;
	Thu, 22 May 2025 16:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747930078;
	bh=CtwcgQu8l1Rhsy/4uiKrfyOevKM8C4S8O29t5eqogi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tm+1/zrLk5FpzQen85QM+j9/xCnjWtC265m8oht9aRakhCWGWfhrB72Z2Qw/HkE02
	 zjw4LBQfXDc7ysZTrxWNXlxd3NohM+7k6/n0zFZ1yi1RMkuvitf1tlAMTnKsCqRsan
	 TmD5reMp5jN8KKOVQxeQilMIkd0ZT4EFQLi89Hwo=
Date: Thu, 22 May 2025 18:06:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	james.clark@linaro.org, leo.yan@linux.dev, mike.leach@linaro.org
Subject: Re: [GIT PULL] coresight: updates for Linux v6.16
Message-ID: <2025052258-chain-apron-f35c@gregkh>
References: <20250522155913.353620-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522155913.353620-1-suzuki.poulose@arm.com>
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

On Thu, May 22, 2025 at 04:59:13PM +0100, Suzuki K Poulose wrote:
> Hi Greg,
> 
> Please find the CoreSight self-hosted tracing subsystem updates for Linux v6.16.

Pulled and pushed out, thanks.

greg k-h

