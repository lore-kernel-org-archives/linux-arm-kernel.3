Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC282E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17MB3TLnenjye6H1Wgw3t+f82X2T7JkkcYw29QUShNk=; b=jJAv5aI8cY5N7or/hB8O6NWLTi
	gL8r5U979AS0cGxMk5VPT9VB8/HLXK5RUSrj/ofEtW1vHHZA+S+51CB5PnI5HYO55h8v8ptQr92Wg
	DBu4thssckIqqMzTk8eNHZph9QSchP0I8i2YK51poGhOCeeEIWdTqeVXH47/osvexaoNAvFJn9ARi
	pzWNidstF8c/bc4dEsxhYlNjyB35h7SWRtvfifdSc2nBoSBaUshNrflZrVSHh4w23Pbw3+T8Egr2a
	W55c6T0PsPFTVRePrzD8ITRyOHX6kD7+sIeema6kPNIlpSgqOIygl9JiOIt+O+/HuYauqFYt4wFST
	McUZiM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWxLu-00000002hmG-3FWO;
	Sun, 12 Jan 2025 12:46:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWxKc-00000002heW-0wla
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 12:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2A0E5C10AB;
	Sun, 12 Jan 2025 12:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D393BC4CEDF;
	Sun, 12 Jan 2025 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736685881;
	bh=SGllNDQtfY4Ioj4kwHQcJnTsMZp8InaZQaPZjyspb44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O59FhdXcMxnLugD3ZLfoBntsy9I+yNpPQ+88G87nJ5p3j+Uv0lyf4fCA/+zAuKJI9
	 b3jCbkzVbCuatmI3Gyb6dOHSMGSIIhLja/gxovBbeS8LkroCVzlA9HmA883+eQaklt
	 wAyOigmEcybzwQa9OCcmJTeCnsxzN79YXxiLAocY=
Date: Sun, 12 Jan 2025 13:44:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] coresight: Updates for Linux v6.14
Message-ID: <2025011203-rinse-statutory-f53d@gregkh>
References: <20250109220732.2032306-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109220732.2032306-1-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_044442_314532_97DDB3BF 
X-CRM114-Status: UNSURE (   9.55  )
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

On Thu, Jan 09, 2025 at 10:07:32PM +0000, Suzuki K Poulose wrote:
> Greg,
> 
> Please find the changes targeting v6.14 for the CoreSight self hosted tracing
> subsystem.
> 
> Kindly pull
> 
> Suzuki
> 
> 
> 
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git tags/coresight-next-v6.14

Pulled and pushed out, thanks.

greg k-h

