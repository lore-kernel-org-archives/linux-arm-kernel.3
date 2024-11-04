Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BB5D132AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u12k3PZbE2Vi2a0LRhD5hRrYpZngFVbhrCwD5suK3p4=; b=NuB6rLXUIjm+o24BOlcLYhhaOy
	SHbdI81hE5eZYOfchrLbXp1h1e0M3zoh9l/dWPEnApfIqlgbb7OOUtYoqy0aOj2byyy4f/uXQ1LPe
	KvNK315440NVjzH7Ylwso4v4wUGZbA5wJARaydcTgonnzBj1XnltpiRPvYux6OPHsymPyPARirWYF
	FpCHQxZ2PCJikptDnYiOvPJ8EJ0ayZq7Pw1ztNjWP8gvCemMySkUDDuaVe+8iTHAPozxQuiqxMYTH
	davuJmat1yS+SZ+7zU1yDJW7oH8zDVjEEli1srLlVaZAtevd7tqcjSPm4TGUxzudxC3mHBEyTd6U4
	6OaWIM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7unS-0000000DOyi-0agb;
	Mon, 04 Nov 2024 10:58:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ukV-0000000DO9c-2RCC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 10:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC15A5C51AD;
	Mon,  4 Nov 2024 10:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6852CC4CED1;
	Mon,  4 Nov 2024 10:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730717754;
	bh=R1qKXKsmSjaiopFI6Bl9p4Vi9Ygu8IYiFVxJfn2NyVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXJyG5W2f7znsR3D/yW9tNam+L2v59v6wwFAmPP+oaWG05+9j4psaFVXh7SIBKJ6L
	 17LwolVP6+WT/LIpkbe0WM5x+yvcYY0LXXIwMYQm/5M11QynFSeuSXO0ujMWDdoaUn
	 fvKtl+qOFt97qVhek3d1t8JOvM392czyx+8yP2sHblkfTiN9IqkwUtzGgnZLIaPzyH
	 aiCvKOevL5PJgMFW9f/2xIej/6cl+8K8JVPwlL8m10cFiBD2Lbq81h/GM9wGG5OluL
	 24cJCqsNuAJUcVW0Dh1tCnvh/M2u5PyTvcdA+XmJ45oi94QhKl08BEnTfBhbwBUV1G
	 Msn6pzxmpRHKQ==
Date: Mon, 4 Nov 2024 10:55:49 +0000
From: Will Deacon <will@kernel.org>
To: "kernelci.org bot" <bot@kernelci.org>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	kernel-build-reports@lists.linaro.org, kernelci-results@groups.io
Subject: Re: arm64/for-kernelci baseline: 14 runs, 4 regressions
 (v6.12-rc5-158-g5283dc78f4da)
Message-ID: <20241104105548.GA11039@willie-the-truck>
References: <67254346.170a0220.36a303.e8c0@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67254346.170a0220.36a303.e8c0@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_025555_687864_F65EE95E 
X-CRM114-Status: UNSURE (   7.63  )
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

On Fri, Nov 01, 2024 at 02:08:22PM -0700, kernelci.org bot wrote:
> arm64/for-kernelci baseline: 14 runs, 4 regressions (v6.12-rc5-158-g5283dc78f4da)
> 
> Regressions Summary
> -------------------
> 
> platform                   | arch  | lab         | compiler | defconfig | regressions
> ---------------------------+-------+-------------+----------+-----------+------------
> qemu_arm64-virt-gicv2      | arm64 | lab-broonie | gcc-12   | defconfig | 1          
> qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1          
> qemu_arm64-virt-gicv3      | arm64 | lab-broonie | gcc-12   | defconfig | 1          
> qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie | gcc-12   | defconfig | 1          

Any chance of getting "lab-broonie" onto a version of QEMU containing [1]?

Will

[1] https://lore.kernel.org/qemu-devel/20241017172331.822587-1-peter.maydell@linaro.org/T/#u

