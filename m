Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62324CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXrG5yA5JUwEe4If4FGziY7v3d7m6i9ZYCM2ymSq8/0=; b=QOcO5h9nHsBdzokReTfdX7ddjt
	GzGkVh7N0WgeFW9ldQ7a10zEA5eQi+z6DYmIoli5q4ceD59Qb8XrRqCSA5EZnncMJnwF2WDXbWmil
	CddAN2WPCQK4sPV3hzWIktnhm6pIoqBJSK+H5WeVgPTIDJ0tRbHI0PYfoC0SDJ8bSbJxUAnU/usi7
	+qj2noRceBedv8ak7FPNwFflOFaKygRIbfrMsIYP3RFVq7xO+qsonccCUi2Eo+gFNhdE0xB+PfjW5
	/kbdIY0UVLAh6+bEMDVzHqtdIHdT/HuH17Er5UahlHho8V8M1w5ZjOm+A3/y0l4WtMCrR1+IAEvBL
	pDvbujRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHwX-00000001BaX-3MXZ;
	Tue, 19 May 2026 10:44:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHwW-00000001BZo-0cK8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FDEA60129;
	Tue, 19 May 2026 10:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95182C2BCB3;
	Tue, 19 May 2026 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779187495;
	bh=bweqqNVEQlCxrPPMlPmHCilEJnXZTQrMsH9ukPx3AOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VhGWnkIJe4A//Uour88grVAKECdhf5mTokRs0OQgbpOPID+Lck+YdsR96hqzAyC6s
	 GIxDBO0lUsXWeJk1mh7sVQY36lxcgOjEBpRbEVXawXNTYKFZDZ7KQaSlxgvQ12pLsz
	 xxvTjQq7jTA/SIonWf6CBn6Lx7s9xd3YoLSRVFdJxP+Nt3Fh+RthGFbdak6IvZtv+U
	 IytnifPxpQcABQWUGhnWT2PsQxxIeuNihFR6NdKjHGiQnY6cCqG1huJyu6AdYmGIoE
	 42/C54Ah4sR/VBjlpcDdA8Zvg22FBEtZyIJ8YaPF8od8bxGn480iO1rFT7FOzTdmfW
	 k9fgOkOla/T1w==
Date: Tue, 19 May 2026 11:44:50 +0100
From: Will Deacon <will@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@kernel.org>, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Rename ptdesc_t
Message-ID: <agw_Ih69WYh7NDWZ@willie-the-truck>
References: <20260430034933.541634-1-anshuman.khandual@arm.com>
 <afMKEgJGWZpZjZub@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afMKEgJGWZpZjZub@kernel.org>
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

On Thu, Apr 30, 2026 at 09:51:46AM +0200, Mike Rapoport wrote:
> Hi Anshuman,
> 
> On Thu, Apr 30, 2026 at 04:49:33AM +0100, Anshuman Khandual wrote:
> > ptdesc_t sounds very similar to the core MM struct ptdesc which is actually
> > the memory descriptor for page table allocations. Hence rename this typedef
> > element as pxxval_t instead for better clarity and separation.
> 
> Maybe we should keep the "pt" prefix and make it "ptval_t"?

Yeah, the 'pxx' prefix really hurts my eyes. Please use something else!

Will

