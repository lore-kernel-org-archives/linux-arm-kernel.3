Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F1DCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rU8H/rU2g3WfGccOFtwT7WjZ5YfIx7nNgO5laRekGY=; b=Pkeqp5oriveGiypbmusmIykLRG
	QIexqsVDzsypWXoVlAyr7088jXHrPPNIR2X/aW+L3k/bTPlJkc2Y4EboOyrBmreVmdTNtdS08QQ/f
	BsJJhlLvPxWF8Nq+m1KpmPdveD9dO/lAiSaXdvrpNi/wTWfHTDGu9mKd7pvaAFYqXFo0c3RH9gBAS
	l6+ucl5QWZQxtcDJJkYY/du0FgeQKgEXnh+bxFFeaX7ma5kDUj4qABAFfwdxvIZdXrbg8PMk9icpl
	k/vkQHRpKnfhlPGHY0Pi480S3O77DVk70wjzVvcQafkBXr5zz7xa8obJiG2iHPvnhsVoA8igoJI5r
	z1hkgnQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTIo-00000001tKx-0vAZ;
	Wed, 22 Oct 2025 07:30:34 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTIm-00000001tJW-0QvD;
	Wed, 22 Oct 2025 07:30:32 +0000
Date: Wed, 22 Oct 2025 00:30:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: xion.wang@mediatek.com
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream@mediatek.com, huadian.liu@mediatek.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/1] selinux: export current_sid API for use in other
 kernel modules
Message-ID: <aPiIGG1Zw5hJ2O3k@infradead.org>
References: <20251022072729.14820-1-xion.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022072729.14820-1-xion.wang@mediatek.com>
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

On Wed, Oct 22, 2025 at 03:27:17PM +0800, xion.wang@mediatek.com wrote:
> From: Xion Wang <xion.wang@mediatek.com>
> 
> We have a kernel driver designed to monitor the status of the Android
> userspace watchdog.

That module is not included in the patch series, making the export
directly unacceptable.


