Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0BCD7788E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5EFQWoq7g5ynXiIiCaEOjr6AnBCXNLoJ6AmNyVyYMI=; b=tZC+7z1g+UrYNwOCDYwj+MRFVr
	0loWTZLE0cf42rZfMY+NxDYQMFUeUtCvTiRQKhaYZJrQSPRVRTl5dkmafLvFmg+AtZRMThJaYHjFO
	q+RTcrFMTzP9L/+zmlULpOhfLCGFFdbzJfGGyUtnW6gucrJrspbziTfwxsXY+fQpe5nlLyQnFezWT
	w+iQQV6oFMo/sd9L8l3v4Pu4Q3nakOoRH/D2WL07SHsg0BX1WgJUIC4g4lhs2CoCrYqX6HNDFmcFa
	JdxaKblFy25rD+fDrE93XfO87gdMYfLNxB06CMmsO3e48uNBf8TLQEHPtZJjp4FyZtqv7wobgT3sc
	bmR+Ul9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKl1-00000009Glk-0MwD;
	Fri, 23 Jan 2026 17:15:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKky-00000009Gl7-30wp;
	Fri, 23 Jan 2026 17:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18CDB42B02;
	Fri, 23 Jan 2026 17:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E97C4CEF1;
	Fri, 23 Jan 2026 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769188536;
	bh=TEToB2Qr35odS2hMmcpVhS46OELbEb52jc8i5sBbYlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y+eMucAEoSaKnXOVwMjQDzZksnff94Bxjyfhb3TC3ZSp88VpZfJzZ66ThH9ynNbrT
	 9UlS1jV9WXAkQdbVCfQTUNsNjPFxkQQqU45XppqAH4KgTW46y/QHSQcgzG0o77E9P8
	 vaOihRreWcANwFTokDyKrigYkPrCqxI66riH0cZ3hq6rXDSdYCrKGGbCLzFym82ifs
	 2REPouXnxCP9GiOthoFCIJIv0gsJtkeWeitPInOZofyZ+ykSAk1rZ5axwCHy7z4V6b
	 +UTa5ik0MIZk8VNrv1cKxsdE+Pada1KEGHq+USsJpTzHArxdyFbvHrQazrbqRmbNIs
	 2kHeqTo7d5Z/g==
Date: Fri, 23 Jan 2026 17:15:29 +0000
From: Will Deacon <will@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, robin.murphy@arm.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v12 3/6] iommu: Add verisilicon IOMMU driver
Message-ID: <aXOssVvBPZ0LQ4Au@willie-the-truck>
References: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
 <20260114100922.149187-4-benjamin.gaignard@collabora.com>
 <3082a454-31dc-42a2-85a6-0fd0c87bf31b@collabora.com>
 <25htwrdapwwvumlaqlu5oywcnnbss5kjyvnv6cxrx42q7mfhuw@wyagcnc3scgf>
 <4e0de2ff-4616-4e49-a419-1bdfb03e1430@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e0de2ff-4616-4e49-a419-1bdfb03e1430@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_091536_775417_961D4E25 
X-CRM114-Status: GOOD (  13.13  )
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

On Wed, Jan 21, 2026 at 02:52:07PM +0100, Benjamin Gaignard wrote:
> 
> Le 21/01/2026 à 12:54, Jörg Rödel a écrit :
> > Note that I stop taking changes for v6.20 (except fixes) by next week. I you
> > want a chance to have this code in 6.20, please make sure a v13 is in my inbox
> > by tomorrow.
> 
> I have v13 ready but I'm waiting for the conclusion of the thread with
> Will to send it.

Thanks for your patience. I just replied again on the other thread because
I still think we need to add some TLB invalidation on the unmap path before
we can merge this.

Will

