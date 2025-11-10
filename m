Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CC7CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/6Rr5vew5ydQvjFw7Rv9F5E1IYomQauBG1EVTvft9Q=; b=YOleSM32//eWA/NznDY/I4Zm7S
	/9szfvRSXG794+G7aAZurQPo0BGSQEuYimE8ntIRoId8pgSYGQPAi5RAVoy0BeMm6W87UckSxqsj6
	Pd1kajr2QyrJfkixS+Cda/33dCl8EQtKIbYjIiBo/EJfNhPoQhw8TH8Pdo0duGNCR6e5C4AfHxxDc
	alS713bwV3jkNIlpHT+a0gtdt+fiNsi59gxPbyuLqLuIy5r/l8JBen9b3xRrnDQ0UglEXs+SOhHnL
	2w/T0XQ0v6yf3Yfw5tEMhPBKK44dv9NzgrsCtKw9QhTDGOknRvett7VinAzAyZ4iM65XMup9c7AZr
	kTet6gOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPyQ-00000005IPN-0TWy;
	Mon, 10 Nov 2025 11:22:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPyO-00000005IP0-2mUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:22:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BB7540910;
	Mon, 10 Nov 2025 11:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7800CC113D0;
	Mon, 10 Nov 2025 11:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762773730;
	bh=S/6Rr5vew5ydQvjFw7Rv9F5E1IYomQauBG1EVTvft9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERdsz9v5AaHjd0vq+7PXumuP2I04xsTwwjLJX/tXHq6Ttima7t0QpsY9chu2IGQiW
	 peFMpzB/Zw8Or+Gyosw7jubrETZZMVD2UJnKwbKZBQ0EXrXKr2apcxq3cR30b5gt/n
	 k4VAJPKBtjwIkC24+4U1dTzbSH+VCzLpSrHZj4NJ1u+75nzzIsWVYVFhwNwXMiFCuf
	 KEiPiT7we6o1Kc3qdQlbipsUv1HouHkkxOPV9ZxDMgkGoY0xWVISCe+Gx3oQHBEkfA
	 rIGVTQ5cUtp+UMtkG71m7xisHoXrL4itx9A948jAF3LRF4Ilh14SdijXNoHCUBoBsn
	 1LTRjosrgIlNA==
Date: Mon, 10 Nov 2025 11:22:05 +0000
From: Will Deacon <will@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-perf-users@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>, regressions@lists.linux.dev,
	gus@collabora.com, linux-next@vger.kernel.org
Subject: Re: [REGRESSION] =?utf-8?Q?next=2Fmaster?=
 =?utf-8?Q?=3A_=28build=29_implicit_declaration_of_function_=E2=80=98topol?=
 =?utf-8?B?b2d5X2NvcmVfaGFzX3NtdOKAmTs=?= did you ...
Message-ID: <aRHK3RPjNq8nbltp@willie-the-truck>
References: <176225394342.3644.6412596085150396269@efdf33580483>
 <c13574f7-b13c-42e0-9b35-a2acb594af33@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c13574f7-b13c-42e0-9b35-a2acb594af33@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_032212_746786_5FA8E584 
X-CRM114-Status: UNSURE (   6.89  )
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

On Fri, Nov 07, 2025 at 07:11:49PM -0800, Randy Dunlap wrote:
> [verified still present in linux-next 20251107]
> [adding CCs]

Should be fixed by 7ab06ea41af5 ("arch_topology: Provide a stub
topology_core_has_smt() for !CONFIG_GENERIC_ARCH_TOPOLOGY") in the Arm
perf tree (which is merged into -next).

Will

