Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9FAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzhR42HWRQJwsFUZSN3D7Mamuah5zJn2fNhbc+yu51Q=; b=btbTB+dyxuCGYoLUalRL5bQQDE
	k4aeXmRzszutSpbYx78CCvGWP2O9AyR/W8eCIUkDoIQAlDcDyyk8nvECnSnC7gtlGbExgwnQSTNBC
	d4K58fw2X3Mg0j8ssvSo0aMf257Syxbz+RuNItoq72bJUnkI/rCY7ubm2IWx3gl8mABKfst5fEpzD
	PJ3bbjlAlpQprCt+5OqztnO6BNHASx1TKa467jwFTNhjUDwFBYn1Hys/gBDlQV9t9JiWO4Wp1k12/
	keGOftxKtJgp67KX1tLN4PjOkDdkWK0EUIboMoY7xvbFOpeoP5YpNJTzFJOMP6PRMquePacZzJ05f
	IPBYV1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcFI-00000004u5r-2eAJ;
	Fri, 20 Dec 2024 12:36:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcE9-00000004tyA-32gj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:35:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA508A400CC;
	Fri, 20 Dec 2024 12:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5D3C4CECD;
	Fri, 20 Dec 2024 12:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734698131;
	bh=RVts/pMVXLan7eC8aLVdkL0TisLwwqxXBGGl7iC6sCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpvgSLUMxPHh2sUHpJLBVwpnjbfxH07PzPFFJ1J7GiFekIHn1a1m1ZxQ2XwcP2XUO
	 BYBbHmfNGdR2pdz8LbNijs5RBmV4Nj8O01nVtDQKHq6cqg0NgXCTHXUKqu5v2VvtA3
	 rO/5d54Nf5hpyDOLHXSvvfFhkj/aNb253g9ozdqTLE6MtHIGsZJKxL76uCoTcwLg3Q
	 fYCmZhjOsv0zuQkmZcisQv4rcd/Y+SCvBLJiOqM6qR3MkXIRXjBMM2PdIlos5+U3Gv
	 P/hTftAwHPrVJwz2Mr57apqy98PDI5TM9et9OiI/kzAJsgbyoLbSFzoB2DKqVNUqur
	 5qf6w0tOl68Bw==
Date: Fri, 20 Dec 2024 12:35:27 +0000
From: Will Deacon <will@kernel.org>
To: cki-project@redhat.com
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	ardb@kernel.org
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 for-kernelci (6.13.0-rc3, upstream-arm-next, 06a57361)
Message-ID: <20241220123526.GA26697@willie-the-truck>
References: <64955.124121918121002524@us-mta-554.us.mimecast.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64955.124121918121002524@us-mta-554.us.mimecast.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_043533_837756_4DFA9D23 
X-CRM114-Status: GOOD (  10.39  )
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

On Thu, Dec 19, 2024 at 11:12:08PM -0000, cki-project@redhat.com wrote:
> Hi, we tested your kernel and here are the results:
> 
>     Overall result: FAILED
>              Merge: OK
>            Compile: OK
>               Test: FAILED (Did not boot)
> 
> 
> Kernel information:
>     Commit message: Merge branch 'for-next/core' into for-kernelci
> 
> You can find all the details about the test run at
>     https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1596629923
> 
> One or more kernel builds failed:
>     Builds that are failing to boot:
>          aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redhat:1596629923-aarch64-kernel

Hmm, I can't find any console logs here. Did the machines really fail that
early?

Will

