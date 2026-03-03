Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BBEEC1433
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yFQzPWxWD8SZo1R13b5VBNZ37K8FLxNcnHAuoclt1I=; b=20uAeoDyKuYXQsEvgXfPHm7fAP
	obZq0Ur6O9OGiNy6Yro861/WFrjiiW1tFWq6SLMVJVVOAcBo5isRQgf6u++/uXyZWsIJ16iT4aGe3
	KNIO5XAkDTycnXUuVZJQCvjW0I6b42Lt9b5BE8OOw2BlQOrborU6uyuVQRLFso8C0O3d7BOuJO8PJ
	O31nLTfmM24+s54HieKkslnKLYZDBtTR3+vxZxzeocoA4CMdWTKu8IFIo3iu4b4Pn3rFSJUSsnKPB
	kJcrtyvZ62X7SopHxYKIPLy7X5IbpXdnrx9+kHrI3K4Jg2+RjY3EH7ZJcTbMiTslYgWeVSfEO0dU3
	/UnGHz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOGm-0000000F6fU-1Y1k;
	Tue, 03 Mar 2026 11:50:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOGl-0000000F6f4-2m9c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 11:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E98F60123;
	Tue,  3 Mar 2026 11:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0055C116C6;
	Tue,  3 Mar 2026 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772538630;
	bh=/yFQzPWxWD8SZo1R13b5VBNZ37K8FLxNcnHAuoclt1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X70iLpDIr5Vgz9Vd23ISXBzBHDiVrVZG5nJVZQRP9Cwjw/9L+ctt2CyUXi5tm31xF
	 mH3IfHN/2WnYbOkJdzZpaiz17pEamy2n4SpRI4Ke7EJ81D8TQSj0vEDuwdmUrT76HB
	 QdNdfUzy5Oht+G5wBF5rfZ7SGBncyw570v2T7+Uz/JNhrbJtlp+14Dw/mdRsuAmPbn
	 oQMJNYELmbE9r+vet/7UxjcLCwOSZ9hDjoTcPd2EPod+ZHHK9UvqctvdTb+PLnzZnU
	 JG0WgzH9jdl4Y74/HkVCOl3H1ApY9AFNcMwaSNuI1LMtpm2KS5Ob8OeDdklkfLe4xf
	 yJhzPzWO+ZXfg==
Date: Tue, 3 Mar 2026 11:50:26 +0000
From: Will Deacon <will@kernel.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH 1/4] arm64: errata: Fix missing space after comma
Message-ID: <aabLAu4KVCuYDhBj@willie-the-truck>
References: <20260301003407.2493781-1-objecting@objecting.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301003407.2493781-1-objecting@objecting.org>
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

On Sun, Mar 01, 2026 at 12:34:04AM +0000, Josh Law wrote:
> Signed-off-by: Josh Law <objecting@objecting.org>

We don't tend to take patches without commit messages. Please read
Documentation/process/submitting-patches.rst, have a look at the git log
to see what other patches look like, include a cover letter when sending
multiple patches at once and also bear in mind that purely cosmetic
changes such as these are often considered as "churn" and consequently
ignored.

You probably also need to fix your mail setup so that the author and
the SoB line match.

Will

