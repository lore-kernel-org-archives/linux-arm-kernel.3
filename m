Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D02E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5e7H5DYZ4h4zsVDB/FHmipF7N/upXpd89Pzxrv6zl4=; b=JjkMOXpkTgv5tMAChHTdA3BxqI
	i7Yp5KAd/nZ9ndjnVGc/MGUUrLlfLBd6K1CJvDHq/GKeK21MhuJdYUtIdo2HW5zd1scutmCs/XWwl
	q1fIxKAgEz2QsL1FAxOfERQbWf9H07frhOrpWz0OwDbZLdCLKIsZC1nTy2GtorfWPWO7Qao1aWj4I
	fRlqccX1JFM2u7pV1jDGM/I1vUrrl0KfrslArrMeIWUGyF01ybpv7C4TSVZGdcIIA5npKFLbN7td4
	6lA/ajj6yI22y2pEp9XTjdci+l8dIn8TZE9C4VHny3Mc673K+c4mMh79cK3zSZ5rh7r7yW3+TWaCN
	ptSRvP3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWTR-0000000GYWI-3gj6;
	Wed, 11 Dec 2024 23:50:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWNY-0000000GWEb-40sC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:44:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DEBB8A42537;
	Wed, 11 Dec 2024 23:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477BDC4CED7;
	Wed, 11 Dec 2024 23:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733960667;
	bh=a+c5XHBHPHf5DcF1zINo9Js3AvIy7oQZobulSu3s2zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z65yBnob/u6CN8UyV2EK8+CgcawyhiaThMszDDbCrEmSkeZTcqa+TcPHbqP41DnIh
	 ZIyXIcwVM7TCAPGu1RaCrNXGc3EusWDgvzIqDYnTwUJlSnmOnE0sOZoG0KTDrwX43J
	 Aq7Db1BqIQM4BNzGRlOsRGevDb8LEdojGTuVIOkhVoYdg4wz9aSyZR9keB3Py3B7we
	 xGSapV3tmEiuhGB/GGgBmqqroNLbBdq0TBCo/MI85tvW5yAqA5B4/FvTzhtYr9Ud3D
	 MIt1M1uaxOWH272mZU+sd0i1nnooxBkMJa6j9uyFc9fCMRVosBa0WjSgN8nMQ16Ub7
	 UimcQzXxAPIsw==
From: Will Deacon <will@kernel.org>
To: linux-mm@kvack.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64/Kconfig: Drop EXECMEM dependency from ARCH_WANTS_EXECMEM_LATE
Date: Wed, 11 Dec 2024 23:44:15 +0000
Message-Id: <173395344324.1068904.2330956532631016501.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241210043257.715822-1-anshuman.khandual@arm.com>
References: <20241210043257.715822-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_154429_054086_F183F260 
X-CRM114-Status: UNSURE (   5.88  )
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

On Tue, 10 Dec 2024 10:02:57 +0530, Anshuman Khandual wrote:
> ARCH_WANTS_EXECMEM_LATE indicates subscribing platform's preference for
> EXECMEM late initialisation without creating a new dependency. Hence this
> just drops EXECMEM dependency while selecting ARCH_WANTS_EXECMEM_LATE.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/Kconfig: Drop EXECMEM dependency from ARCH_WANTS_EXECMEM_LATE
      https://git.kernel.org/arm64/c/9456a15947c1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

