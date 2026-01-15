Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A742D44C41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LNzBon2fBCdQ9dNweOmhq3o3tSN5XtZPT0mnB3DKh4=; b=Od6lhAfkuFfY68HuAEaDQGECUE
	cHSd9Hw0aM/7m1hDDcjGLUZsFSo+aE6VA8TbssDVKlAH0poXs2sU+mIInGsZg/eYyLosiq9HdiTRd
	4Dvr3lsdZykNWQy1ZgHFY6JhkE7RT/hTgZtD6LyRS/TIBJLVS9twb4MdhpYk9ZTcIDd2gvCzX9iTR
	+sWSVnhdUZk1ejyLbP2Upwn5UGR5y80uPBSUNFp3HEsDefnqLVS9ICg8ilZ4Y9AZBIBn3LA2yFP/k
	XtrOIczYWtCzG9aaxLGuHweuk9WXLuZ6IMatjDxpDns4Pu64qxO3NmwlRt6Q4anXTwQUONcTjSNM1
	b8p3gXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMzP-0000000CNU8-3S7W;
	Thu, 15 Jan 2026 13:02:15 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMzL-0000000CNTR-4AHa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4LNz
	Bon2fBCdQ9dNweOmhq3o3tSN5XtZPT0mnB3DKh4=; b=iz/XQYvweb1ilfVJK/ub
	/3emkEw2H70mlHSqqCU2h1Ewc/IG0RcsLmR4O+Frt28oltv4AZNxUqNhcK9FFzCf
	cdew9No1iTI6xImopcsEgonmNLOFIYwmvoqGve4LXIRqcwyyb95N2ShCcfRMV7VJ
	wiHYja3plL8fWY0BtSH1lGSS2a6jqmYpXwHJIdWX9M5IMY4RIRg8hYrYPmvCHUpG
	ZI4DVN7kI1m/nrJ093Wh32B5JU77Tl7Uc8X1yEptzSRV/ovoDosSHSMDB+kYHIA7
	yb1+H8MZBWg158iNU+RLTy0i9JdC2F8MF4NXWjmAMBp8N9qxw6As+IM5EC2VH3Wa
	QQ==
Received: (qmail 2544332 invoked from network); 15 Jan 2026 14:02:05 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jan 2026 14:02:05 +0100
X-UD-Smtp-Session: l3s3148p1@DGrY1GxIjq8ujnvI
Date: Thu, 15 Jan 2026 14:02:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: xiic: add ACPI support
Message-ID: <aWjlTKrM34lfDsfC@shikoro>
References: <20260115002846.25389-1-abdurrahman@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115002846.25389-1-abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_050212_888950_F35E2896 
X-CRM114-Status: UNSURE (   7.23  )
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

On Thu, Jan 15, 2026 at 12:28:46AM +0000, Abdurrahman Hussain wrote:
> Use generic device property accessors.
> Make the clock optional assuming it's managed by firmware.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

On which hardware has this been tested?


