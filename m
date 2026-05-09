Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6A9CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 06:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lh+Rf+S9Y1oV0j5jnSZk/rlpg3XQLtQo9q16FEDk7A4=; b=XTmu7Fg3XSduOrhlq2rQ5xndXK
	qb+uQY9GmGXo5/i4oOZ6kJW+TwieqYJ7urM00ptK76Se/WLrMILHaJzPW/dM/M0X+wLR/KAkZ7RWq
	U9CdcCJMo7zH0MNngNx8NyeWETEksJ0zrGzVEUzlCDhzJos3J+GrSK1bortmYqzgApN5yQQACo6d8
	xMHDMpGbxX//KgwtRTkj6ctg/zfHUa5IG4FWYXAW2NJwfpVyxHhCgg1xSi9hvDIo7IfLKms/mh0St
	xOpxn/LqOPHzr/fG11a/DLIPtA6QlI1Agh/m89quTF6XA/bPBPel1/5t7GHJu/+Zwx0LetmdfApnT
	ANwlC3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLatx-00000008N16-1gjJ;
	Sat, 09 May 2026 06:11:01 +0000
Received: from out162-62-57-87.mail.qq.com ([162.62.57.87])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLatu-00000008N0P-2FCW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 06:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1778307047;
	bh=lh+Rf+S9Y1oV0j5jnSZk/rlpg3XQLtQo9q16FEDk7A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yZOHDRFnwU+rUgUNkW/H74Jd8D0ZAcpIR4OFxk+7Okpi2q8uce6i4OTcIxnEde3Xk
	 zfOE++1Ieoeauxf5L1mZ9so+8jKisKqR/eO1PGSsyRqFRqt2ZHLrheMcmTdogDY9bA
	 c3b3pHoiJb4RmhG0w0s7xW2uUCOd1jfH0PnI42DI=
Received: from localhost ([61.169.175.90])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 2AD878A5; Sat, 09 May 2026 14:10:45 +0800
X-QQ-mid: xmsmtpt1778307045t6d36uikg
Message-ID: <tencent_07DC93F42D53F6A4C20886013823A83F6C06@qq.com>
X-QQ-XMAILINFO: M2SvzgchpLqfYZz+3Zuh5EItW+RffQKBvaDfLY9K8+69X/3AG7l27NptDT7PL4
	 cxownEE9lNB3RRvL0opEYrgVVTAwXFvq3CcAbsKMvko7OnnLJSUr8KjgvHC38Dw6t3X7+4xzLb6N
	 Ny1cAB66V7/G91OQaidOXldWlSpBjdCdX20kKDBrHiUEnXppdGVsk5c0nErGitw/tgRHw4sIAZQk
	 BcbBV/cfN/wLLrvRCk44LQMHaYFDN6SCI04a0Sn7kogW5Mxd3wb4ySwM/PhP/3FV9eQFEMZj6Sdd
	 Si6a8Dcvac0lMcf3xwSW02fKLNgfCgZKmquoGGS5j5YS2l+P5j+LvsDKl8PkYrVHpGqW4mMtDLlH
	 acPEdjt/kL58PGHbo34j1PYos4rzmd2qcZzUA9CBbHS1mZssaDiUG1PeEwoUaHQn8sfz6vVlI4eb
	 nO8Psw3xkhGENk5fR4ce5ilnZ8Dus5Bfkg47arRvQpUZT/JoNQR5WZBAacoi624kIijRPEEkZDPu
	 +tb0G3H2DPVtS8RnGyFb2YoDzaCm6xBlVLWx0ApTdXEnSfJhnKJDvwYox64ndLcYozy4UFHbihBn
	 m6jfh3O2CtI7hcg8SyVjTvB/ewClW7vYGyrdKQn3LhAy/MIT93TfLrNbor1cm1zOxIBqSsyCD3u3
	 NsJqeZDyKAmrLP6aUrEUa4PqygBpqX5gVe272G/x7VkH92R9sxy/WsSK0PVVqzq9QOBpEBH0H0Ba
	 6hayH1FS1pLer10vrlXZyizEQPZnGIuFMRLCKe9nYsrU1tEZo16FMz/nbkax8XQz85JVwUUCjOdX
	 JaE+06VY0OeEXK35QTRW8nPlP6Q+/2Iguhxid36jmwjdm/1xmwCqJV9UAJd1Jsi4Zsfp+KW37pUN
	 Q8vArVxOudIWOSG4QCJ6vyh6Ef96iPgsrSs48G9P/ksqK85qBCuxQ2uHasH3KqYnF73lYpW932/v
	 8+7IL399MPqoxShtLo0ToobQxLUDiiOkSjdik3gfg+WZ7lD3NKgrvzh1sVIf34Klzz1MrZCdY5RF
	 HpW7A15vKZMIgodMOuXWf+PT5hBk5tpHyIKJQqAo7Pk36/7TYZ
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
Date: Sat, 9 May 2026 14:10:46 +0800
From: Leo Jiang <leo.jiang1224@foxmail.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Stop queue allocation retry at
 PAGE_SIZE
X-OQ-MSGID: <20260509061046.tdau6n6p4564k7sf@LAPTOP-LEO.localdomain>
References: <tencent_F6E384A40D990A279B460A0CDE1927FDF509@qq.com>
 <0fdf4b1f-90f2-4f69-9d2b-dc5f608e9c1c@arm.com>
 <aeeoEHHNKPo32H9R@willie-the-truck>
 <tencent_DA99B62735469A0CD219E9FC73E234A47309@qq.com>
 <af340uhd40FLTaEO@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af340uhd40FLTaEO@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_231059_535307_2E805A88 
X-CRM114-Status: GOOD (  16.89  )
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

On Fri, May 08, 2026 at 02:53:06PM +0000, Pranjal Shrivastava wrote:

> On Wed, Apr 22, 2026 at 05:13:08PM +0800, Leo Jiang wrote:
> > Hi Will, Robin,
> > 
> > Thank you both for the detailed feedback.
> > 
> > Robin, you are absolutely correct. After a deeper look into the source code,
> > I see that allocations smaller than a page are indeed possible in certain
> > cases. My previous assumption about the DMA API's granularity was wrong,
> > and I appreciate the correction.
> > 
> > However, as Will noted that the current logic deviates from the original
> > intent, I have prepared a v2 to limit the queue allocation retry boundary
> > to PAGE_SIZE.
> > 
> > In v2, I have:
> >  - Updated my identity to Leo Jiang.
> >  - Removed the code comments as suggested.
> > 
> > I will send the v2 as a follow-up shortly.
> 
> Hi Leo,
> 
> The general guidance is to send the v2 as a fresh email so that it
> doesn't drop off the commmunity's radar.
> 
> Thanks,
> Praan

Thanks for the guidance, Praan. I'll send v2 as a fresh thread shortly.

Best regards,
Leo Jiang


