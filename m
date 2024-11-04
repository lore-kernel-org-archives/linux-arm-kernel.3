Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D32D132AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nmX+b3S8jCKaBd2TT1Kq6gm3xB8cIG2E651H7rkYjg=; b=BadMEBxukLVAh07I+pyUG7rkCv
	F/ypRyE+O/XgrgbGrgbYoj6vGP0DknP3dTerHh+R99s8x/R5Oq28xdey3Gh6gYdbbF60A+amIftV8
	XaM396ttRgH8uG9xeRweqscr2zKkUmKqW99DCI4Q+QUUund/B2xJab10fr38uat9R4nFsjW4voQ2l
	VUTfXepqruVacLoqiYRXvmhh9Nk9bLT9+ZBNnL3y2nz8yne8Fh0A355y2ux8ZRBb8jDgV10nyZHj2
	R3oL3IbH1SSDizdTsjKr1Qnx76LTg9BBzmBzYY0Zf57LuWYjjVTi6K6ksIQZ2wSj58VKdnOcfDZ+L
	3z5SWafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uqp-0000000DPuO-3caH;
	Mon, 04 Nov 2024 11:02:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uox-0000000DPLP-3gVw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96C505C54B2;
	Mon,  4 Nov 2024 10:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C25C4CECE;
	Mon,  4 Nov 2024 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730718031;
	bh=6nmX+b3S8jCKaBd2TT1Kq6gm3xB8cIG2E651H7rkYjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pqx1JFQsNMax76wukI4F6tAYH2g5FhaqO39Jpf/0Vg1Jk/TzNdOArKcGaR7FsNu9k
	 AJsA+J01dryLYHUg9WX0Sk9mYG5M2NPgsle/Es4PIoRQ+gzvDAQyrhvv/ff3RbroM9
	 4CfNzb4MQAn+4vTwFy1EOYXYEPw8Er5nPGA3ZGkVv2pW35quno8abit6LpGbAkFj60
	 ZeUxHu6WsczJjg7UaKkVn/2AtdsGbeqSPDpzRK5lC+9dUhAq9msI6w/2XylDlnaVkI
	 WzUPZLKkmQvWrt3MeJd8xTACut0SsXjm21BDzrZwtg5N/O8fLNJ1dw0YOUbWE6bfBV
	 MHQR/Vnk0pOJg==
Date: Mon, 4 Nov 2024 11:00:26 +0000
From: Will Deacon <will@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64/fpsimd: Fix a typo
Message-ID: <20241104110025.GA11157@willie-the-truck>
References: <2cbcb42615e9265bccc9b746465d7998382e605d.1730539907.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cbcb42615e9265bccc9b746465d7998382e605d.1730539907.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_030031_975078_D28B8B8D 
X-CRM114-Status: UNSURE (   7.58  )
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

On Sat, Nov 02, 2024 at 10:31:54AM +0100, Christophe JAILLET wrote:
> s/FPSMID/FPSIMD/
> M and I inversted. Fix it

inversted? Fix it

Will

