Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C9EC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 20:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4XWP40XA65x3Kn/DtU9MN2nDSrXPNHUqiDZVqbPiDg=; b=hXlfiCTPABmV/gDGOBOAa6w82X
	KzJwjdAt7OgSRbTSAvxZOktsuU58Cmi9Ay8NK433mEZU8Nmt8fqU5W+mpnpBjwtyY22lLYXJp2RQP
	1s72phgvWV3N4xyL9oeRGwvGzWm/OkzelXqgVZubMffxVmudRIDflWYhwgxRpOy8SSfywaNnf5+4h
	YX7jXGD/0rxH/RWNJ1dt7hZ0Tpg1hgRL/8cXbqxiuRg+qeJsgPICFq2Ex6cWdUnDtlpTDi0txEP+l
	TIp/+mz3c+bMAoBz7dh1Xi2QPYcxWqMBZwdw3ALAZby44k065RKXJlpUn1aGRue0TJNn3JIYkocAZ
	WIR515rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub2xk-00000000a4W-2PGA;
	Sun, 13 Jul 2025 20:06:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub2uN-00000000Zkz-3GGH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 20:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12B6B43FB4;
	Sun, 13 Jul 2025 20:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15B3C4CEE3;
	Sun, 13 Jul 2025 20:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752436966;
	bh=GNz6GGX7CATQGMZiU2RcEGADzPlhOuUZaXfas8vT0H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NFaZfLJ6hFPx+/iyBc9KU1epPKGMqBCeKcCS4FXgoVzVIcSKsmX4cixmlcjO9huTu
	 X9YrbyOCxVs9SM7Fa4qm69HBZr2W/osn9pG+KmcoDIgNXhTPsbEDhohu/L6FBKsWNM
	 zCfO8Y1E8SwGbALNNfP3vtlQosWophBVFt284Vi3s2cZHQaXkA8SWz+0wfqI4bo+UI
	 cB4bWZ0FqWuHAiIOrvir53IYmJY9ofhe7sWvq6ik1YfM4RInhKXYiGL9ZY8XcPvNMj
	 oIjoGm/O7B5d6xM5AhrgtRIwOBEpbhGUqYZzFDkMDNrxWrDry3zA/7ZjCfxmkqmMSI
	 meJ/sdEWf8ang==
Date: Sun, 13 Jul 2025 21:02:41 +0100
From: Will Deacon <will@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Yicong Yang <yangyicong@huawei.com>, mark.rutland@arm.com,
	yangyicong@hisilicon.com, hejunhao3@huawei.com,
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
	linuxarm@huawei.com, wangyushan12@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v3 0/8] General updates and two new drivers for
 HiSilicon Uncore PMU
Message-ID: <aHQQ4T1aMUazw-Dw@willie-the-truck>
References: <20250619125557.57372-1-yangyicong@huawei.com>
 <c5a99a5a-20d9-ef07-1cc3-cb025f446619@huawei.com>
 <20250713172732.13100182@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713172732.13100182@jic23-huawei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_130247_836565_1DB9835F 
X-CRM114-Status: GOOD (  11.44  )
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

On Sun, Jul 13, 2025 at 05:27:32PM +0100, Jonathan Cameron wrote:
> On Tue, 1 Jul 2025 20:36:11 +0800
> Yicong Yang <yangyicong@huawei.com> wrote:
> 
> > just want to make sure the mail's not lost somehow, it's been skipped for the last cycle and
> > no further comment since v2.
> 
> This one is still outstanding and Yicong mentioned some recent issues with
> some Huawei emails being taken out by spam filters.  As such, a quick
> ping from an account that shouldn't suffer that fate!

No probs, it's on the backlog but we've got lots of patches and not many
reviewers :(

Thanks for checking, though.

Will

