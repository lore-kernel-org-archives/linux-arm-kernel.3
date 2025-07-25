Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D78C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 12:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pyoo+o4+1Km4PDvgH1Rc3jgjtnw73S1JWJ+cbZvXrIg=; b=yhbs3WfSr1xgA8tWJOcCKCL262
	hc7afExYKJFeebKEvOUvZ5QtsXVLUmgvRpb8Av7HcEV1h58465eW+SLvlv4OCqvLN2v+eW4fXRz6n
	70X1l4uFL9bJ0qSse0LzU82uPw5XFF83rBleCuYMO9DIKVuOJrT1IODc+nhHajKFZr2XmRM9axTAN
	96c0xTiUmsmvs3szgI2IA3vyDw5fyQsdxOeo6BPEpm0IvmGYq9hODlyOhpPIKIb1apkPtOzEpC/q7
	jnmrk68e27rnteoq3yyE+7hUQBYIkBV8NPzduq6lT9tCqU3cnXUAk6MEpUqC+L3aokYxdFPtH8rO1
	Qsaq7MUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufH8m-00000009mIM-49Dq;
	Fri, 25 Jul 2025 12:03:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGiU-00000009jQ3-3ImF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 11:35:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1536F43F18;
	Fri, 25 Jul 2025 11:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74337C4CEE7;
	Fri, 25 Jul 2025 11:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753443357;
	bh=+PL5Ce46pzzEvE5wbz43WCE0ZQpyW3u8CV4e5f9V7WU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdCIUE603IEMZwVAMQub69g3JUAfY4Axyb5S53r0VqEjed8cHWrz77xcSZtk5Y+yE
	 Z308hsoyDDs1Lox/W68/IMJAEeGVMzJf+9owAcUM60mlWLZh7ht/5LRxJSdkyyaskw
	 KF15GAyt1hIi5XQjJRbP/DEFtY2fiEcSK2Ofj7lshn7rTbWvV6FRb6vFaMOSKMoFW+
	 2B9fQfU24fjHM7sX5Mz+Gd2e8hI9bXD7y0fuBUZ4SfM1b8Ia4M1x+9ppdgrBSkO2ge
	 YaCC4ZGUuOodeLqB2Yddm1H2RKT6A6uJxAWglP9bmO5jFK9/TsXV+zVu6BOnVeF8r+
	 49U84M63+dciQ==
Date: Fri, 25 Jul 2025 12:35:39 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mfd tree
Message-ID: <20250725113539.GB11056@google.com>
References: <20250725113657.039aa5ce@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250725113657.039aa5ce@canb.auug.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_043558_846777_3F82DC46 
X-CRM114-Status: GOOD (  11.26  )
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

On Fri, 25 Jul 2025, Stephen Rothwell wrote:

> Hi all,
> 
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
> 
>   ba9ae011e837 ("soc: apple: rtkit: Make shmem_destroy optional")
> 
> This is commit
> 
>   0445eee835d6 ("soc: apple: rtkit: Make shmem_destroy optional")

Odd.  I don't see an applied email for this.

This was applied to MFD and a pull-request was provided for the other subsystems:

https://lore.kernel.org/all/20250724102529.GA11056@google.com/

-- 
Lee Jones [李琼斯]

