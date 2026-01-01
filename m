Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18618EED626
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8f1133hI0R2At4WellgcuzXZ3XbA3CRP6TJW0Ailfg=; b=B144XEyb+8QU8RMUTfxhkdko9E
	1obuTzZR6J5UP6qaT+bKHxw4E+mbn2Gs82v4OUUCFrP0zDQJYzXEvfN1C/V33wqacV4/eMNtlDxeJ
	vnKI2p2v80bq0zf/+75tTWfTrMQVB0YqZ/WGWup0a7fDFB5h8+HT0bHbdPEqf5/9jBxVbIgVCN/ls
	QcizKSzIf9C00ZFUAHEWU6yG3j4DLbPtoh3LQYQNT8q08OqQPtYx234EbikNtDwgzkzeD4OVaibcL
	HNxqbzZfDgMjLaTf4dWYTH3g4XylyVxks7EVZdvNl8sMP/CyjrszG/LLyQT82c4P8UyKDMzvLuiRm
	QIH5Z9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMmH-00000007P8R-0nbc;
	Thu, 01 Jan 2026 17:48:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMmB-00000007P88-3dq8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:47:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EC7C497;
	Thu,  1 Jan 2026 09:47:48 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4091A3F694;
	Thu,  1 Jan 2026 09:47:54 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Add missing umap in ffa_init()
Date: Thu,  1 Jan 2026 17:47:50 +0000
Message-ID: <176728961379.116640.15797102562215367030.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210031656.56194-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20251210031656.56194-1-lihaoxiang@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_094755_948758_7931E60A 
X-CRM114-Status: UNSURE (   5.63  )
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

On Wed, 10 Dec 2025 11:16:56 +0800, Haoxiang Li wrote:
> In error path, add ffa_rxtx_unmap() to release the resource
> acquired by ffa_rxtx_map().
> 

Applied to sudeep.holla/linux (for-next/ffa/updates), thanks!

[1/1] firmware: arm_ffa: Add missing umap in ffa_init()
      https://git.kernel.org/sudeep.holla/c/9fda364cb78c
--
Regards,
Sudeep


