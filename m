Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614C7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 07:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVl6l8d+15iOyu6HFy0188Kpf0l29Nv2XPT2oqDJ5Cg=; b=GxT/7pX3a/KXIpdzU9GQmZrApH
	7mR3oS3R5NL0+rCvXFT85GhmeQBlYcErbbv1vsZ/jTloSMNlz2yw2vxPT84aAmb1jAViOaXVUcrR3
	Bi1vAVWnAzsXtyJqWTNamuGnuBKplemAp5wkhIcVk/+cvdk+UeoUtwFa0HZbeKOYeN2x94PZ8xvOB
	aHrdudnWi4A4py2FnsY3j0zixQnzbLnvGz4x9jJ5teVuWeHowtOPem9wvqtjNs5y+eA84NWK5uid9
	DCdL3FgcXWQ8X1ryBnY0LFo31DJIhW6d2tTajwQymCev2fbrmVTtgZ9F2dZXVt9NA3iTJfxDVd5o5
	ySALlb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ehA-00000006wpN-0UyQ;
	Fri, 17 Oct 2025 07:16:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eh9-00000006wou-1E0H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 07:16:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 529EC64244;
	Fri, 17 Oct 2025 07:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15D3C4CEE7;
	Fri, 17 Oct 2025 07:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760685370;
	bh=DBYeAssgERcj5gFZWUZJOCagBdQyc6pnAfhkLqvzpig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zi7ygUiX99gZDAvp1O436Oq4DvCoZ/hTL4mkEJiuvC5mGx2fGzWbmO7q4NmyVC8aM
	 BQJzi7ILB5uf6oCCKalyjHX0jjmJEb7V3Zhf2I+ADR4pYNWiDBXsXXv4WX4eHfyMzh
	 EW8IAmbzlfI9ijF3zhtQdSfQCt9pQSkexEjjNjRA=
Date: Fri, 17 Oct 2025 09:16:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: catalin.marinas@arm.com, james.morse@arm.com,
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
	ryan.roberts@arm.com, will@kernel.org
Cc: stable-commits@vger.kernel.org
Subject: Re: Patch "arm64: cputype: Add Neoverse-V3AE definitions" has been
 added to the 6.12-stable tree
Message-ID: <2025101749-gloomy-equipment-c4c3@gregkh>
References: <20251016111208.3983300-2-ryan.roberts@arm.com>
 <2025101719-lethargy-brunch-e56f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025101719-lethargy-brunch-e56f@gregkh>
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

On Fri, Oct 17, 2025 at 09:13:19AM +0200, gregkh@linuxfoundation.org wrote:
> 
> This is a note to let you know that I've just added the patch titled
> 
>     arm64: cputype: Add Neoverse-V3AE definitions
> 
> to the 6.12-stable tree which can be found at:
>     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> 
> The filename of the patch is:
>      arm64-cputype-add-neoverse-v3ae-definitions.patch
> and it can be found in the queue-6.12 subdirectory.
> 
> If you, or anyone else, feels it should not be added to the stable tree,
> please let <stable@vger.kernel.org> know about it.
> 

OOps, nope, dropping this one and the other one until we get a 6.17
version as well.  Sorry for the noise.

greg k-h

