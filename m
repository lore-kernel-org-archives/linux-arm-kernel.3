Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65D2C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kI1wmnnF5oqLVnltLhXSkeA7u4mRHNTAGtGe797Stg=; b=gFK6fXJSgkFWOyC4LyikZU6CtE
	aCOMyIMSCzo6aPcFJeU3O8TNxZNgBL9F2k1RzAqImgK93qi1tYHaEOhLOnnLwX+64INV0HMmdpyMJ
	7XEYuTOO1AaXBGRelReHx4hzv7pTX6yS7yjofW9pLkm2u3LrWghja5JA7+blECsdHon4mm8cEZFhB
	7D10P9zQvoU89VrKFXdLBEzauujJbeK5sHh0IBLrnT5sJWu9gKbaeSMw3jKXtmKBOeiKpUFU8kFLE
	ZsBScWvb1miGY2O2TNi7l93A/54WOubYBgLLSsTs9esa6bKP++XXMwQi4KKqIyOOkUQg1CFJVC7QS
	bHZMHryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1j2H-0000000EUFQ-0Q0A;
	Wed, 02 Sep 2026 11:21:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1j2F-0000000EUFB-42OV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:21:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8531D40E2D;
	Wed,  2 Sep 2026 11:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6E81F000E9;
	Wed,  2 Sep 2026 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788348103;
	bh=4kI1wmnnF5oqLVnltLhXSkeA7u4mRHNTAGtGe797Stg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SZGqs85Jwc3kwLcbEfmsYj1I1Rt9ZZPBFJY3Ymwce0VUBprC1P8TK14DOSlhQEWwT
	 KSA0t79SxzkxudmX+FrH7bshTtYekQS+59okcKR0OIg0rSYJ1um3ifN3hPAMc/OeUh
	 WB/09O2ZqVRlSj7ScsW9aa+LNYCgQtkIwclf401h3p6GF787z5yZUDqIraAmSu9Yp1
	 Ml/HqydAhmSCpZ2NUd4lC5aWtpzJ3ifhpTqO3CyOXdQtIHorGIxdAz0f8wRBznbHYC
	 6c5T4Y9cm4RVUGoONME/Dhr/mnqTxKgBkG7znQ2YYm6/EW4mcGd+zpaJCofs164FAb
	 3t1t+Ik0rVvgA==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.ams.internal (Postfix) with ESMTP id EBEFF198003A;
	Wed,  2 Sep 2026 07:21:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 02 Sep 2026 07:21:40 -0400
X-ME-Sender: <xms:wgaYaoENrzvK0fUpsyrKZr655ah6dYh_GQHcD7NMcfCvaTc2Tyvi_Q>
    <xme:wgaYasy33_-b6q48ptAZMBR_hxBay2GTljFmP0N5BLiXYP_0Jdyic6eoDUdGeKcza
    bxUCBbbmQRrrIRXOHmHNkP5yGY_ncqSVcK_KodLa1CNJGs8VVrm8CE3>
X-ME-Received: <xmr:wgaYag2wY5kfEXySGcj9-qoEpXYn7HryuBgZeoBAmhlRefnY01bsQ84CeXs>
X-ME-Proxy-Cause: dmFkZTFF6v4bnWNqxQRAVg85E4OXSGQ8j0xl3q78hLZbvYKQIRmURWLxI3iuzyFtS3E+b0
    c+Z5Vu8D8ED+p6PjTdmt54z5hc2e2zuLGfI+aRwspvwJWwfGvgTeeI027t/aHmDnWyEaaq
    un2uv8eirX7FJAyIrRLxGTmfNJdXRdqpAaQ3PgEIvYinCBG1ZXZy17LyKNa5/710N6A8Kq
    5cB1kwKO71TpQt8IUo63ADiTEdDbXBkhbocpc+tdaMrs8+LZ1EZpCjPkSLJWWqwMcVqyuV
    wQr/kGk6b2rPEbdTEzXnk2lCr0F2fmAY1Oit9esuvYAMav2JTR0uhhsHq7vjGMe4760PZY
    RA1mRhtUuOlfhvk0HKZVH691HecmGgLfEm1hqy9w8eTJ8CChJL4fYDtVrffIoOG7tpPpe1
    nbUZBRZI/WClzP4YVfq8lK7oyU++skK3E6Xah8teE/WkdnMjePaxO+Z1KSAWCuZutegq/9
    WAINMHrmscpIs/ws4NYA8pg1fyYFwRp3NgcYQkW0x90D9Hq42MB1p+s3hSuayJglAd3rOB
    P7vRCeiryIxf0zKoqQCGKkPPbJ+o736o5egecMvUqm+3tsdQwU62XTido3HwDsjOAG+0DA
    WOw9kSZOsxC4hSqaORCCuKbQokVRMvMCSZZYMTaJZ6bBSCVblwqis4ACVo4Q
X-ME-Proxy: <xmx:wgaYanPSO8qI1v2wkkMCFeqj8eLM6GGgw_U_vkdlnqJlb3QU1rSHmA>
    <xmx:wgaYaks52r7Q65Q59F3OlRJo2DRzcEiWZE-pqUqh5Lf0jfuFCsJIjg>
    <xmx:wgaYajJi5MCje3xJVOkwTrtqZBxSOgC9nWo0Zb7fmLoRud8I7p_ZUA>
    <xmx:wgaYajNsjTAeRzpB7bWblBIZdnBEXHLzs3EWnMVYc_xT5LEFGxOe3g>
    <xmx:wgaYanDZ3w2dDYKdZMosdwvDa_B1G-Sn90jGvVxp1nof7IsbsOd2Gkze>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 07:21:37 -0400 (EDT)
Date: Wed, 2 Sep 2026 12:21:36 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, 
	praan@google.com, kevin.tian@intel.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	jamien@nvidia.com
Subject: Re: [PATCH v10 03/13] iommu/arm-smmu-v3: Add ARM_SMMU_FEAT_EVTQ for
 the event queue
Message-ID: <apgGoQYMoNSAXEP0@thinkstation>
References: <cover.1788130528.git.nicolinc@nvidia.com>
 <b6493aeece86f44195e8afb6fb8b3497cc237dc2.1788130528.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6493aeece86f44195e8afb6fb8b3497cc237dc2.1788130528.git.nicolinc@nvidia.com>
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

On Sun, Aug 30, 2026 at 04:18:04PM -0700, Nicolin Chen wrote:
> The driver programs and enables the event queue unconditionally, while the
> PRI queue has an ARM_SMMU_FEAT_PRI gating each of its touch points. Yet a
> kdump kernel wants to leave both of the queues alone, which would take an
> is_kdump_kernel() test at every one of those places.
> 
> Add an ARM_SMMU_FEAT_EVTQ that the probe always sets, as the event queue is
> architecturally mandatory, and gate the queue's allocation, its interrupt
> and its CR0 and IRQ_CTRL enables on it, so that a later change can turn the
> queue off in a single place.
> 
> No functional change intended.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

