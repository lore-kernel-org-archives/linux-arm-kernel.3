Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A91CD343C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqaiZVs1Ik/tZDUhIybjxUVbGmVHrLbR/3FdU6hgk/8=; b=apDdIZUaxyPFbgJ4V3G8xoKQMB
	x/+1ukKm3Bw0LZsvVOkb7pa2uNh0wR3+4A/LYep5K5bWELZNzeUpkUPNRGyAIK7aFFMCY3eRvXXsh
	/p8jOGlVbAaxRXhkWGXEth25P+nCKwP3CJ7c1i+SwNu5d1ueRQGIDOlHO6rhMRT6mdTdVtvxLoiXo
	Sb97vMWUuHr2JQpqw8jH+kgzMmksl5tgGYJZrfV3aR/PvIu6cOEkRY/qdItjLbwf1Dq+WGAw92Dg+
	H3OVLOGwTSLf8tjjttOwX+w8fvDk0BA6X2mfDZ3qxcggTQsALsDImaKqjAa+Ewb5KB5xXn+oleXgS
	daGv81Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFf2-00000009MUD-0gzg;
	Wed, 12 Nov 2025 18:33:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFf0-00000009MTt-3Apl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FBEA601A5;
	Wed, 12 Nov 2025 18:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E622C4CEF8;
	Wed, 12 Nov 2025 18:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762972414;
	bh=svyquVfOlmQCnTwOTU1HeKk9AcKWK15SpFPxSVLYHSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JjFgimRWTU36hJVBFroyCYIqSjvCu6FSRPmiSQ8EO2W/1YQmYrCkSKZqMvFkd0mQC
	 R7Fha6K277a2BFlpbm4aryDiiiHDxd6bVRPlcJ/1+IjMpO1Yh5eFcr8uBHdlIRoGrC
	 DBJ8kG3cQH9m2Jt0J1PgD/x2nJN4lqb92PEp3Zk5TuUPfLCU/oVqF10P0t5G8RxK7p
	 M53rX0hR3abi0SzDpMLn3OMMctBYlq3PU5RPoNq5rKpP2f1C9BW1n56KAh098L8n4H
	 K9KmPjdQx7DO0bHSsazzyV62JMuJrCzLnoRNt0nIX+C7KJ49mOQQJ+lXlpEGfF627l
	 YSaILRSb5DrlQ==
From: Catalin Marinas <cmarinas@kernel.org>
To: will@kernel.org,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Fix typos and spelling errors in comments
Date: Wed, 12 Nov 2025 18:33:19 +0000
Message-ID: <176297238094.2053466.16803014781753422009.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106135655.8441-1-mrigendra.chaubey@gmail.com>
References: <aQoF3pu8CjO3tAl6@willie-the-truck> <20251106135655.8441-1-mrigendra.chaubey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Thu, 06 Nov 2025 19:26:55 +0530, mrigendrachaubey wrote:
> This patch corrects several minor typographical and spelling errors
> in comments across multiple arm64 source files.
> 
> No functional changes.

Applied to arm64 (for-next/typos), thanks!

[1/1] arm64: Fix typos and spelling errors in comments
      https://git.kernel.org/arm64/c/96ac403ea2b4

-- 
Catalin


