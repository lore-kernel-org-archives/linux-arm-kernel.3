Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B04CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8UFSx72RbpMItY1SQYyOWf0b2YOdayj8KbARCCd1rM=; b=rK+P3b14KjVcd8RVNRXE7x+xy5
	VZY79Jf83EE8DSkVqLmkgfpQDRXBwBWmSG5tIauzwlgzRMVXh9dSwx9XnidxMxon9FbpGUGcWM+Sx
	rn8nk/nzBk9QUTEddRmo5lIKrpGCLEtYutTmQfkI29jelBM3AAs/uMQTQqsf46+C4nMjaMB+dpYMm
	dCHrrpt6+c0tlDk51OPMkRGQ1GJy1x4SoIl8dB5YgdOJ1pQIl99ap/KM5opzkfJY3ot8s/lUiWGHm
	Du8XThOW6pan/0muvOZc1HnGL1E5Fg6hlfjC7pByKJxh4cZL8cxmYifHAOTzK3rC3tho91c1R5SI0
	VBhWvOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvDO-00000005UUm-3h1f;
	Tue, 09 Jun 2026 12:05:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvDN-00000005UUb-0ULT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:05:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EB3B601DC;
	Tue,  9 Jun 2026 12:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CA31F00898;
	Tue,  9 Jun 2026 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006752;
	bh=g8UFSx72RbpMItY1SQYyOWf0b2YOdayj8KbARCCd1rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NBAi9LEJgz0xgPh8Tv6S3ZF/2vmonRfnQ5eaTzjG1O5Iv//jlKEi4+ior2wD9Y3aB
	 L3sMnpac4VuUjiuQ1ns/kbSMvmft1DKwb7b8f+OR5kazE7CTjKUwY+w9cBkXZxhACs
	 AnBtkinRqAvGoX5IYJRH/AuF9K2OIRbCagoO0NCMgw/tAnQA5AE0kDArU0bfZo5s8m
	 vbNjkLLX4iVgCMM7CbzvH8SiUj5xcNRFA7FjtnLs/JCNq+m/1hrGdvsSGBgmuiekdR
	 9m0Ypz6cOg/UkEBRyr3oOIQd4cJKHceknQYhZ+TOv8AuuO/txld8hTmL5cKPKE/KuU
	 ullBC9AH4h2ag==
Date: Tue, 9 Jun 2026 14:05:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] aspeed: First batch of driver changes for v7.2
Message-ID: <20260609-terrestrial-magnificent-loon-24eabd@quoll>
References: <6b6b592163523beea48e875a047afc8b4bdbb00b.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6b6b592163523beea48e875a047afc8b4bdbb00b.camel@codeconstruct.com.au>
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

On Wed, Jun 03, 2026 at 11:15:25AM +0930, Andrew Jeffery wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed-7.2-drivers-0
> 
> for you to fetch changes up to bc13f14f5cd3d15054de38dc1232b49343d36297:
> 
>   soc: aspeed: cleanup dead default for ASPEED_SOCINFO (2026-06-03 10:47:55 +0930)
> 

Thanks, applied

Best regards,
Krzysztof


